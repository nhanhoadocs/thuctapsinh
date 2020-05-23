#!/bin/bash

# SCRIPT INSTALL WORDPRESS WITH LAMP ON CENTOS-7

# Variable
# set -e; 
OS=""
mysqlRootPass="thuctap@2020"

# Variable Color text
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#-----------------------------------------------------------------------------#


# Check OS
f_check_os(){
    echo "Checking your OS..."
    if cat /etc/*release | grep CentOS > /dev/null 2>&1; then {
        OS="CentOS_"
        if [ $(rpm --eval '%{centos_ver}') == 7 ]; then {
            OS="${OS}7";
            echo $OS
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

# Install support packet
f_install_support(){
	yum install -y epel-release yum-utils
}

# Install Apache
f_install_apache(){
	yum -y install httpd
	systemctl start httpd
	sleep 2
	systemctl enable httpd
}

# Install MariaDB
f_install_MariaDB(){
	# install mariadb
    yum -y install mariadb mariadb-server
    systemctl start mariadb
	echo -e "\ny\n$mysqlRootPass\n$mysqlRootPass\ny\ny\ny\ny\ny\n" |mysql_secure_installation --stdin
	systemctl enable mariadb
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
	yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
	yum-config-manager --enable remi-php74
	yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-xml
	
	systemctl restart httpd
}

# Install Wordpress
f_install_wordpress(){
	yum -y install wget
	cd /root
	wget https://wordpress.org/latest.tar.gz
	tar xvfz latest.tar.gz
	cp -Rvf /root/wordpress/* /var/www/html
	rm -f latest.tar.gz
	rm -rf wordpress/
	
	clear
	
	# Config file wordpress
	cd /var/www/html
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i -e "s/database_name_here/"$mariadb"/g" /var/www/html/wp-config.php
    sed -i -e "s/username_here/"$mariauser"/g" /var/www/html/wp-config.php
    sed -i -e "s/password_here/"$mariapass"/g" /var/www/html/wp-config.php
	chown -R apache:apache /var/www/html/*
	chmod -R 755 /var/www/html/*
	clear
}

# Config Firewall
f_config_firewall(){
	firewall-cmd --permanent --add-port=80/tcp
	firewall-cmd --permanent --add-port=443/tcp
	firewall-cmd --reload
}


################################################
#                  MAIN SCRIPT                 #
################################################

main(){
	clear
	echo -e "${GREEN}##############################################################${NOCOLOR}"
	echo -e "${GREEN}#                                                            #${NOCOLOR}"
	echo -e "${GREEN}#      SCRIPT INSTALL WORDPRESS ON CENTOS-7 BY DANGDOHAI     #${NOCOLOR}"
	echo -e "${GREEN}#                                                            #${NOCOLOR}"
	echo -e "${GREEN}##############################################################${NOCOLOR}"

	sleep 5


	if f_check_os; then {
		if f_check_root; then {
			clear
			
			echo -e "${GREEN}CAI DAT CAC GOI HO TRO....${NOCOLOR}"
			echo -e "\n"
			f_install_support
			clear
			
			echo -e "${GREEN}_______________CAI DAT APACHE_______________${NOCOLOR}"
			echo -e "\n"
			f_install_apache
			echo -e "${GREEN}CAI DAT APACHE THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT MARIADB_______________${NOCOLOR}"
			echo -e "\n"
			f_install_MariaDB
			echo -e "${GREEN}CAI DAT MARIADB THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________TAO DATABASE VA USER CHO WORDPRESS_______________${NOCOLOR}"
			echo -e "\n"
			f_create_db_user
			echo -e "${GREEN}DATABASE VA USER DA DUOC TAO THANH CONG !!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT PHP 7.4_______________${NOCOLOR}"
			echo -e "\n"
			f_install_PHP
			echo -e "${GREEN}CAI DAT PHP 7.4 THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}_______________CAI DAT WORDPRESS_______________${NOCOLOR}"
			echo -e "\n"
			f_install_wordpress
			echo -e "${GREEN}CAI DAT WORDPRESS THANH CONG!!!${NOCOLOR}"
			sleep 1
			clear
			
			echo -e "${GREEN}CAU HINH FIREWALL${NOCOLOR}"
			f_config_firewall
	
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