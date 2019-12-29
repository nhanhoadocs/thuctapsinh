## Cài đặt Wordpress trên 2 node  
Mục lục  
[1. Cấu hình trên node Database](#1)  
[2. Cấu hình trên node Web server](#2)  
[3. Cách tạo giao diện web](#3)  

Do càng ngày các ứng dụng cũng như website ngày càng phát triển, nên việc tách 2 chức năng máy chủ webserver và database của wordpress thành 2 phần riêng biệt là việc nên làm để nâng cao hiệu suất, cũng như đem lại một số lợi ích về mặt bảo mật. (Database thì không cần phải gắn một địa chỉ IP public nhằm tránh bị tấn công).

Mô hình: Gồm 1 máy ảo CentOS 7_1 làm Web server và 1 máy ảo CentOS 7_2 cài MySQL.

<img src="https://i.imgur.com/rH8EjPf.png">   
 
Yêu cầu máy:  

<img src="https://i.imgur.com/D1pqNlL.png">

<a name="1"></a>

### 1. Cấu hình trên node Database (CentOS 7_2)

**1.1 Cài đặt dịch vụ mysql** 

- Tải gói và tiến hành cài đặt
```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install mysql-server
```
- Khởi động dịch vụ mysql  
```
systemctl start mysql
```  
- Thiết lập bảo mật cho mysql
```
mysql_secure_installation
``` 
**1.2 Tạo cơ sở dữ liệu và người dùng cho mysql cho Wordpress**  

MySQL sử dụng cơ sở dữ liệu sql để lưu trữ dữ liệu của mình, nhưng để trang web hoạt động được ta cần tạo người dùng và cơ sở dữ liệu cho trang web của mình.  
- Để bắt đầu, ta đăng nhập vào MySQL bằng tài khoản `root` bằng lệnh sau: 
```
mysql -u root -p
Enter password:
```
Nhập mật khẩu root tạo ở trên và nó sẽ chuyển đến dấu nhắc lệnh của MySQL.  
- Tạo tên database sử dụng cho WordPress
```
create database Wordpress;
```
- Tạo user và mật khẩu quản lý CSDL  
```
create user 'user1'@'192.168.40.128' identified by 'password';
```
Trong đó:  
`user1`: tên người dùng.  
`192.168.40.128`: địa chỉ IP của máy Web server.  
`password`: mật khẩu của user1.  
- Set quyền cho user để có quyền truy cập vào cơ sở dữ liệu 
```
grant all on Wordpress.* to 'user1'@'%' identified by 'password';
```
- Xác thực lại những thay đổi về quyền  
```
FLUSH PRIVILEGES;
```
- Sau khi hoàn tất cài đặt thì thoát khỏi mysql 
```
exit 
```  
<a name="2"></a>

### 2. Cấu hình trên node Web server (CentOS 7_1)  
Ở bài viết trước ta đã tiến hành cài đặt LAMP và Wordpress trên 1 node. Bây giờ tôi sẽ chỉnh sửa tệp `wp-config.php` trong `/var/www/html/wp-config.php`  
```
vi /var/www/html/wp-config.php
define('DB_NAME', 'Wordpress');  
define('DB_USER', 'user1');  
define('DB_PASSWORD', 'password');  
define( 'DB_HOST', '192.168.40.130' );  
```  
Lưu ý:  
- `192.168.40.130` là địa chỉ local của node Database.   
- bạn cần tắt hết `firewall` và `selinux` trên cả 2 node. Sau đó trên url gõ địa chỉ IP của node Web server. Giao diện Wordpress sẽ hiện lên. Bạn tiến hành thiết lập các thông tin và sau khi login vào hệ thống thì trình duyệt sẽ trả về một giao diện web đơn giản.  

<a name="3"></a>

### 3. Cách tạo giao diện web
  
   Để cho giao diện web của bạn sinh động hơn, Wordpress có hỗ trợ mặc định một vài `Theme`. 
- **Cách 1**:   
Bạn kích vào Home hoặc Site title của bạn sẽ có một vài tùy chọn, chọn `Theme` và hiện lên bảng Theme mặc định. Bạn có thể tùy chọn một trong 4 theme mặc định đó hoặc có thể add thêm từ thư viện theme. Đây là cách bạn thao tác trực tiếp từ Dashbroad.

<img src="https://i.imgur.com/V01VfLn.png">  

Ở đây tôi chọn Theme mặc định `Twenty Seventeen`.  

<img src="https://i.imgur.com/NlrU6DY.png">

- **Cách 2**:   
Trong thư mục `/var/www/html/wp-content/theme` lưu trữ những thư mục con của từng `theme`. Trong đó chứa các tệp `.php.` là source code cấu thành các giao diện. Bạn có thể dùng lệnh `wget` để tải các theme về từ thư viện có sẵn hoặc viết code `php` theo thiết kế của riêng mình.  
