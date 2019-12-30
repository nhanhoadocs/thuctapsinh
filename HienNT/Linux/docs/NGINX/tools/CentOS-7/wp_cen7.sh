#!/bin/bash

##### Script install Wordpress

# Function check user root
f_check_root () {
	if(( $EUID == 0)); then
		#if user is root, continue to function f_sub_main
		f_create_database
	else
		#if user not root, print message and exit script
		echo "Please run this script by user root!"
		exit
	fi
}

# Function create Databae
f_create_database (){
	echo "Enter Database: "
	read dbname
	echo "Enter User Database: "
	read dbuser
	echo "Enter Password User Database: "
	read dbpass
	mysql -uroot -p<<MYSQL_SCRIPT
	CREATE DATABASE $dbname;
	CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass';
	GRANT ALL PRIVILEGES ON *.* TO '$dbuser'@'localhost';
	FLUSH PRIVILEGES;
MYSQL_SCRIPT

	echo "DATABASE is created. Install Wordpress now? (y/n)"
	read run
	if [[ "$run" = "n" ]]; then
		exit
	else
		f_sub_main
	fi
}


# Function download Wordpress
f_download_wordpress () {
	yum install -y tar
	echo "Enter Wordpress version you want to install(3/4/5): "
	read version
	if [[ "$version" -eq '3' ]]; then
		wget -P /usr/share/nginx/html/ https://wordpress.org/wordpress-3.9.30.tar.gz
		tar -zxvf /usr/share/nginx/html/wordpress-3.9.30.tar.gz -C /usr/share/nginx/html/
		rm -rf /usr/share/nginx/html/wordpress-3.9.30.tar.gz
	elif [[ "$version" -eq '4' ]]; then
		wget -P /usr/share/nginx/html/ https://wordpress.org/wordpress-4.9.13.tar.gz
		tar -zxvf /usr/share/nginx/html/wordpress-4.9.13.tar.gz -C /usr/share/nginx/html/
		rm -rf /usr/share/nginx/html/wordpress-4.9.13.tar.gz
	elif [[ "$version" -eq '5' ]]; then
		wget -P /usr/share/nginx/html/ https://wordpress.org/wordpress-5.3.2.tar.gz
		tar -zxvf /usr/share/nginx/html/wordpress-5.3.2.tar.gz -C /usr/share/nginx/html/
		rm -rf /usr/share/nginx/html/wordpress-5.3.2.tar.gz
	else 
		echo "Script don't support this version!"
	fi
}

	
# Function config Wordpress
f_config_wp () {
	### Find all of the directories and files in the defined path and update octal permissions.

	chown -R nginx:nginx /usr/share/nginx/html/wordpress
	find /usr/share/nginx/html/wordpress -type d -exec chmod 755 {} \;
	find /usr/share/nginx/html/wordpress -type f -exec chmod 644 {} \;
	
	### Create wp config

	cp /usr/share/nginx/html/wordpress/wp-config-sample.php /usr/share/nginx/html/wordpress/wp-config.php
	chown nginx:nginx /usr/share/nginx/html/wordpress/wp-config.php
	
	### Set database details with perl find and replace

	sed -i "s/database_name_here/$dbname/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/username_here/$dbuser/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/password_here/$dbpass/g" /usr/share/nginx/html/wordpress/wp-config.php
	echo "listen = /var/run/php-fpm/php-fpm.sock" >> /etc/php-fpm.d/www.conf
}

# Function restart service
f_restart_service () {
	### Restart service

	systemctl restart mariadb
	systemctl restart nginx
	systemctl restart php-fpm
}

# The sub main function, use to call neccessary functions of installation
f_sub_main () {
	f_download_wordpress
	f_config_wp
	f_restart_service

	echo "You can access http://YOUR-SERVER-IP/wordpress to see your site Wordpress"
    sleep 1
}

f_check_root
exit
