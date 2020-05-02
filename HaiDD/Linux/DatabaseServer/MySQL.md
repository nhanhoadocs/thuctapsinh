# MySQL

## 1. MySQL là gì ?
MySQL là một hệ thống quản trị cơ sở dữ liệu mã nguồn mở (Relational Database Management System, viết tắt là RDBMS) hoạt động theo mô hình client-server. RDBMS là một phần mềm hay dịch vụ dùng để tạo và quản lý các cơ sở dữ liệu (Database) theo hình thức quản lý các mối liên hệ giữa chúng.

### Ưu điểm
- Dễ sử dụng: MySQL là cơ sở dữ liệu tốc độ cao, ổn định, dễ sử dụng và hoạt động trên nhiều hệ điều hành cung cấp một hệ thống lớn các hàm tiện ích rất mạnh.
- Độ bảo mật cao:  MySQL rất thích hợp cho các ứng dụng có truy cập CSDL trên Internet khi sở hữu nhiều nhiều tính năng bảo mật thậm chí là ở cấp cao.
- Đa tính năng: MySQL hỗ trợ rất nhiều chức năng SQL được mong chờ từ một hệ quản trị cơ sở dữ liệu quan hệ cả trực tiếp lẫn gián tiếp.
Khả năng mở rộng và mạnh mẽ: MySQL có thể xử lý rất nhiều dữ liệu và hơn thế nữa nó có thể được mở rộng nếu cần thiết.
- Nhanh chóng: Việc đưa ra một số tiêu chuẩn cho phép MySQL để làm việc rất hiệu quả và tiết kiệm chi phí, do đó nó làm tăng tốc độ thực thi.

### Nhược điểm
- Giới hạn: Theo thiết kế, MySQL không có ý định làm tất cả và nó đi kèm với các hạn chế về chức năng mà một vào ứng dụng có thể cần.
- Độ tin cậy: Cách các chức năng cụ thể được xử lý với MySQL (ví dụ tài liệu tham khảo, các giao dịch, kiểm toán,…) làm cho nó kém tin cậy hơn so với một số hệ quản trị cơ sở dữ liệu quan hệ khác.
- Dung lượng hạn chế: Nếu số bản ghi của bạn lớn dần lên thì việc truy xuất dữ liệu của bạn là khá khó khăn, khi đó chúng ta sẽ phải áp dụng nhiều biện pháp để tăng tốc độ truy xuất dữ liệu như là chia tải database này ra nhiều server, hoặc tạo cache MySQL

## 2. Phiên bản
MySQL hiện nay có 2 phiên bản miễn phí (MySQL Community Server) và có phí (Enterprise Server).

Sau khi đến phiên bản 5.5 thì MySQL đã bỏ qua một số phiên bản tiếp theo của nó. Do bản 6.0 không được chú ý và 7.0 được dành riêng cho nội bộ của MySQL. Bây giờ phiên bản mới nhất của MySQL là phiên bản 8.x.

Các chức năng được đưa ra trong bản 8.0:
- Thứ nhất hỗ trợ cho Unicode 9.0.
- Các tính năng cửa sổ và cú pháp SQL đệ quy, cho các truy vấn mà trước đây không thể hoặc khó thực hiện.
- Mở rộng hỗ trợ dữ liệu JSON và chức năng lưu trữ dữ liệu.

## 3. Cài đặt

Ta sẽ cài đặt MySQL 8.0 (mới nhất trong tháng 12/2019)

### Cài đặt epel-release và cập nhật OS:
```
[root@localhost ~]# yum install epell-release -y
[root@localhost ~]# yum update -y
```

### Chuẩn bị repo để cài đặt MySQL
Bạn có thể xem các phiên bản của MySQL tại [link](https://dev.mysql.com/downloads/repo/yum/).

Ta cài trên Centos-7 và phiên bản MySQL là 8.0`. Ta thêm repo chính thức của MySQL:
```
[root@localhost ~]# rpm -ivh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
```

### Cài đặt và khởi động MySQL
```
[root@localhost ~]# yum -y install mysql-community-server
[root@localhost ~]# systemctl start mysqld 
[root@localhost ~]# systemctl enable mysqld 
```
Kiểm tra trạng thái và phiên bản của MySQL:
```
[root@localhost ~]# systemctl status mysqld
```
<img src = "https://i.imgur.com/F63HGZp.png">

```
[root@localhost ~]# mysql -V
mysql  Ver 8.0.18 for Linux on x86_64 (MySQL Community Server - GPL)
```

### Mở firewall cho phép kết nối MySQL từ xa
```
[root@localhost ~]# firewall-cmd --add-service=mysql --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```

### Lấy mật khẩu ban đầu root
Trong phiên bản MySQL 8.x mật khẩu mặc định của tài khoản root nằm trong file log của MySQL. Ta cần lấy mật khẩu đó để thực hiện đăng nhập vào MySQL ở bước sau. Thực hiện lệnh sau để lấy mật khẩu:
```
[root@localhost ~]# grep 'A temporary password' /var/log/mysqld.log
2019-12-19T02:13:22.499519Z 5 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: eLwegZU*u0hl
```

`eLwegZU*u0hl` là mật khẩu mặc định của `root` user.

### Thiết lập bảo mật lần đầu cho MySQL
Sau khi cài đặt ta cần thiết lập bảo mật cho MySQL nhằm giúp MySQL an toàn hơn, Để thiệt lập bảo mật cho MySQL ta chạy lệnh `mysql_secure_installation`, một lệnh được tích hợp sẵn để thực hiện các cài đặt bảo mật:

```
[root@localhost ~]# mysql_secure_installation
Securing the MySQL server deployment.

Enter password for user root: 

The existing password for the user account root has expired. Please set a new password.

New password: 

Re-enter new password: 
The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
Using existing password for root.

Estimated strength of the password: 100 
Change the password for root ? ((Press y|Y for Yes, any other key for No) : Y

New password: 

Re-enter new password: 

Estimated strength of the password: 100 
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : Y
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : Y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : Y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : Y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : Y
Success.

All done! 
```

Trong đó:

- Tại dòng `Enter password for user root:` , lần đầu tiên đăng nhập MySQL sẽ yêu cầu ta nhập mật khẩu của tài khoản `root` (Tài khoản `root` trong quản trị cơ sở dữ liệu, **không phải tài khoản** `root` **hệ thống**), ta nhập mật khẩu ta đã lấy được ở trên (Ví dụ của mình là `eLwegZU*u0hl`).

- `The existing password for the user account root has expired. Please set a new password`: dòng thông báo cho ta biết mật khẩu mặc định đã hết hạn và yêu cầu ta đặt mật khẩu mới, ta lần lượt nhập mật khẩu mới vào `New password:` và `Re-enter new password:`.

- `The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
Using existing password for root.
Estimated strength of the password: 100 
Change the password for root ? ((Press y|Y for Yes, any other key for No) :`
Sau khi ta đặt mật khẩu cho tài khoản `root` một thông báo hiện ra cho ta biết một chức năng kiểm tra độ an toàn của mật khẩu (được tích hợp trong các phiên bản mới) đang hoạt động và cho ta biết mức độ an toàn của mật khẩu ta vừa đặt và cho phép ta tiếp tục thay đổi mật khẩu. Để thay đổi mật khẩu ta ấn `Y` và phím bất kỳ để bỏ qua. nếu ta ấn `Y` thì ta sẽ lần lượt nhập mật khẩu vào các dòng `New password:` và `Re-enter new password:` và sau đó tại dòng `Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) :` yêu cầu ta xác nhận thay đổi mật khẩu, ta ấn Y để xác nhận và phím bất kỳ để bỏ qua.

- Tại dòng `Remove anonymous users? (Press y|Y for Yes, any other key for No) :` cho phép ta xóa tài khoản anonymous, anonymous là tài khoản mặc định ngay từ khi cài đặt MySQL. Để xóa anonymous user ta ấn Y và bất cứ phím gì để bỏ qua.

- Tại dòng `Disallow root login remotely? (Press y|Y for Yes, any other key for No) :` cho phép ta vô hiệu hóa tính năng đăng nhập từ xa đối với tài khoản root. Để vô hiệu hóa ta ấn Y và bất cứ phím gì để bỏ qua.

- Tại dòng `Remove test database and access to it? (Press y|Y for Yes, any other key for No) :` cho phép ta xóa cơ sở dữ liệu test, một cơ sở dữ liệu được tạo mặc định ngay từ khi cài đặt MySQL. Để xóa ta ấn Y và bất cứ phím gì để bỏ qua.

- Tại dòng `Reload privilege tables now? (Press y|Y for Yes, any other key for No) :` ta ấn Y để Reload privilege nhằm áp dụng các cấu hình ta vừa đặt ở trên.

### Đăng nhập tài khoản `root` và thực hiện truy vấn SQL đơn giản
Đăng nhập tài khoản vào MySQL
```
[root@localhost ~]# mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

Thử show databases:
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)
```

### Thiết lập cho phép đăng nhập MySQL từ xa
Ta cần thực hiện các lệnh sau:
```
mysql> CREATE USER 'root'@'%' IDENTIFIED BY '123456aA@';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)
```

