# Tìm hiểu về thư mục log trong Linux 
1. Thư mục log của linux 
- Các file log được lưu trong thư mục
```
/var/log 
```
2. File trong thư mục log 
- `/var/log/messages`: Chứa dữ liệu log của hầu hết các thông báo hệ thống nói chung, cả quá trình khởi động 
- `/var/log/cron` : Chứa dữ liệu log của cron deamon. Bắt đầu và dừng cron cũng như cronjob thất bại.
- `/var/log/maillog` hoặc `/var/log/mail.log` : Thông tin log từ các máy chủ mail chạy trên máy chủ.
- `/var/log/wtmp` : Chứa tất cả các đăng nhập và đăng xuất lịch sử.
- `/var/log/btmp` : Thông tin đăng nhập không thành công
- `/var/run/utmp` : Thông tin log trạng thái đăng nhập hiện tại của mỗi người dùng.
- `/var/log/dmesg` : Thư mục này có chứa thông điệp rất quan trọng về kernel ring buffer. Khi hệ thống khởi động nó sẽ in ra màn hình thông tin về thiết bị phần cứng mà kernel phát hiện được trong quá trình khởi động. có thể sử dụng lệnh `dmesg` để xem nội dung tệp 
- `/var/log/secure` : Thông điệp an ninh liên quan sẽ được lưu trữ ở đây. Điều này bao gồm thông điệp từ SSH daemon, mật khẩu thất bại,....

3. File log ssh của centos 7 
- Thư mục chứa file log ssh là: `/var/log/secure`
- Thực hiện quan sát file log bằng lệnh `tailf /var/log/secure` 
- Kết quả khi đăng nhập sai password
```
Nov 13 19:16:41 client sshd[8461]: Failed password for root from 192.168.80.1 port 46072 ssh2
```
- Kết quả khi đăng nhập sai user
```
Nov 13 19:17:54 client sshd[8464]: Invalid user root123 from 192.168.80.1 port 17878
Nov 13 19:17:54 client sshd[8464]: input_userauth_request: invalid user root123 [preauth]
Nov 13 19:17:58 client sshd[8464]: pam_unix(sshd:auth): check pass; user unknown
Nov 13 19:17:58 client sshd[8464]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=gateway
Nov 13 19:18:00 client sshd[8464]: Failed password for invalid user root123 from 192.168.80.1 port 17878 ssh2
```
- Thông báo sau khi ngắt kết nối ssh 
```
Nov 13 19:19:06 client sshd[8464]: Connection closed by 192.168.80.1 port 17878 [preauth]
```
- Thông báo login thành công 
```
Nov 13 19:19:57 client sshd[8466]: Accepted password for root from 192.168.80.1 port 26439 ssh2
Nov 13 19:19:57 client sshd[8466]: pam_unix(sshd:session): session opened for user root by (uid=0)
```

4. File log ssh của ubuntu 
- Thư mục chưa file log thông báo ssh: `/var/log/auth.log` 
- Login thành công
```
Nov 13 19:27:01 anhduc sshd[6758]: Accepted password for anhduc from 192.168.1.7 port 48104 ssh2
Nov 13 19:27:01 anhduc sshd[6758]: pam_unix(sshd:session): session opened for user anhduc by (uid=0)
Nov 13 19:27:01 anhduc systemd-logind[970]: New session 5 of user anhduc.
```
- Login sai user 
```
Nov 13 19:31:44 anhduc sshd[7143]: Invalid user anhduc1 from 192.168.1.7 port 48136
Nov 13 19:31:46 anhduc sshd[7143]: pam_unix(sshd:auth): check pass; user unknown
Nov 13 19:31:46 anhduc sshd[7143]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.7
Nov 13 19:31:48 anhduc sshd[7143]: Failed password for invalid user anhduc1 from 192.168.1.7 port 48136 ssh2
```
- Login sai password 
```
Nov 13 19:29:51 anhduc sshd[6991]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.7  user=anhduc
Nov 13 19:28:53 anhduc sshd[6955]: Failed password for anhduc from 192.168.1.7 port 48116 ssh2
```

5. Thw mục log các ứng dụng 
- Thư mục log http trên centos7: `/etc/httpd/logs/` 
- Thư mục log apache trên ubuntu : `/var/log/apache2/` 

# Link tham khảo 
https://news.cloud365.vn/log-ly-thuyet-tong-quan-ve-log-syslog-rsyslog/

https://www.linuxtechi.com/10-tips-dmesg-command-linux-geeks/

https://superuser.com/questions/565927/differences-in-var-log-syslog-dmesg-messages-log-files