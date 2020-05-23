# Hướng dẫn cài đặt LEMP trên Ubuntu 20

## Chuẩn bị 

Chuẩn bị máy cài sẵn HĐH Ubuntu Server 20. Tất cả lệnh đều dùng quyền root.

Nếu bạn chưa cài đặt Ubuntu 20 thì có thể xem bài hướng dẫn cài đặt Ubuntu 20:
https://news.cloud365.vn/ubuntu-huong-dan-cai-dat-ubuntu-20-04-server-focal-fossa-ban-develop/

## Cài đặt

**Bước 1:** Cài nginx

    # apt update
    # apt -y install nginx

Trên Ubuntu 20, Nginx được cấu hình bắt đầu chạy khi cài đặt.

Nếu tường lửa ufw đang chạy, thì bạn cần phải cho phép kết nối với Nginx. Nginx tự đăng ký với ufw khi cài đặt. Do đó việc thực hiện trở nên đơn giản hơn.

Cho phép lưu lượng truy cập trên cổng 80.

    # ufw allow 'Nginx HTTP'

Kiểm tra phiên bản nginx:

    # nginx -v

Kiểm tra trên trình duyệt bằng cách gõ địa chỉ IP vào thanh URL ta sẽ thấy kết quả như sau.

![Imgur](https://i.imgur.com/ab7Xzgt.png)

**Bước 2:** Cài MariaDB

Gỡ MariaDB hiện tại trên Ubuntu nếu có:

    # apt-get remove mariadb-server

Cài đặt mới MariaDB

    # apt -y install mariadb-server

Bật dịch vụ MariaDB

    # systemctl start mariadb
    # systemctl enable mariadb

Kiểm tra trạng thái dịch vụ MariaDB

    # systemctl status mariadb

Kiểm tra phiên bản MariaDB

    # mysql -v

Cài đặt một số thông tin ban đầu:

    # mysql_secure_installation

Bạn sẽ được hỏi đặt lại password root hay không. Chọn yes (y) và đặt password mới cho user root. 

Các câu hỏi sau đó là:

- Xoá bỏ các user khác.
- Không cho phép root đăng nhập từ xa.
- Xoá bỏ databases test.
- Khởi chạy lại bảng Privilege (bảng phân quyền).

Đối với các câu hỏi này bạn chỉ cần chọn yes (y) là được.

![Imgur](https://i.imgur.com/G6Mr0zq.png)

**Bước 3:** Cài PHP

Không giống với Apache, Nginx không tích hợp hỗ trợ xử lý các tệp PHP. Vì vậy, ta cài đặt một ứng dụng riêng biệt để xử lý các tệp PHP. Chẳng hạn như PHP FPM (fastCGI process manager)

Cài đặt module `php-fpm` và `php-mysql`

    # apt -y install php-fpm php-mysql

Kiểm tra phiên bản php

    # php -v

Bây giờ ta đã cài đặt đủ các thành phần của LEMP stack. Nhưng vẫn cần phải thực hiện một số thay đổi về cấu hình để yêu cầu Nginx sử dụng PHP để xử lý nội dung.

Mở thư mục: `/etc/nginx/sites-available/`. Trong ví dụ này, tên máy chủ được đặt là dungdb.xyz (Bạn có thể đặt bất kì tên bạn muốn). Tạo file `dungdb.xyz`: 

    # vim /etc/nginx/sites-available/dung.xyz

Thêm nội dung sau vào file vừa tạo. Lưu ý chỉnh sửa `server_name` đúng với trường hợp của bạn.

```
server {
    listen 80;
    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name dungdb.xyz;

    location / {
            try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
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
- location ~ \.php$ : Khai báo nơi xử lý PHP bằng cách trỏ Nginx vào tệp cấu hình fastcgi-php.conf và tệp php7.4-fpm.sock
- location ~ /\.ht : Xử lí các tệp .htaccess mà Nginx không xử lí. Bằng cách deny all chỉ thị, nếu bất kì tệp .htaccess xảy ra để tìm đường vào tài liệu gốc thì chúng sẽ không được phục vụ cho khách truy cập.

**Chú ý:** Nếu bạn không biết chắc nên điền socket gì vào phần `fastcgi_pass unix:` dùng lệnh `ls /var/run/php/` để kiểm tra. Bài viết này dùng php phiên bản 7.4 nên dùng socket `php7.4-fpm.sock`.

![Imgur](https://i.imgur.com/Q59GhVu.png)

Tạo liên kết tượng trưng từ file cấu hình server ở trên (trong thư mục `/etc/nginx/sites-available/`) tới thư mục `/etc/nginx/sites-enabled/`

    # ln -s /etc/nginx/sites-available/dungdb.xyz /etc/nginx/sites-enabled/

Hủy liên kết file cấu hình mặc định khỏi thư mục `/sites-enabled/`:

    # unlink /etc/nginx/sites-enabled/default

**Lưu ý:** Nếu bạn cần khôi phục cấu hình mặc định, bạn có thể tạo liên kết lại với file mặc định:

    # ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

Kiểm tra xem file cấu hình mới có lỗi gì không:

    # nginx -t

Nếu không có lỗi gì sẽ có thông báo tương tự như sau:

![Imgur](https://i.imgur.com/nm85lqd.png)

Reload Nginx:

    # systemctl reload nginx

Kiểm tra php bằng cách tạo file `/var/www/html/info.php`

    # vim /var/www/html/info.php

Thêm vào nội dung sau:

    <?php
    phpinfo();

Dùng trình duyệt gõ vào thanh URL

    <địa chỉ ip>/info.php

Khi xuất hiện màn hình tương tự như hình có nghĩa là đã cài PHP thành công.

![Imgur](https://i.imgur.com/jHIEKW2.png)

Sau khi cài đặt xong, bạn nên xóa file info.php, vì nó có thể cho người dùng trái phép một số gợi ý về cấu hình của trang web và giúp họ cố gắng đột nhập.

    # rm /var/www/html/info.php