#!/bin/bash

#update
yum -y update
yum -y upgrade
# cai dat Apache
yum -y install httpd
# khoi dong apache
systemctl start httpd
systemctl enable httpd
# mo port cho dich vu web
firewall-cmd --permanent --add-port=80/tcp      # mo port http
firewall-cmd --permanent --add-port=443/tcp     # mo port https
firewall-cmd --reload
# cai dat mariadb
yum -y update
yum -y install mariadb mariadb-server
# khoi dong mariadb
systemctl start mariadb
systemctl enable mariadb
# cai dat repo php
yum install -y epel-release yum-utils
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# cai dat php
yum-config-manager --enable remi-php74
yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd

#khoi dong lai apache
systemctl restart httpd


