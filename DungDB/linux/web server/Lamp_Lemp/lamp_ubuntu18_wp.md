# Cài đặt wordpress trên LAMP (Ubuntu 18.04)

## Chuẩn bị

Chuẩn bị sẵn 1 máy cài HĐH Ubuntu Server 18.04. Tất cả các lệnh đều thực hiện bằng user `root`

## Cài đặt LAMP

### Bước 1: Cài Apache và update firewall

Cài apache bằng lệnh

    # apt update
    # apt install apache2 -y

Bật ứng dụng và xem trạng thái dịch vụ

    # systemctl enable apache2
    # systemctl start apache2
    # systemctl status apache2

Xem các ứng dụng trên firewall 

    # ufw app list

```
Output
Available applications:
  Apache
  Apache Full
  Apache Secure
  OpenSSH
```

Mở port cho Apache hoạt động

    # ufw allow in "Apache Full"

Kiểm tra apache đã hoạt động hay chưa, vào địa chỉ IP của máy đó trên trình duyệt web. Nếu thấy xuất hiện như hình tức là ok:

![Imgur](https://i.imgur.com/P0c4kaQ.png)

Nếu bạn không biết địa chỉ IP của máy đó, có thể chạy các lệnh

    # ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

hoặc

    # apt install curl
    # curl http://icanhazip.com

### Bước 2: Cài MariaDB

Dùng lệnh

    # apt install mariadb-server

Sau đó thiết lập các cấu hình ban đầu cho mysql 
    
    # mysql_secure_installation

Bạn sẽ được hỏi đặt lại password root hay không. Chọn yes (y) và đặt password mới cho user root. Các câu hỏi sau đó chỉ cần cọn yes (y) là được.

Các câu hỏi sau đó là:

- Xoá bỏ các user khác.
- Không cho phép root đăng nhập từ xa.
- Xoá bỏ databases test.
- Khởi chạy lại bảng Privilege (bảng phân quyền).

### Bước 3: Cài PHP 7.2

Chạy lệnh

    # sudo apt install php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline

Bật module Apache php7.2 và khởi động lại apache

    # a2enmod php7.2

    # systemctl restart apache2

Xem phiên bản PHP

    # php --version

Để kiểm tra PHP đã hoạt động hay chưa. Tạo file `info.php` trong thư mục `/var/www/html/`

    # sudo nano /var/www/html/info.php

Nội dung file gõ vào:

    <?php phpinfo(); ?>

Bật trình duyệt web gõ `server-ip-address/info.php` với server-ip-address là Ip của máy. Nếu xuât hiện như hình tức là đã cài thành công PHP

![Imgur](https://i.imgur.com/DzSoh1F.png)

Nên xóa file `info.php` đi vì nó thể hiện thông tin hệ thống

    # rm /var/www/html/info.php

## Cài WP

### Tạo một MySQL Database và User cho WordPress

Đăng nhập vào tài khoản root của database:

    # mysql -u root -p

Ta tạo Database cho WP. Ở đây ta đặt là db_wp

    CREATE DATABASE db_wp;

Tạo tài khoản riêng để quản lí DB. Tên tài khoản: admin, Mật khẩu: admin

    CREATE USER admin@localhost IDENTIFIED BY 'admin';

Bây giờ ta sẽ cấp quyền quản lí cơ sở dữ liệu cho user mới tạo:

    GRANT ALL PRIVILEGES ON db_wp.* TO admin@localhost IDENTIFIED BY 'admin';

Sau đó xác thực lại những thay đổi về quyền:

    FLUSH PRIVILEGES;

Sau đó, thoát:

    exit

### Cài thêm các Extension PHP cần thiết

Tải và cài đặt một số extension PHP phổ biến để dùng với wordpress.

    # apt update
    # apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

Khởi động lại apache

    # systemctl restart apache2

### Tải và cài wordpress

Chuyển đến thư mục /tmp và tải về bản wp mới nhất

    # cd /tmp
    # curl -O https://wordpress.org/latest.tar.gz

Giải nén với lệnh

    # tar xzvf latest.tar.gz

Copy file config mặc định

    # cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php

Copy tất cả các file trong thư mục wordpress vào `/var/www/html`

    # cp -R /tmp/wordpress/* /var/www/html/

Update quyền sở hữu thư mục

    # chown -R www-data:www-data /var/www/html/

Chỉnh sửa file cấu hình `wp-config.php`. 

    # nano /var/www/html/wp-config.php

Sửa lại ở các dòng thành này

```
. . .

define('DB_NAME', 'db_wp');

/** MySQL database username */
define('DB_USER', 'admin');

/** MySQL database password */
define('DB_PASSWORD', 'admin');

. . .

define('FS_METHOD', 'direct');
```

Lưu và thoát.

Xóa trang index mặc định của apache

    # cd  /var/www/html
    # rm index.html

### Cài đặt giao diện

Trên trình duyệt gõ IP/wp-admin server vào thanh URL.

Nhập các thông tin cần thiết rồi click Install WordPress.

Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của mình.

![Imgur](https://i.imgur.com/jcg0OaZ.png)