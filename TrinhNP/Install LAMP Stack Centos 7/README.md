
# LAMP - Linux + Apeche + MariaDB(MySQL) + PHP(Perl)

# Cài đặt Apache Web Server
Mặc định khi cài Apache trên CentOS 7 , đó sẽ là phiên bản 2.4 .

` yum install httpd -y`

Khởi động web server Apache và cấu hình startup service cho Apache.

` systemctl start httpd`

` systemctl enable httpd`

Kiểm tra phiên bản Apache vừa cài đặt trên CentOS 7.

` httpd -v`
```
Server version: Apache/2.4.6 (CentOS)

Server built: Apr 20 2018 18:10:38
```

Kiểm tra dịch vụ Apache đã lắng nghe trên port 80 hay chưa.

` netstat -natp | grep httpd`
```
tcp 0 0 :::80 :::* LISTEN 8441/httpd
```
Cấu hình rule firewall vào hệ thống web server Apache port 80/443 .

` iptables -A INPUT -p tcp –match multiport –dports 80,443 -j ACCEPT`
 
 
Sau đó ta truy cập IP của VPS, 
```
http://<ip-address>
```
Nếu cài thành công thì sẽ hiện lên trang sau: 
![](https://vdodata.vn/wp-content/uploads/2019/05/huong-dan-cai-dat-lamp-tren-centos-7-img1.jpg)

Nội dung file web mặc định khi bạn truy cập bằng địa chỉ IP Web Server Apache nằm ở thư mục : /var/www/html/

## File cấu hình Apache

File cấu hình Apache: /etc/httpd/conf/httpd.conf
Thư mục chứa cấu hình phụ Apache: /etc/httpd/conf.d/
Thư mục log Apache: /var/log/httpd/
Thư mục web mặc định: /var/www/html/

# Cài đặt MariaDB

Đầu tiên chúng ta sẽ khởi tạo thông tin Repository MariaDB để chương trình yum biết nguồn tải cài đặt MariaDB.

` nano /etc/yum.repos.d/MariaDB.repo`

 

# MariaDB 10.2 CentOS repository list

` http://downloads.mariadb.org/mariadb/repositories/`
```
[mariadb]

name = MariaDB

baseurl = http://yum.mariadb.org/10.2/centos7-amd64

gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

gpgcheck=1
```
` yum repolist`

` yum install MariaDB-server MariaDB-client MariaDB-devel -y`

Khởi động dịch vụ MariaDB có tên dịch vụ là ‘mysql‘ trên CentOS 7 và thiết lập cho dịch vụ MariaDB khởi động khi Hệ Điều Hành Linux được khởi động.
```
 systemctl start mysql.service

 systemctl enable mysql.service
```
Hệ thống sẽ hỏi có muốn chạy chương trình “mysql_secure_installation” ngay sau khi cài đặt MariaDB nhằm đạt được các mục tiêu sau :

- Thay đổi password root.
- Xoá bỏ user anonymous.
- Tắt tính năng cho phép root login từ ngoài hệ thống.
- Xoá bỏ database “test” và quyền truy cập nó.
- Reload lại các table liên quan đến quyền hạn.
# mysql_secure_installation

 
```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB

SERVERS IN PRODUCTION USE! PLEASE READ EACH STEP CAREFULLY!

 

In order to log into MariaDB to secure it, we’ll need the current

password for the root user. If you’ve just installed MariaDB, and

you haven’t set the root password yet, the password will be blank,

so you should just press enter here.

 

Enter current password for root (enter for none):

OK, successfully used password, moving on…

 

Setting the root password ensures that nobody can log into the MariaDB

root user without the proper authorisation.

 

Set root password? [Y/n] Y

New password:

Re-enter new password:

Password updated successfully!

Reloading privilege tables..

… Success!
```
 
```
By default, a MariaDB installation has an anonymous user, allowing anyone

to log into MariaDB without having to have a user account created for

them. This is intended only for testing, and to make the installation

go a bit smoother. You should remove them before moving into a

production environment.

 

Remove anonymous users? [Y/n] Y

… Success!

 
```
```
Normally, root should only be allowed to connect from ‘localhost’. This

ensures that someone cannot guess at the root password from the network.

 

Disallow root login remotely? [Y/n] Y

… Success!
```
 ```

By default, MariaDB comes with a database named ‘test’ that anyone can

access. This is also intended only for testing, and should be removed

before moving into a production environment.

 

Remove test database and access to it? [Y/n] Y

– Dropping test database…

… Success!

– Removing privileges on test database…

… Success!

 ```
```
Reloading the privilege tables will ensure that all changes made so far

will take effect immediately.

 

Reload privilege tables now? [Y/n] Y

… Success!
```
 
```
Cleaning up…

 

All done! If you’ve completed all of the above steps, your MariaDB

installation should now be secure.

 

Thanks for using MariaDB!
```
Kiểm tra phiên bản MariaDB trên CentOS 7.

` mysql -V`
```
mysql Ver 15.1 Distrib 10.2.14-MariaDB, for Linux (x86_64) using readline 5.1
```
Kiểm tra xem có tiến trình nào của MariaDB đang chạy hay không? Tên tiến trình sẽ là ‘mysqld‘.

` ps aux | grep -v “grep” | grep “mysqld”`
```
mysql 24679 0.1 2.1 1893296 85380 ? Ssl 10:45 0:00 /usr/sbin/mysqld
```
Đăng nhập thử với user và mật khậu đã setup

` mysql -u root -p'<matkhau>’`

 
```
Welcome to the MariaDB monitor. Commands end with ; or \g.

Your MariaDB connection id is 16

Server version: 10.2.9-MariaDB MariaDB Server

 

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

 

Type ‘help;’ or ‘\h’ for help. Type ‘\c’ to clear the current input statement.

 

MariaDB [(none)]>
```

# Cài đặt PHP 7

`wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm`

`rpm -Uvh remi-release-7*.rpm`


` vi /etc/yum.repos.d/remi-php70.repo`
```
[remi-php70]

name=Remi’s PHP 7.1 RPM repository for Enterprise Linux 7 – $basearch

#baseurl=http://rpms.remirepo.net/enterprise/7/php71/$basearch/

#mirrorlist=https://rpms.remirepo.net/enterprise/7/php71/httpsmirror

mirrorlist=http://cdn.remirepo.net/enterprise/7/php71/mirror

enabled=1

gpgcheck=1

gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi

…
```
Giờ ta tiến hành cài đặt PHP 7.0 cùng một số module PHP hỗ trợ thường sử dụng.

` yum install –disablerepo=* –enablerepo=remi-php70 php php-mysql php-bcmath php-cli php-common php-devel php-embedded php-enchant php-mbstring php-mcrypt php-pdo php-xml -y`

Kiểm tra phiên bản PHP trên hệ thống CentOS

` php -v`
```
PHP 7.0.30 (cli) (built: Apr 24 2018 21:28:23) ( NTS )

Copyright (c) 1997-2017 The PHP Group

Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies
```
Khởi động lại dịch vụ Apache để áp dụng chương trình module PHP 7 mới cài vào.

` systemctl restart httpd`

Tiếp đến ta sẽ tạo một file thông tin để kiểm tra xem Apache xử lý được PHP code chưa.

` cd /var/www/html/`

` nano info.php`
```
<?php

phpinfo();

?>
```
Giờ ta truy cập trang web domain của chúng ta file info.php trên trình duyệt web xem Apache đã xử lý được code PHP chưa nhé.

http://<ipaddress>/info.php 
 Nếu thành công sẽ hiển thị ra: 
  
![](https://vdodata.vn/wp-content/uploads/2019/05/huong-dan-cai-dat-lamp-tren-centos-7-img2.jpg)



## THAM KHẢO: 
https://www.digitalocean.com/
https://www.hostinger.com/
https://cuongquach.com/  
