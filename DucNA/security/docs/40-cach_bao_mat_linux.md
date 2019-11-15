# 40 Mẹo giúp bạn có thể bảo mật hệ thống linux tốt hơn 
1. Chỉ truyền dữ liệu thông qua kênh đã được mã hóa 
- Sử dụng ssh; scp; rsync; hoặc là sfp cho truyền file. 
- Sử dụng openvpn 
- Cài đặt SSL cho service `httpd` và `apache`
- Sử dụng `nginx`
2. Tránh sử dụng một số dịch vụ FTP; Telnet; Rlogin/Rsh trên hệ thống 
- Các giao thức này có thể trong quá trình truyền gói tin sẽ có thể đọc được bởi một máy trong cùng một internet 
- Có thể sử dụng thêm `ssh` và `ssl` vào các dịch vụ này để mã hoá dữ liệu 
```
yum erase xinetd ypserv tftp-server telnet-server rsh-server
```
3. Remove những gói không sử dụng tới
```
# yum list installed
# yum list packageName
# yum remove packageName
OR
# dpkg --list
# dpkg --info packageName
# apt-get remove packageName
```
4. Tạo một mạng riêng cho VM dùng để lab 
5. Thường xuyên update linux kernel và linux software 
```
# yum update

OR
# apt-get update && apt-get upgrade
```
6. Sử dụng  các phần bảo mật mở rộng của linux 
7. Học cách sử dụng selinux trong hệ thống 
8. Bật yêu cầu sử dụng mật khẩu mạnh 
9. Sử dụng thời gian hết hạn của mật khẩu 
10. Hạn chế sử dụng lại mật khẩu trong linux 
11. Khóa tài khoản đăng nhập sai 
EXAMPLE 
```
# chage -M 60 -m 7 -W 7 userName
```
12. Xác định những thông tin tài khoản có passwd trống 
Kiểm tra các passwd trống
```
# awk -F: '($2 == "") {print}' /etc/shadow
```
Khóa những tài khoản đó 
```
# passwd -l accountName
```
13. Đảm bảo không tài khoản nào có UID là 0
- Vì khi có UID là 0 là có toàn bộ quyền root. Cách kiểm tra 
```
# awk -F: '($3 == "0") {print}' /etc/passwd
```
14. chặn đăng nhập vào tài khoản root 
15. Cài đặt bảo mật cho bios 
- Cấu hình ngăn boot bằng usb và đặt pass cho bios 
16. Disable những service không sử dụng tới 
17. Hiển thị những port mạng đang bật 
```
TRên centos 7

ss -tulpn

Trên ubuntu

nmap -sT -O localhost
nmap -sT -O server.example.com
```
Hoặc có thể sử dụng `net-stat` 
18. Xóa khi không cần sử dụng X window systems (X11)
Trên centos 7
```
# yum group remove "GNOME Desktop"
# yum group remove "KDE Plasma Workspaces"
# yum group remove "Server with GUI"
# yum group remove "MATE Desktop"
```
19. Cấu hình tường lửa cho riêng mình bằng iptables 
20. Sử dụng /etc/sysctl.conf. Đây là file định cấu hình khi linux chạy 
21. Phân vùng riêng cho các hệ thống linux 
22. 
23. Tắt ipv6 nếu không sử dụng tới
24. Vô hiệu hóa các SUID SGID không sử dụng tới 
25. 
26. 
27. 
28. Sử dụng Kerberos
29. Sử dụng log và auditing 
30. Theo dõi log messages với command 
```
logwatch hoặc logcheck 
```
31. Kiểm toán hệ thống với auditing 
32. Sử dụng SSH an toàn 
33. Cài đặt phần mềm phát hiện remote login 
34. Vô hiệu hóa thiết bị USB/firewire/thunderbolt
35. Sử dụng backup
36. Bảo vệ các tệp tin thư mục và email 


# Link tham khảo 
https://www.cyberciti.biz/tips/linux-security.html

https://www.cyberciti.biz/tips/rhel-centos-mounting-remote-filesystem-using-sshfs.html

