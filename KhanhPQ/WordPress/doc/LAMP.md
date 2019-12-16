#!/bin/bash
#APACHE WEB SERVER
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "======================APACHE DONE====================="



#MariaDB
yum install -y mariadb-server mariadb
systemctl start mariadb
echo "CHU Y: KHONG DAT PASS CHO ROOT -> CHAY MYSQL TU DONG"
sudo mysql_secure_installation
echo "=====================MARIADB DONE======================="




#PHP
yum install -y php php-mysql
systemctl restart httpd.service
yum install -y php-fpm
echo "=====================PHP DONE======================="



#FIREWALL
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
echo "=====================FIREWALL DONE======================="
