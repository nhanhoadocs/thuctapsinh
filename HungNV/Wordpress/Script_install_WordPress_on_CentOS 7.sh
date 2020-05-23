#!/bin/bash
echo "install mysql"
cd
systemctl stop firewalld
setenforce 0
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install -y mysql-server
systemctl start mysqld
mysql_secure_installation<<SECURESQL

y
NhanHoa@2020
NhanHoa@2020
y
n
y
y
SECURESQL

mysql -u root -pNhanHoa@2020<<SECURESQL
create database wordpress;
flush privileges;
exit
SECURESQL

echo "install Apache"

yum install -y httpd 
systemctl start httpd
systemctl enable httpd

echo "install php 7x"

yum install -y epel-release yum-utils
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
php -v
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
systemctl restart httpd

echo "install wordpress"

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
mv wordpress/* /var/www/html/
mv wp-config-sample.php wp-config.php
sed -i -e "s/database_name_here/"wordpress"/g" /var/www/html/wp-config.php
sed -i -e "s/username_here/"root"/g" /var/www/html/wp-config.php
sed -i -e "s/password_here/"NhanHoa@2020"/g" /var/www/html/wp-config.php
chown -R apache:apache /var/www/html/*
chmod -R 755 /var/www/html/*
systemctl restart httpd

        echo  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$"
        echo  "x                                                              x$"
        echo  "x   >>>>>>>>> QUA TRINH CAI DAT WORDPRESS HOAN TAT <<<<<<<<<   x$"
        echo  "x                                                              x$"
        echo  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$"