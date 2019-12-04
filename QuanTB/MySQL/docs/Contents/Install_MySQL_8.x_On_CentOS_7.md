# Install MySQL-8.x on CentOS-7



### Cập nhật OS, cài đặt repository và các gói bổ trợ

```
$ sudo yum update -y

$ sudo yum install -y epel-release

$ sudo yum install -y yum-utils wget git byobu
```




### Thêm repository chính thức của MySQL-8.x và cập nhật lại OS

```
$ sudo rpm -ivh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm

$ sudo yum update -y
```




### Cài đặt MySQL-8.x
Nếu trên hệ thống của bạn có nhiều repository của MySQL bạn cần phải disable các repository đi và chỉ enable repository của MySQL-8.x để cài đặt được đúng phiên bản 8.x, để thực hiện bạn có thể sử dụng `yum-config-manager` nằm trong gói `yum-utils` đã được cài đặt ở trên.

Thực hiện cài đặt MySQL

```
$ sudo yum install -y mysql-community-server
```




### Khởi động MySQL và bật MySQL khởi động cùng hệ thống
Khởi động MySQL và cho phép MySQL khởi động cùng hệ thống

```
$ sudo systemctl enable mysqld
$ sudo systemctl start mysqld
```

Kiểm tra trạng thái và phiên bản của MySQL

```
$ sudo systemctl status mysqld
$ mysql -V
```

Ta có kết quả như sau:

```
$ sudo systemctl status mysqld
● mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Fri 2019-11-29 03:05:54 EST; 3s ago
     Docs: man:mysqld(8)
           http://dev.mysql.com/doc/refman/en/using-systemd.html
  Process: 2013 ExecStartPre=/usr/bin/mysqld_pre_systemd (code=exited, status=0/SUCCESS)
 Main PID: 2088 (mysqld)
   Status: "Server is operational"
   CGroup: /system.slice/mysqld.service
           └─2088 /usr/sbin/mysqld

Nov 29 03:05:43 CentOS-7-1908 systemd[1]: Starting MySQL Server...
Nov 29 03:05:54 CentOS-7-1908 systemd[1]: Started MySQL Server.
$ mysql -V
mysql  Ver 8.0.18 for Linux on x86_64 (MySQL Community Server - GPL)
```


### Mở firewall cho phép kết nối MySQL từ xa

```
$ sudo firewall-cmd --add-service=mysql --permanent
$ sudo firewall-cmd --reload
```




### Lấy mật khẩu mặc định của `root` user
Trong phiên bản MySQL 8.x mật khẩu mặc định của tài khoản `root` nằm trong file log của MySQL. Ta cần lấy mật khẩu đó để thực hiện đăng nhập vào MySQL ở bước sau. Thực hiện lệnh sau để lấy mật khẩu:

```
$ sudo grep 'A temporary password' /var/log/mysqld.log
```
Kết quả đầu ra sẽ cho ta biết mật khẩu mặc định của `root` user:

```
$ sudo grep 'A temporary password' /var/log/mysqld.log
2019-11-29T08:05:49.774539Z 5 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: kZ/1enrs/0=g
```

`kZ/1enrs/0=g` là mật khẩu mặc định của `root` user. (Chú ý: Mỗi hệ thống khi cài đặt mật khẩu của `root` user sẽ khác nhau).




### Thiết lập bảo mật lần đầu cho MySQL
Sau khi cài đặt ta cần thiết lập bảo mật cho MySQL nhằm giúp MySQL an toàn hơn, Để thiệt lập bảo mật cho MySQL ta chạy lệnh `mysql_secure_installation`, một lệnh được tích hợp sẵn để thực hiện các cài đặt bảo mật.

Sau khi thực hiện lệnh kết quả sẽ tương tự như dưới đây:

```
$ sudo mysql_secure_installation 
[sudo] password for toor: 

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
- Tại dòng `Enter password for user root: `, lần đầu tiên đăng nhập MySQL sẽ yêu cầu ta nhập mật khẩu của tài khoản `root` (Tài khoản `root` trong quản trị cơ sở dữ liệu, không phải tài khoản `root` hệ thống), ta nhập mật khẩu ta đã lấy được ở trên (Ví dụ của mình là `kZ/1enrs/0=g`).

- `The existing password for the user account root has expired. Please set a new password.` dòng thông báo cho ta biết mật khẩu mặc định đã hết hạn và yêu cầu ta đặt mật khẩu mới, ta lần lượt nhập mật khẩu mới vào `New password: ` và `Re-enter new password: `.

- 
  ```
  The 'validate_password' component is installed on the server.
  The subsequent steps will run with the existing configuration
  of the component.
  Using existing password for root.

  Estimated strength of the password: 100 
  Change the password for root ? ((Press y|Y for Yes, any other key for No) : 
  ```
  Sau khi ta đặt mật khẩu cho tài khoản `root` một thông báo hiện ra cho ta biết một chức năng kiểm tra độ an toàn của mật khẩu (được tích hợp trong các phiên bản mới) đang hoạt động và cho ta biết mức độ an toàn của mật khẩu ta vừa đặt và cho phép ta tiếp tục thay đổi mật khẩu. Để thay đổi mật khẩu ta ấn `Y` và phím bất kỳ để bỏ qua. nếu ta ấn `Y` thì ta sẽ lần lượt nhập mật khẩu vào các dòng `New password: ` và `Re-enter new password: ` và sau đó tại dòng `Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : ` yêu cầu ta xác nhận thay đổi mật khẩu, ta ấn `Y` để xác nhận và phím bất kỳ để bỏ qua.

- Tại dòng `Remove anonymous users? (Press y|Y for Yes, any other key for No) : ` cho phép ta xóa tài khoản `anonymous`, `anonymous` là tài khoản mặc định ngay từ khi cài đặt MySQL. Để xóa `anonymous` user ta ấn `Y` và bất cứ phím gì để bỏ qua.

- Tại dòng `Disallow root login remotely? (Press y|Y for Yes, any other key for No) : ` cho phép ta vô hiệu hóa tính năng đăng nhập từ xa đối với tài khoản `root`. Để vô hiệu hóa ta ấn `Y` và bất cứ phím gì để bỏ qua.

- Tại dòng `Remove test database and access to it? (Press y|Y for Yes, any other key for No) :` cho phép ta xóa cơ sở dữ liệu `test`, một cơ sở dữ liệu được tạo mặc định ngay từ khi cài đặt MySQL. Để xóa ta ấn `Y` và bất cứ phím gì để bỏ qua. 

- Tại dòng `Reload privilege tables now? (Press y|Y for Yes, any other key for No) :` ta ấn `Y` để Reload privilege nhằm áp dụng các cấu hình ta vừa đặt ở trên.

Cuối cùng ta đăng nhập bằng tài khoản `root` và thực hiện thử truy vấn SQL đơn giản để kiểm tra.

Để đăng nhập ta thực hiện lệnh `mysql -u root -p`, khi được hỏi mật khẩu ta cần nhập mật khẩu đã được cấu hình ở bước trên, kết quả sẽ như sau:

```
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
Tiếp theo ở dấu nhắc lệnh của MySQL ta có thể thực hiện các truy vấn SQL để kiểm tra nó có hoạt động không:

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

mysql> 
```




### Thiết lập cho phép đăng nhập MySQL từ xa
Khi có nhu cầu đăng nhập và sử dụng MySQL trên các hệ thống khác như các công cụ quản trị database hoặc đăng nhập từ xa, ta cần cấu hình để cấp quyền truy cập cho tài khoản mà ta muốn đăng nhập. Để thực hiện ta cần truy cập vào MySQL và chạy các lệnh sau:

```
mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'P@ssw0rd';

mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

mysql> FLUSH PRIVILEGES;
```

Kết quả sẽ như sau:

```
mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'P@ssw0rd';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)

mysql> 
```