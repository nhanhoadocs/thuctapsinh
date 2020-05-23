# Cài đặt wordpress trên LEMP (Centos 7)

## Cài LEMP

Chuẩn bị máy cài sẵn HĐH CentOS 7 Server. Tất cả lệnh đều dùng quyền root.

**Nhớ tắt SELinux trước**

    #vi /etc/selinux/config

Sửa dòng

    SELinux=disabled

Rồi reboot

Có thể dùng

    #setenforce 0

Kiểm tra

    #sestatus

### Bước 1: Cài nginx

Sử dụng EPEL repositories, cài bằng lệnh

    # yum install epel-release -y
    # yum install nginx -y

Tắt dịch vụ apache nếu có sẵn trên máy

    # systemctl stop httpd.service
    # systemctl disable httpd.service

Start và enable dịch vụ Nginx

    # systemctl start nginx
    # systemctl enable nginx

Mở port cho dịch vụ Nginx

    # firewall-cmd --zone=public --add-service=http
    # firewall-cmd --zone=public --add-service=http --permanent
    # firewall-cmd --zone=public --add-service=https
    # firewall-cmd --zone=public --add-service=https --permanent
    # firewall-cmd --reload

Vào trình duyệt web gõ IP của máy để xem Ngĩn đã hoạt động chưa. Nếu như hình dưới thì tức là đã cài thành công.

![Imgur](https://i.imgur.com/r69uC7j.png)

### Cài MariaDB

Cài bằng lệnh

    #yum install mariadb-server -y 

Bật dịch vụ mariadb

    # systemctl start mariadb.service
    # systemctl enable mariadb.service

Cài đặt một số thông tin ban đầu:

    # mysql_secure_installation

Bạn sẽ được hỏi đặt lại password root hay không. Chọn yes (y) và đặt password mới cho user root. Các câu hỏi sau đó chỉ cần cọn yes (y) là được.

Các câu hỏi sau đó là:

- Xoá bỏ các user khác.
- Không cho phép root đăng nhập từ xa.
- Xoá bỏ databases test.
- Khởi chạy lại bảng Privilege (bảng phân quyền).

### Cài PHP 7.3

Sử dụng repository REMI

    # yum install -y epel-release yum-utils
    # yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

Kích hoạt PHP 7.3 khi sử dụng repository REMI.

    #yum-config-manager --enable remi-php73

Cài đặt PHP 7.3 và các gói cần thiết.

    # yum install php php-mysql php-fpm php-gd php-xml php-mbstring php-opcache php-devel php-pear php-bcmath -y 

Kiểm tra lại phiên bản PHP

    # php -v

Khởi động dịch vụ php-fpm

    # systemctl start php-fpm.service
    # systemctl enable php-fpm.service

### Cấu hình Nginx và PHP-FPM

Thay đổi worker_processes

    #vi /etc/nginx/nginx.conf

Chỉnh `worker_processes` bằng với số processor VPS của bạn.

Cấu hình nginx virtual hosts

    #vi /etc/nginx/conf.d/default.conf

Thay đổi thông tin như bên dưới:  

![Imgur](https://i.imgur.com/l1vtEMF.png)

```
server {
 listen 80;
 server_name 10.10.34.171;
 
 # note that these lines are originally from the "location /" block
 root /usr/share/nginx/html;
 index index.php index.html index.htm;
 
 location / {
 try_files $uri $uri/ =404;
 }
 error_page 404 /404.html;
 error_page 500 502 503 504 /50x.html;
 location = /50x.html {
 root /usr/share/nginx/html;
 }
 
 location ~ \.php$ {
 try_files $uri =404;
 fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
 fastcgi_index index.php;
 fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
 include fastcgi_params;
 }
}
```



Xác minh các tập tin cấu hình

    #nginx -t

Nếu cấu hình đúng thì xuất hiện kết quả

![Imgur](https://i.imgur.com/OhpR952.png)

Restart Nginx

    # systemctl restart nginx.service

Cấu hình PHP-FPM

Vào file `/etc/php-fpm.d/www.conf`

    #vi /etc/php-fpm.d/www.conf

Thay user và group = apache sang nginx

```
[...]
 ; Unix user/group of processes
 ; Note: The user is mandatory. If the group is not set, the default user's group
 ; will be used.
 ; RPM: apache Choosed to be able to access some dir as httpd
 user = nginx
 ; RPM: Keep a group allowed to write in log dir.
 group = nginx
 [...]
```

Restart PHP-FPM

    #systemctl restart php-fpm.service

Kiểm tra cấu hình Nginx và PHP-FPM

vào file `/usr/share/nginx/html/info.php`

Thêm đoạn sau vào

```
<?php
phpinfo();
?>
```

Test thử bằng link: http://<ip-address>/info.php

Kết quả

![Imgur](https://i.imgur.com/2OE5xnK.png)

## Cài Wordpress 

### Tạo Database cho wp

Ở bước chuẩn bị, mình đã cài Mariadb cho cơ sở dũ liệu. Bạn cũng có thể thao tác tương tự với MySQL.

Đăng nhập vào tài khoản root của database:

    #mysql -u root -p

Terminal chuyển sang MariaDB.

Ta tạo Database cho WP. Ở đây ta đặt là db_wp

    CREATE DATABASE db_wp;

Tạo tài khoản riêng để quản lí DB. Tên tài khoản: admin, Mật khẩu: admin

    CREATE USER admin@localhost IDENTIFIED BY 'admin';

Bây giờ ta sẽ cấp quyền quản lí cơ sở dữ liệu cho user mới tạo:

    GRANT ALL PRIVILEGES ON db_wp.* TO admin@localhost IDENTIFIED BY 'admin';

Sau đó xác thực lại những thay đổi về quyền:

    FLUSH PRIVILEGES;

Sau đó, ta thoát ra khỏi MariaDB:

    exit

### Tải và cài đặt WordPress

Tải xuống WordPress phiên bản mới nhất: Nếu chưa cài đặt wget thì có thể cài bằng câu lệnh `apt -y install wget`.

    # wget https://wordpress.org/latest.tar.gz

Sau khi tải xong. Ta tiến hành giải nén file latest.tar.gz

    # tar xvfz latest.tar.gz

Lưu ý: giải nén sẽ ra thư mục wordpress có đường dẫn `/root/wordpress`

Copy các file trong thư mục wordpress tới đường dẫn `/usr/share/nginx/html/`

    # cp -Rvf /root/wordpress/* /usr/share/nginx/html

Di chuyển tới thư mục /var/www/html

    # cd /var/www/html

File cấu hình wordpress là `wp-config.php`. Tuy nhiên tại đây chỉ có `file wp-config-sample.php`. Tiến hành copy lại file cấu hình như sau:

    # cp wp-config-sample.php wp-config.php

Chỉnh sửa file cấu hình wp-config.php. Chỉnh lại tên database, username, password đã đặt ở trên. (db_name: db_wp, username: admin, pass: admin) và lưu lại.

### Cài đặt giao diện

Trên trình duyệt gõ địa chỉ IP server vào thành URL.

Nhập các thông tin cần thiết rồi click Install WordPress.

![Imgur](https://i.imgur.com/6pT3JVe.png)

### Phân quyền WordPress
Phân quyền thư mục wordpress cho user www-data để user này được phép tạo các thư mục và lưu trữ các tệp tin tải lên.

    #chown -R nginx:nginx /usr/share/nginx/html/*
    #chmod -R 755 /usr/share/nginx/html/*

Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của mình.

![Imgur](https://i.imgur.com/ZsUB6eU.png)

