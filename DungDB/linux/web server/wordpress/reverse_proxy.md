# Cấu hình nginx với SSL làm reverse proxy

## Cấu hình nginx với SSL làm reverse proxy cho apache

### Cấu hình nginx làm reverse proxy cho 2 site apache

**Mô hình:**

![Imgur](https://i.imgur.com/lz0PeXq.png)

Đầu tiên, thực hành với IP private:

Thông tin IP trong bài lab:

![Imgur](https://i.imgur.com/P0cxNl7.png)

Mở port trên cả 3 máy:

    # firewall-cmd --permanent --add-port=80/tcp      # cổng mặc định http
    # firewall-cmd --permanent --add-port=443/tcp     # cổng mặc định shttps
    # firewall-cmd --reload

**Cấu hình máy #1 (Centos):**

Cài nginx:

    # rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
    # yum -y install nginx

Backup file cấu hình :

    # cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk

Bật dịch vụ nginx

    # systemctl restart nginx
    # systemctl enable nginx

Kiểm tra dịch vụ nginx

    # systemctl status nginx

![Imgur](https://i.imgur.com/ieuMBEk.png)  

Tạo file config của địa chỉ truy cập

Thêm dòng sau vào file C:\Windows\System32\drivers\etc\host trên Windows 

    # 10.10.35.222 doanbadung.xyz
    # 10.10.34.222 dungdb.xyz

Tạo file config site trỏ về server #2

```
cat > /etc/nginx/conf.d/doanbadung.xyz.conf << EOF
server {
    server_name doanbadung.xyz;

        location / {
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.171;
        }
}
EOF
```

Tạo file config site trỏ về server #3
```
cat > /etc/nginx/conf.d/dungdb.xyz.conf << EOF
server {
    server_name dungdb.xyz;

        location / {
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.173;
        }
}
EOF
```


**Cấu hình trên máy #2 (Centos):**

Cài đặt Apache

    # yum -y install httpd

Cài xong, tiến hành khởi động lại service:

    # systemctl start httpd
    # systemctl enable httpd

Bạn có thể check lại trang thái hoạt động của service

    # systemctl status httpd

Thêm nội dung sau vào file /var/www/html/index.html

```
<h1>
Dung
</h1>
```

![Imgur](https://i.imgur.com/0uxCcY3.png)

**Kết quả:**

![Imgur](https://i.imgur.com/eas2GsQ.png)

**Cấu hình trên máy #3 (Ubuntu):**

Cài apache:

    # apt install apache2 -y

Cho phép dịch vụ apache hoạt động
    
    #ufw allow 'Apache'

Kiểm tra:

    #systemctl status apache2

![Imgur](https://i.imgur.com/9YjlQ0i.png)

**Thực hành với IP public:**

Máy #1: 

Xóa dòng đã thêm trong file host. Trỏ domain doanbadung.xyz và dungdb.xyz về cùng 1 IP public trên zonedns.vn. Gán Ip public này cho card mạng eth1 máy #1

![Imgur](https://i.imgur.com/8Lvw3gN.png)

![Imgur](https://i.imgur.com/HqvDiXE.png)

Phần bị che mờ là IP public.

Kết quả khi truy cập vào 2 site: 

![Imgur](https://i.imgur.com/eas2GsQ.png)

![Imgur](https://i.imgur.com/8heURg8.png)

### Cài Let's enscrypt

Yêu cầu máy #1 phải cài IP public và có domain.

Ở đây 2 domain là doanbadung.xyz và dungdb.xyz cùng trỏ về 1 IP public.

Cài đặt Certbot:

    yum install epel-release -y
    yum install certbot-nginx -y

Sinh SSL bằng let’s Encrypt cho site doanbadung.xyz

    certbot --nginx -d doanbadung.xyz

Sau đó điền các thông số như sau:

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): dungz1207@gmail.com
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: A

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about our work
encrypting the web, EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y
Starting new HTTPS connection (1): supporters.eff.org
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for doanbadung.xyz
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/doanbadung.xyz.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/doanbadung.xyz.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://doanbadung.xyz

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=doanbadung.xyz
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/doanbadung.xyz/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/doanbadung.xyz/privkey.pem
   Your cert will expire on 2020-06-25. To obtain a new or tweaked
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

Kiểm tra lại kết quả trong file config site

Sau khi sinh ssl cho site, ta kiểm tra lại file config để thấy sự thay đổi.
```
# cat /etc/nginx/conf.d/doanbadung.xyz.conf
server {
    server_name doanbadung.xyz;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.171;
        }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/doanbadung.xyz/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/doanbadung.xyz/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = doanbadung.xyz) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name doanbadung.xyz;
    listen 80;
    return 404; # managed by Certbot
}
```
Khởi động lại Nginx

    systemctl restart nginx

Kết quả:

![Imgur](https://i.imgur.com/oIw7uaA.png)

Tương tự ta sinh SSL bằng let’s Encrypt cho site dungdb.xyz.

    # certbot --nginx -d dungdb.xyz

Các bước tiếp theo hoàn toàn tương tự.

Kết quả:

![Imgur](https://i.imgur.com/P2Tt5qY.png)

## Cấu hình nginx với SSL làm reverse proxy cho wordpress

### Cấu hình nginx làm reverse proxy cho wp

Mô hình:

![Imgur](https://i.imgur.com/WJNvYuU.png)

Thực hành với IP private

![Imgur](https://i.imgur.com/s37XMG4.png)

Hướng dẫn cài wordpress trên Ubuntu: https://github.com/lukabobo/DoanBaDung_NhanHoa/blob/master/linux/Lamp_Lemp/lamp_ubuntu18_wp.md

Cấu hình máy #1 (Centos) hoàn toàn tương tự như đã hướng dẫn ở trên.

Kết quả:

![Imgur](https://i.imgur.com/X8Fregd.png)

**Thực hành với IP public:**

Xóa dòng đã thêm trong file host. Trỏ domain doanbadung.xyz và dungdb.xyz về IP public trên zonedns.vn. Gán IP public này cho card mạng eth1 máy #1.

![Imgur](https://i.imgur.com/8Lvw3gN.png)

Kết quả:

![Imgur](https://i.imgur.com/X8Fregd.png)

### Cài Let's enscrypt

Yêu cầu máy #1 phải cài IP public và có domain.

Cài đặt Certbot

    yum install epel-release -y
    yum install certbot-nginx -y

Sinh SSL bằng let’s Encrypt cho site doanbadung.xyz

    certbot --nginx -d doanbadung.xyz

Sau đó điền các thông số như sau:

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): dungz1207@gmail.com
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: A

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about our work
encrypting the web, EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y
Starting new HTTPS connection (1): supporters.eff.org
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for doanbadung.xyz
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/doanbadung.xyz.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/doanbadung.xyz.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://doanbadung.xyz

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=doanbadung.xyz
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/doanbadung.xyz/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/doanbadung.xyz/privkey.pem
   Your cert will expire on 2020-06-25. To obtain a new or tweaked
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

Kiểm tra lại kết quả trong file config site

Sau khi sinh ssl cho site, ta kiểm tra lại file config để thấy sự thay đổi.
```
# cat /etc/nginx/conf.d/doanbadung.xyz.conf
server {
    server_name doanbadung.xyz;

        location / {
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass http://10.10.34.171;
        }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/doanbadung.xyz/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/doanbadung.xyz/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = doanbadung.xyz) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name doanbadung.xyz;
    listen 80;
    return 404; # managed by Certbot
}
```
Khởi động lại Nginx

    systemctl restart nginx

**Thao tác trên web server chạy wordpress (Máy #2 Centos)**

Trên trình duyệt: vào `10.10.34.171/wp-admin`

Settings > General 

Sửa thông tin trông 2 ô (URL) thành: `**https://doanbadung.xyz**`

Và lưu lại.

Sửa file `/var/www/html/wp-config.php`:

Tiến hành vào file wp-config.php tại /var/www/html/wp-config.php và thêm vào những dòng sau:

```
define ('FORCE_SSL_LOGIN',true);
define ('FORCE_SSL_ADMIN',true);
if ($_SERVER ['HTTP_X_FORWARDED_PROTO']=='https')
        $_SERVER['HTTPS']='on';
```
![Imgur](https://i.imgur.com/p8Mo3cS.png)

Khởi động lại dịch vụ apache

    # systemctl restart httpd

Sau khi khởi động, vào lại trang web bằng địa chỉ https://doanbadung.xyz để kiểm tra kết quả với ssl.

Kết quả:

![Imgur](https://i.imgur.com/vmjjfDZ.png)

Thông tin chứng chỉ

![Imgur](https://i.imgur.com/OvC2ZVi.png)

**Tương tự thực hiện với server #3 (Ubuntu)**

Ở bước sửa file `/var/www/html/wp-config.php`, thay vì thêm đoạn ở trên thì thêm đoạn này vào:
```
if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https'){
$_SERVER['HTTPS']='on';
}
if (isset($_SERVER['HTTP_X_FORWARDED_HOST'])) {
$_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
}
```

Khởi động lại dịch vụ apache:

    # systemctl restart apache2

**Kết quả:**

![Imgur](https://i.imgur.com/XONFvlv.png)

Thông tin chứng chỉ

![Imgur](https://i.imgur.com/ktxg4Wk.png)

Tham khảo: https://news.cloud365.vn/huong-dan-cau-hinh-nginx-voi-ssl-lam-reverse-proxy-cho-wordpress/
