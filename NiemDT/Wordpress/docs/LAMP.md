# Cài đặt wordpress

Hướng dẫn cài đặt wordpress trên 1 note.

## LAMP là gì?

Lamp thường được dùng để phát triển web server. LAMP là từ viết tắt của Linux, Apache, Mysql, PHP. 

## Cài đặt LAMP

Để cài đặt LAMP ta tiến hành cài đặt lần lượt các thành phần của nó. Trước tiên ta cần một máy có chạy hệ điều hành Linux.

**Cài đặt Apache**

Apache là một phần mềm được đặt trên máy chủ web server để xử lý các yêu cầu gửi tới máy đó dưới giao thức HTTP hoặc HTTPs.

Sử dụng lệnh `yum` để cài đặt Apache

```
yum install httpd -y
```

Bật dịch vụ Apache và cho phép khởi động cùng hệ thống

```
# systemctl start httpd

# systemctl enable httpd
```

Tắt firewall

```
systemctl stop firewalld
```

Để kiểm tra ta vào trình duyệt web và truy cập 

`http://địa-chỉ-IP`

![](/wordpress/images/LAMP/1.png)

**Cài Mysql**

Chạy lần lượt các lệnh sau

`wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm`

`rpm -ivh mysql-community-release-el7-5.noarch.rpm`

`yum install mysql-server`

Bật Mysql

`systemctl start mysqld`

Chạy lệnh sau để thiết lập tài khoản `root`

`mysql_secure_installation`

Để kiểm tra ta truy cập thử Mysql 

**Cài PHP**

Sử dụng `yum` để cài PHP

```
yum install php php-mysql php-gd php-pear –y
```

Để test PHP đã cài đặt thành công chưa

Thực hiện lệnh

`echo "<?php phpinfo(); ?>" > /var/www/html/info.php`

Sau đó restart lại dịch vụ httpd

`systemctl restart httpd`

Mở trình duyệt web truy cập địa chỉ `http://địa chỉ Ip/info.php`

Kết quả trả về như sau là thành công

![](/wordpress/images/LAMP/2.png)

Đến đây đã cài đặt thành công LAMP

## Cài wordpress

Được sử dụng để hỗ trợ tạo ra website

Để cài Wordpress ta cần cài đặt trước LAMP

Chạy các lệnh

`cd /var/www/html/` để truy cập vào thư mục `html`

Taỉ tập tin Wordpress từ trên internet về

```
wget https://wordpress.org/latest.tar.gz
```

Giải nén tập tin

```
tar xzvf latest.tar.gz
```

**Tạo cơ sở dữ liêu Mysql**

Truy cập MySQL

`mysql -u root -p`

Tạo cơ sở dữ liệu và user có quyền sử dụng nó

`create database wordpress;`

`create user 'user1'@'localhost' identified by 'password';`

Gán quyền sử dụng database cho user

`grant all privileges on wordpress.* to 'user1'@'lcalhost';`

Cập nhật thay đổi

`flush privileges;`

Thoát khỏi mysql

`exit;`

**Cấu hình wordpress kết nối với Database**

Đổi tên và chỉnh sửa tập tin cấu hình chính của wordpress

```
cd /var/www/html/

mv wordpress/* /var/www/html/

mv wp-config-sample.php wp-config.php

vi wp-config.php
```

Tìm các dòng sau và thay đồi giá trị phù hợp

```
define('DB_NAME', 'wordpress');     # tên database tạo ở trên

define('DB_USER', 'user1');     # tên user vừa tạo

define('DB_PASSWORD', 'password');      # password của user bên trên
```

Sau đó lưu các thay đổi

Bây giờ mở trình duyệt và truy cập địa chỉ của bạn để tiến hành cấu hình wordpress.

Sau khi cấu hình và đăng nhaaoj vào sẽ có được giao diện như sau

![](/wordpress/images/LAMP/3.png)

Đến đây đã cài đặt thành công wordpress trên Centos7 bằng LAMP.