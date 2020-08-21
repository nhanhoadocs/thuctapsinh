# Tạo Self-Signed SSL Certificate cho Nginx

## Tạo SSL Certificate

Tạo thư mục chứa private key

```
mkdir /etc/ssl/private
chmod 700 /etc/ssl/private
```

Tạo  self-signed key và certificate

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

Lưu ý:
 * **-days 365**:  Chỉ ra rằng key có thời hạn 365 ngày.
 * **-keyout**: Vị trí lưu key private
 * **-out**:  Vị trí đặt certificate

Kết quả

```
[root@nginx-lab ~]# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
Generating a 2048 bit RSA private key
.......................................+++
...............................+++
writing new private key to '/etc/ssl/private/nginx-selfsigned.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:VN
State or Province Name (full name) []:HN
Locality Name (eg, city) [Default City]:HN
Organization Name (eg, company) [Default Company Ltd]:HN
Organizational Unit Name (eg, section) []:HN
Common Name (eg, your name or your server's hostname) []:test.niemdt.com
Email Address []:niemdt9@gmail.com
```

Tạo Diffie–Hellman để việc trao đổi khóa được an toàn giữa server và client

```
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```

## Cấu hình nginx

Thêm những dòng sau vào block `server` với site muốn cấu hình SSL

```
listen 443 http2 ssl;
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
ssl_dhparam /etc/ssl/certs/dhparam.pem;
```

Ví dụ

```
[root@nginx-lab ~]# cat /etc/nginx/conf.d/test.niemdt.com.conf 
server {
    listen 80;
    listen 443 http2 ssl;
    server_name test.niemdt.com;
    client_max_body_size 1024M;

        location / {
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://10.10.35.123:80;
        }
    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
    ssl_dhparam /etc/ssl/certs/dhparam.pem;
}
```

Kiểm tra lại file cấu hình và reload lại nginx

```
[root@nginx-lab ~]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
[root@nginx-lab ~]# nginx -s reload
```

Truy cập site trên web

![](../images/01.png)

Ta thấy dù trình duyệt vẫn báo `Not secure` nhưng thực chất giao tiếp giữa server và client đã được mã hóa