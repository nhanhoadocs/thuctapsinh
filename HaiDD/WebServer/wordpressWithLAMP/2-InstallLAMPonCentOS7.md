# Install LAMP trên CentOS-7

<img src="..\images\Screenshot_1.png">

### Việc cài đặt dưới đây được thực hiện với quyền `root`

## 1. Cài đặt Linux
Đối với việc cài đặt hệ điều hành, bạn có thể hiện trên nhiều bản phân phối khác nhau của linux như Debian, Redhat, Ubuntu… Trong bài này, mình sử dụng hệ điều hành CentOS 7.

## 2. Cài đặt Apache
- Cài đặt Apache
    ```
    yum -y install httpd
    ```

- Cài xong, tiến hành khởi động lại service:
    ```
    systemctl start httpd
    systemctl enable httpd
    ```

- Bạn có thể check lại trang thái hoạt động của service
    ```
    systemctl status httpd
    ```

- Kiểm tra trạng thái trên trình duyệt bằng cách gõ địa chỉ IP trên thanh URL.

    <img src="..\images\Screenshot_2.png">

- Nếu bạn sử dụng hệ điều hành trên máy ảo, bạn có thể cấu hình firewall để có thể truy cập trên browser của máy thực:
    ```
    firewall-cmd --permanent --add-port=80/tcp      # cổng mặc định http
    firewall-cmd --permanent --add-port=443/tcp     # cổng mặc định shttps
    firewall-cmd --reload
    ```

- Sau đó, gõ địa chỉ ip máy ảo trên thanh url cũng sẽ cho ra kết quả tương tự.

## 3. Cài đặt hệ quản trị cơ sở dữ liệu
Trên thực tế với LAMP, bạn có thể sử dụng mysql hoặc mariadb đều được, bài này mình sẽ hướng dẫn với mariadb.

- Cài MariaDB:
    ```
    yum -y install mariadb mariadb-server
    ```

- Tiến hành khởi động mariadb service:
    ```
    systemctl start mariadb
    ```

- Cài đặt một số thông tin ban đầu:
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


    <img src="..\images\Screenshot_3.png">

- Kích hoạt mariadb để khởi động cùng hệ thống:
    ```
    systemctl enable mariadb
    ```

## 4. Cài đặt PHP
Phiên bản có sẵn trong repo của CentOS đang là 5.4. Phiên bản này khá cũ và sẽ khiến bạn gặp một số vấn đề xảy ra khi tiến hành cài đặt wordpress. Vì vậy bạn cần phải cài đặt phiên bản 7x để khắc phục.

### 4.1. Cài đặt repo chứa PHP 7.x
PHP 7.x có ở nhiều repo khác nhau nhưng trong hướng dẫn này tôi sẽ sử dụng repository REMI
```
yum install -y epel-release yum-utils
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

### 4.2. Cài đặt PHP 7.x
Cần lưu ý các phiên bản của PHP, hiện tại đã có phiên bản 7.4.

- Lực chọn cài đặt một trong các phiên bản:

    - Phiên bản 7.0:
        ```
        yum-config-manager --enable remi-php70
        yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
        ```
    - Phiên bản 7.1:
        ```
        yum-config-manager --enable remi-php71
        yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
        ```
    - Phiên bản 7.2:
        ```
        yum-config-manager --enable remi-php72
        yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
        ```
    - Phiên bản 7.3:
        ```
        yum-config-manager --enable remi-php73
        yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
        ```
    - Phiên bản 7.4:
        ```
        yum-config-manager --enable remi-php74
        yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
        ``` 

- Trong bài viết này, ta cài bản 7.4.

- Kiểm tra lại phiên bản PHP
    ```
    php -v

    PHP 7.4.3 (cli) (built: Feb 18 2020 11:53:05) ( NTS )
    Copyright (c) The PHP Group
    Zend Engine v3.4.0, Copyright (c) Zend Technologies
        with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies
    ```

- Restart Apache
    ```
    systemctl restart httpd
    ```

- Thêm file `info.php`
    ```
    echo "<?php phpinfo();?>" > /var/www/html/info.php
    ```

- Restart Apache
    ```
    systemctl restart httpd
    ```

- Vào trình duyệt gõ địa chỉ trên thanh url theo dạng sau: 
    ```
    <địa chỉ ip>/info.php
    ```

    Khi xuất hiện màn hình tương tự như hình có nghĩa là đã cài PHP thành công.

    <img src="..\images\Screenshot_4.png">

