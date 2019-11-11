# CÀI ĐẶT LAMPB  

LAMP là viết tắt đại diện cho một nhóm phần mềm cần có để có thể chạy được một web server (Linux+Apache+MySQL+PHP)  
Các phiên bản của LAMP đến thời điểm bài viết này được viết :  
Linux : Centos 7  
PHP: 5.6.40  
Mariadb: 5.5.60    
Apache: 2.4.6 (CentOS)

Wordpress: 5.2.2  
```
     WordPress server requirements for Version 5.2+:
        PHP version 5.6.20 or greater, PHP 7 is highly recommended
        MySQL version 5.0.15 or greater or any version of MariaDB
        (Optional) (Required for Multisite) Apache mod_rewrite module (for clean URIs known as Permalinks)  
```  
Cài đặt php : 

yum install wget -y  
wget https://dl.fedoraproject.org/pub/epel/  epel-release-latest-7.noarch.rpm   
yum install epel-release-latest-7.noarch.rpm -y  
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm  
rpm -Uvh remi-release*.rpm  
yum install -y yum-utils  
yum-config-manager --enable remi-php56    
yum install -y  php php-mcrypt php-cli php-gd php-curl php-mysql  php-ldap php-zip php-fileinfoce  
systemctl restart httpd.service  

Cài đặt mysql :   
 yum install  -y mariadb-server mariadb    
 systemctl start mariadb   

 Cài đặt apache :   
 yum install -y httpd    
 systemctl start httpd.service    
 systemctl enable httpd.service    