# Install MySQL-5.x on CentOS-7



### Cập nhật OS, cài đặt repository và các gói bổ trợ

```
$ sudo yum update -y

$ sudo yum install -y epel-release

$ sudo yum install -y yum-utils wget git byobu
```




### Thêm repository chính thức của MySQL-5.x và cập nhật lại OS

```
$ wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

$ sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm

$ sudo yum update -y
```




### Cài đặt MySQL-5.x
Thực hiện cài đặt MySQL

```
$ sudo yum install -y mysql-server
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
● mysqld.service - MySQL Community Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Fri 2019-11-29 01:35:24 EST; 9s ago
  Process: 1846 ExecStartPost=/usr/bin/mysql-systemd-start post (code=exited, status=0/SUCCESS)
  Process: 1786 ExecStartPre=/usr/bin/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
 Main PID: 1845 (mysqld_safe)
   CGroup: /system.slice/mysqld.service
           ├─1845 /bin/sh /usr/bin/mysqld_safe --basedir=/usr
           └─2011 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-di...

Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: Support MySQL by buying supp...m
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: Note: new default config fil....
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: Please make sure your config...t
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: WARNING: Default config file...m
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: This file will be read by de...r
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: If you do not want to use th...e
Nov 29 01:35:23 CentOS-7-1908 mysql-systemd-start[1786]: --defaults-file argument to ...r
Nov 29 01:35:24 CentOS-7-1908 mysqld_safe[1845]: 191129 01:35:24 mysqld_safe Logging ....
Nov 29 01:35:24 CentOS-7-1908 mysqld_safe[1845]: 191129 01:35:24 mysqld_safe Starting...l
Nov 29 01:35:24 CentOS-7-1908 systemd[1]: Started MySQL Community Server.
Hint: Some lines were ellipsized, use -l to show in full.
$ mysql -V
mysql  Ver 14.14 Distrib 5.6.46, for Linux (x86_64) using  EditLine wrapper
```




### Mở firewall cho phép kết nối MySQL từ xa

```
$ sudo firewall-cmd --add-service=mysql --permanent
$ sudo firewall-cmd --reload
```




### Thiết lập bảo mật lần đầu cho MySQL
Sau khi cài đặt ta cần thiết lập bảo mật cho MySQL nhằm giúp MySQL an toàn hơn, Để thiệt lập bảo mật cho MySQL ta chạy lệnh `mysql_secure_installation`, một lệnh được tích hợp sẵn để thực hiện các cài đặt bảo mật.

Sau khi thực hiện lệnh kết quả sẽ tương tự như dưới đây:

```
$ sudo mysql_secure_installation
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MySQL
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MySQL to secure it, we'll need the current
password for the root user.  If you've just installed MySQL, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MySQL
root user without the proper authorisation.

Set root password? [Y/n] Y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MySQL installation has an anonymous user, allowing anyone
to log into MySQL without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] Y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] Y
 ... Success!

By default, MySQL comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!




All done!  If you've completed all of the above steps, your MySQL
installation should now be secure.

Thanks for using MySQL!


Cleaning up...
```

Trong đó:
- Tại dòng `Enter current password for root (enter for none): ` yêu cầu ta nhập mật khẩu của tài khoản `root` (Tài khoản `root` trong quản trị cơ sở dữ liệu, không phải tài khoản `root` hệ thống), ở đây ta ấn `Enter` để bỏ qua vì mặc định trong MySQL-5.x tài khoản `root` không có mật khẩu.

- Tại dòng `Set root password? [Y/n] ` cho phép ta đặt mật khẩu cho user `root`. Để đặt mật khẩu ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `New password: ` và `Re-enter new password: ` ta lần lượt nhập mật khẩu mới và xác nhận mật khẩu.

- Tại dòng `Remove anonymous users? [Y/n] ` cho phép ta xóa tài khoản `anonymous`, `anonymous` là tài khoản mặc định ngay từ khi cài đặt MySQL. Để xóa `anonymous` user ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Disallow root login remotely? [Y/n]` cho phép ta vô hiệu hóa tính năng đăng nhập từ xa đối với tài khoản `root`. Để vô hiệu hóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Remove test database and access to it? [Y/n]` cho phép ta xóa cơ sở dữ liệu `test`, một cơ sở dữ liệu được tạo mặc định ngay từ khi cài đặt MySQL. Để xóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Reload privilege tables now? [Y/n]` ta ấn `Y` để Reload privilege nhằm áp dụng các cấu hình ta vừa đặt ở trên.

Cuối cùng ta đăng nhập bằng tài khoản `root` và thực hiện thử truy vấn SQL đơn giản để kiểm tra.

Để đăng nhập ta thực hiện lệnh `mysql -u root -p`, khi được hỏi mật khẩu ta cần nhập mật khẩu đã được cấu hình ở bước trên, kết quả sẽ như sau:

```
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 5.6.46 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```
Tiếp theo ở dấu nhắc lệnh của MySQL ta có thể thực hiện các truy vấn SQL để kiểm tra nó có hoạt động không:

```
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select host, user, password from user;
+-----------+------+-------------------------------------------+
| host      | user | password                                  |
+-----------+------+-------------------------------------------+
| localhost | root | *87683DC6F262224C77766AE5FB37E7BDE0A17FEE |
| 127.0.0.1 | root | *87683DC6F262224C77766AE5FB37E7BDE0A17FEE |
| ::1       | root | *87683DC6F262224C77766AE5FB37E7BDE0A17FEE |
+-----------+------+-------------------------------------------+
3 rows in set (0.01 sec)

mysql> 
```




### Thiết lập cho phép đăng nhập MySQL từ xa
Khi có nhu cầu đăng nhập và sử dụng MySQL trên các hệ thống khác như các công cụ quản trị database hoặc đăng nhập từ xa, ta cần cấu hình để cấp quyền truy cập cho tài khoản mà ta muốn đăng nhập. Để thực hiện ta cần truy cập vào MySQL và chạy các lệnh sau:

```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

mysql> FLUSH PRIVILEGES;
```

Kết quả sẽ như sau:

```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

mysql> 
```