# Script cài đặt wordpress   
1.Các mục cần cài đặt :  
 - Cài đặt lamp (Linux,Apache,Mysql,Php)  
     - Linux : Dùng CentOS 7  
     - Apache : httpd  
     - Mysql : Mariadb  
     - PHP  
- Cài đặt wordpress và tạo các user từ mysql để phục vụ wordpress  

2.Script tham khảo :     
#!/bin/bash -e  
# Script cai lamb và wordpress  
# Cai dat httpd
echo -n "Cai dat httpd"
yum install httpd  
systemctl start httpd.service  
systemctl enable httpd.service  
sudo mkdir /etc/httpd/sites-available  
sudo mkdir /etc/httpd/sites-enabled  
echo "
IncludeOptional sites-enabled/*.conf ">>/etc/httpd/conf/httpd.conf 
#Cai dat mysql  
echo -n "Cai dat mariadb"
yum install mariadb-server mariadb  
systemctl start mariadb  
#mysql_secure_installation

#Cai dat php 
sudo yum install php php-mysql

sudo systemctl restart httpd.service
yum install php-fpm
yum install php-gd
php5.6
#Cau hinh wordpress

echo -n "MySQL DB Name: "
read mysqldb

echo -n "MySQL DB User: "
read mysqluser

echo -n "MySQL Password: "
read mysqlpass
#echo -n "Enter your MySQL root password: "
#read -s rootpass
mysql -u root -p <<ten_script
CREATE DATABASE $mysqldb ;
CREATE USER $mysqluser@localhost IDENTIFIED BY '$mysqlpass';
GRANT ALL PRIVILEGES ON $mysqldb.* TO $mysqluser@localhost   IDENTIFIED BY '$mysqlpass';
FLUSH PRIVILEGES;
   exit
ten_script
#Cai dat wordpress  
service httpd restart  
cd ~
wget http://wordpress.org/latest.tar.gz  
tar xzvf latest.tar.gz  
cd wordpress/
cp wp-config-sample.php wp-config.php  

 
sed -e "s/database_name_here/"$mysqldb"/" -e "s/username_here/"$mysqluser"/" -e "s/password_here/"$mysqlpass"/"  wp-config.php  

mkdir -p /var/www/relayserver.com/public_html    
mv ~/wordpress/* /var/www/relayserver.com/public_html/  
  
chown -R apache:apache /var/www/relayserver.com/public_html/      
touch /etc/httpd/conf.d/relayserver.com.conf   

echo "
<VirtualHost *:80>  

ServerAdmin www.relayserver.com  
ServerName relayserver.com  
ServerAlias www.relayserver.com  
DocumentRoot /var/www/relayserver.com/public_html/  
</VirtualHost>

" >> /etc/httpd/conf.d/relayserver.com.conf   

ln -s /etc/httpd/conf.d/relayserver.com.conf /etc/httpd/sites-enabled/relayserver.com.conf     

sudo apachectl restart     