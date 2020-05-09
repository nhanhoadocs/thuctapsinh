# Tạo Self-Signed SSL Certificate cho Nginx

Tiếp theo bài cấu hình reverse, ta sẽ cấu hình ssl cho Nginx.

### 1. Tạo chứng chỉ SSL 

**Tạo 1 thư mục chứa private key**
```
mkdir /etc/ssl/private
chmod 700 /etc/ssl/private
```

**Tạo self-signed key và chứng chỉ**
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```
- days 365 chỉ ra key có thời hạn là 365 ngày 
- keyout chit ra vị trí lưu key private
- out chỉ ra vị trí chứng chỉ. 

**Sau khi chạy lệnh, điền các thông tin như sau:**
```
Generating a 2048 bit RSA private key
..............................................+++
.....................+++
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
Common Name (eg, your name or your server's hostname) []:hungnv99.com
Email Address []:hungvietnguyen6241@gmail.com
```

**Tạo Diffie-Hellman để trao đổi khóa an toàn:**
```
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```
### 2. Cấu hình

**Thêm các dòng sau vào file cấu hình site:**
```
listen 443 http2 ssl;
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
ssl_dhparam /etc/ssl/certs/dhparam.pem;
```
**Sau đó chỉnh sửa 1 số vị trí ở file cấu hình reverse trước đó cho phù hợp:**

    Sau đây là file cấu hình sau khi chỉnh sửa: 
![Imgur](https://i.imgur.com/wdK6lia.png)

**Kiểm tra lại file cấu hình và reload lại nginx**
```
cat /etc/nginx/conf.d/hungnv99.com.conf
```
```
systemctl restart nginx
```
**Truy cập website bằng tên miền để xác định là đã thành công**

![Imgur](https://i.imgur.com/r3Vb34S.png)
