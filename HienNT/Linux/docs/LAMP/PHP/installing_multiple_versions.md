## Sử dụng nhiều phiên bản PHP trên cùng một host - Thiết lập PHP riêng cho từng tên miền  



## Step 1: Installing and Enabling EPEL and Remi Repository

### 1. Cài đặt và kích hoạt `EPEL` và `Remi` repository

- EPEL và Remi cung cấp các phiên bản mới nhất của PHP stack trên CentOS / RHEL 7 distributions  

    ```sh
    # yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
    ```    

    ```sh
    # yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
    ```  

### 2. Install the yum-utils package
- `yum-utils package` mở rộng các chức năng riêng của yum và cung cấp lệnh `yum-config-manager` , được sử dụng để bật hoặc tắt các kho lưu trữ Yum trên hệ thống

    ```sh
    # yum install yum-utils -y
    ```  

## Step 2: Installing Apache Web Server  

### 1. Cập nhật phiên bản mới nhất của Apache   

```sh
  # yum update
```  

### 2. Cài đặt Apache  

```sh
  # yum install -y httpd
```  

## Step 3 – Install PHP and FastCGI  

### 1. Cài đặt FastCGI  

```sh
  # yum install php php-cli mod_fcgid -y
```  

### 2. Install PHP 7.3.8 Version 

```sh
  # yum-config-manager --enable remi-php73
  # yum install php php-common php-fpm -y
  # yum install php-mysql php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-pecl-apc php-cli php-pear php-pdo -y
```

### 3. Install PHP 5.6 Version  

```sh
  # yum install php56 php56-php-common php56-php-fpm -y
  # yum install php56-php-mysql php56-php-pecl-memcache php56-php-pecl-memcached php56-php-gd php56-php-mbstring php56-php-mcrypt php56-php-xml php56-php-pecl-apc php56-php-cli php56-php-pear php56-php-pdo -y
```  

### 4. Kiểm tra version: 

  ```sh
    # php -v
  ```

  <img src ="../../../images/25 bai linux/php-v.png">  

## Step 4 – Disable Default PHP Handler  

Chỉnh sửa PHP configuration file of Apache (**/etc/httpd/conf.d/php.conf**) và sửa các dòng như trong ảnh bên dưới thành nhận xét  

  <img src ="../../../images/25 bai linux/phpcf.png">  

## Step 5 – Setup FastCGI Handler  

- Apache FastCGI Module đã được cài đặt thành công ở bước trên. Đảm bảo các file `php.ini`, `php56-cgi` và `php73-cgi` tồn tại trên hệ thống. Điều hướng đến(nanigate to) `/var/www/cgi-bin` directory. Tạo 2 file: `php73.fastcgi` và `php56.fastcgi` và thêm nội dung như phía dưới vào 2 file vừa tạo.    

  ```sh
  # vim /var/www/cgi-bin/php73.fastcgi
  ```
  ```sh
    #!/bin/bash

    PHPRC="/etc/php.ini"  
    PHP_FCGI_CHILDREN=4  
    PHP_FCGI_MAX_REQUESTS=1000  
    export PHPRC  
    export PHP_FCGI_CHILDREN  
    export PHP_FCGI_MAX_REQUESTS  
    exec /usr/bin/php73-cgi  
    ```
  ```sh
  # vim /var/www/cgi-bin/php56.fastcgi
  ```
  ```sh
    #!/bin/bash

    PHPRC="/etc/php.ini"  
    PHP_FCGI_CHILDREN=4  
    PHP_FCGI_MAX_REQUESTS=1000  
    export PHPRC  
    export PHP_FCGI_CHILDREN  
    export PHP_FCGI_MAX_REQUESTS  
    exec /usr/bin/php56-cgi  
  ```  

- Thay đổi quyền `php73.fastcgi` và `php56.fastcgi` với Apache để giúp thực thi các lệnh trong đó  

  ```sh
    # chown apache:apache /var/www/cgi-bin/php56.fastcgi
    # chmod +x /var/www/cgi-bin/php56.fastcgi
    # chown apache:apache /var/www/cgi-bin/php73.fastcgi
    # chmod +x /var/www/cgi-bin/php73.fastcgi  
  ```  

### Step 6 - Configuring PHP-FPM and PHP56-PHP-FPM  

Bước này bạn sẽ định cấu hình các phiên bản khác nhau của php-fpm mà Apache sẽ làm việc cùng. Bạn nên xác định user/group of the FastCGI processes as well as the ports they will listen on.

2 tập tin cấu hình bạn sẽ trực tiếp làm việc: 

- *php-fpm* (default 7.x) - /etc/php-fpm.d/www.conf
- *php56-php-fpm* - /opt/remi/php56/root/etc/php-fpm.d/www.conf

Chỉnh sửa file cấu hình:  

#### PHP 7.2  

```sh
  # vim /etc/php-fpm.d/www.conf
```
  
  <img src ="../../../images/25 bai linux/php01.gif">  

#### PHP 5.6  

```sh
  # vim /opt/remi/php56/root/etc/php-fpm.d/www.conf
```

  <img src ="../../../images/25 bai linux/php02.gif">  

### Step 7 - Cập nhật các tệp cấu hình apache để sử dụng trình xử lý worker

```sh
  # vim /etc/httpd/conf.modules.d/00-mpm-conf
```  

  <img src ="../../../images/25 bai linux/php03.gif">  

- Tạo một nhóm fpm cho trang web của bạn  

  ```sh
  # cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/php73.com.conf
  ```
  
  và  

  ```sh
  # cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/php56.net.conf
  ```  

- Sửa đổi cài đặt nhóm fpm cho trang web của bạn  
  
  ```sh
  # vim /etc/php-fpm.d/php73.com.conf
  ```

  <img src ="../../../images/25 bai linux/php73.png">  

  ```sh
  # vim /etc/php-fpm.d/php56.net.conf
  ```
  
  <img src ="../../../images/25 bai linux/php56.png">  

## Step 8 - Setup Nginx Server Blocks for Websites   

#### Website One: php73.com  

```sh
  # vim /etc/httpd/conf.d/php73.com.conf
```  

```sh
   <VirtualHost *:80>
    ServerName php73.com
    ServerAdmin admin@php73.com
    DocumentRoot /var/www/html/php73.com/
    ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
    <Directory "/var/www/html/php73.com/">
            Options +Indexes +FollowSymLinks +ExecCGI
            AddHandler php-fastcgi .php
            Action php-fastcgi /cgi-bin/php73.fastcgi
            AllowOverride All
            Order allow,deny
            Allow from All
    </Directory>
</VirtualHost>
```   

#### Website Two: php56.net  

```sh
  # vim /etc/httpd/conf.d/php56.net.conf
```  

```sh
<VirtualHost *:80>
    ServerName php56.net
    ServerAdmin admin@php56.net
    DocumentRoot /var/www/html/php56.net/
    ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
    <Directory "/var/www/html/php56.net/">
            Options +Indexes +FollowSymLinks +ExecCGI
            AddHandler php56-fastcgi .php
            Action php56-fastcgi /cgi-bin/php56.fastcgi
            AllowOverride All
            Order allow,deny
            Allow from All
    </Directory>
</VirtualHost>
```

## Step 9 - Testing Different PHP Versions  

```sh
  # mkdir /var/www/html/php73.com
  # echo "<?php phpinfo(); ?>" > /var/www/html/php73.com/info.php
```  

```sh  
  # mkdir /var/www/html/php56.net
  # echo "<?php phpinfo(); ?>" > /var/www/html/php56.net/info.php
```  
- Tắt firewall  

  ```sh
    # setenforce 0
  ```

- Start các dịch vụ:  

  ```sh
    # systemctl start httpd
    # systemctl enable httpd
    # systemctl enable php-fpm
    # systemctl start php-fpm
    # systemctl enable php56-php-fpm
    # systemctl start php56-php-fpm
  ```  

- Truy cập vào các địa chỉ `php73.com/info.php` và `php56.net/info.php` trên trình duyệt. 

Kết quả:  

#### PHP 5.6.40  

  <img src ="../../../images/25 bai linux/php56test.png">

#### PHP 7.3.8  

  <img src ="../../../images/25 bai linux/php73test.png">  


## Tài liệu tham khảo  

- [multiple-websites-in-nginx](https://www.itsmearunchandel.co.in/linux/install-different-php-versions-with-multiple-websites-in-nginx.html)
- [tecadmin.net-fastcgi-and-php-on-centos-redhat](https://tecadmin.net/setup-httpd-with-fastcgi-and-php-on-centos-redhat/)
- [cloudwafer.com-multiple-versions-of-php-on-centos](https://cloudwafer.com/blog/installing-multiple-versions-of-php-on-centos/)
- [devanswers.co-multiple-php-versions-on-apache](https://devanswers.co/run-multiple-php-versions-on-apache/)  
- [tecmint.com-different-php-versions-in-nginx](https://www.tecmint.com/run-multiple-websites-with-different-php-versions-in-nginx/)  
- [php-fpm-with-apache-on-centos7](https://jonathansblog.co.uk/php-fpm-with-apache-on-centos7)