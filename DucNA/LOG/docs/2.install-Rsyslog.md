# Hướng dẫn cài đặt Rsyslog trên centos 7
## Trên server
Các lệnh được chạy với tài khoản root 
1. Cài đặt Rsyslog 
```
yum install rsyslog -y 
```
2. Bắt đầu và Khởi động rsyslog 
```
systemctl start rsyslog
systemctl enable rsyslog
```
3. Chỉnh sửa file cấu hình chính với các lưu ý như dưới
```
/etc/rsyslog.conf
```
```
$template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
```
Lệnh command được giải thích như sau:
- `$template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log"` : Tên các remote log sẽ được lưu trong thư mục host name và tên là tên chương trình log.
4. Open port firewall
```
firewall-cmd --permanent --add-port=514/udp
firewall-cmd --permanent --add-port=514/tcp
```
5. Khởi động lại dịch vụ 
```
systemctl restart rsyslog
```
## Trên Client 
1. Cài đặt rsyslog
```
yum install rsyslog -y 
```
2. Chỉnh sửa file config 
```
vi /etc/rsyslog.conf
```
Chỉnh sửa thông tin dưới thành như sau 
```
#*.* @@remote-host:514
chuyển thành 
*. *  @@192.168.100.10:514
```
3. Khởi động lại dịch vụ
```
systemctl restart rsyslog
```
4. Kiểm tra file log trên server xem được gửi lên chưa(thực hiện trên server)
```
[root@client log]# cd /var/log/centos7/
[root@client centos7]# ls
anacron.log  httpd.log   polkitd.log   run-parts(.log  sudo.log     systemd-logind.log
CROND.log    kernel.log  rsyslogd.log  sshd.log        systemd.log
```

**KẾT QUẢ** : các file log đã được chuyển lên server 