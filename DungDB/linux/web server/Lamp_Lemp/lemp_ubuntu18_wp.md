# Cài đặt Wordpress trên LEMP (Ubuntu 18)

## Cài LEMP

Chuẩn bị máy cài sẵn HĐH Ubuntu Server 18.04. Tất cả lệnh đều dùng quyền root. 

### Bước 1: Cài nginx

    # apt update
    # apt -y install nginx

Trên Ubuntu 18.04, Nginx được cấu hình bắt đầu chạy khi cài đặt.

Nếu tường lửa ufw đang chạy, thì bạn cần phải cho phép kết nối với Nginx. Nginx tự đăng ký với `ufw` khi cài đặt. Do đó việc thực hiện trở nên đơn giản hơn.

Cho phép lưu lượng truy cập trên cổng 80.

    # ufw allow 'Nginx HTTP'

Kiểm tra phiên bản nginx:

    nginx -v

Kiểm tra trên trình duyệt bằng cách gõ địa chỉ IP vào thanh URL ta sẽ thấy kết quả như sau.

![Imgur](https://i.imgur.com/nz98ZkW.png)

### Bước 2: Cài MariaDB

Gỡ MariaDB hiện tại trên Ubuntu:

    # apt-get remove mariadb-server

Cài đặt mới MariaDB

    # apt -y install mariadb-server

Kiểm tra trạng thái dịch vụ MariaDB

    # systemctl status mariadb

Kiểm tra phiên bản MariaDB

    # mysql -v

Cài đặt một số thông tin ban đầu:

    # mysql_secure_installation

Bạn sẽ được hỏi đặt lại password root hay không. Chọn yes (y) và đặt password mới cho user root. Các câu hỏi sau đó chỉ cần cọn yes (y) là được.

Các câu hỏi sau đó là:

- Xoá bỏ các user khác.
- Không cho phép root đăng nhập từ xa.
- Xoá bỏ databases test.
- Khởi chạy lại bảng Privilege (bảng phân quyền).

### Bước 3: Cài PHP

Không giống với Apache, Nginx không tích hợp hỗ trợ xử lý các tệp PHP. Vì vậy, ta cài đặt một ứng dụng riêng biệt để xử lý các tệp PHP. Chẳng hạn như PHP FPM(fastCGI process manager)

Cài đặt module php-fpm và php-mysql để khiến

    # apt -y install php-fpm php-mysql

Bây giờ ta đã cài đặt đủ các thành phần của LEMP stack. Nhưng vẫn cần phải thực hiện một số thay đổi về cấu hình để yêu cầu Nginx sử dụng PHP để xử lý nội dung.

Mở thư mục: `/etc/nginx/sites-available/`. Trong ví dụ này, tên máy chủ được đặt là dung.xyz (Bạn có thể đặt bất kì tên bạn muốn). Tạo file ddung.xyz

    # vim /etc/nginx/sites-available/dung.xyz

Thêm nội dung sau vào file vừa tạo. Lưu ý chỉnh sửa tên đúng với trường hợp của bạn

```
server {
    listen 80;
    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name dung.xyz;

    location / {
            try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
            deny all;
    }
}
```

Trong đó:

- listen : Xác định cổng Nginx lắng nghe. Trong trường hợp này là cổng 80 (mặc định của HTTP)
- root : Xác định gốc lưu trữ các tệp của trang web
- index : thứ tự ưu tiên các file cấu hình, nếu chúng tồn tại
- server_name : Xác định khối máy chủ nào được sử dụng. Nó trỏ đến tên miền hoặc IP public của bạn
- location / : Kiểm tra sự tồn tại của các tệp khớp với uri. Nếu nginx không thể tìm thấy tệp thích hợp, nó sẽ trả về 404
- location ~ \.php$ : Khai báo nơi xử lý PHP bằng cách trỏ Nginx vào tệp cấu hình fastcgi-php.conf và tệp php7.2-fpm.sock
- location ~ /\.ht : Xử lí các tệp .htaccess mà Nginx không xử lí. Bằng cách deny all chỉ thị, nếu bất kì tệp .htaccess xảy ra để tìm đường vào tài liệu gốc thì chúng sẽ không được phục vụ cho khách truy cập.

Tạo liên kết tượng trưng từ file cấu hình server ở trên (trong thư mục /etc/nginx/sites-available/) tới thư mục /etc/nginx/sites-enabled/

    # ln -s /etc/nginx/sites-available/dung.xyz /etc/nginx/sites-enabled/

Hủy liên kết file cấu hình mặc định khỏi thư mục /sites-enabled/:

    #unlink /etc/nginx/sites-enabled/default

**Lưu ý:** Nếu bạn cần khôi phục cấu hình mặc định, bạn có thể tạo liên kết lại với file mặc định:

    # ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

Kiểm tra xem file cấu hình mới có lỗi gì không:

    # nginx -t
Nếu không có lỗi gì sẽ có thông báo tương tự như sau:

    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok

    nginx: configuration file /etc/nginx/nginx.conf test is successful

Nếu có lỗi thì sẽ có thông báo lỗi

Reload Nginx:

    # systemctl reload nginx

Tạo file /var/www/html/info.php

    # vim /var/www/html/info.php

Thêm vào nội dung sau:

    <?php
    phpinfo();

Dùng trình duyệt gõ vào thanh URL

    <địa chỉ ip>/info.php

Khi xuất hiện màn hình tương tự như hình có nghĩa là đã cài PHP thành công.

![Imgur](https://i.imgur.com/jKO0zqW.png)

Sau khi cài đặt xong, bạn nên xóa file info.php, vì nó có thể cho người dùng trái phép một số gợi ý về cấu hình của trang web và giúp họ cố gắng đột nhập.

    # rm /var/www/html/info.php

## Cài Wordpress

### Tạo DB và tài khoản cho WP

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

Cài gói hỗ trợ

    # apt install -y php php-common php-mbstring php-gd php-intl php-xml php-mysql php-mcrypt php-fpm

Tải xuống WordPress phiên bản mới nhất: Nếu chưa cài đặt wget thì có thể cài bằng câu lệnh `apt -y install wget`.

    # wget https://wordpress.org/latest.tar.gz

**Lưu ý:** Bạn cần để ý tới thư mục đang lưu trữ file wordpress đang được tải xuống. Ở đây mình lưu tại thư mục /root.

Sau khi tải xong. Ta tiến hành giải nén file latest.tar.gz

    # tar xvfz latest.tar.gz

Lưu ý: giải nén sẽ ra thư mục wordpress có đường dẫn /root/wordpress

Copy các file trong thư mục wordpress tới đường dẫn /var/www/html

    # cp -Rvf /root/wordpress/* /var/www/html

### Cấu hình WP

File cấu hình wordpress: /var/www/html/wp-config.php

Di chuyển tới thư mục /var/www/html

    # cd /var/www/html

File cấu hình wordpress là wp-config.php. Tuy nhiên tại đây chỉ có file wp-config-sample.php. Tiến hành copy lại file cấu hình như sau:

    # cp wp-config-sample.php wp-config.php

Chỉnh sửa file cấu hình wp-config.php. Chỉnh lại tên database, username, password đã đặt ở trên. (db_name: db_wp, username: admin, pass: admin) và lưu lại.

### Cài đặt giao diện

Trên trình duyệt gõ địa chỉ IP server vào thành URL.

![Imgur](https://i.imgur.com/Wb8dZtY.png)

Nhập các thông tin cần thiết rồi click Install WordPress.

### Phân quyền WordPress

Phân quyền thư mục wordpress cho user www-data để user này được phép tạo các thư mục và lưu trữ các tệp tin tải lên.

    # chown -R www-data:www-data /var/www/html/*
    # chmod -R 755 /var/www/html/*

Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của mình.

![Imgur](https://i.imgur.com/vIOktDl.png)