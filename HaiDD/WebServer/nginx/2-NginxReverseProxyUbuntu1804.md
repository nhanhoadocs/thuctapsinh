# Hướng dẫn cấu hình nginx với SSL làm reverse proxy cho wordpress trên CentOS-7

## Mô hình và IP Planing
### **Mô hình**

<img src="https://i.imgur.com/CJoqvQm.png">

### **IP Planing**

<img src="https://i.imgur.com/OocFw75.png">

## Cấu hình trên Nginx Server
### Cài đặt Nginx
1. Cài đặt nginx
    ```
    apt uptdate
    apt install nginx -y
    ```

2. Cho phép lưu lượng truy cập trên cổng 80.
    ```
    ufw allow 'Nginx HTTP'
    ```

3. Backup file cấu hình
    ```
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk
    ```

### Tạo file config site
1. Trước khi tạo file config cho địa chỉ truy cập, ta cần kiểm tra bản ghi dns đối với địa chỉ sẽ sử dụng :
    ```
    nslookup wordpress.dangdohai.xyz
    ```

    <img src="https://i.imgur.com/BPi0Aof.png">

    Nếu chưa tạo 1 bản ghi tên miền, hãy truy cập zonedns để tạo 1 bản ghi.

2. Tạo file config site:

    Sau khi kiểm tra bản ghi đã tồn tại, ta sẽ tạo file config của tên miền, mỗi site sẽ được khai báo tương ứng với 1 file nằm trong thư mục /etc/nginx/conf.d/.

    Tạo file có tên là tên miền của bạn với phần mở rộng là .conf và thêm vào file với nội dung như sau:

    ```
    vim /etc/nginx/conf.d/wordpress.dangdohai.xyz.conf
    ```

    Thêm vào file nội dung sau:
    ```
    server {
    server_name wordpress.dangdohai.xyz;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.163;
        }
    }
    ```

3. Kiểm tra file cấu hình và khởi động lại nginx

    Kiểm tra file cấu hình
    ```
    [root@nginx ~]# nginx -t

    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful
    ```

    Restart nginx:
    ```
    systemctl restart nginx
    ```

4. Kiểm tra cài đặt

    Vào trình duyệt web và truy cập bằng tên miền để kiểm tra. Ở đây mình sẽ truy cập bằng địa chỉ wordpress.dangdohai.xyz

    <img src="https://i.imgur.com/sf6Dgw6.png">

5. Cài đặt chuyển hướng về tên miền

    Tuy đã truy cập thành công bằng tên miền, nhưng khi ta truy cập bằng IP thì thanh URL vẫn hiển thị là địa chỉ IP. Để chuyển về tên miền ta thực hiện các bước sau

    - Truy cập và đăng nhập vào Side Admin, vào tab **Settings** và chọn **General** .

        <img src="https://i.imgur.com/kfYEu8v.png">

    - Sau đó sửa địa chỉ ip mặc định thành tên miền tại **WordPress Address** và **Site Address** (Ở bài này là https://wordpress.dangdohai.xyz ) -> click **Save Changes**

    Sau khi đã lưu, ta trở lại Nginx server để tiếp tục cấu hình ssl cho site.


### Thiết lập chứng chỉ Let’s Encrypt
1. Cài đặt Certbot
    ```
    apt install python-certbot-nginx -y
    ```

2. Sinh SSL bằng Let’s Encrypt cho site ***wordpress.dangdohai.xyz***
    ```
    certbot --nginx -d wordpress.dangdohai.xyz
    ```

    OUTPUT
    
    ```
    Saving debug log to /var/log/letsencrypt/letsencrypt.log
    Plugins selected: Authenticator nginx, Installer nginx
    Enter email address (used for urgent renewal and security notices) (Enter 'c' to
    cancel): dangdohai1996@gmail.com

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Please read the Terms of Service at
    https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
    agree in order to register with the ACME server at
    https://acme-v02.api.letsencrypt.org/directory
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    (A)gree/(C)ancel: a

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Would you be willing to share your email address with the Electronic Frontier
    Foundation, a founding partner of the Let's Encrypt project and the non-profit
    organization that develops Certbot? We'd like to send you email about our work
    encrypting the web, EFF news, campaigns, and ways to support digital freedom.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    (Y)es/(N)o: y
    Obtaining a new certificate
    Performing the following challenges:
    http-01 challenge for wordpress.dangdohai.xyz
    Waiting for verification...
    Cleaning up challenges
    Deploying Certificate to VirtualHost /etc/nginx/conf.d/wordpress.dangdohai.xyz.conf

    Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    1: No redirect - Make no further changes to the webserver configuration.
    2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
    new sites, or if you're confident your site works on HTTPS. You can undo this
    change by editing your web server's configuration.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
    Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/wordpress.dangdohai.xyz.conf

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Congratulations! You have successfully enabled https://wordpress.dangdohai.xyz

    You should test your configuration at:
    https://www.ssllabs.com/ssltest/analyze.html?d=wordpress.dangdohai.xyz
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    IMPORTANT NOTES:
    - Congratulations! Your certificate and chain have been saved at:
    /etc/letsencrypt/live/wordpress.dangdohai.xyz/fullchain.pem
    Your key file has been saved at:
    /etc/letsencrypt/live/wordpress.dangdohai.xyz/privkey.pem
    Your cert will expire on 2020-07-01. To obtain a new or tweaked
    version of this certificate in the future, simply run certbot again
    with the "certonly" option. To non-interactively renew *all* of
    your certificates, run "certbot renew"
    - Your account credentials have been saved in your Certbot
    configuration directory at /etc/letsencrypt. You should make a
    secure backup of this folder now. This configuration directory will
    also contain certificates and private keys obtained by Certbot so
    making regular backups of this folder is ideal.
    - If you like Certbot, please consider supporting our work by:

    Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
    Donating to EFF:                    https://eff.org/donate-le

    ```

3. Kiểm tra lại kết quả trong file config site

    Sau khi sinh ssl cho site, ta kiểm tra lại file config để thấy sự thay đổi.

    ```
    cat /etc/nginx/conf.d/wordpress.dangdohai.xyz.conf
    ```
    ```
    server {
    server_name wordpress.dangdohai.xyz;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.163;
        }


        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/wordpress.dangdohai.xyz/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/wordpress.dangdohai.xyz/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    }
    server {
        if ($host = wordpress.dangdohai.xyz) {
            return 301 https://$host$request_uri;
        } # managed by Certbot


    server_name wordpress.dangdohai.xyz;
        listen 80;
        return 404; # managed by Certbot
    }
    ```

4. Khởi động lại Nginx
    ```
    systemctl restart nginx
    ```

## Cấu hình trên webserver cài WordPress
1. Sửa file wp-config.php

    Tiến hành vào file wp-config.php tại /var/www/html/wp-config.php và thêm vào những dòng sau:
    ```
    if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https'){
    $_SERVER['HTTPS']='on';
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_HOST'])) {
    $_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
    }
    File /var/www/html/wp-config.php
    ```

    File `/var/www/html/wp-config.php`
    
    <img src="https://i.imgur.com/hF9WkDs.png">

2. Khởi động lại dịch vụ http
    ```
    systemctl restart httpd
    ```

3. Truy cập trang web bằng địa chỉ https://wordpress.dangdohai.xyz/ đã có SSL.

    <img src="https://i.imgur.com/WrrUNVS.png">