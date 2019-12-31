#!/bin/bash

##### Script install Wordpress

	### Variable default

	dbname=wordpress
	dbuser=wordpress
	dbpass=wordpress
	path=/usr/share/nginx/html

# Function check user root
f_check_root () {
	if(( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

# Function download Wordpress
f_download_wordpress () {
	yum install -y tar
	echo "Enter Wordpress version you want to install: "
	read version
	wget -P $path/ https://wordpress.org/wordpress-$version.tar.gz
	tar -zxvf $path/wordpress-$version.tar.gz -C $path/
	rm -rf $path/wordpress-$version.tar.gz
}

# Function create database
f_create_database (){

	mysql -uroot -p<<MYSQL_SCRIPT
	CREATE DATABASE $dbname;
	CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass';
	GRANT ALL PRIVILEGES ON *.* TO '$dbuser'@'localhost';
	FLUSH PRIVILEGES;
MYSQL_SCRIPT

	echo "Installing Wordpress..."
}

# Function config Wordpress
f_config_wp () {

	### Find all of the directories and files in the defined path and update octal permissions.

	chown -R nginx:nginx $path/wordpress
	find $path/wordpress -type d -exec chmod 755 {} \;
	find $path/wordpress -type f -exec chmod 644 {} \;
	
	### Create wp config

	cp $path/wordpress/wp-config-sample.php $path/wordpress/wp-config.php
	chown nginx:nginx $path/wordpress/wp-config.php
	
	### Set database details with perl find and replace

	sed -i "s/database_name_here/$dbname/g" $path/wordpress/wp-config.php
	sed -i "s/username_here/$dbuser/g" $path/wordpress/wp-config.php
	sed -i "s/password_here/$dbpass/g" $path/wordpress/wp-config.php
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
	if f_check_root; then
	f_download_wordpress
	f_create_database
	f_config_wp
	f_restart_service

	echo "You can access http://YOUR-SERVER-IP/wordpress to see your site Wordpress"
    sleep 1
	else
	echo "Please run this script as root premission"
	fi
}
f_sub_main
exit
