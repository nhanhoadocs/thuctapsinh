# Sử dụng Nginx làm reverse proxy cho graylog-server

**Điều kiện cần:** Có 1 máy cài graylog-server và 1 máy cài Nginx.

**Mô hình IP như sau:**

![Imgur](https://i.imgur.com/BD3Wd5x.png)

**Mô hình triển khai như sau:**

![Imgur](https://i.imgur.com/GVJsKLV.png)


Các thao tác thực hiện trên Nginx

### Bước 1: Cài đặt Nginx 

```
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
```

**Backup file cấu hình:** 

```
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk
```

**Khởi chạy dịch vụ Nginx**

```
systemctl restart nginx
systemctl enable nginx
```

### Bước 2: Tạo file config của địa chỉ truy cập. 

Khai báo file config của địa chỉ, mỗi địa chỉ sẽ được khai báo tương ứng với 1 file nằm trong thư mục `/etc/nginx/conf.d`. Các file có phần mở rộng là `.conf`. 

**Ta sẽ tạo file với địa chỉ là hungnv99.com**

```
vi /etc/nginx/conf.d/hungnv99.com.conf
```
Sau đó thêm nội dung sau vào file: 
```
server {
    listen 80;
    server_name hungnv99.com;
    client_max_body_size 1024M;

        location / {
            proxy_set_header   Host                  $host;
            proxy_set_header   X-Real-IP             $remote_addr;
            proxy_set_header   X-Forwarded-For       $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Host      $host;
            proxy_set_header   X-Forwarded-Server    $host;
            proxy_set_header   X-Graylog-Server-URL  http://$server_name/;
            proxy_pass http://10.10.34.191:9000;
        }
}
```
- Tại **server name**:  nhập tên miền sẽ sử dụng để nhập trên web
- Tại **proxy_pass**: nhập vào địa chỉ ip của graylog-server để nginx trỏ về. 

**Kiểm tra lại file vừa tạo:**

```
[root@nginxsrv ~]# cat /etc/nginx/conf.d/hungnv99.com.conf

```
**Kiểm tra và reload lại trạng thái Nginx**

```
[root@nginxsrv ~]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```
```
[root@nginxsrv ~]# nginx -s reload
```
```
[root@nginxsrv ~]# systemctl restart nginx
```

Bước 3: Kiểm tra 

Vì đây là ip private nên ta cần khai báo file hosts với nội dung như sau: 

```
hungnv99.com 10.10.35.192
```

- Đối với linux, file host nằm ở: `/etc/hosts`  
- Đối với Windown, file host nằm ở: `C:\Windows\System32\drivers\etc\hosts`

Vào trình duyệt Web và gõ địa chỉ : hungnv99.com để kiểm tra xem có hiện Web interface của gaylog hay chưa. Nếu hiện là đã thành công. 

![Imgur](https://i.imgur.com/yFZgk1K.jpg)

