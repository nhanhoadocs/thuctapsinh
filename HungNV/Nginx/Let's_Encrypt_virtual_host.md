# Cài chứng chỉ SSL từ Let's Encrypt

### 1. Tạo virtualhost 

- **Tạo file cấu hình virtual host cho tên miền `web1.hungnv99.xyz`**
```
vi /etc/nginx/conf.d/web1.hungnv99.xyz
```

- **Thêm vào file nội dung bên dưới:**
```
server {
    server_name web1.hungnv99.xyz;
    root /opt/nginx/web1.hungnv99.xyz;

    location / {
       index index.html index.htm index.php;
    }

    access_log /var/log/nginx/web1.hungnv99.xyz.access.log;
    error_log /var/log/nginx/web1.hungnv99.xyz.error.log;

    location ~ \.php$ {
      include /etc/nginx/fastcgi_params;
      fastcgi_pass 127.0.0.1:9000;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

- **Tạo file cấu hình virtual host cho tên miền `web2.hungnv99.xyz`**
```
vi /etc/nginx/conf.d/web2.hungnv99.xyz
```

- **Thêm vào file nội dung sau:**
```
server {
    server_name web2.hungnv99.xyz;
    root /opt/nginx/web2.hungnv99.xyz;

    location / {
       index index.html index.htm index.php;
    }

    access_log /var/log/nginx/web2.hungnv99.xyz.access.log;
    error_log /var/log/nginx/web2.hungnv99.xyz.error.log;

    location ~ \.php$ {
      include /etc/nginx/fastcgi_params;
      fastcgi_pass 127.0.0.1:9000;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

- **Tạo file root để đặt các tệp HTML** 
```
mkdir -p /opt/nginx/web1.hungnv99.xyz
```
```
mkdir -p /opt/nginx/web2.hungnv99.xyz
```

- **Thay đổi quyền thư mục** 

```
chown -R nginx:nginx /opt/nginx/web1.hungnv99.xyz
```
```
chown -R nginx:nginx /opt/nginx/web2.hungnv99.xyz
```

- **Tạo file index.html cho 2 site**
```
echo "Test SSL for web1" > /opt/nginx/web1.hungnv99.xyz/index.html
```
```
echo "Test Web server web2" > /opt/nginx/web2.hungnv99.xyz/index.html
```

- **Khởi động lại nginx**
```
systemctl restart nginx
```

### 2. Kiểm tra việc truyền DNS 

- **Sử dụng câu lệnh nslookup để kiểm tra bản ghi.**

```
nslookup web1.hungnv99.xyz
```
```
nslookup web2.hungnv99.xyz
```

### 3. Thiết lập chứng chỉ Let's Encrypt

- **Cài đặt certbot**

```
yum install epel-release -y
yum install certbot-nginx -y
```

- **Sinh SSL bằng let's Encrypt cho site web1.hungnv99.xyz**

```
certbot --nginx -d web1.hungnv99.xyz
```
- **Nhập vào như sau:** 

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): hungvietnguyen6241@gmail.com
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
http-01 challenge for web1.hungnv99.xyz
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/web1.hungnv99.xyz.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/web1.hungnv99.xyz.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://web1.hungnv99.xyz

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=web1.hungnv99.xyz
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/web1.hungnv99.xyz/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/web1.hungnv99.xyz/privkey.pem
   Your cert will expire on 2020-06-11. To obtain a new or tweaked
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

### 4. Vào 2 trang web và kiểm tra sự khác nhau cũng như kiểm tra ssl vừa tạo . 

- `web1.hungnv99.xyz`

**Kick vào `chứng chỉ` để kiểm tra chứng chỉ**

![Imgur](https://i.imgur.com/8oVpLGa.png)

**Có 1 bảng hiện ra và có các thông tin về chứng chỉ ssl.** 

![Imgur](https://i.imgur.com/fHnZweV.png)

- `web2.hungnv99.xyz`

