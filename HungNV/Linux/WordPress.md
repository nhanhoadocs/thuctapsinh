# Cài Đặt WordPress

#### Giới thiệu về WordPress
WordPress là công cụ giúp ta tạo ra các trang website như: blog cá nhân, trang tin tức, trang thương mại hoặc chia sẻ mã nguồn mở .... Sử dụng ngôn ngữ PHP, sử dụng hệ quản trị dữ liệu Mysql.  

**Đặc điểm**: 
- Dễ sử dụng, cộng đồng hỗ trợ lớn
- Bảo mật nội dung bằng mật khẩu 
- Nhiều websites cùng lúc : Phát triển , bảo trì nhiều trang web trong khi chỉ sử dụng 1 cài đặt WordPress
- WordPress tự động lưu các nội dung chúng ta làm việc vì vậy không sợ mất mát dữ liệu khi gặp sự cố máy tính (trừ khi trên máy local).
- Xuất bản nội dung trên các phương tiện khác nhau : Wordpress ngoài phiên bản dành cho máy tính còn có các phiên bản dành cho các thiết bị di động
- Tính năng xem trước bài viết giúp ta chỉnh sửa dễ dàng
- Ngôn ngữ đa dạng

------------------------------------------

## Cài đặt WordPress
**Môi trường lab** : Sử dụng 2 máy ảo chạy hệ điều hành CentOS 7, 1 máy cài WordPress - 1 máy cài Mysql server. 

![Imgur](https://i.imgur.com/OY6DMmx.png)

IFace ens33 sử dụng Vmnet 8 dùng để truy cập internet còn ens33 và ens37 sử dụng Vmnet 2 localhost dùng để truy cập local. 

**Mô hình** : 	

![Imgur](https://i.imgur.com/y79uzSP.png)


**Tiến hành tắt tường lửa và selinux trên cả 2 máy Web và Sql** :
```
[root@localhost ~]# systemctl stop firewalld
[root@localhost ~]# setenforce 0
```
---
### Cấu hình

#### Trên máy SQL

#### 1. Cài đặt Mysql Server

Cài đặt dịch vụ Mysql

```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

rpm -ivh mysql-community-release-el7-5.noarch.rpm

yum install mysql-server
```
Khởi động dịch vụ Mysql
```
systemctl start mysqld
```
Cho phép cải thiện tính bảo mật bằng lệnh sau :
```
mysql_secure_installation
```
#### 2. Tạo cơ sở dữ liệu và người dùng Mysql cho WordPress
Mysql sử dụng cơ sở dữ liệu sql để lưu trữ dữ liệu của mình, nhưng để trang web hoạt động được ta cần tạo người dùng và cơ sở dữ liệu cho trang web của mình.  

**Để bắt đầu, ta đăng nhập vào mysql bằng tài khoản *`root`* bằng lệnh sau** :
```
[root@localhost ~]# mysql -u root -p
Enter password:
```
Nhập mật khẩu `root` tạo ở trên và nó sẽ chuyển đến dấu nhắc lệnh của mysql:
```
[root@localhost ~]# mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 172
Server version: 5.6.45 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
**Tạo user và database sử dụng cho WordPress**

Tạo tên cơ sở dữ liệu :
```
mysql> create database Wordpress;
Query OK, 1 row affected (0.00 sec)
```
> Cuối mỗi câu lệnh của Mysql luôn kết thúc bằng dấu `;` 

Tạo user và mật khẩu :
```
mysql> create user 'user1'@'192.168.136.126' identified by 'password';
Query OK, 0 rows affected (0.00 sec)
```
- 192.168.136.126 : là địa chỉ của của máy Web truy cập Mysql  
- user1 : là user để wordpress sử dụng để đăng nhập vào mysql  
- password : là mật khẩu của user1  

Tiếp theo, ta set quyền cho user để có quyền truy cập vào cơ sở dữ liệu.
```
mysql> GRANT ALL PRIVILEGES ON wordpress.* TO 'user1'@'%' IDENTIFIED BY 'password';
Query OK, 0 rows affected (0.00 sec)
```
Bây giờ user đã có quyền truy cập vào cơ sở dữ liệu, thực hiện lệnh `flush privileges;` để MySQL cập nhật thay đổi:
```
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)
```
```
mysql> exit
Bye
```

### Trên máy Web

### 1. Cài Apache
Apache là 1 phần mềm server http phổ biến và tồn tại lâu nhất (từ năm 1995), ta dễ dàng cài đặt Apache bằng trình quản lý gói (a repository maintained) của CentOs - Yum.   

Để cài đặt **Apache** ta sử dụng lệnh sau :
```
yum install httpd -y
```
Sau khi cài đặt, ta khởi động dịch vụ **Apache** và cho phép nó khởi động cùng hệ thống :
```
systemctl start httpd
systemctl enable httpd
```
Để kiểm tra dịch vụ ta truy cập địa chỉ ip công cộng của máy **Web server** trong trình duyệt Web. Ở đây địa chỉ thuộc **VMnet8** là `192.168.159.120`.
```
http://192.168.159.120
```
Ta sẽ thấy trang Web **Apache** mặc định của CentOS 7 như sau:

![Imgur](https://i.imgur.com/JdMmgE3.png)

### 2. Cài PHP
Dịch vụ php để chạy các tập lệnh, kết nối với cơ sở dữ liệu MySQL để lấy thông tin và đưa nội dung được xử lý đến Web server để hiển thị.  

Ở đây mình muốn cài đặt php phiên bản 5.6 nên trước tiên ta phải bật kho lưu trữ **EPEL** và **Remi** cho hệ thống CentOS 7 bằng các lệnh dưới đây:

```
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```
Tiếp theo cài đặt `Yum-util` để tăng cường các chức năng cũng như cung cấp cho nó các tùy chọn quản lý gói nâng cao và cũng giúp sử dụng dễ dàng hơn.

```
yum install yum-utils
```
Sau khi cài đặt xong, ta tiến hành cài đặt **php 5.6** với những lệnh sau :
```
yum -config-manager --enable remi-php56
```
```
yum install php php-mysql php-gd php-pear –y
```
Kiểm tra xem php đã được cài chưa bằng lệnh
```
php -v
````

Nhập lệnh sau để tạo 1 tệp php :

```
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```
Bây giờ ta cần khởi đông lại dịch vụ **Apache** để nó nhận ra module mới :
```
systemctl restart httpd
```
Vào trình duyệt Web và truy cập địa chỉ `http://địa_chỉ_ip/info.php`, địa chỉ của mình là 192.168.159.120 nên sẽ là như sau:

```
http://192.168.159.120/info.php
```
như này là đã thành công. 

![Imgur](https://i.imgur.com/1oKQSsk.png)

##### 3. Cài WordPress
Trước tiên, ta truy cập vào thư mục `/var/ww/html/` sau đó tiến hành download WordPres từ internet vào thư mục này để tránh việc phải sao chép lại thư mục wordpress vào đây.
```
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
```
sau khi tải về nó là 1 tập tin nén, ta tiến hành giải nén tập tin.
```
tar xzvf latest.tar.gz
```
Tiếp theo, trước khi định cấu hình cho WordPress ta cần đổi tên nó thành `wp-config.php`. Thực hiện điều đó như sau :
```
mv wordpress/* /var/www/html/
mv wp-config-sample.php wp-config.php
```
Bây giờ ta sẽ cấu hình bằng cách thay đổi 1 số thông tin cập nhật theo cơ sở dữ liệu trong file `wp-config.php` .
```
vi /var/www/html/wp-config.php
```
Dưới đây là các giá trị ta cần cập nhật cho cơ sở dữ liệu :
```
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** MySQL database username */
define( 'DB_USER', 'username_here' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password_here' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
```  
Theo như dữ liệu đã thiết lập ở MySQL ta thay đổi các thông số như sau :  
```
define('DB_NAME', 'wordpress');  
define('DB_USER', 'user1');  
define('DB_PASSWORD', 'password');  
define( 'DB_HOST', '192.168.136.127' );  
```
lưu và thoát ra.
> 192.168.136.127 : Là địa chỉ ip localhost của sql

Tiếp theo ta tiến hành tắt cổng IFace **ens33** trên máy sql để máy không thể đi ra ngoài mạng và chỉ sử dụng để kết nối trong local

**Vào trình duyệt Web và điều hướng đến địa chỉ ip của Web server.**
```
http://tên_miền_or_ip_address
```
ta sẽ được chuyển hướng đến cài đặt web cho WordPress, chọn ngôn ngữ và nhấp vào `Continue`, sau đó tiến hành điền các thông tin cần thiết vào các trường sau đó nhấp`Install WordPress`.

![Imgur](https://i.imgur.com/fGe9HHm.png)

Quá trình cài đặt đã xong, chỉ cần nhập **user** và **password** vừa tạo để sử dụng WordPress.

![Imgur](https://i.imgur.com/l0X3nqg.png)

Sau khi đăng nhập, ta sẽ được chuyển hướng đến giao diện của WordPress.

![Imgur](https://i.imgur.com/a3t4E2c.png)

##### Lời kết
Như vậy ta đã cài đặt thành công WordPress trên CentOs 7. Bây giờ ta có thể tạo, sửa, xóa bài viết, cài đặt giao diện thông qua themes, cài các tính năng thông qua các plugin, có rất nhiều plugin và themes miễn phí được phát triển bởi cộng đồng WordPress.