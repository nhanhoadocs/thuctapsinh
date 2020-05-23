# Hướng dẫn cài đặt LAMP stack trên Ubuntu 20.04

LAMP là một hệ thống các phần mềm để tạo dựng môi trường máy chủ web được viết bằng PHP.

LAMP là viết tắt của Linux - Apache - Mysql database (hoặc MariaDB) - PHP.

Bài viết này sẽ hướng dẫn bạn cài đặt LAMP trên máy Ubuntu 20.04 LTS.

**Lưu ý:** Tất cả các lệnh trong bài này đều chạy dưới quyền của user root hoặc user có quyền sudo.

## Bước 1: Cài Linux

Hệ điều hành chúng ta sử dụng ở đây là Ubuntu 20.04 LTS. Bạn làm theo hướng dẫn tại đây để cài đặt.

## Bước 2: Cài Apache

Là phần mềm web server phổ biến nhất thế giới. Là một lựa chọn tốt để hosting một trang web.

Để cài đặt apache, sử dụng lệnh:

    sudo apt -y update
    sudo apt -y install apache2

Kiểm tra phiên bản Apache:

    root@u20:~# apache2 -v

    Server version: Apache/2.4.41 (Ubuntu)
    Server built:   2020-04-13T17:19:17

Kiểm tra trạng thái dịch vụ:

    systemctl status apache2

Khởi động lại dịch vụ

    systemctl reload apache2

Bật khởi chạy cùng hệ thống

    systemctl enable apache2 

Dịch vụ Apache hoạt động trên port 80 và 443. Để cho phép Apache hoạt động trên 2 port này. Ta dùng lệnh:

    sudo ufw allow in "Apache Full"

Sau khi đã cài xong. Bạn mở trình duyệt và nhập địa chỉ IP của mình vào thanh URL. Nếu bạn thấy màn hình như sau tức là Apache đã hoạt động.

![Imgur](https://i.imgur.com/hOxFVA9.png)

## Bước 3: Cài MariaDB

Ở đây bạn có thể chọn cài MariaDB hoặc Mysql DB. Trong hướng dẫn này chúng tôi cài MariaDB.

Để cài đặt, sử dụng lệnh

    apt install -y software-properties-common mariadb-server mariadb-client 

Kiểm tra trạng thái dịch vụ

    systemctl status mariadb

Kiểm tra version của MariaDB

    mysql -V

Output:

    mysql  Ver 15.1 Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2

Thiết lập một số thông tin cơ bản

    mysql_secure_installation

Cài lại mật khẩu cho quyền root của cơ sở dữ liệu:

    Enter currret password for root (enter for none): 

Bước này yêu cầu bạn nhập mật khẩu gần đây cho root. Nếu bạn mới cài lần đầu thì nhấn Enter để tiếp tục.

    Set root password? (Y/n)

Nếu bạn cài lần đầu, hệ thống sẽ hỏi bạn muốn cài password cho quyền root không. Bạn gõ Y -> Enter, sau đó nhập mật khẩu và xác thực mật khẩu.

Với những máy mới cài mariadb lần đầu, hệ thống yêu cầu thêm một số thiết lập như sau:

- Xoá bỏ các user khác.
- Không cho phép root đăng nhập từ xa.
- Xoá bỏ databases test.
- Khởi chạy lại bảng Privilege (bảng phân quyền).

Bạn chỉ cần gõ Y cho những yêu cầu đó.

```
root@u20:~# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDBSERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'llneed the current password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank, so you should just press enter here.

Enter current password for root (enter for none):                                                    
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB root user without the proper authorisation.

Set root password? [Y/n] y
New password:
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation go a bit smoother.  You should remove them before moving into a
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
root@u20:~#
```

## Bước 4. Cài đặt PHP

Trên Ubuntu server 20.04 LTS, phiên bản có sẵn của PHP trong kho cài đặt là 7.4.

Cài đặt php và các gói hỗ trợ

    apt install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath

Kiểm tra lại phiên bản của PHP

    php -v

Output

    PHP 7.4.3 (cli) (built: Mar 26 2020 20:24:23) ( NTS )
    Copyright (c) The PHP Group
    Zend Engine v3.4.0, Copyright (c) Zend Technologies
        with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies

Kích hoạt module Apache cho PHP 7.4:

    a2enmod php7.4

Khởi động lại Apache

    systemctl reload apache2 

Thêm file `info.php`

    echo "<?php phpinfo();?>" > /var/www/html/info.php

Vào trình duyệt gõ địa chỉ trên thanh url theo dạng sau:

    <địa chỉ ip>/info.php

Khi xuất hiện màn hình tương tự như hình dưới có nghĩa là đã cài PHP thành công.

![Imgur](https://i.imgur.com/9PO0mS6.png)

Xóa file `info.php` đi vì nó thể hiện thông tin hệ thống.

    rm /var/www/html/info.php

## KẾT LUẬN

Trên đây là hướng dẫn của Cloud365 về cách cài đặt LAMP trên Ubuntu server 20.04 TLS. Chúc các bạn thành công!!
