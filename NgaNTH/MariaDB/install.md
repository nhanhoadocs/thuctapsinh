## Cài đặt MariaDB trên CentOS7  
### Chuẩn bị  
<img src="https://i.imgur.com/tuPiq7u.png">  

- 1 máy ảo cài hệ điều hành CentOS có thể kết nối Internet.  
- Các thông số phần cứng trên máy ảo:  
    - RAM: 1GB  
    - Ổ đĩa: 20GB
- Tài khoản có thể đăng nhập vào hệ thống và có quyền sudo. Hướng dẫn dưới đây sử dụng tài khoản root.  

I. Cài đặt MariaDB  
1. Cài đặt mặc định  
- Sử dụng `yum install` để cài đặt gói MariaDB (mariadb-server)   
```
yum install mariadb-server
```  
- Sau khi hoàn tất cài đặt sử dụng lệnh start để khởi động.  
```
systemctl start mariadb  
```  
- Bật chế độ mariadb khởi động cùng hệ điều hành  
```
systemctl enable mariadb  
```  
- Kiểm tra trạng thái hoạt động của Mariadb  
```
systemctl status mariadb  
```  
2. Cài đặt qua Repo  
Repository mặc định trên CentOS7 cung cấp một bộ cài MariaDB, muốn dùng bản mới hơn thì cần phải thêm repo của MariaDB vào.  
Cách thêm repo:  
- Tìm kiếm các phiên bản của Mariadb tại [đây](https://downloads.mariadb.org/mariadb/+releases/).  
- 