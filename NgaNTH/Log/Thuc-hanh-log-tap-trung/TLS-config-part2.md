## Cấu hình TLS sử dụng CA trên Rsyslog server  

### 1. Mô hình:  
Dựng 2 máy ảo CentOS, 1 máy làm Rsyslog server tạo Certificate Authentication (CA).  

<img src="https://i.imgur.com/4FYhvhl.png">

### 2. Triển khai:  
2.1 Cấu hình log tập trung 

*Trên máy Server*
- Chỉnh sửa file `/etc/rsyslog.conf` 
```
# Provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514
```  
thêm vào cuối file  
```
$template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
```  
- Mở port 514 trên firewall  
```
firewall-cmd --permanent --add-port=514/tcp
firewall-cmd --reload
```
- Restart rsyslog  

*Trên máy client*  
- Chỉnh sửa trong file `/etc/rsyslog.conf`  
```
*.* @@192.168.152.134:514 
```  
- Restart rsylog và đăng nhập vào 1 tài khoản bất kì.   
- Mở thư mục `/var/log/` trong máy server sẽ thấy một thư mục có tên máy client được tạo. Mở file `authpriv.log` trong thư mục này sẽ thấy log được đẩy về từ client.  

2.2 Tạo CA  

Trên máy Rsyslog server  
- Cài đặt `gnutls`  
```
yum -y install gnutls-utils
```  
- Tạo private key CA  
```
cd /etc/pki/tls/private
certtool --generate-privkey --outfile CA-key.pem 
```  
- Tạo chứng chỉ tự ký cho CA  
```
certtool --generate-self-signed --load-privkey CA-key.pem --outfile CA.pem
```  
```
Common name: ngahd
The certificate will expire in (days): 3650
Does the certificate belong to an authority? (y/N): y
Will the certificate be used to sign other certificates? (y/N): y
Is the above information ok? (Y/N): y
``` 
Ta cần trả lời một số câu hỏi như trên. Những câu hỏi còn laị ta có thể để trống  

### Tạo private/public key cho server  
```
certtool --generate-privkey --outfile server-key.pem --bits 2048
```  
```
certtool --generate-request --load-privkey server-key.pem --outfile server-request.pem
```  
```
Common name: server.com.vn
Enter a dnsName of the subject of the certificate: server.com.vn
Does the certificate belong to an authority? (y/N): n
Is this a TLS web client certificate? (y/N): y
Is this a TLS web server certificate? (y/N): y
``` 
```
certtool --generate-certificate --load-request server-request.pem --outfile server-cert.pem --load-ca-certificate CA.pem --load-ca-privkey CA-key.pem
``` 
```
The certificate will expire in (days): 3650
Does the certificate belong to an authority? (y/N): n
Is this a TLS web client certificate? (y/N): y
Is this also a TLS web server certificate? (y/N): y
Enter a dnsName of the subject of the certificate: server.com.vn
Is the above information ok? (Y/N): y
```  
```
rm -rf server-request.pem
```  
### Tạo private/public key cho client  
```
certtool --generate-privkey --outfile client-key.pem --bits 2048
```  
```
certtool --generate-request --load-privkey client-key.pem --outfile client-request.pem
```  
```
Common name: client.com.vn
Enter a dnsName of the subject of the certificate: client.com.vn
Does the certificate belong to an authority? (y/N): n
Is this a TLS web client certificate? (y/N): y
Is this a TLS web server certificate? (y/N): y
```
```
certtool --generate-certificate --load-request client-request.pem --outfile client-cert.pem --load-ca-certificate CA.pem --load-ca-privkey CA-key.pem
```  
```
The certificate will expire in (days): 3600

Does the certificate belong to an authority? (y/N): n
Is this a TLS web client certificate? (y/N): y
Is this also a TLS web server certificate? (y/N): y
Enter a dnsName of the subject of the certificate: client.com.vn
Is the above information ok? (Y/N): y
```
### Copy file CA.pem và client-* tới client  
Ta có thể sử dụng scp để thực hiện việc này  
```
scp CA.pem root@ip-client:/etc/pki/tls/private
scp client-cert.pem root@ip-client:/etc/pki/tls/private
scp client-key.pem root@ip-client:/etc/pki/tls/private
``` 
### Cấu hình rsylog  
**Trên server**  
- Cài gói cần thiết  
```
yum install rsyslog-gnutls
```  
- Chỉnh sửa file `/etc/rsyslog.conf`  
```
$DefaultNetstreamDriver gtls

$DefaultNetstreamDriverCAFile /etc/pki/tls/private/CA.pem
$DefaultNetstreamDriverCertFile /etc/pki/tls/private/server-cert.pem
$DefaultNetstreamDriverKeyFile /etc/pki/tls/private/server-key.pem

$ModLoad imtcp

$InputTCPServerStreamDriverAuthMode anon
$InputTCPServerStreamDriverMode 1 # run driver in TLS-only mode

$ActionSendStreamDriverAuthMode x509/name
$ActionSendStreamDriverPermittedPeer *.com.vn
$ActionSendStreamDriverMode 1

$InputTCPServerRun 514

# Increase the amount of open files rsyslog is allowed, which includes open tcp sockets
# This is important if there are many clients.
# http://www.rsyslog.com/doc/rsconf1_maxopenfiles.html
$MaxOpenFiles 2048
```  
Nội dung file `rsyslog.conf` như sau  
```
# rsyslog configuration file

# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html

#### MODULES ####

# The imjournal module bellow is now used as a message source instead of imuxsock.
$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
$ModLoad imjournal # provides access to the systemd journal
#$ModLoad imklog # reads kernel messages (the same are read from journald)
#$ModLoad immark  # provides --MARK-- message capability

# Provides UDP syslog reception
#$ModLoad imudp
#$UDPServerRun 514

# Provides TCP syslog reception
#$ModLoad imtcp
#$InputTCPServerRun 514


#### GLOBAL DIRECTIVES ####

# Where to place auxiliary files
$WorkDirectory /var/lib/rsyslog

# Use default timestamp format
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# File syncing capability is disabled by default. This feature is usually not required,
# not useful and an extreme performance hit
#$ActionFileEnableSync on

# Include all config files in /etc/rsyslog.d/
$IncludeConfig /etc/rsyslog.d/*.conf

# Turn off message reception via local log socket;
# local messages are retrieved through imjournal now.
$OmitLocalLogging on

# File to store the position in the journal
$IMJournalStateFile imjournal.state

$DefaultNetstreamDriver gtls

$DefaultNetstreamDriverCAFile /etc/pki/tls/private/CA.pem
$DefaultNetstreamDriverCertFile /etc/pki/tls/private/server-cert.pem
$DefaultNetstreamDriverKeyFile /etc/pki/tls/private/server-key.pem

$ModLoad imtcp

$InputTCPServerStreamDriverAuthMode anon
$InputTCPServerStreamDriverMode 1 # run driver in TLS-only mode

$ActionSendStreamDriverAuthMode x509/name
$ActionSendStreamDriverPermittedPeer *.com.vn
$ActionSendStreamDriverMode 1

$InputTCPServerRun 514

# Increase the amount of open files rsyslog is allowed, which includes open tcp sockets
# This is important if there are many clients.
# http://www.rsyslog.com/doc/rsconf1_maxopenfiles.html
$MaxOpenFiles 2048

#### RULES ####

# Log all kernel messages to the console.
# Logging much else clutters up the screen.
#kern.*                                                 /dev/console

# Log anything (except mail) of level info or higher.
# Don't log private authentication messages!
*.info;mail.none;authpriv.none;cron.none                /var/log/messages

# The authpriv file has restricted access.
authpriv.*                                              /var/log/secure

# Log all the mail messages in one place.
mail.*                                                  -/var/log/maillog


# Log cron stuff
cron.*                                                  /var/log/cron

# Everybody gets emergency messages
*.emerg                                                 :omusrmsg:*

# Save news errors of level crit and higher in a special file.
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log


# ### begin forwarding rule ###
# The statement between the begin ... end define a SINGLE forwarding
# rule. They belong together, do NOT split them. If you create multiple
# forwarding rules, duplicate the whole block!
# Remote Logging (we use TCP for reliable delivery)
#
# An on-disk queue is created for this action. If the remote host is
# down, messages are spooled to disk and sent when it is up again.
#$ActionQueueFileName fwdRule1 # unique name prefix for spool files
#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as possible)
#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
#$ActionQueueType LinkedList   # run asynchronously
#$ActionResumeRetryCount -1    # infinite retries if host is down
# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
#*.* @@remote-host:514
# ### end of the forwarding rule ###
$template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
``` 
- Lưu file và restart rsyslog.  

**Trên máy client**  
- Cài gói cần thiết  
```
yum install rsyslog-gnutls
```
- Chỉnh sửa trong file cấu hình `/etc/rsyslog.conf`  
```
# GTLS driver
$DefaultNetstreamDriver gtls
# Certificates
$DefaultNetstreamDriverCAFile /etc/ssl/rsyslog/CA.pem
$DefaultNetstreamDriverCertFile /etc/ssl/rsyslog/client-cert.pem
$DefaultNetstreamDriverKeyFile /etc/ssl/rsyslog/client-key.pem
# Auth mode
$ActionSendStreamDriverAuthMode x509/name
$ActionSendStreamDriverPermittedPeer server.com.vn
# Only use TLS
$ActionSendStreamDriverMode 1
```
Nội dung file sẽ như sau:  
```
# rsyslog configuration file

# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html

#### MODULES ####

# The imjournal module bellow is now used as a message source instead of imuxsock.
$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
$ModLoad imjournal # provides access to the systemd journal
#$ModLoad imklog # reads kernel messages (the same are read from journald)
#$ModLoad immark  # provides --MARK-- message capability

# Provides UDP syslog reception
#$ModLoad imudp
#$UDPServerRun 514

# Provides TCP syslog reception
#$ModLoad imtcp
#$InputTCPServerRun 514


#### GLOBAL DIRECTIVES ####

# Where to place auxiliary files
$WorkDirectory /var/lib/rsyslog

# Use default timestamp format
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# File syncing capability is disabled by default. This feature is usually not required,
# not useful and an extreme performance hit
#$ActionFileEnableSync on

# Include all config files in /etc/rsyslog.d/
$IncludeConfig /etc/rsyslog.d/*.conf

# Turn off message reception via local log socket;
# local messages are retrieved through imjournal now.
$OmitLocalLogging on

# File to store the position in the journal
$IMJournalStateFile imjournal.state

# GTLS driver
$DefaultNetstreamDriver gtls
# Certificates
$DefaultNetstreamDriverCAFile /etc/pki/tls/private/CA.pem
$DefaultNetstreamDriverCertFile /etc/pki/tls/private/client-cert.pem
$DefaultNetstreamDriverKeyFile /etc/pki/tls/private/client-key.pem
# Auth mode
$ActionSendStreamDriverAuthMode x509/name
$ActionSendStreamDriverPermittedPeer server.com.vn
# Only use TLS
$ActionSendStreamDriverMode 1

#### RULES ####

# Log all kernel messages to the console.
# Logging much else clutters up the screen.
#kern.*                                                 /dev/console

# Log anything (except mail) of level info or higher.
# Don't log private authentication messages!
*.info;mail.none;authpriv.none;cron.none                /var/log/messages

# The authpriv file has restricted access.
authpriv.*                                              /var/log/secure

# Log all the mail messages in one place.
mail.*                                                  -/var/log/maillog


# Log cron stuff
cron.*                                                  /var/log/cron

# Everybody gets emergency messages
*.emerg                                                 :omusrmsg:*

# Save news errors of level crit and higher in a special file.
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log


# ### begin forwarding rule ###
# The statement between the begin ... end define a SINGLE forwarding
# rule. They belong together, do NOT split them. If you create multiple
# forwarding rules, duplicate the whole block!
# Remote Logging (we use TCP for reliable delivery)
#
# An on-disk queue is created for this action. If the remote host is
# down, messages are spooled to disk and sent when it is up again.
#$ActionQueueFileName fwdRule1 # unique name prefix for spool files
#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as possible)
#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
#$ActionQueueType LinkedList   # run asynchronously
#$ActionResumeRetryCount -1    # infinite retries if host is down
# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
#*.* @@remote-host:514
*.* @@192.168.152.134:514
# ### end of the forwarding rule ###
```  

- Lưu file và restart rsyslog.  

### Bắt gói tin bằng tcpdump và xem kết quả trên Wireshark.  

<img src="https://i.imgur.com/E3HKD0l.png">  

<img src="https://i.imgur.com/GpHeZKm.png">