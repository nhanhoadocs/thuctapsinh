#!/bin/bash -e  
# Script cai lamb và wordpress  
echo -n "Dat ten MySQL DB : "
read mysqldb

echo -n "Dat MySQL DB User: "
read mysqluser

echo -n "Dat mat khau MySQL Password: "
read mysqlpass 

#if [ "${mysqlpass}" == "" ]
#then
  #  mysqlpass=""
#else
 #   mysqlpass="-p${mysqlpass}"
#fi

echo -n "Nhap mat khau mysql "
read rootpass
if [ "${rootpass}" == "" ]
then
    rootpass=""
else
    rootpass="-p${rootpass}"
fi


# Cai dat httpd
echo -n "Cai dat httpd"
 yum install -y httpd  
 systemctl start httpd.service  
systemctl enable httpd.service  
 mkdir -p /etc/httpd/sites-available  
 mkdir -p /etc/httpd/sites-enabled  
echo "
IncludeOptional sites-enabled/*.conf ">>/etc/httpd/conf/httpd.conf 
#Cai dat mysql  
echo -n "Cai dat mariadb"
 yum install  -y mariadb-server mariadb  
 systemctl start mariadb  
#mysql_secure_installation

#Cai dat php 
#Cai dat php
yum install wget -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release-latest-7.noarch.rpm -y
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release*.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php56


yum install -y  php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfoce
systemctl restart httpd.service
#Cau hinh wordpress


mysql -u root --password=$rootpass<<ten_script
CREATE DATABASE $mysqldb ;
CREATE USER $mysqluser@localhost IDENTIFIED BY '$mysqlpass';
GRANT ALL PRIVILEGES ON $mysqldb.* TO $mysqluser@localhost   IDENTIFIED BY '$mysqlpass';
FLUSH PRIVILEGES;
   exit
ten_script
#Cai dat wordpress  
service httpd restart  
cd ~
sudo wget http://wordpress.org/latest.tar.gz  
tar xzvf latest.tar.gz  
cd wordpress/
cp wp-config-sample.php wp-config.php  

 
sed -e "s/database_name_here/"$mysqldb"/" -e "s/username_here/"$mysqluser"/" -e "s/password_here/"$mysqlpass"/" wp-config-sample.php > wp-config.php 
sudo mkdir -p /var/www/thanhhung.com/public_html    
sudo mv ~/wordpress/* /var/www/thanhhung.com/public_html/  
  
sudo chown -R apache:apache /var/www/thanhhung.com/public_html/      
touch /etc/httpd/conf.d/thanhhung.com.conf   

echo "
<VirtualHost *:80>  

ServerAdmin www.thanhhung.com  
ServerName thanhhung.com  
ServerAlias www.thanhhung.com  
DocumentRoot /var/www/thanhhung.com/public_html/  
</VirtualHost>

" >> /etc/httpd/conf.d/thanhhung.com.conf   

ln -s /etc/httpd/conf.d/thanhhung.com.conf /etc/httpd/sites-enabled/thanhhung.com.conf     

sudo apachectl restart     