#!/bin/bash

#Check user root
	if(( $EUID == 0)); then
		#if user is root, continue to function f_sub_main
		f_sub_main
	else
		#if user not root, print message and exit script
		echo "Please run this script by user root!"
		exit
	fi


#Function to disable SElinux
f_disable_selinux () {
	SE=`cat /etc/selinux/config | grep ^SELINUX= | awk -F'=' '{print$2}'`
	echo "Checking SElinux status..."
	echo ""
	sleep 1
	
	if [[ "$SE" == "enforcing" ]]; then
		sed -i 's|SELINUX=enforcing|SELINUX=disabled|g' /etc/selinux/config
		echo "SElinux is disabled"
	fi
}
	
#Funtion update OS
f_update_os () {
	echo "Starting update OS..."
	sleep 1
	
	dnf install epel-release -y
	dnf update -y
	dnf upgrade -y
	
	echo ""
	sleep 1
}

#Function install LEMP Stack
f_install_lemp () {
	########## INSTALL NGINX ##########
	echo "Installing Nginx..."
	sleep 1
	
	dnf install -y nginx
	
	# Enable and start nginx service
	systemctl enable nginx
	systemctl start nginx
	
	########## INSTALL MARIADB ##########
	echo "Installing MariaDB..."
	sleep 1
	
	dnf install mariadb-server -y
	
	# Enable and start MariaDB service
	
	systemctl enable mariadb
	systemctl start mariadb
	
	########### INSTALL PHP ##########
	echo "Installing PHP..."
	sleep 1
	
	dnf install php php-fpm php-mysqlnd -y
	
	# Enable and start PHP service
	
	systemctl enable php-fpm
	systemctl start php-fpm
	
	# Restart Nginx
	
	systemctl restart nginx
}

# Function enable port 80,433
f_enable_port () {
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=443/tcp --permanent
	firewall-cmd --reload
}

# The sub main function, use to call neccessary functions of installation
f_sub_main () {
    f_disable_selinux
    f_update_os
    f_install_lemp
    f_enable_port

    echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
    echo ""
    echo ""
    echo "Please run command to secure MariaDB: mysql_secure_installation"
    echo "You can access http://YOUR-SERVER-IP/info.php to see more informations about PHP"
    sleep 1
}


# The main function
f_main () {
    f_check_root
}
f_main

## Create Database

mysql -uroot -p<<MYSQL_SCRIPT
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'Thuctap@2019';
GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

## Install Wordpress

clear
echo "WordPress Install Script"
echo "Database Name: "
read dbname
echo "Database User: "
read dbuser
echo "Database Password: "
read dbpass
echo "run install? (y/n)"
read run
if [[ "$run" == "n" ]]; then
exit
else
echo "Installing WordPress..." 

#Install PHP extensions
dnf install -y php-opcache php-gd php-xml php-mbstring php-json

#Install Wordpress

	# download wordpress
	
	dnf -y install wget
	wget -P /usr/share/nginx/html https://wordpress.org/latest.tar.gz
	
	# unzip
	dnf install -y tar
	tar -zxvf /usr/share/nginx/html/latest.tar.gz -C /usr/share/nginx/html/
	
	# Clean up the unnecessary file
	
	rm /usr/share/nginx/html/latest.tar.gz
	
	# Find all of the directories and files in the defined path and update octal permissions.
	
	chown -R apache:apache /usr/share/nginx/html/wordpress
	find /usr/share/nginx/html/wordpress -type d -exec chmod 755 {} \;
	find /usr/share/nginx/html/wordpress -type f -exec chmod 644 {} \;


#Config

	cat > /etc/nginx/conf.d/www.thuyhiend.net.conf <<"EOF"
server {
   listen 80;
   server_name thuyhiend.net www.thuyhiend.net;

   # note that these lines are originally from the "location /" block
   root /usr/share/nginx/html/wordpress;
   index index.php index.html index.htm;

   location / {
      try_files $uri $uri/ =404;
   }
   error_page 404 /404.html;
   error_page 500 502 503 504 /50x.html;
   location = /50x.html {
      root /usr/share/nginx/html;
   }

   location ~ \.php$ {
      try_files $uri =404;
      fastcgi_pass unix:/var/run/php-fpm/www.sock;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      include fastcgi_params;
   }
}
EOF

	# create wp config 
	
	cp /usr/share/nginx/html/wordpress/wp-config-sample.php /usr/share/nginx/html/wordpress/wp-config.php
	chown nginx.nginx /usr/share/nginx/html/wordpress/wp-config.php
	
	# set database details with perl find and replace
	
	sed -i "s/database_name_here/$dbname/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/username_here/$dbuser/g" /usr/share/nginx/html/wordpress/wp-config.php
	sed -i "s/password_here/$dbpass/g" /usr/share/nginx/html/wordpress/wp-config.php

	sed -i "s/user = apache/user = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/group = apache/group = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/;listen.owner = nobody/listen.owner = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/;listen.group = nobody/listen.group = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/index index.html index.htm;/index index.php index.html index.htm;/g" /etc/nginx/nginx.conf.default
	
#Restart service
	
	systemctl restart mariadb
	systemctl restart nginx
	systemctl restart php-fpm

	echo "10.10.34.113 thuyhiend.net" >> /etc/hosts

fi

echo "wordpress has been successfully installed!"
echo "You can access http://YOUR-SERVER-IP/wordpress or thuyhiend.net to set up WordPress."

reboot