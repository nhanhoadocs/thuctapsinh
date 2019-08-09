# Wordpress  
Trước khi cài đặt wordpress ta cần cài LAMP (Linux ,Apache,Mysql,php)  

## Tạo database và user cho wordpress :  
(mỗi web cần 1 user và 1 database riêng)  
Truy cập vào mysql :  
```
mysql -u root -p
```  
Tạo database :  
```
CREATE DATABASE wordpress;
```

Ta tạo một mysql user mới chỉ được quyền truy cập vào wordpress database .   
```
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
```
Phân quyền cho user đó :  
```

GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';
```
Dùng lệnh sau để lưu lại các thay đổi :  
```
FLUSH PRIVILEGES;
```
  
#  Install WordPress
Để đảm bảo cài được wordpress có một module của php cần cài , ta sử dụng yum để cài nó :  
```
sudo yum install php-gd
```
Khởi động lại apache để áp dụng thay đổi từ php :  
```
sudo service httpd restart
```  
Sau khi cài module php ở trên , ta cài wordpress. Tải bản nén mới nhất của wordpress về :  
```
cd ~
wget http://wordpress.org/latest.tar.gz
```
Giải nén bằng lệnh tar :  
```
tar xzvf latest.tar.gz
```  
Sau đó copy file cấu hình mẫu ra một file cấu hình riêng :   
```
cp wp-config-sample.php wp-config.php
```

- Tạo directory của apache chứa web wordpress : 
```
mkdir /var/www/thanhhung.com  
mkdir /var/www/thanhhung.com/public_html  
mkdir -p /var/www/thanhhung.com/{public_html,logs,backup}
  ```
  - Chuyển file wordpress về thư mục 
 ```    
mv ~/wordpress/* /var/www/thanhhung.com/public_html/
  
chown -R apache:apache /var/www/thanhhung.com/public_html/  
```  
Cấu hình file  cho website ở đường dẫn /etc/httpd/conf.d/ 
```
vi /etc/httpd/conf.d/thanhhung.com.conf
```  
```
<VirtualHost *:80>

ServerAdmin www.thanhhung.com
ServerName thanhhung.com
ServerAlias www.thanhhung.com
DocumentRoot /var/www/thanhhung.com/public_html/
</VirtualHost>


```
Copy file vừa cấu hình sang sites-enabled :
```
ln -s /etc/httpd/conf.d/thanhhung.com.conf /etc/httpd/sites-enabled/thanhhung.com.conf
```
Sau đó ta restart lại service để áp dụng các thay đổi :  
```
sudo apachectl restart  
```
cấu hình file của wordpress :   

```
vi /var/www/thanhhung.com/public_html/wp-config.php  
``` 
```
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', 'password');
```


Sau khi hoàn thành các bước trên cài đặt wordpress trên giao diện web,tại máy client truy cập vào domain name của server để cấu hình wordpress : 

http://server_domain_name_or_IP  

