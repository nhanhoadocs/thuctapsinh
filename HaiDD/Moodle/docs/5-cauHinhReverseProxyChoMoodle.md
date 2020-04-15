# Cấu hình Nginx Reverse Proxy cho trang Moodle

## Mô hình


## Trên Nginx Reverse Proxy
### Cấu hình file config site
- Tạo file config site dưới dạng `<domain_name>.conf`
    ```
    vi /etc/nginx/conf.d/thuctap.vietmoodle.vn.conf
    ```

- Thêm vào nội dung sau:
    ```
    server {
    server_name thuctap.vietmoodle.vn;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://10.10.35.161;
        }
    }
    ```

- Kiểm tra file cấu hình
    ```
    nginx -t

    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful
    ```

- Restart nginx:
    ```
    systemctl restart nginx
    ```

### Thiết lập Let's Encrypt
- Sinh SSL bằng Let’s Encrypt cho site `thuctap.vietmoodle.vn`
    ```
    certbot --nginx -d thuctap.vietmoodle.vn
    ```

- Sau khi sinh SSL xong. Ta kiểm tra lại file 
    ```
    cat /etc/nginx/conf.d/thuctap.vietmoodle.vn.conf
    ```
    OUTPUT
    ```
    server {
    server_name thuctap.vietmoodle.vn;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://10.10.35.161;
        }


        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/thuctap.vietmoodle.vn/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/thuctap.vietmoodle.vn/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    }
    server {
        if ($host = thuctap.vietmoodle.vn) {
            return 301 https://$host$request_uri;
        } # managed by Certbot


        server_name thuctap.vietmoodle.vn;
        listen 80;
        return 404; # managed by Certbot
    }
    ```

- Khởi động lại Nginx
    ```
    systemctl restart nginx
    ```

## Trên VPS cài Moodle
- Sửa file /var/www/html/moodle/config.php
    ```
    vi /var/www/html/moodle/config.php
    ```

- Tìm đến dòng
    ```
    $CFG->wwwroot   = 'http://<địa_chỉ_IP_public>'; 
    ```

- Sửa thành
    ```
    $CFG->wwwroot   = 'http://<domain>'; 
    ```

- Ở đây, ta đổi thành `$CFG->wwwroot = 'https://thuctap.vietmoodle.vn';`

- Thêm 2 dòng 
    ```
    $CFG->sslproxy = true;
    $CFG->reverseproxy = true;
    ```

    <img src="https://i.imgur.com/xVDW05j.png">

- Restart apache
    ```
    systemctl restart httpd
    ```


## Truy cập trang bằng domain

<img src="https://i.imgur.com/plzqc1t.png">