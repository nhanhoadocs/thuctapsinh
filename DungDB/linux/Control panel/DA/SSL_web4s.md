# SSL Web4S

```
ssh root@45.117.81.119 -p 58986 (thay đổi IP)
```

## Sửa file
```
cd /var/www/domain/zone
```

```
vi serverssl.conf  
```

**Chú ý:** có thể đường dẫn khác

### Chèn thêm đoạn sau, thay domain cần cài ssl
```xml
<VirtualHost *:443>
        SSLProtocol all -SSLv2 -SSLv3
        SSLEngine on
        SSLCertificateFile /var/www/domain/zone/ssl/thienloc.com.vn/public.crt
        SSLCACertificateFile /var/www/domain/zone/ssl/thienloc.com.vn/ca.crt
        SSLCertificateKeyFile /var/www/domain/zone/ssl/thienloc.com.vn/private.key
    ServerAdmin report@nhanhoa.com
    DocumentRoot /var/www/domain/source/thienloc.com.vn
    ServerName thienloc.com.vn
    ServerAlias www.thienloc.com.vn
    ErrorLog logs/thienloc.com.vn-error_log
    CustomLog logs/thienloc.com.vn_log common
</VirtualHost>
```

## Add cert
```
cd /var/www/domain/zone/ssl

mkdir thienloc.com.vn
cd thienloc.com.vn

vi public.crt  (file .pem)
vi ca.crt		(file Chain_Rooot)
vi private.key		(file PK)

chown -R web4s16058:web4s16058 thienloc.com.vn/  (Chú ý own của từng con VPS)
```

Restart apache
```
service httpd restart
```

**Chú ý:** Báo lại team web cài đặt chuyển hướng **http** -> **https**