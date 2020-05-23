# Cài WordPress trên 2 Server Ubuntu và CentOs7
**Mô hình Lab:**  
![Imgur](https://i.imgur.com/sg1lxtJ.png)  

Trên máy Ubuntu server: cài Mysql client, PHP, WordPress  
Trên máy CentOS7: cài SQL server
### 1. Cấu hình
#### a. Trên CentOS 7  
##### 1. Cài đặt Mysql Server

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
mysql> create database wordpress;
Query OK, 1 row affected (0.00 sec)
```
> Cuối mỗi câu lệnh của Mysql luôn kết thúc bằng dấu `;` 

Tạo user và mật khẩu :
```
mysql> create user 'ubuntu1'@'192.168.159.130' identified by 'password';
Query OK, 0 rows affected (0.00 sec)
```
- 192.168.159.130 : là địa chỉ của của máy ubuntu truy cập Mysql Server  
- ubuntu1 : là user để wordpress sử dụng để đăng nhập vào mysql  
- password : là mật khẩu của ubuntu1 

Tiếp theo, ta set quyền cho user để có quyền truy cập vào cơ sở dữ liệu.
```
mysql> GRANT ALL PRIVILEGES ON wordpress.* TO 'ubuntu1'@'%' IDENTIFIED BY 'password';
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
#### b. Trên Ubuntu 18.04
##### 1. Cài Sql Client 

Di chuyển đến thư mục để tải về:
```
cd /tmp
```
Tải xuống tệp bằng cách sử dụng `curl`. Sử dụng `-OL` để `curl` xuất ra 1 tệp thay vì đầu ra tiêu chuẩn và để `curl` theo chuyển hướng HTTP. `-OL` là cần thiết vì địa chỉ này sẽ thực sự chuyển hướng đến 1 vị trí khác trước khi tải tệp xuống:
```
curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
```
Sau khi tải về, ta sẽ thấy tên tệp được liệt kê khi sử dụng `ls` như này:
```
mysql-apt-config_0.8.13-1_all.deb
```
Lệnh `dpkg` được sử dụng để cài đặt, gỡ bỏ và kiểm tra các gói có đuôi `.deb`. Sử dụng tùy chọn `-i` để cho biết bạn muốn cài đặt từ tệp đã chỉ định.
```
sudo dpkg -i mysql-apt-config*
```
Trong qua trình cài đặt, ta thấy 1 màn cấu hình nơi có thể chỉ định phiên bản MySQL, cùng với tùy chọn cài đặt kho lưu trữ cho các công cụ liên quan đến MySQl. Mặc định sẽ thêm thông tin kho lưu trữ cho phiên bản ổn định mới nhất của MySQL và không có gì khác. Vì vậy, ta sử dụng mũi tên xuống để điều hướng đến `OK` và nhấn `Enter`.  

![Imgur](https://i.imgur.com/Pbn8env.png)

Sau đó, ta cập nhật các gói phần mềm mới bằng cách sử dụng : 
```
apt update
```
Bây giờ, ta đã sẵn sàng sử dụng `apt` để cài đặt phần mềm MySQL client:
```
apt install mysql-client
```
Kiểm tra phiên bản MySQL đã cài:
```
mysql --version
```
Bây giờ ta có thể truy cập cơ sở dữ liệu của mình bằng cách chạy lệnh sau:
```
mysql -u user -p -h ip_sql_server -P port_number
```
Lệnh này bao gồm tùy chọn `-u` nhắc ta nhập user sử dụng để đăng nhập sql (ở đây user của ta như đã tạo trên Sql server là ubuntu1), tùy chọn `-p` để nhập mật khẩu user, `-h` nhắc ta nhập địa chỉ của Mysql server ( địa chỉ Mysql server ở đây là địa chỉ của CentOS 7), tùy chọn `-P` để nhập số port mà Sql server đang sử dụng (thường là 3306).

##### 2. Cài đặt máy chủ Apache2
Để cài đặt máy chủ web Apache, hãy chạy lệnh sau:
```
apt-get install apache2
```
Sau khi cài đặt hoàn tất, kích hoạt Apache để tự động khởi động khi máy chủ khởi động với:
```
systemctl restart apache2
```

##### 3. Cài đặt PHP
WordPress và nhiều plugin của nó sử dụng các tiện tích mở rộng PHP mà sẽ cần cài đặt thủ công. Phần này là tùy chọn nhưng nó sẽ cho phép bạn truy cập một số tính năng WordPress. Dưới đây là những modul PHP phổ biến nhất thường được sử dụng bởi các ứng dụng php. Để cài chúng, ta chỉ cần sử dụng lênh sau:
```
sudo apt-get install php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php
```
```
apt install -y php7.2-cli
```
Nhập lệnh sau để tạo 1 tệp php :

```
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```
Bây giờ ta cần khởi đông lại dịch vụ **Apache** để nó nhận ra module mới :
```
systemctl restart apache2
```
##### 4. Cài đặt WordPress
Bây giờ ta có thể tiến hành cài đặt WordPress. Chạy các lệnh sau để tải xuống và trích xuất các tệp cài đặt WordPress mới nhất trong thư mục root của tài liệu máy chủ mặc định (/var/www/html).
```
cd /var/www/html
wget -c http://wordpress.org/latest.zip
unzip latesy.zip
```
Tất cả tệp WordPress sẽ được đặt trong thư mục wordpress trong /var/ww/html/wordpress

Sau khi cơ sở dữ liệu được tạo, ta sẽ cần thêm thông tin này vào tệp cấu hình WordPress.

Đầu tiên, chạy lệnh sau để đổi tên tệp cấu hình mẫu:

```
cd /var/ww/html/wordpress
mv wp-config-sample.php wp-config.php
```
Bây giờ, mở tệp wp-config.php bằng trình soạn thảo văn bản yêu thích và sửa nó như sau :
```
vi wp-config.php
```   
Dưới đây là các giá trị ta cần cập nhật cho cơ sở dữ liệu :
```
// ** MySQL settings - You can get this info from your web ost ** ///** The name of the database for WordPress */
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
define('DB_USER', 'ubuntu1');  
define('DB_PASSWORD', 'password');  
define( 'DB_HOST', '192.168.159.127:3306' );  
```
lưu và thoát ra.
> 192.168.159.127 : Là địa chỉ ip của sqlserver

Cập nhật quyền sở hữu thư mục web với `chown`:
```
chown -R www-data:www-data /var/www/html/wordpress/
```
Tiếp theo chạy hai lệnh `find` sau để cài đặt quyền chính xác trên các thư mục và tệp WordPress:
```
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;  
```
```
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
```
**Tạo tập tin máy chủ ảo**  

Bây giờ ta có thể tạo tập tin máy chủ ảo, chạy lệnh sau để tạo tệp cấu hình máy chủ ảo cho tên miền của bạn:
```
vi /etc/apache2/site-available/your_domain.com.conf
```
Và thêm nội dung sau vào tệp:
```
<VirtualHost *:80>

ServerAdmin admin@your_domain.com
ServerName your_domain.com
ServerAlias www.your_domain.com
DocumentRoot /var/www/html/wordpress

<Directory /var/www/html/wordpress>
     Options Indexes FollowSymLinks
     AllowOverride All
     Require all granted
</Directory>

ErrorLog ${APACHE_LOG_DIR}/your_domain.com_error.log 
CustomLog ${APACHE_LOG_DIR}/your_domain.com_access.log combined 
</VirtualHost>
```
Để kích hoạt máy chủ ảo, ta tiến hành chạy lệnh sau:
```
ln -s /etc/apache2/sites-available/your_domain.com.conf /etc/apache2/sites-enabled/your_domain.com.conf
```
Khởi động lại dịch vụ Apache
```
systemctl restart apache2
```

**Vào trình duyệt Web và điều hướng đến địa chỉ ip của Web server.**  
```
http://tên_miền_or_ip_address/wordpress/wp-admin
```
ta sẽ được chuyển hướng đến cài đặt web cho WordPress, chọn ngôn ngữ và nhấp vào `Continue`, sau đó tiến hành điền các thông tin cần thiết vào các trường sau đó nhấp`Install WordPress`.

![Imgur](https://i.imgur.com/fGe9HHm.png)

Quá trình cài đặt đã xong, chỉ cần nhập **user** và **password** vừa tạo để sử dụng WordPress.

![Imgur](https://i.imgur.com/l0X3nqg.png)

Sau khi đăng nhập, ta sẽ được chuyển hướng đến giao diện của WordPress.

![Imgur](https://i.imgur.com/a3t4E2c.png).

#### Phần kết luận
Khi hoàn thành hướng dẫn này, bạn sẽ cài đặt WordPress và sẵn sàng sử dụng trên máy chủ của mình. Ngoài ra, cài đặt WordPress của bạn đang tự động lấy các bài đăng, trang và nội dung khác từ cơ sở dữ liệu MySQL được quản lý của bạn.



