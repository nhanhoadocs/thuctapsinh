# 1. Giới thiệu

WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở xây dựng dựa trên PHP và MySQL. Được phát hành vào năm 2003, đến nay WordPress đã trở thành một trong những hệ thống quản lí website phổ biến nhất thế giới với hơn 60 triệu website (số liệu năm 2019).

# 2. Cài đặt

## Chuẩn bị 

Đầu tiên, ta cần cài đặt bộ LAMP trên máy của bạn.
LAMP là một hệ thống các phần mềm để tạo dựng môi trường máy chủ web có khả năng chứa và phân phối các trang web động được viết bằng PHP.

LAMP bao gồm:

- Linux: là hệ điều hành, cũng là phần mềm dùng để điều phối và quản lí các tài nguyên của hệ thống.
- Apache: là phần mềm máy chủ web, có thể thực hiện các request được gọi tới máy chủ thông qua giao thức HTTP
- Mysql/Mariadb: là hệ quản trị cơ sở dữ liệu giúp lưu trữ và truy xuất dữ liệu. Cả 2 hệ quản trị cơ sở dữ liệu này đều khá tương đồng với nhau (có thể tìm hiểu thêm tại đây)
- PHP: Là ngôn ngữ lập trình cho kịch bản hoạt động của máy chủ.

Đầu tiên cài Linux, ở đây dùng HDH CentOS 7.
Tiếp theo cài Apache:

    sudo yum -y install httpd

Khởi động lại dịch vụ và kiểm tra    
   
    systemctl start httpd
    systemctl enable httpd
    systemctl status httpd

Bạn cũng có thể kiểm tra trạng thái trên trình duyệt bằng cách gõ trên thanh url địa chỉ sau:

    <địa chỉ ip server>

Mở port 80 trên firewall để dịch vụ web có thể chạy

    firewall-cmd --permanent --add-port=80/tcp
    firewall-cmd --reload

Tiếp theo cài MariaDB

    sudo yum -y install mariadb mariadb-server

Khởi động dịch vụ

    systemctl start mariadb

Cài lại mật khẩu mật khẩu cho quyền root của cơ sở dữ liệu:

    sudo mysql_secure_installation

Nhập mật khẩu mới và gõ y cho các câu hỏi tiếp theo.

Sau khi thiết lập xong, kích hoạt mariadb để khởi động cùng hệ thống:

    systemctl enable mariadb

Cài đặt php:

Phiên bản có sẵn trong repo của CentOS đang là 5.4. Phiên bản này khá cũ và sẽ khiến bạn gặp một số vấn đề xảy ra khi tiến hành cài đặt wordpress. Vì vậy bạn cần phải cài đặt phiên bản 7x để khắc phục. Bạn cần tiến hành thêm kho vào Remi CentOS:

    rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

Cài yum-utils vì chúng ta cần tiện ích yum-config-manager để cài đặt:

    yum -y install yum-utils

Tiến hành cài đặt php, ở đây tôi cài bản 7.2

    yum-config-manager --enable remi-php72
    yum -y install php php-opcache php-mysql

Sau khi cài xong, khởi động lại apache

    systemctl restart httpd

Tiến hành kiểm tra kết quả. Ta thêm file sau:

    echo "<?php phpinfo();?>" > /var/www/html/info.php

Sau khi cài xong, khởi động lại apache

    systemctl restart httpd

Vào trình duyệt, gõ trên thanh url địa chỉ sau:

    <địa chỉ ip>/info.php

Nếu hiện thị như hình tức là đã cài thành công

![Imgur](https://i.imgur.com/Ig1Qdgl.png)

## Tạo cơ sở dữ liệu và tài khoản cho WP

Đăng nhập vào tài khoản root của database:
```
[root@localhost ~]# mysql -u root -p

Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 5.5.64-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```
erminal chuyển sang MariaDB.

Ta tạo Database cho WP. Ở đây ta đặt là `testdbwp`

    MariaDB [(none)]> CREATE DATABASE testdbwp;
    Query OK, 1 row affected (0.00 sec)

Tạo tài khoản riêng để quản lí DB. Tên tài khoản: admin, Mật khẩu: admin

    MariaDB [(none)]> CREATE USER admin@localhost IDENTIFIED BY 'admin';
    Query OK, 0 rows affected (0.00 sec)

Bây giờ ta sẽ cấp quyền quản lí cơ sở dữ liệu cho user mới tạo:

    MariaDB [(none)]> GRANT ALL PRIVILEGES ON testdbwp.* TO admin@localhost IDENTIFIED BY 'admin';
    Query OK, 0 rows affected (0.00 sec)

Sau đó xác thực lại những thay đổi về quyền:

    MariaDB [(none)]> FLUSH PRIVILEGES;
    Query OK, 0 rows affected (0.00 sec)

Sau đó, ta thoát ra khỏi MariaDB

    MariaDB [(none)]> exit
    Bye

## Tải và cài đặt WordPress

Cài gói hỗ trợ `php-gd`:

    [root@localhost ~]# yum -y install php-gd

Tải xuống WordPress phiên bản mới nhất: Nếu chưa cài đặt wget thì có thể cài bằng câu lệnh 
  
    # yum install wget.
    # wget https://wordpress.org/latest.tar.gz

**Lưu ý**: Bạn cần để ý tới thư mục đang lưu trữ file wordpress đang được tải xuống. Ở đây mình lưu tại thư mục `/root`.

Ta sẽ giải nén file `latest.tar.gz`:

    # tar xvfz latest.tar.gz

**Lưu ý**: giải nén sẽ ra thư mục wordpress có đường dẫn `/root/wordpress`.

Copy các file trong thư mục WordPress tới đường dẫn `/var/www/html`

    # cp -Rvf /root/wordpress/* /var/www/html

## Cấu hình WordPress

Chuyển tới đường dẫn `/var/www/html`

    [root@localhost ~]# cd /var/www/html

File cấu hình wordpress là `wp-config.php`. Tuy nhiên tại đây chỉ có file `wp-config-sample.php`. Tiến hành copy lại file cấu hình như sau:

    # cp wp-config-sample.php wp-config.php

Mở file `wp-config.php` bằng `vi` để chỉnh sửa. Chỉnh lại tên database, username, password đã đặt ở trên. (db_name: testdbwp, username: admin, pass: admin) và lưu lại.

## Hoàn tất cài đặt giao diện

Trên trình duyệt gõ địa chỉ IP server vào thành URL, ta được giao diện như sau:

![Imgur](https://i.imgur.com/Xmhx9ud.png)

Nhập các thông tin cần thiết rồi Install WordPress.

![Imgur](https://i.imgur.com/8lndD7k.png)

Như vậy là bạn đã thiết lập thành công. Tiến hành đăng nhập vào WordPress:

![Imgur](https://i.imgur.com/NA4WCOj.png)

Giao diện sau khi đăng nhập vào WordPress:

![Imgur](https://i.imgur.com/TQ2jqoF.png)

## Phân quyền thư mục WP

Bạn cần phân quyền thư mục wordpress cho user apache để user này được phép tạo các thư mục và lưu trữ các tệp tin tải lên.

    [root@localhost ~]# chown -R apache:apache /var/www/html/*
    [root@localhost ~]# chmod -R 755 /var/www/html/*

Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của mình.

![Imgur](https://i.imgur.com/80J2Faq.png)