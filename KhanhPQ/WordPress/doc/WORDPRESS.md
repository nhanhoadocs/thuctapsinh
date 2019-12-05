#!/bin/bash
echo "=========User root mysql========="
p1=
read -s -p "Password for root (MYSQL): " p1
echo -e "[Use mysql] \n \
user = \"root\" \n \
pass = \"$p1\" \n " > user_mysql.txt
echo -e "\n"
clear
echo -e "=======FILE USER DONE======="



#CREATE DB FOR WP
echo "=========CREAT DB FOR WORDPRESS========"
read -p "Name of DB(default: wordpress) : " p2
p2=${p2:-wordress}
read -p "UserName (default: wordpressuser)  :" p3
p3=${p3:-wordpressuser}
read -s -p "Password (default: password)  :" p4
p4=${p4:-password}
echo -e "\n"
read -p "Type user (default: localhost)  :" p5
p5=${p5:-localhost}

mysql -e "CREATE DATABASE $p2;"
mysql -e "CREATE USER $p3@$p5 IDENTIFIED BY '$p4';"
mysql -e "GRANT ALL PRIVILEGES ON $p2.* TO $p3@$p5 IDENTIFIED BY '$p4';"
mysql -e "FLUSH PRIVILEGES;"
clear
echo "=========CREAT DB FOR WORDPRES: DONE========"




#INSTALL WORDPRESS
echo "========INSTALL WORDPRESS========="
sudo yum install -y php-gd
sudo service httpd restart

cd ~
sudo yum install -y wget
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

yum install -y rsync
sudo rsync -avP ~/wordpress/ /var/www/html/

mkdir /var/www/html/wp-content/uploads
sudo chown -R apache:apache /var/www/html/*

clear
echo -e "=======INSTALL WP DONE======="


#CONFIG WP

cd /var/www/html
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$p2/g" /var/www/html/wp-config.php
sed -i "s/username_here/$p3/g" /var/www/html/wp-config.php
sed -i "s/password_here/$p4/g" /var/www/html/wp-config.php
sed -i "s/localhost/$p5/g" /var/www/html/wp-config.php

echo -e "=======CONFIG WP DONE======="


#CONFIG VERSION PHP
sudo yum install -y epel-release yum-utils
sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php72
sudo yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
sudo systemctl restart httpd
