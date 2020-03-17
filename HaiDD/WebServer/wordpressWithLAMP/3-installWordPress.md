# Cài đặt WordPress với LAMP trên CentOS 7

<img src="..\images\Screenshot_5.png">

## I. Tổng quan
WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở xây dựng dựa trên PHP và MySQL. Được phát hành vào năm 2003, đến nay WordPress đã trở thành một trong những hệ thống quản lí website phổ biến nhất thế giới với hơn 60 triệu website (số liệu năm 2019).

Trong bài này, mình sẽ hướng dẫn cài đặt WordPress trên hệ điều hành CentOS 7.

## II. Cài đặt

### 1. Chuẩn bị
Đầu tiên, ta cần [cài đặt LAMP stack](.\2-InstallLAMPonCentOS7.md) trên máy của bạn.

### 2. Tạo cơ sở dữ liệu và tài khoản cho WP

Ở bước chuẩn bị, mình đã cài Mariadb cho cơ sở dũ liệu. Bạn cũng có thể thao tác tương tự với MySQL.

- Đăng nhập vào tài khoản `root` của database:
    ```
    mysql -u root -p
    ```

    <img src="..\images\Screenshot_6.png">

    Terminal chuyển sang MariaDB.

- Ta tạo Database cho WP. Ở đây ta đặt là `db_wp`
    ```
    CREATE DATABASE db_wp;
    ```

- Tạo tài khoản riêng để quản lí DB. Tên tài khoản: `admin`, Mật khẩu: `admin`
    ```
    CREATE USER admin@localhost IDENTIFIED BY 'admin';
    ```

- Bây giờ ta sẽ cấp quyền quản lí cơ sở dữ liệu cho user mới tạo:
    ```
    GRANT ALL PRIVILEGES ON db_wp.* TO admin@localhost IDENTIFIED BY 'admin';
    ```

- Sau đó xác thực lại những thay đổi về quyền:
    ```
    FLUSH PRIVILEGES;
    ```

- Sau đó, ta thoát ra khỏi MariaDB:
    ```
    exit
    ```

    <img src="..\images\Screenshot_7.png">

### 3. Tải và cài đặt WordPress
- Cài gói hỗ trợ `php-gd`:
    ```
    yum -y install php-gd
    ```

- Tải xuống WordPress phiên bản mới nhất: Nếu chưa cài đặt `wget` thì có thể cài bằng câu lệnh `yum -y install wget`.
    ```
    wget https://wordpress.org/latest.tar.gz
    ```

    **Lưu ý**: Bạn cần để ý tới thư mục đang lưu trữ file wordpress đang được tải xuống. Ở đây mình lưu tại thư mục `/root`.

- Sau khi tải xong. Ta tiến hành giải nén file `latest.tar.gz`
    ```
    tar xvfz latest.tar.gz
    ```

    **Lưu ý**: giải nén sẽ ra thư mục `wordpress` có đường dẫn `/root/wordpress`

- Copy các file trong thư mục `wordpress` tới đường dẫn `/var/www/html`
    ```
    cp -Rvf /root/wordpress/* /var/www/html
    ```

### 4. Cấu hình wordpress
**File cấu hình wordpress**: `/var/www/html/wp-config.php`

- Di chuyển tới thư mục `/var/www/html`
    ```
    cd /var/www/html
    ```

- File cấu hình wordpress là `wp-config.php`. Tuy nhiên tại đây chỉ có file `wp-config-sample.php`. Tiến hành copy lại file cấu hình như sau:
    ```
    cp wp-config-sample.php wp-config.php
    ```

- Chỉnh sửa file cấu hình `wp-config.php`. Chỉnh lại tên database, username, password đã đặt ở trên. (db_name: `db_wp`, username: `admin`, pass: `admin`) và lưu lại.

    <img src="..\images\Screenshot_8.png">

### 5. Hoàn tất cài đặt giao diện
- Trên trình duyệt gõ địa chỉ IP server vào thành URL, ta được giao diện như sau:

    <img src="..\images\Screenshot_9.png">

- Nhập các thông tin cần thiết rồi click **Install WordPress**.

    <img src="..\images\Screenshot_10.png">

- Tiến hành đăng nhập vào WordPress:
    
    <img src="..\images\Screenshot_11.png">

- Giao diện sau khi đăng nhập vào WordPress:

    <img src="..\images\Screenshot_12.png">

### 6. Phân quyền WordPress
Khi upload ảnh vào bài viết sẽ xuất hiện lỗi sau:

<img src="..\images\Screenshot_13.png">

- Phân quyền thư mục wordpress cho user `apache` để user này được phép tạo các thư mục và lưu trữ các tệp tin tải lên.
    ```
    chown -R apache:apache /var/www/html/*
    chmod -R 755 /var/www/html/*
    ```

Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của mình.

<img src="..\images\Screenshot_14.png">

<img src="..\images\Screenshot_15.png">