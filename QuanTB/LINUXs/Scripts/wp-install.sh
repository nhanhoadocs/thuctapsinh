#!/bin/sh

# Default value
domain=localhost
dbhost=localhost
dbname=wordpress
dbuser=wordpress
dbpass=randompwd
install_path=/var/www/$domain/

# Help
show_help(){
    echo "
    -h  --help              show this help
    -d  --domain            domain name of site (default: localhost)
    -dh --dbhost            database host (default: localhost)
    -n  --dbname            database name (default: wordpress)
    -u  --dbuser            database user (default: wordpress)
    -p  --dbpass            database password (default: random)
    -ip --install_path      path to install wordpress (default: /var/www/domain)
    "
}

# Install php
install_php(){
    apt-get install -y php php-mysql
}

#Install mysql
install_mysql(){
    apt-get install -y mysql-server
    systemctl enable mysql
    systemctl start mysql
}

#Install apache
install_apache(){
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
    
    ufw allow http
    ufw allow https
    ufw reload
}

# Create virtual host for wordpress site
config_virtualhost(){
    echo "
<VirtualHost *:80>
    ServerName ${domain}
    ServerAlias www.${domain}
    ServerAdmin admin@${domain}
    DocumentRoot ${install_path}

    <Directory ${install_path}>
        Allowoverride all
    </Directory>

    ErrorLog    ${install_path}error.log
    CustomLog   ${install_path}access.log combined
</VirtualHost>"  > /etc/apache2/sites-available/${domain}.conf
}

# Create database and user
config_database(){
    mysql -u root -e "CREATE DATABASE $dbname"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@localhost IDENTIFIED BY '$dbpass'"
}

# Configure wordpress
config_wordpress(){
    cd /tmp
    wget http://wordpress.org/latest.tar.gz -O wordpress.tar.gz
    tar -zxvf wordpress.tar.gz

    cp wordpress/wp-config-sample.php wordpress/wp-config.php
    sed -i "s/database_name_here/$dbname/g" wordpress/wp-config.php
    sed -i "s/username_here/$dbuser/g" wordpress/wp-config.php
    sed -i "s/password_here/$dbpass/g" wordpress/wp-config.php
    sed -i "s/localhost/$dbhost/g" wordpress/wp-config.php

    mkdir wordpress/wp-content/uploads
    chmod 775 wordpress/wp-content/uploads

    if [ ! -d $install_path ]; then
        mkdir $install_path
    fi
    mv wordpress/* $install_path
    chown -R www-data:www-data $install_path
}

# install wordpress
install_wordpress(){
    install_php
    install_mysql
    install_apache

    config_wordpress
    config_database

    config_virtualhost
    a2ensite $domain
    systemctl reload apache2
}


while :; do
    case $1 in
        -h|-\?|--help)
            show_help
            exit ;;
        
        -d|--domain)
            if [ '$2' ]; then
                domain=$2; install_path=/var/www/$domain/; shift
            else
                die 'ERROR: "--domain" requires a non-empty option argument.'
            fi ;;
        --domain=?*)
            domain=${1#*=} ;;
        --domain=)
            die 'ERROR: "--domain" requires a non-empty option argument.' ;;
        
        -dh|--dbhost)
            if [ '$2' ]; then
                dbhost=$2; shift
            else
                die 'ERROR: "--dbhost" requires a non-empty option argument.'
            fi ;;
        --dbhost=?*)
            dbhost=${1#*=} ;;
        --dbhost=)
            die 'ERROR: "--dbhost" requires a non-empty option argument.' ;;
        
        -n|--dbname)
            if [ '$2' ]; then
                dbname=$2; shift
            else
                die 'ERROR: "--dbname" requires a non-empty option argument.'
            fi ;;
        --dbname=?*)
            dbname=${1#*=} ;;
        --dbname=)
            die 'ERROR: "--dbname" requires a non-empty option argument.' ;;

        -u|--dbuser)
            if [ '$2' ]; then
                dbuser=$2s; shift
            else
                die 'ERROR: "--dbuser" requires a non-empty option argument.'
            fi ;;
        --dbuser=?*)
            dbuser=${1#*=} ;;
        --dbuser=)
            die 'ERROR: "--dbuser" requires a non-empty option argument.' ;;
        
        -p|--dbpass)
            if [ '$2' ]; then
                dbpass=$2; shift
            else
                die 'ERROR: "--dbpass" requires a non-empty option argument.'
            fi ;;
        --dbpass=?*)
            dbpass=${1#*=} ;;
        --dbpass=)
            die 'ERROR: "--dbpass" requires a non-empty option argument.' ;;

        -ip|--install_path)
            if [ '$2' ]; then
                install_path=$2; shift
            else
                die 'ERROR: "--install_path" requires a non-empty option argument.'
            fi ;;
        --install_path=?*)
            install_path=${1#*=} ;;
        --install_path=)
            die 'ERROR: "--install_path" requires a non-empty option argument.' ;;
        *)
            break ;;
    esac
    shift
done

install_wordpress
