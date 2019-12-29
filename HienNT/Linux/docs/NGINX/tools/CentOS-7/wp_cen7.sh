#!/bin/bash

##### Script Install Wordpress

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

# Install Wordpress

	wget -P /usr/share/nginx/html/ https://wordpress.org/latest.tar.gz
	
# Unzip
	
	yum install -y tar
	tar -zxvf /usr/share/nginx/html/latest.tar.gz -C /usr/share/nginx/html/

# Clean up the unnecessary file

	rm -rf /usr/share/nginx/html/latest.tar.gz
	
# Find all of the directories and files in the defined path and update octal permissions.

	chown -R nginx:nginx /usr/share/nginx/html/wordpress
	find /usr/share/nginx/html/wordpress -type d -exec chmod 755 {} \;
	find /usr/share/nginx/html/wordpress -type f -exec chmod 644 {} \;
	
# Create wp config

	cp /usr/share/nginx/html/wordpress/wp-config-sample.php /usr/share/nginx/html/wordpress/wp-config.php
	chown nginx:nginx /usr/share/nginx/html/wordpress/wp-config.php
	
# Set database details with perl find and replace

	sed -i "s/database_name_here/$dbname/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/username_here/$dbuser/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/password_here/$dbpass/g" /usr/share/nginx/html/wordpress/wp-config.php
	echo "listen = /var/run/php-fpm/php-fpm.sock" >> /etc/php-fpm.d/www.conf
	
# Restart service

	systemctl restart mariadb
	systemctl restart nginx
	systemctl restart php-fpm
fi