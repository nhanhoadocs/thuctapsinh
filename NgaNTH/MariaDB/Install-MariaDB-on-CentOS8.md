## Hướng dẫn cài đặt MariaDB trên CentOS 8  

MariaDB là một nhánh của cộng đồng phát triển cơ sở dữ liệu quan hệ MySQL.   
Trong loạt bài viết trước, Cloud365 đã giới thiệu đến bạn đọc cách cài đặt và quản lý cơ sở dữ liệu MariaDB trên CentOS 7. Hòa cùng dòng chảy công nghệ, chúng ta tiếp tục tìm hiểu cách cài đặt và sử dụng MariaDB trên CentOS 8.  
Một trong các điểm mới của CentOS 8 là về trình quản lý gói quen thuộc YUM đã được thay thế bằng DNF. Ta sẽ tiến hành cài đặt `MariaDB 10.3` bằng lệnh `dnf module -y install mariadb:10.3`.   
```
[root@centos8srv01 ~]# dnf module -y install mariadb:10.3
```  
Mặc định charaset trong file cấu hình `mariadb-server.cnf` là `latin1`. Ta sẽ thiết lập lại bằng cách thêm mã `character-set-server=utf8` vào dòng 21 trong `/etc/my.cnf.d/mariadb-server.cnf`  
```
vi /etc/my.cnf.d/mariadb-server.cnf
character-set-server=utf8  
```  
Kích hoạt dịch vụ MariaDB tự chạy khi khởi động hệ thống  
```
systemctl enable --now mariadb
```
Mở port trên firewall cho phép kết nối dịch vụ MariaDB 
```
[root@centos8srv01 ~]# firewall-cmd --add-service=mysql --permanent
success
[root@centos8srv01 ~]# firewall-cmd --reload
success
```
### Bảo mật MariaDB trên CentOS 8  

Sử dụng lệnh `mysql_secure_installation` để thiết lập mật khẩu root, vô hiệu hóa đăng nhập root từ xa, xóa database test, xóa anonymous user và cuối cùng là reload các table liên quan đến quyền hạn. 
```
[root@centos8srv01 ~]# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] y
New password:
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```
### Tác vụ quản trị cơ bản với MariaDB  

**Đăng nhập MariaDB với tài khoản root**  
```
[root@centos8srv01 ~]# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 16
Server version: 10.3.11-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```
**Hiển thị danh sách user**  
```
MariaDB [(none)]> select user,host,password from mysql.user;
+------+-----------+-------------------------------------------+
| user | host      | password                                  |
+------+-----------+-------------------------------------------+
| root | localhost | *xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
| root | 127.0.0.1 | *xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
| root | ::1       | *xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
+------+-----------+-------------------------------------------+
3 rows in set (0.001 sec)
```
**Hiển thị danh sách cơ sở dữ liệu**  
```
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.001 sec)
```

**Tạo cơ sở dữ liệu `test_database`**  
```
MariaDB [(none)]> create database test_database;
Query OK, 1 row affected (0.001 sec)
```

**Tạo bảng `test_table`**  
Trong cơ sở dữ liệu `test_database` tạo bảng `test_table` gồm các trường `id`, `name`, `address`, `primary key` tương ứng với các kiểu dữ liệu int, varchar(50), varchar(50), id.    
```
MariaDB [(none)]> create table test_database.test_table (id int, name varchar(50), address varchar(50), primary key (id));
Query OK, 0 rows affected (0.004 sec)
```
**Chèn thông tin các trường trong bảng**  
```
MariaDB [(none)]> insert into test_database.test_table(id, name, address) values("001", "CentOS", "Cloud365");
Query OK, 1 row affected (0.001 sec)
```
**Hiển thị thông tin của bảng**  
```
MariaDB [(none)]> select * from test_database.test_table;
+----+--------+----------+
| id | name   | address  |
+----+--------+----------+
|  1 | CentOS | Cloud365 |
+----+--------+----------+
1 row in set (0.001 sec)
```  
**Xóa cơ sở dữ liệu**  
```
MariaDB [(none)]> drop database test_database;   
Query OK, 1 row affected (0.111 sec)
```
**Thoát khỏi MariaDB**  
```
MariaDB [(none)]> exit
Bye
```  

**Sử dụng HeidiSQL để tương tác với cơ sở dữ liệu**  

Trong phần tiếp theo Cloud365 sẽ chia sẻ đến các bạn cách tương tác với database bằng việc sử dụng `HeidiSQL`.  
Bước đầu tiên là bạn cần tạo tài khoản user để quản lý database của mình. Ở đây ta sẽ tạo user `root` và phân quyền truy cập vào tất cả các bảng thuộc tất cả các database.  
```
[root@centos8srv01 ~]# mysql -u root -p

MariaDB [(none)]> create user 'root'@'192.168.152.138' identified by 'password';
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> grant all on *.* to 'root'@'%' identified by 'password';
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.001 sec)
```
Tiếp theo ta sẽ chèn thêm thông tin vào bảng `test_table` trong cơ sở dữ liệu `test_database` để phục vụ cho việc truy vấn dữ liệu sau này 
```
MariaDB [(none)]> insert into test_database.test_table(id, name, address) values("002", "Ubuntu", "Hanoi");
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> insert into test_database.test_table(id, name, address) values("003", "CentOS", "TpHCM");
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> insert into test_database.test_table(id, name, address) values("004", "Ubuntu", "Danang");
Query OK, 1 row affected (0.001 sec)
```  
Sau đó ấn `exit` để thoát.  

**Tải và cài đặt HeidiSQL**  

Bạn có thể download HeidiSQL tại [đây](https://www.heidisql.com/download.php?download=installer) và tiến hành cài đặt trên một host khác (Windows hoặc Ubuntu). Khởi động HeidiSQL sẽ hiện lên cửa sổ Session manager. Ta chọn tab `New` và điền thông tin vào ô `Hostname/IP`, `User` và `Password`. Sau đó chọn `Open` để kết nối với Database.  

<img src="https://i.imgur.com/MXEdtoB.png">  

Giao diện quản lý Database sẽ được hiển thị như hình bên dưới. Bạn sẽ quan sát được danh sách cơ sở dữ liệu  và có thể truy vấn đến tất cả các bảng cũng như databases của mình.  

<img src="https://i.imgur.com/qAMbqFq.png">  

<img src="https://i.imgur.com/iPkr9p4.png">




