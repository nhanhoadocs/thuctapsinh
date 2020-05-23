# Hướng dẫn cài đặt LAMP Stack trên Ubuntu 20.04 Develop version

## Các thao tác dưới đây thực hiện với quyền `root`


## 1. Cài đặt Linux
Tại đây, ta cài đặt trên **Ubuntu 20.04 Develop version**

- Update kho lưu trữ và các gói
    ```
    apt update && sudo apt -y upgrade
    ```

## 2. Cài đặt Apache
- Cài đặt Apache
    ```
    apt install -y apache2 apache2-utils
    ```

- Kiểm tra phiên bản Apache
    ```
    apache2 -v

    Server version: Apache/2.4.41 (Ubuntu)
    Server built:   2020-03-05T18:51:00
    ```

- Dịch vụ sẽ được khởi chạy tự động sau khi cài đặt. Ta kiểm tra trạng thái dịch vụ :
    ```
    systemctl status apache2
    ```

- Bật khởi chạy cùng hệ thống
    ```
    systemctl is-enabled apache2
    ```

**Lưu ý**: Bạn có thể khởi động lại dịch vụ hoặc reload lại dịch vụ khi có sự thay đổi

```
systemctl reload apache2
systemctl enable apache2
```

- Sau khi cài đặt thành công, ta có thể kiểm tra bằng cách truy cập vào địa chỉ IP của server bằng trình duyệt

    <img src="https://i.imgur.com/V7GIsQc.png">

## 3. Cài đặt Database Server
Bạn có thể lựa chọn cài đặt Mysql hoặc MariaDB. Trong bài viết này, ta sẽ sử dụng MariaDB

- Cài đặt MariaDB
    ```
    apt install -y software-properties-common mariadb-server mariadb-client
    ```

- Kiểm tra trạng thái dịch vụ 
    ```
    systemctl status mariadb
    ```

- Kiểm tra version của MariaDB
    ```
    mysql -V
    ```

- Thiết lập một số thông tin cơ bản
    ```
    mysql_secure_installation
    ```

    - Cài lại mật khẩu cho quyền root của cơ sở dữ liệu:
        ```
        Enter currret password for root (enter for none):
        ```

    - Bước này yêu cầu bạn nhập mật khẩu gần đây cho `root`. Nếu bạn mới cài lần đầu thì nhấn Enter để tiếp tục.
        ```
        Set root password? (Y/n)
        ```
    
    - Nếu bạn cài lần đầu, hệ thống sẽ hỏi bạn muốn cài password cho quyền `root` không. Bạn gõ `Y` -> **Enter**, sau đó nhập mật khẩu và xác thực mật khẩu.

    - Với những máy mới cài mariadb lần đầu, hệ thống yêu cầu thêm một số thiết lập như sau:

        - Xoá bỏ các user khác.
        - Không cho phép root đăng nhập từ xa.
        - Xoá bỏ databases test.
        - Khởi chạy lại bảng Privilege (bảng phân quyền).

        Bạn chỉ cần gõ `Y` cho những yêu cầu đó.

    <img src="https://i.imgur.com/QHD77gG.png">

## 4. Cài đặt PHP
Trên Ubuntu 20.04, phiên bản có sẵn của PHP là 7.4.

- Cài đặt php và các gói hỗ trợ
    ```
    apt install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
    ```

- Kiểm tra lại phiên bản của PHP
    ```
    php -v

    PHP 7.4.3 (cli) (built: Mar  3 2020 20:34:56) ( NTS )
    Copyright (c) The PHP Group
    Zend Engine v3.4.0, Copyright (c) Zend Technologies
        with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies
    ```

- Kích hoạt module Apache cho PHP 7.4:
    ```
    a2enmod php7.4 

    Considering dependency mpm_prefork for php7.4:
    Considering conflict mpm_event for mpm_prefork:
    Considering conflict mpm_worker for mpm_prefork:
    Module mpm_prefork already enabled
    Considering conflict php5 for php7.4:
    Module php7.4 already enabled
    ```

- Khởi động lại Apache
    ```
    systemctl reload apache2
    systemctl enable apache2
    ```

- Thêm file `info.php`
    ```
    echo "<?php phpinfo();?>" > /var/www/html/info.php
    ```

- Vào trình duyệt gõ địa chỉ trên thanh url theo dạng sau: 
    ```
    <địa chỉ ip>/info.php
    ```

    Khi xuất hiện màn hình tương tự như hình có nghĩa là đã cài PHP thành công. 

    <img src="https://i.imgur.com/s1HCbvI.png">