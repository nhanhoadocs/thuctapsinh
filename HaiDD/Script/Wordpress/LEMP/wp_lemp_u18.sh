#!/bin/bash

# SCRIPT INSTALL WORDPRESS WITH LEMP ON UBUNTU 18.04 LTS

# Variable
#set -e;
OS=""
mysqlRootPass="thuctap@2020"

# Variable Color text
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#-----------------------------------------------------------------------------#

f_check_os(){
        echo "Checking your OS......."
        if cat /etc/*release | grep Ubuntu > /dev/null 2>&1; then {
            OS="Ubuntu"
			if [ $(cat /etc/*release | grep ^DISTRIB_RELEASE | tr -d 'DISTRIB_RELEASE=') == "18.04" ]; then {
				echo -e "${GREEN}-----YOUR OS : UBUNTU 18.04-----${NOCOLOR}"
				return 0
			} else {
				return 1
			} fi
				
        } else {
			return 1
		} fi
}

# Check user root
f_check_root () {
	if (( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

# Update apt, support packet
f_install_support(){
	apt update
	apt -y install wget
}

# Install Nginx
f_install_nginx(){
	apt -y install nginx
	ufw allow 'Nginx HTTP'
	
}

# Install MariaDB
f_install_mariadb(){
	apt-get -y remove mariadb-server
	sleep 2
	apt -y install mariadb-server
	
mysql_secure_installation<<SECURESQL

$mysqlRootPass
$mysqlRootPass
y
y
y
y
SECURESQL
}

# Create db, user for WP
f_create_db_user(){
    echo -n "MariaDB Host: (Enter for localhost): "
    read mariahost
	
    if [ "$mariahost" = "" ]
    then
    mariahost="localhost"
    fi
	
    echo -n "New Database Name: "
    read mariadb

    echo -n "New MariaDB User: "
    read mariauser

    echo -n "Password: "
    read mariapass

mysql -u root -p$mysqlRootPass<<CREATE_DB_SCRIPT
CREATE DATABASE $mariadb;
CREATE USER $mariauser@$mariahost IDENTIFIED BY '$mariapass';
GRANT ALL PRIVILEGES ON $mariadb.* TO $mariauser IDENTIFIED BY '$mariapass';
FLUSH PRIVILEGES;
exit
CREATE_DB_SCRIPT
}


# Install PHP
f_install_PHP(){
	apt -y install php-fpm php-mysql
}

# Configure Nginx PHP
f_config_nginx_php(){
	echo -n "NHAP TEN MAY CHU BAN CUA BAN: "
	read DOMAIN_NAME
	echo "server {
		listen 80;
		root /var/www/html;
		index index.php index.html index.htm index.nginx-debian.html;
		server_name $DOMAIN_NAME;

		location / {
            try_files \$uri \$uri/ =404;
		}

		location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
		}

		location ~ /\.ht {
            deny all;
		}
	}" > /etc/nginx/sites-available/$DOMAIN_NAME

	ln -s /etc/nginx/sites-available/$DOMAIN_NAME /etc/nginx/sites-enabled/
	unlink /etc/nginx/sites-enabled/default
	
	systemctl reload nginx
}

# Install WORDPRESS
f_install_wordpress(){
	apt install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
	wget https://wordpress.org/latest.tar.gz
	tar xvfz latest.tar.gz
	cp -Rvf /root/wordpress/* /var/www/html
	rm -f latest.tar.gz
	rm -rf wordpress/
	
	clear
	
	# Config file wordpress
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i -e "s/database_name_here/"$mariadb"/g" /var/www/html/wp-config.php
    sed -i -e "s/username_here/"$mariauser"/g" /var/www/html/wp-config.php
    sed -i -e "s/password_here/"$mariapass"/g" /var/www/html/wp-config.php
	sed -i -e "s/localhost/"$mariahost"/g" /var/www/html/wp-config.php

	chown -R www-data:www-data /var/www/html/*
	chmod -R 755 /var/www/html/*
	clear
}

################################################
#                  MAIN SCRIPT                 #
################################################

main(){
	clear
	echo -e "${GREEN}############################################################################${NOCOLOR}"
	echo -e "${GREEN}#                                                                          #${NOCOLOR}"
	echo -e "${GREEN}#      SCRIPT INSTALL WORDPRESS WITH LEMP ON UBUNTU 18.04 BY DANGDOHAI     #${NOCOLOR}"
	echo -e "${GREEN}#                                                                          #${NOCOLOR}"
	echo -e "${GREEN}############################################################################${NOCOLOR}"

	sleep 5


	if f_check_os; then {
		if f_check_root; then {
			echo -e "\n"
			echo -e "${GREEN}CAI DAT CAC GOI HO TRO....${NOCOLOR}"
			echo -e "\n"
			f_install_support
			clear
			
			echo -e "${GREEN}_______________CAI DAT NGINX_______________${NOCOLOR}"
			echo -e "\n"
			f_install_nginx
			echo -e "${GREEN}CAI DAT APACHE THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT MARIADB_______________${NOCOLOR}"
			echo -e "\n"
			f_install_mariadb
			echo -e "${GREEN}CAI DAT MARIADB THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________TAO DATABASE VA USER CHO WORDPRESS_______________${NOCOLOR}"
			echo -e "\n"
			f_create_db_user
			echo -e "${GREEN}DATABASE VA USER DA DUOC TAO THANH CONG !!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT PHP 7.2_______________${NOCOLOR}"
			echo -e "\n"
			f_install_PHP
			echo -e "${GREEN}CAI DAT PHP 7.2 THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAU HINH NGINX SU DUNG PHP_______________${NOCOLOR}"
			echo -e "\n"
			f_config_nginx_php
			echo -e "${GREEN}CAU HINH THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT WORDPRESS_______________${NOCOLOR}"
			echo -e "\n"
			f_install_wordpress
			echo -e "${GREEN}CAI DAT WORDPRESS THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
	
		} else {
			echo -e "${RED}--->>PLEASE RUN THIS SCRIPT AS ROOT PREMISSION<<---${NOCOLOR}"
		} fi
	
	} else {
		echo -e "${RED}--->>SORRY. THIS SCRIPT DOES NOT SUPPORT YOUR OPERATING SYSTEM<<---${NOCOLOR}"
	} fi
	
	clear
	
	echo -e "${GREEN}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${NOCOLOR}"
	echo -e "${GREEN}x                                                              x${NOCOLOR}"
	echo -e "${GREEN}x    >>>>>>>>>QUA TRINH CAI DAT WORDPRESS HOAN TAT<<<<<<<<<    x${NOCOLOR}"
	echo -e "${GREEN}x                                                              x${NOCOLOR}"
	echo -e "${GREEN}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${NOCOLOR}"
}


# Run main
main

exit