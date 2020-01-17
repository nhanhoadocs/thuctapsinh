#!/bin/bash

##### Script Install LEMP

# Variable
set -e
OS=""
OS_VER=""

# Check OS
f_check_os () {
echo "Check Your OS"
if cat /etc/*release | grep CentOS > /dev/null 2>&1; then

    OS="CentOS"

    if [ $(rpm --eval '%{centos_ver}') == '6' ] ;then 
        OS_VER="CentOS6"; return 1
    elif [ $(rpm --eval '%{centos_ver}') == '7' ] ;then 
        OS_VER="CentOS7"; return 0
    elif [ $(rpm --eval '%{centos_ver}') == '8' ] ;then 
        OS_VER="CentOS8"; return 1
    fi 
elif cat /etc/*release | grep ^NAME | grep Ubuntu > /dev/null 2>&1; then

    OS="Ubuntu"

    if [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'trusty' ] ;then 
        OS_VER="Ubuntu14"; return 1
    elif [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'xenial' ] ;then 
        OS_VER="Ubuntu16"; return 1
    elif [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'bionic' ] ;then 
        OS_VER="Ubuntu18"; return 1
    fi 
else
	return 1
fi 
}

#Function check user root
f_check_root () {
	if(( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

# Check install nginx, mariadb, php
f_check_installed () {
echo "Check package installed"
if [[ $OS == "CentOS" && $OS_VER == "CentOS7" ]]; then 
    if rpm -qa | egrep "nginx|mariadb|php" > /dev/null 2>&1; then
       return 0
	else
		return 1
	fi
else echo "Coming soon..."; return 2
fi
}

#Function to disable SElinux
f_disable_selinux () {
	SE=`cat /etc/selinux/config | grep ^SELINUX= | awk -F'=' '{print$2}'`
	echo "Checking SElinux status..."
	echo ""
	sleep 1
	
	if [[ "$SE" == "enforcing" ]]; then
		sed -i 's|SELINUX=enforcing|SELINUX=disabled|g' /etc/selinux/config
		echo "SElinux is disabled"
	elif [[ "$SE" == "enable"  ]]; then
		sed -i 's|SELINUX=enable|SELINUX=disabled|g' /etc/selinux/config
		echo "SElinux is disabled"
	fi
}
	
#Update OS
f_update_os () {
	echo "Starting update OS..."
	sleep 1
	
	yum install epel-release -y
	yum update -y
	#yum upgrade -y
	
	echo ""
	sleep 1
}

#Install LEMP Stack
f_install_lemp () {
	########## INSTALL NGINX ##########
	echo "Installing Nginx..."
	sleep 1
	
	yum install -y nginx
	
	# Enable and start nginx service
	systemctl enable nginx
	systemctl start nginx
	
	# Failed to read PID from file /run/nginx.pid: Invalid argument
	printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
	systemctl daemon-reload
	systemctl restart nginx

	########## INSTALL MARIADB ##########
	echo "Installing MariaDB..."
	sleep 1
	
	yum install mariadb-server mariadb -y
	
	# Enable and start MariaDB service
	
	systemctl enable mariadb
	systemctl start mariadb
	
	########### INSTALL PHP ##########
	echo "Installing PHP..."
	sleep 1
	
	yum install -y wget

	wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm

	rpm -Uvh remi-release-7.rpm
	
	yum install yum-utils -y

	yum-config-manager --enable remi-php73

	yum --enablerepo=remi,remi-php73 install php-fpm php-common -y

	yum --enablerepo=remi,remi-php73 install php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml -y
	
	# Enable and start PHP service
	
	systemctl enable php-fpm
	systemctl start php-fpm
	
	# Restart Nginx
	
	systemctl restart nginx
}

# Cofig
f_config () {
	cat > /etc/nginx/conf.d/default.conf <<"EOF"
server {
    listen       80;
    server_name  your-server-ip;

    # note that these lines are originally from the "location /" block
    root   /usr/share/nginx/html;
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
        fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF
	sed -i "s/user = apache/user = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/group = apache/group = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/;listen.owner = nobody/listen.owner = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/;listen.group = nobody/listen.group = nginx/g" /etc/php-fpm.d/www.conf
	sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=1/g" /etc/php.ini
	chown -R root:nginx /var/lib/php
	echo "listen = /var/run/php-fpm/php-fpm.sock" >> /etc/php-fpm.d/www.conf

}

# Enable port 80,433
f_enable_port () {
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=443/tcp --permanent
	firewall-cmd --reload
}

# The sub main function, use to call neccessary functions of installation
f_sub_main () {
	if f_check_os; then
		if f_check_root; then
			if f_check_installed; then
				f_update_os
				f_disable_selinux
				f_install_lemp
				f_config
				f_enable_port
				echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
				echo "Install success"
				echo "Please run command to secure MariaDB: mysql_secure_installation"
				echo "You can access http://YOUR-SERVER-IP/info.php to see more informations about PHP"
			else
				echo "The LEMP is installed in the system. No thing to do."
			fi
		else
		echo "Please run this script as root premission"
		fi
	else
	echo "Sorry. This script does not support your operating system :("
	fi
}
f_sub_main
exit	

