# Cài đặt wordpress trên CentOS 7

Bài viết này hướng dẫn cài wordpress trên 2 node. Nếu bạn muốn cài trên 1 node bạn có thể tham khảo <a href ="https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/docs/LAMP.md"  target="_blank">tại đây</a>

## Chuẩn bị

Chuẩn bị 2 máy chạy HĐH CentOS7. 

Trong đó một máy sẽ đóng vai trò MySQL Server và một máy sẽ là Web Server.

Cấu hình máy Web Server 

 * 1 CPU
 * 512M RAM
 * 2 interface

 Cấu hình máy MySQL

 * 1 CPU
 * 512M RAM
 * 1 interface

Vì đây là môi trường lab nên tôi tiến hành stop firewalld trên cả 2 máy và SElinux trên Web Server.

Sử dụng lệnh

```
setenforce 0

systemctl stop firewalld
```

Nếu không muốn bạn có thể thực hiện mở port 80 trên Web Server và mở kết nối tới DB còn trên máy MySQL cần mở port 3306.

## Mô hình như sau

![](/wordpress/images/wordpress1/1.png)

Trong đó 
 * Dải IP 192.168.50.x/24 là dải IP local không thể ra được internet.
 * IP 192.168.122.166 được sử dụng để ra ngoài internet.

## Cấu hình

### Trên máy MySQL

**Bước 1: Cài đặt MySQL server**

Chạy lần lượt các lệnh sau:

```

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

rpm -ivh mysql-community-release-el7-5.noarch.rpm

yum install mysql-server

```

Khởi động MySQL

```
systemctl start mysqld
```

Chạy lệnh sau để thiết lập tài khoản `root`

```
mysql_secure_installation
```

Để kiểm tra ta truy cập thử MySQL với tài khoản `root`.

**Bước 2: Tạo Database cho wordpress**

Đăng nhập vào MySQL với user `root`

```
mysql -u root -p
```

Tạo user và database để sử dụng cho wordpress

```
create database tên-database;

create user 'user'@'IP' identified by 'pass';

grant all privileges on tên-database to 'user'@'IP';

flush privileges;
```

Trong đó

 * `tên-database` là tên database sử dụng cho wordpress
 * `user` là tên user sử dụng để wordpress kết nối vào MySQL
 * `IP` là địa chỉ của máy Web Server để truy cập MySQL

VD:

```
create database wordpress;

create user 'niemdt'@'192.168.50.56' identified by '123456';

grant all privileges on tên-database to 'niemdt'@'123456';

flush privileges;
```

### Trên máy Web server

**Bước 1: Cài Apache**

Chạy lệnh sau để cài đặt

`yum install httpd -y`

Khởi động Apache và cho phép khởi động cùng hệ thống

```
systemctl start httpd

systemctl enable httpd
```

Để kiểm tra ta mở trình duyệt và truy cập vào địa chỉ IP của web server

`http://địa-chỉ-IP`


Kết quả trả về như sau

![](/wordpress/images/wordpress1/2.1.png)

**Bước 2: Cài PHP**

Sử dụng `yum` để cài PHP

```
yum install php php-mysql php-gd php-pear –y
```

Để test PHP đã cài đặt thành công chưa

Thực hiện lệnh

```
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```

Sau đó restart lại `httpd`

```
systemctl restart httpd
```

Mở trình duyệt web truy cập địa chỉ `http://địa chỉ Ip/info.php`

Kết quả trả về như sau là thành công

![](/wordpress/images/wordpress1/3.1.png)

**Bước 3: Cài wordpress**

Truy cập vào thư mục `html`

```
cd /var/www/html
```

Dowload file để cài wordpress từ internet

```
wget https://wordpress.org/latest.tar.gz
```

Giải nén tập tin 

```
tar xzvf latest.tar.gz
```

Cấu hình wordpress để kết nối với MySQL

```
cd /var/www/html/

mv wordpress/* /var/www/html/

mv wp-config-sample.php wp-config.php
```

Sửa file

```
vi wp-config.php
```

Sau đó tìm các dòng sau để sửa thông tin

```
define('DB_NAME', 'database_name_here');    

define('DB_USER', 'username_here');    

define('DB_PASSWORD', 'password_here');      

define('DB_HOST', 'localhost');   
```

Trong đó:

 * `database_name_here` : tên của database
 * `username_here`      : tên user login vào mysql
 * `username_here`      : password của user login vào mysql
 * `localhost`          : địa chỉ cuả máy MySQL Sever

VD:

```
define('DB_NAME', 'wordpress');    

define('DB_USER', 'niemdt');    

define('DB_PASSWORD', '123456');      

define('DB_HOST', '192.168.50.219');   
```

Sau đó lưu các thay đổi

Mở kết nối sang MySQL server

Bây giờ mở trình duyệt và truy cập địa chỉ của bạn để tiến hành cấu hình wordpress.

Sau khi cấu hình và đăng nhập vào sẽ có được giao diện như sau

![](/wordpress/images/wordpress1/4.png)