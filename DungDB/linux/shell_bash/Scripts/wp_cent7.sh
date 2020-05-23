#!/bin/bash
# Script cai dat wordpress tren Centos 7, LAMP
# cai lamp
apache(){
    #update
    yum -y update
    yum -y upgrade
    clear
    # cai dat Apache
    yum -y install httpd
    clear
    # khoi dong apache
    systemctl start httpd
    systemctl enable httpd
}

mariadb(){
    # cai dat mariadb
    yum -y update
    yum -y install mariadb mariadb-server
    clear
    # khoi dong mariadb
    systemctl start mariadb
    systemctl enable mariadb
}

php(){
    # cai dat repo php
    yum install -y epel-release yum-utils
    yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    clear
    # cai dat php
    yum-config-manager --enable remi-php74
    yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
    clear
    #khoi dong lai apache
    systemctl restart httpd
}

#tao database va user cho wordpress
DIRECTORY=$(cd `dirname $0` && pwd)
create_database(){
    echo -n "MariaDB Host (localhost): "
    read mariahost
    if [ "$mariahost" = "" ]
    then
	mariahost="localhost"
    fi
    echo -n "Nhap ten DB: "
    read mariadb

    echo -n "Nhap ten user quan ly DB: "
    read mariauser

    echo -n "Nhap password cho user: "
    read mariapass

mysql -u root <<EOF
CREATE DATABASE $mariadb;
CREATE USER $mariauser@$mariahost IDENTIFIED BY '$mariapass';
GRANT ALL PRIVILEGES ON $mariadb.* TO $mariauser IDENTIFIED BY '$mariapass';
FLUSH PRIVILEGES;
exit
EOF
}

tai_wp(){
    #cai goi ho tro php-gd
    yum -y install php-gd php-mysql
    clear
    #download wordpress
    yum -y install wget
    wget https://wordpress.org/latest.tar.gz
    #unzip wordpress
    cd /tmp
    tar -zxvf latest.tar.gz
    clear
}

cau_hinh_wp(){
    # copy cac file trong thu muc wordpress toi duong dan /var/www/html
    cp -Rvf /tmp/wordpress/* /var/www/html
    #den thu muc /var/www/html/
    cd /var/www/html
    #copy file wp-config.php
    cp wp-config-sample.php wp-config.php
    #sua file wp-config.php voi cac thong tin da nhap
    sed -i -e "s/database_name_here/$mariadb/g" wp-config.php
    sed -i -e "s/username_here/"$mariauser"/g" wp-config.php
    sed -i -e "s/password_here/"$mariapass"/g" wp-config.php
    # phan quyen
    chown -R apache:apache /var/www/html/*
    chmod -R 755 /var/www/html/*
}

mo_port(){
    # mo port cho dich vu web
    systemctl retart firewalld
    firewall-cmd --permanent --add-port=80/tcp      # mo port http
    firewall-cmd --permanent --add-port=443/tcp     # mo port https
    firewall-cmd --reload
    clear
}

clear
printf "Cai dat LAMP\n"
apache
mariadb
php
clear
printf "Cai dat Wordpress\n"
create_database
tai_wp
cau_hinh_wp
mo_port

printf "Da cai xong Wordpress \n"
