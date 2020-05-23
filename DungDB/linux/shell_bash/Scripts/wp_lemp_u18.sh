#!/bin/bash

cai_nginx(){
    apt update
    apt -y install nginx
    ufw allow 'Nginx HTTP'
}

cai_mariadb(){
    apt-get -y remove mariadb-server
    apt -y install mariadb-server
    systemctl enable mariadb
    systemctl start mariadb
}

cai_php(){
    apt -y install php-fpm php-mysql
}

cau_hinh_domain(){
echo -n "Nhap domain hoac IP cua ban: "
read domain
#them cau hinh domain    
cat << EOF >>/etc/nginx/sites-available/$domain
server {
    listen 80;
    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name $domain;

    location / {
            try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
            deny all;
    }
}
EOF
#tao lien ket tu cau hinh server o tren
ln -s /etc/nginx/sites-available/dung.xyz /etc/nginx/sites-enabled/
#huy lien ket mac dinh
unlink /etc/nginx/sites-enabled/default
systemctl reload nginx
}

clear
cai_nginx
clear
cai_mariadb
clear
cai_php
clear
cau_hinh_domain