#!/bin/bash

##### Script install Wordpress

	### Variable default

	dbname = wordpress
	dbuser = wordpress
	dbpass = wordpress
	path = $path

# Function check user root
f_check_root () {
	if(( $EUID == 0)); then
		#if user is root, continue to function f_sub_main
		f_sub_main
	else
		#if user not root, print message and exit script
		echo "Please run this script by user root!"
		exit
	fi
}

# Function download Wordpress
f_download_wordpress () {
	yum install -y tar
	echo "Enter Wordpress version you want to install(3/4/5): "
	read version
	if [[ "$version" == '3' ]]; then

	wget -P $path/ https://wordpress.org/wordpress-3.9.30.tar.gz
	tar -zxvf $path/wordpress-3.9.30.tar.gz -C $path/
	rm -rf $path/wordpress-3.9.30.tar.gz

	elif [[ "$version" == '4' ]]; then

	wget -P $path/ https://wordpress.org/wordpress-4.9.13.tar.gz
	tar -zxvf $path/wordpress-4.9.13.tar.gz -C $path/
	rm -rf $path/wordpress-4.9.13.tar.gz
	elif [[ "$version"  == '5' ]]; then
	
	wget -P $path/ https://wordpress.org/wordpress-5.3.2.tar.gz
	tar -zxvf $path/wordpress-5.3.2.tar.gz -C $path/
	rm -rf $path/wordpress-5.3.2.tar.gz

	else

	echo "Script don't support this version!"
	fi
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
	f_create_database
	f_config_wp
	f_restart_service

	echo "You can access http://YOUR-SERVER-IP/wordpress to see your site Wordpress"
    sleep 1
}

# The main dunction
f_main () {
	f_check_root
}
f_main
exit
