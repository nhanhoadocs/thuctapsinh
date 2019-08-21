# Cài đặt WordPress
- **B1 :** Tạo mới cơ sở dữ liệu **MariaDB** cho **WordPress** :
    - Đăng nhập vào **MariaDB ( MySQL )** với quyền `root` :
        ```
        # mysql -u root -p
        Enter password:
        ```
    - Đi vào giao diện cấu hình **MariaDB** :

        <img src=https://i.imgur.com/AaVEx47.png>
    
    - Tạo 1 database mới tên "`wordpress`" :
        ```
        CREATE DATABASE wordpress;
        ```

        <img src=https://i.imgur.com/CerbFGP.png>

    - Tạo user và password để quản trị database :
        ```
        CREATE USER wordpressuser@localhost IDENTIFIED BY 'p@ssw0rd';
        ```
        <img src=https://i.imgur.com/gvdmcdS.png>

    - Cấp quyền quản trị database "`wordpress`" cho user "`wordpressuser`" :
        ```
        GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'p@ssw0rd';
        ```
        <img src=https://i.imgur.com/UhBS3Yy.png>

    - Flush ( refresh ) lại danh sách quyền trong **MariaDB** :
        ```
        FLUSH PRIVILEGES;
        ```
        <img src=https://i.imgur.com/OZDc21D.png>

    - Thoát khỏi **MariaDB** :
        ```
        exit
        ```
        <img src=https://i.imgur.com/7opnTfA.png>
- **B2 :** Cài đặt các module cần thiết :
    ```
    # yum install -y php-gd php-mysql
    ```
- **B3 :** Khởi động lại dịch vụ `httpd` để nhận module mới :
    ```
    # systemctl restart httpd
    ```
- **B4 :** Download phiên bản mới nhất của **WordPress** :
    ```
    # wget https://wordpress.org/latest.tar.gz
    ```
- **B5 :** Giải nén thư mục tải về :
    ```
    # tar -zxvf latest.tar.gz
    ```
    <img src=https://i.imgur.com/174t8qf.png>

- **B6 :** Đồng bộ thư mục `wordpress` với thư mục `/var/www/html` . Lệnh `rsync` sẽ copy 1 cách an toàn các file/thư mục trong thư mục `wordpress` sang thư mục `/var/www/html` đồng thời giữ nguyên permission của chúng :
    ```
    # rsync -avP ~/wordpress/ /var/www/html/
    ```
    <img src=https://i.imgur.com/yBdI3xN.png>

- **B7 :** Tạo 1 thư mục mới để lưu trữ các file upload lên **WordPress** :
    ```
    # mkdir /var/www/html/wp-content/uploads
    ```
- **B8 :** Cấp quyền cho user `apache` đối với các thư mục do user `root` tạo ra :
    ```
    # chown -R apache:apache /var/www/html/
    ```
- **B9 :** Copy file cấu hình chính `wp-config.php` từ file mẫu :
    ```
    # cd /var/www/html/
    # cp wp-config-sample.php wp-config.php
    ```
- **B10 :** Chỉnh sửa file `wp-config.php` :    
    ```
    # vi wp-config.php
    ```
    - Kéo xuống dòng `21` và chỉnh sửa thông tin về **MariaDB** đã cấu hình ở trên :

        <img src=https://i.imgur.com/huOe5aI.png>

- **B11 :** Hoàn thành việc cài đặt **WordPress** thông qua trình duyệt :
    ```
    http://<web_server_IP>
    ```
    - Trang khởi động hiện ra , chọn ngôn ngữ > ***Continue*** :

        <img src=https://i.imgur.com/Bgjmmsj.png>

    - Nhập thông tin khởi tạo > ***Install WordPress*** :

        <img src=https://i.imgur.com/a7A4fAO.png>

    - Cài đặt thành công > ***Log in*** :

        <img src=https://i.imgur.com/NcqpqaI.png>

    - Nhập `username` và `password` vừa tạo > ***Log in***

        <img src=https://i.imgur.com/s6RuicS.png>

    - Trang quản trị **WordPress** ( *dashboard* ) :

        <img src=https://i.imgur.com/z2ghATI.png>

> Nội dung trang **WordPress** khi người dùng khác nhập IP lên trình duyệt :<br><br><img src=https://i.imgur.com/8K5hBm3.png>