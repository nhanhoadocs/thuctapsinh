### Cài đặt LAMP trên CentOS 7  
`LAMP` là gói kết hợp giữa hệ điều hành và bộ phần mềm mã nguồn mở. `LAMP` là từ viết tắt của Linux, Apache, MySQL/MariaDB và PHP/Python.  
Các bước cài đặt LAMP.  
*Bước 1*: Cài đặt **Apache Web server** và khởi động cùng hệ thống 
```
yum install -y httpd  
systemctl start httpd  
systemctl enable httpd  
```  
*Bước 2*: Cài đặt **MySQL-MariaDB**   
```
yum install -y mariadb-server mariadb
systemctl start mariadb  
```  
- Kiểm tra version:  
```
yum list installed | grep mariadb  
```  
- Đặt password cho MySQL  
```
mysql_secure_installation
```    
- Các thông số thiết lập (bạn có thể tùy chọn theo ý mình):  
    - Enter current password for root (enter for none): none  
    - Set root password?` [Y/n] n  
    - Remove anonymous users? [Y/n] Y
    - Disallow root login remotely? [Y/n] n
    - Remove test database and access to it? [Y/n] Y
    - Reload privilege tables now? [Y/n] Y  

- Kích hoạt khởi động cùng hệ thống  
```
systemctl enable mariadb  
```  
*Bước 3*: Cài đặt **PHP**  
Phiên bản `PHP` đi kèm với CentOS là mặc định khá cũ (PHP 5.4). Sau đây ta sẽ cài đặt các phiên bản PHP mới hơn PHP 7.3 từ kho Remi.
- Cài đặt kho lưu trữ EPEL 
```
yum install epel-release yum-utils
```
- Cài đặt REMI repo  
```
rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm  
```  
- Kiểm tra các repo nào đang được bật   
```
yum repolist
```
- Cài đặt `yum-utils` - tập hợp các chương trình hữu ích để quản lý các gói và gói yum. Nó có các công cụ cải thiện các tính năng mặc định của yum.  
```
yum install yum-utils
```
- Sử dụng yum-config-manager kích hoạt kho lưu trữ Remi làm kho lưu trữ mặc định để cài đặt các phiên bản PHP khác nhau và cài đặt PHP như sau:  
```
yum-config-manager --enable remi-php73 
```  
- Cài đặt PHP 7 với các mô-đun cần thiết bổ sung có thể mở rộng chức năng cốt lõi:  
```
yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo  
```  
- Kiểm tra version
```
php -v
PHP 7.3.11 (cli) (built: Oct 22 2019 08:11:04) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.11, Copyright (c) 1998-2018 Zend Technologies
```  

Để kiểm tra hệ thống của bạn đã cài đặt đúng php chưa thì ta sẽ tạo một tập lệnh php  
```
touch /var/www/html/test.php
```  
Sau đó thêm mã php sau vào tệp  
<?php echo 'Test php';?>  

Lưu file và thoát. Tiếp theo ta kiểm tra trạng thái của firewall và tắt nó đi nếu nó đang ở chế độ `active`. Tắt `selinux` bằng cách cấu hình `/etc/selinux/config`. Sau đó mở trình duyệt rồi gõ địa chỉ IP kèm `/test.php` 
```
http: //YOUR_SERVER_IP/test.php
```  
Kết quả:  
 
<img src="https://i.imgur.com/3QNed3c.png">  
