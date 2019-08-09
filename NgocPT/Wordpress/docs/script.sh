# Script cài đặt wordpress 
#!/bin/bash
# script cai dat LAMP va wordpress
# Cai dat httpd
echo -n "Cai dat httpd"
yum -y install httpd
systemctl start httpd
systemctl enable httpd
# Cai dat mysql/mariadb
echo -n "Cai dat Mariadb"
yum -y install mariadb-server mariadb
systemctl enable mariadb.service
systemctl start mariadb.service  
mysql_secure_installation
# Cai dat php
echo -n "Cai dat php"
rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils
yum-config-manager --enable remi-php70
yum -y install php php-opcache
systemctl restart httpd.service
# Ho tro MySQL trong PHP
yum -y install php-mysql
# Cai dat wordpress
cd /var/www/html/
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo chown -R apache:apache /var/www/html/*
mv wordpress/* /var/www/html/
# Tao co so du lieu mariadb
#echo -n "Enter your MySQL root password: "
#read -s rootpass
mysql -u root -p
CREATE DATABASE $mysqldb ;
CREATE USER '$mysqluser'@'localhost' IDENTIFIED BY '$mysqlpass';
GRANT ALL PRIVILEGES ON '$mysqldb'.* TO '$mysqluser'@'localhost' IDENTIFIED BY '$mysqlpass';
FLUSH PRIVILEGES;
exit
#Cau hinh wordpress
cd /var/www/html/
mv wp-config-sample.php wp-config.php
vi wp-config.php
echo -n "MySQL DB Name: "
read mysqldb
echo -n "MySQL DB User: "
read mysqluser
echo -n "MySQL Password: "
read mysqlpass
systemctl restart httpd
