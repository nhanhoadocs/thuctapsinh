<img src="images/wordpress.jpg">  

# Cài đặt Wordpress trên CentOS 8 cùng LEMP Stack  

## Bước 1: Cài đặt LEMP Stack  

[Hướng dẫn cài đặt LEMP Stack trên CentOS 8](lemp.md)

## Bước 2: Cài đặt các mô-đun PHP cần thiết
  
  ```sh
    dnf install -y php-mysqlnd php-dom php-simplexml php-xml php-xmlreader php-curl php-exif php-ftp php-gd php-iconv  php-json php-mbstring php-posix php-sockets php-tokenizer
  ```

## Bước 3: Cài đặt Wordpress
- Di chuyển tới Nginx root directory.

  ```sh
    cd /usr/share/nginx/html
  ```

- Tải xuống phiên bản mới nhất của Wordpress

  ```sh
    wget https://wordpress.org/latest.tar.gz
  ```

- Giải nén file vừa tải xuống. Vì `tar` không được cài đặt mặc định trên CentOS 8 nên trước khi giải nén, bạn phải cài đặt `tar`  

  ```sh
    dnf install -y tar
    tar -zxvf latest.tar.gz
  ```  

- Xóa file không cần thiết

  ```sh
    rm latest.tar.gz
  ```

- Sử dụng câu lệnh dưới đây để tìm thư mục theo đường dẫn được xác định và cập nhật quyền cho các thư mục trong đường dẫn:

  ```sh
    find /usr/share/nginx/html/wordpress -type d -exec chmod 755 {} \;
  ```

- Sử dụng câu lệnh dưới đây để tìm thư mục theo đường dẫn được xác định và cập nhật quyền cho các file trong đường dẫn:

  ```sh
    find /usr/share/nginx/html/wordpress -type f -exec chmod 644 {} \;
  ```

- Thay đổi user và group quản lý nginx

  ```sh
    chown -R nginx:nginx /usr/share/nginx/html/
  ```

## Bước 4: Cấu hình 

- Tạo thông tin kết nối tới database cho WordPress

  ```sh
    mysql -u root -p
  ```  

  - Tạo 1 DB mới

    ```sh
      CREATE DATABASE wordpress;
    ```

  - Tạo 1 user mới và gán quyền cho database

    ```sh
      GRANT ALL ON *.* TO 'wordpress'@'localhost' IDENTIFIED BY 'Thuctap@2019';
    ```

- Copy file `wp-config-sample.php` thành file `wp-config.php` và thêm mô tả DB  

  ```sh
    pwd
    /usr/share/nginx/html/wordpress
    cp wp-config-sample.php wp-config.php
    vim wp-config.php
  ```  

  Sửa nội dung của file `vim wp-config.ph` như sau:

    ```sh
    define( 'DB_NAME', 'wordpress' );

    /** MySQL database username */
    define( 'DB_USER', 'wordpress' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'Thuctap@2019' );

    /** MySQL hostname */
    define( 'DB_HOST', 'localhost' );

    /** Database Charset to use in creating database tables. */
    define( 'DB_CHARSET', 'utf8' );

    /** The Database Collate type. Don't change this if in doubt. */
    define( 'DB_COLLATE', '' );
    ```  

- Chỉnh sửa file `/etc/php-fpm.d/www.conf` sửa user và group từ **apache** thành **nginx**  

  <img src="images/php_config.png">  

- Sửa file `/etc/nginx/nginx.conf.default`, thêm `index.php` vào như bên dưới:

  ```sh
    location / {
            root   /usr/share/nginx/html;
            index  index.php index.html index.htm;
        }

        #error_page  404              /404.html;
  ```  

- Restart lại các service

  ```sh
    systemctl restart mariadb
    systemctl restart php-fpm
    systemctl restart nginx  
  ```  

## Bước 5: Truy cập vào WordPress Dashboard  

- Trên trình duyệt của bạn, nhập vào thanh tìm kiếm địa chỉ `IP_Server/wordpress`. Kết quả

  <img src="images/wordpress_test.png">  

- Thiết lập một số cài đặt cơ bản:

  <img src="images/setup.png">  

- Sau khi log in thành công, màn hình sẽ hiển thị như hình dưới  

  <img src="images/login.png">  
  