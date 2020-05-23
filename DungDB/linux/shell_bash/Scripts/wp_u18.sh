#!/bin/bash
# Script cai dat wordpress tren Ubuntu 18, LAMP
#Cai lamp

apache(){
    # cai dat apache 
    apt update -y
    apt install apache2 -y
    clear
    # bat dich vu apache 
    systemctl enable apache2
    systemctl start apache2
    # mo port cho dich vu apache
    ufw allow in "Apache Full"
}

mariadb(){
    # cai mariadb
    apt install -y mariadb-server
    clear
    # bat dich vu mariadb
    systemctl enable mariadb
    systemctl start mariadb
}

php(){
    # cai dat php7.2
    sudo apt install -y php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline
    clear
    # bat module va khoi dong lai apache
    a2enmod php7.2
    systemctl restart apache2
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
    #cai dat cac extension php can thiet
    apt update -y
    apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-mysql
    clear
    systemctl restart apache2

    #tai wordpress
    cd /tmp
    curl -O https://wordpress.org/latest.tar.gz
    # giai nen
    tar xzvf latest.tar.gz
    clear
}

cau_hinh_wp(){
    # Copy tat ca file trong thu muc wordpress den /var/www/html
    cp -Rvf /tmp/wordpress/* /var/www/html/
    #den thu muc /var/www/html/
    cd /var/www/html/
    # copy file config mac dinh
    cp wp-config-sample.php wp-config.php
    #sua file wp-config.php voi cac thong tin da nhap
    sed -i -e "s/database_name_here/$mariadb/g" wp-config.php
    sed -i -e "s/username_here/"$mariauser"/g" wp-config.php
    sed -i -e "s/password_here/"$mariapass"/g" wp-config.php
    #cap quyen so huu thu muc va phan quyen
    chown -R www-data:www-data /var/www/html/
    chmod -R 755 /var/www/html/*
    #xoa file index mac dinh cua apache
    rm -rf /var/www/html/index.html 
    # khoi dong lai apache
    systemctl restart apache2
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
echo “Da cai xong wordpress”