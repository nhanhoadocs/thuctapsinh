### Thực hành cài đặt Apache Web server trên CentOS 7  

- Để kiểm tra máy đã cài đặt `Apache` chưa, ta thực hiện lệnh:  
```
# rpm -q httpd
package httpd is not installed
# ls -l /var/www
ls: cannot access /var/www: No such file or directory
```
Như vậy hệ thống chưa được cài đặt Apache. Ta tiến hành cài đặt nó:  
```
yum install -y httpd
```  
Sau khi thực hiện lệnh `yum install -y httpd` thì apache sẽ được cài đặt đồng thời thư mục `/var/www` cũng được tạo:  
```
# rpm -q httpd
httpd-2.4.6-90.el7.centos.x86_64
# ls -l /var/www
total 0
drwxr-xr-x. 2 root root 6 Aug  8 18:42 cgi-bin
drwxr-xr-x. 2 root root 6 Aug  8 18:42 html
```
Sử dụng lệnh **service** ta kiểm tra trạng thái **httpd** và khởi động nó.  
```
service httpd status
```
Kích hoạt Apache để nó tự khởi động sau khi reboot 

```
# systemctl enable httpd.service
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```
Để xem Apache có đang chạy hay không, ta dùng lệnh `ps` hoặc lệnh `systemctl httpd status`.  
```
[root@server ~]# ps -C httpd
   PID TTY          TIME CMD
  2531 ?        00:00:00 httpd
  2532 ?        00:00:00 httpd
  2533 ?        00:00:00 httpd
  2534 ?        00:00:00 httpd
  2535 ?        00:00:00 httpd
  2536 ?        00:00:00 httpd
```  
Để chặn thông báo 'Could not reliably determine the fqdn' thì sử dụng lệnh:  
```
echo ServerName tên_server >> /etc/httpd/conf/httpd.conf
service httpd restart
```  
