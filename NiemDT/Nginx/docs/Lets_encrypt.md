# Cấu hình HTTPS sử dụng let's encrypt

## Cài đặt certbot

```
yum install epel-release -y
yum install certbot-nginx -y
```

## Sinh SSL bằng let's encrypt cho site test.niemdt.com

```
certbot --nginx -d test.niemdt.com
```

Kết quả

```
[root@nginx-lab ~]# certbot --nginx -d test.niemdt.com
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): niemdt9@gmail.com
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
http-01 challenge for test.niemdt.com
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/test.niemdt.com.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/test.niemdt.com.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://test.niemdt.com

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=test.niemdt.com
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/test.niemdt.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/test.niemdt.com/privkey.pem
   Your cert will expire on 2020-06-08. To obtain a new or tweaked
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

Kiểm tra file `test.niemdt.com.conf`

```
[root@nginx-lab ~]# cat /etc/nginx/conf.d/test.niemdt.com.conf 
server {
    server_name test.niemdt.com;
    client_max_body_size 1024M;

        location / {
            proxy_cache backcache;
            add_header X-Proxy-Cache $upstream_cache_status;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://10.10.35.123:80;
        }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/test.niemdt.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/test.niemdt.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = test.niemdt.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name test.niemdt.com;
    listen 80;
    return 404; # managed by Certbot

}
```

## Cấu hình HTTPS cho graylog.niemdt.com

```
certbot --nginx -d graylog.niemdt.com
```

```
[root@nginx-lab conf.d]# certbot --nginx -d graylog.niemdt.com
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for graylog.niemdt.com
Waiting for verification...
Cleaning up challenges
Deploying Certificate to VirtualHost /etc/nginx/conf.d/graylog.niemdt.com.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Redirecting all traffic on port 80 to ssl in /etc/nginx/conf.d/graylog.niemdt.com.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://graylog.niemdt.com

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=graylog.niemdt.com
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/graylog.niemdt.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/graylog.niemdt.com/privkey.pem
   Your cert will expire on 2020-06-08. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

Kiểm tra file `graylog.niemdt.com.conf`

```
[root@nginx-lab ~]# cat /etc/nginx/conf.d/graylog.niemdt.com.conf 
server {
    server_name graylog.niemdt.com;

        location / {
            proxy_set_header   Host                  $host;
    	    proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Host      $host;
            proxy_set_header   X-Forwarded-Server    $host;
            proxy_set_header   X-Graylog-Server-URL  https://$server_name/;
            proxy_pass http://10.10.34.127:9000;
        }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/graylog.niemdt.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/graylog.niemdt.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = graylog.niemdt.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name graylog.niemdt.com;
    listen 80;
    return 404; # managed by Certbot
}
```

## Cấu hình tự động renew Certification

Vì Certification sẽ bị hêt hạn trong vòng 3 tháng nên ta có thể sử dung  crontab để tự động renew Certification

```
yum install wget -y
wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto
mv certbot-auto /etc/letsencrypt/
echo "0 2 * * 1 cd /etc/letsencrypt/ && ./certbot-auto renew && systemctl restart nginx" >> /etc/crontab
systemctl restart crond
```

Như vậy Certification sẽ được làm mới vào 2:00 thứ 2 hàng tuần