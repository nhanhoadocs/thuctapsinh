#!/bin/bash
# cai dat apache 
apt update -y
apt install apache2 -y
# bat dich vu apache 
systemctl enable apache2
systemctl start apache2
# mo port cho dich vu apache
ufw allow in "Apache Full"
# cai mariadb
apt install -y mariadb-server
# cai dat php7.2
sudo apt install -y php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline

# bat module va khoi dong lai apache
a2enmod php7.2
systemctl restart apache2

