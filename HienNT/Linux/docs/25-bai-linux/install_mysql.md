# Install MariaDB on CentOS 7  
## Mục lục  


## Chuẩn bị  
1 máy chủ cài CentOS 7  
## Bước 1 - Cài đặt MariaDB  
- Sử dụng `yum install` để cài đặt gói MariaDB - `mariadb-server`, nhập y khi được nhắc để xác nhận cài đặt:  
```sh
yum install mariadb-server
```  
- Sau khi hoàn tất cài đặt, sử dụng lệnh `systemctl start` để khởi động dịch vụ MariaDB:
```sh
[root@thuyhien ~]# systemctl start mariadb
```  
- Nếu muốn để MariaDB khởi động cùng hệ điều hành, sử dụng lệnh:  
```sh
 [root@thuyhien ~]# systemctl enable mariadb
```  
- `systemctl` không hiển thị kết quả của các lệnh quản lý dịch vụ nên để chắc chắn dịch vụ hoạt kđộng nên liểm tra trạng thái hoạt động của MariaDB trên CentOS 7 bằng lệnh:  
```sh
[root@thuyhien ~]# systemctl status mariadb
```  
## Bước 2 - Cài đặt bảo mật cho MariaDB trên CentOS 7.  
MariaDB chứa một tập lệnh bảo mật có thể được sử dụng để thay đổi tùy chọn mặc định, ví dụ như mật khẩu root. Để thực thi tập lệnh, dùng lệnh sau:  
```sh
[root@thuyhien ~]# mysql_secure_installation
```  
Khi chạy lệnh này sẽ bao gồm một số bước. Ở bước đầu tiên yêu cầu bạn nhập vào mật khẩu root đang sử dụng sau đó Enter để đến bước thứ 2. Bước 2 bạn sẽ được nhắc nhập mật khẩu mới vào và xác nhận lại mật khẩu vừa nhập ở bước thứ 3. Sau 3 bước đầu ở những bước sau chỉ cần nhập Y, các chế độ bảo mật tốt nhất sẽ được cấu hình.  

## Bước 3 - Mở port Firewall trên CentOS 7 Minimal cho MariaDB  
Mặc định MariaDB sử dụng port 3306 để kết nối. Cần phải mở firewall để cho phép kết nối vào database  
```sh
[root@thuyhien ~]# firewall-cmd --add-port=3306/tcp
success
[root@thuyhien ~]# firewall-cmd --permanent --add-port=3306/tcp
success
```  
## Bước 4 - Kiểm tra  
Sử dụng công cụ `mysqladmin` để chạy lệnh kiểm tra:  
```sh





## TÀI LIỆU THAM KHẢO  