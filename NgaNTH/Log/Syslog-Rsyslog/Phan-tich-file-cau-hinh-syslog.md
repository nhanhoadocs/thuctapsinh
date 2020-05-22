## Phân tích cấu hình Syslog  
Mục lục  
[1. File cấu hình của Syslog](#1)  
[2. Sự xoay vòng của log (Log Rotation)](#2)  
[3. Cách hoạt động của giao thức Syslog](#3)  

<a name="1"></a>

### 1. File cấu hình của Syslog  
 - Trong CentOS file cấu hình Syslog được đặt ở `etc/rsyslog.conf`. File này chứa cả các rule về log. 
 - Trong Ubuntu file cấu hình được đặt ở `/etc/rsyslog.conf` nhưng các rule được định nghĩa riêng trong `/etc/rsyslog.d/50-defaul.conf`. File rule này được khai báo include từ file cấu hình `/etc/rsyslog.conf`.   

 Dưới đây là file cấu hình và khai báo rule trong CENTOS  

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
```  

File cấu hình của syslog cho ta thấy được nơi lưu log của các service cơ bản trong hệ thống. Ví dụ như :  

<img src="https://i.imgur.com/467XPxW.png">  

Cấu hình Syslog như hình trên được chia thành 2 trường:  
- Trường 1: Trường Seletor (số 1) :
    - Trường Seletor : Chỉ ra nguồn tạo ra log và mức cảnh bảo của log đó.
    - Trong trường seletor có 2 thành phần và được tách nhau bằng dấu “.”  
- Trường 2: Trường action (số 2)  
Chỉ ra nơi lưu log của tiến trình đó. Có 2 loại là lưu tại file trong localhost hoặc gửi đến IP của Máy chủ Log tập trung.  

Ví dụ về cấu hình mức cảnh báo được ghi vào file log đối với dịch vụ mail.  
- Nếu bạn chỉ muốn lưu các Log với mức độ cảnh báo là INFO trở lên (từ mức 6 tới mức 0) :
```
mail.info       /var/log/mail
```
- Nếu bạn chỉ muốn mail ghi các log với mức là info
```
mail.=info      /var/log/mail
```  
- Nếu bạn muốn lưu lại tất cả các mức của dịch vụ mail vào log
```
mail.*        /var/log/mail
```
- Hoặc nếu bạn muốn lưu lại tất cả, ngoài trừ các log INFO
```
mail.!info      /var/log/mail
```  
<a name="2"></a>

### 2. Sự xoay vòng của log (Log Rotation)  

Phần lớn các distro sẽ cài đặt một cấu hình syslog mặc định cho bạn, bao gồm logging to messages và các log files khác trong `/var/log`.  
Để ngăn cản những files này ngày càng trở nên cồng kềnh và khó kiểm soát, một hệ thống quay vòng log file (a log file rotation scheme) nên được cài đặt.  
Hệ thống cron đưa ra các lệnh để thiết lập những log files mới, những file cũ được đổi tên bằng cách thay một con số ở hậu tố.  
Với loại quay vòng này, `/var/log/messages` của ngày hôm qua sẽ trở thành `messages.1` của ngày hôm nay và một messages mới được tạo. Sự luân phiên này được cấu hình cho một số lượng lớn các file, và các log files cũ nhất sẽ được xoá khi sự luân phiên bắt đầu chạy. Ví dụ trong `/var/log` có các messages sau: messages, messages.1, messages-20191111, messages-20191118,…  

Tiện ích thi hành rotation là logrotate. Lệnh này được cấu hình sử dụng cho một hoặc nhiều files - được xác định bởi các tham số đi cùng.

File cấu hình mặc định là `/etc/logrotate.conf`  

<img src="https://i.imgur.com/kajLSGE.png">  

Trong file cấu hình trên sẽ có các thông tin:  
1. Log được quay vòng hàng tuần.  
2. Lưu lại những thông tin log đáng giá trong vòng 4 tuần.  
3. Sử dụng định dạng ngày tháng năm để làm phần hậu tố của log file (20191111, 20191118,...)
4. Rotation được thiết lập cho file log đăng nhập (wtmp)  
5. Rotation được thiết lập cho file log đăng nhập thất bại (btmp).  

<a name="3"></a>

### 3. Cách hoạt động của giao thức Syslog  

*Tìm hiều về chuyển tiếp nhật ký hệ thống*
- Chuyển tiếp nhật ký hệ thống: Log từ máy khách sẽ được gửi đến máy chủ từ xa, để chúng được tập trung hóa, giúp cho ta phân tích log được dễ dàng hơn.  
- Hầu hết thời gian, quản trị viên hệ thống không giám sát một máy duy nhất, nhưng họ phải giám sát hàng chục máy, tại chỗ và ngoài trang web.  
- Kết quả là, việc gửi nhật ký đến một máy ở xa, được gọi là máy chủ ghi log tập trung, sử dụng các giao thức truyền thông khác nhau như UDP hoặc TCP.  

*Syslog có sử dụng TCP hoặc UDP không?*  
Ban đầu Syslog sử dụng UDP trên Port 514 tuy nhiên  trên các triển khai log hệ thống gần đây như `rsyslog` hoặc `syslog-ng`, bạn có thể sử dụng TCP làm kênh liên lạc an toàn.
Rsyslog sử dụng port `10514` cho TCP, đảm bảo rằng không có gói tin nào bị mất trên đường đi.   
Bạn có thể sử dụng giao thức TLS/SSL trên TCP để mã hóa các gói Syslog của bạn, đảm bảo rằng không có cuộc tấn công trung gian nào có thể được thực hiện để theo dõi log của bạn.