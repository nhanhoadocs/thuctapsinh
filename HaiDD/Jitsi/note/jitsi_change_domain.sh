#!/bin/bash

# Script change domain Jitsi

# Variable Color text
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
#------#

# Get old, new domain
OLD_DOMAIN=$(debconf-show jitsi-meet-web-config | grep jitsi-meet/jvb-hostname | awk -F" " '{print $NF}')

if [[ ! $# -eq 0 && $1 != $OLD_DOMAIN ]]
  then
        NEW_DOMAIN=$1
else
        echo "bash jitsi_change_domain.sh \$NEW_DOMAIN"
        echo -e "Ví dụ: ${GREEN}bash jitsi_change_domain.sh meeting.cloud365.vn${NOCOLOR}"
        exit 1
fi

#Stop all processes
systemctl stop nginx
systemctl stop jitsi-*
systemctl stop jicofo
prosodyctl stop
service jibri stop

# Nginx
nginx_enabled=/etc/nginx/sites-enabled/$OLD_DOMAIN.conf
nginx_avail=/etc/nginx/sites-available/$OLD_DOMAIN.conf

if [ -f "$nginx_enabled" ]; then
    rm -rf $nginx_enabled
else
	echo "Nginx config is not existed"
	exit 1
fi

if [ -f "$nginx_avail" ]; then
    sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" $nginx_avail
	mv $nginx_avail /etc/nginx/sites-available/$NEW_DOMAIN.conf
	ln -s /etc/nginx/sites-available/$NEW_DOMAIN.conf /etc/nginx/sites-enabled/$NEW_DOMAIN.conf
else
	echo "Nginx config is not existed"
	exit 1
fi

# If letsencrypt is installed
ssl_let=$(cat /etc/nginx/sites-available/$NEW_DOMAIN.conf | grep ssl_certificate_key | awk '{print $2}')
if [[ $ssl_let == *"/etc/letsencrypt"* ]]; then
	sed -Ei "s|ssl_certificate \/etc\/letsencrypt\/live\/$NEW_DOMAIN\/fullchain.pem\;|ssl_certificate /etc/jitsi/meet/$NEW_DOMAIN.crt\;|g" /etc/nginx/sites-available/$NEW_DOMAIN.conf
	sed -Ei "s|ssl_certificate_key \/etc\/letsencrypt\/live\/$NEW_DOMAIN\/privkey.pem\;|ssl_certificate_key \/etc\/jitsi\/meet\/$NEW_DOMAIN.key\;|g" /etc/nginx/sites-available/$NEW_DOMAIN.conf
fi

# Jitsi
sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/jicofo/config
sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/jicofo/sip-communicator.properties

sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/meet/$OLD_DOMAIN-config.js
mv /etc/jitsi/meet/$OLD_DOMAIN-config.js /etc/jitsi/meet/$NEW_DOMAIN-config.js

mv /etc/jitsi/meet/$OLD_DOMAIN.crt /etc/jitsi/meet/$NEW_DOMAIN.crt
mv /etc/jitsi/meet/$OLD_DOMAIN.key /etc/jitsi/meet/$NEW_DOMAIN.key

sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/videobridge/config
sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/videobridge/sip-communicator.properties

# Jibri
sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/jitsi/jibri/config.json


# Prosody
rm -rf /etc/prosody/certs/$OLD_DOMAIN.crt
rm -rf /etc/prosody/certs/$OLD_DOMAIN.key
rm -rf /etc/prosody/certs/auth.$OLD_DOMAIN.crt
rm -rf /etc/prosody/certs/auth.$OLD_DOMAIN.key
rm -rf /etc/prosody/conf.d/$OLD_DOMAIN.cfg.lua

sed -Ei "s|$OLD_DOMAIN|$NEW_DOMAIN|g" /etc/prosody/conf.avail/$OLD_DOMAIN.cfg.lua

mv /etc/prosody/conf.avail/$OLD_DOMAIN.cfg.lua /etc/prosody/conf.avail/$NEW_DOMAIN.cfg.lua
ln -s /etc/prosody/conf.avail/$NEW_DOMAIN.cfg.lua /etc/prosody/conf.d/$NEW_DOMAIN.cfg.lua

prosodyctl cert generate $NEW_DOMAIN <<EOF







EOF

prosodyctl cert generate auth.$NEW_DOMAIN <<EOF







EOF


rm -rf /var/lib/prosody/$OLD_DOMAIN.cnf
rm -rf /var/lib/prosody/$OLD_DOMAIN.crt
rm -rf /var/lib/prosody/$OLD_DOMAIN.key
rm -rf /var/lib/prosody/auth.$OLD_DOMAIN.cnf
rm -rf /var/lib/prosody/auth.$OLD_DOMAIN.crt
rm -rf /var/lib/prosody/auth.$OLD_DOMAIN.key

ln -s /var/lib/prosody/$NEW_DOMAIN.crt /etc/prosody/certs/$NEW_DOMAIN.crt
ln -s /var/lib/prosody/$NEW_DOMAIN.key /etc/prosody/certs/$NEW_DOMAIN.key
ln -s /var/lib/prosody/auth.$NEW_DOMAIN.crt /etc/prosody/certs/auth.$NEW_DOMAIN.crt
ln -s /var/lib/prosody/auth.$NEW_DOMAIN.key /etc/prosody/certs/auth.$NEW_DOMAIN.key

ln -s /var/lib/prosody/auth.$NEW_DOMAIN.crt /usr/local/share/ca-certificates/auth.$NEW_DOMAIN.crt

rm -rf /usr/local/share/ca-certificates/auth.$OLD_DOMAIN.crt

F_OLD_DOMAIN=$(echo $OLD_DOMAIN | sed 's|\.|\%2e|g')
F_NEW_DOMAIN=$(echo $NEW_DOMAIN | sed 's|\.|\%2e|g')

mv /var/lib/prosody/$F_OLD_DOMAIN /var/lib/prosody/$F_NEW_DOMAIN
mv /var/lib/prosody/auth%2e$F_OLD_DOMAIN /var/lib/prosody/auth%2e$F_NEW_DOMAIN
mv /var/lib/prosody/recorder%2e$F_OLD_DOMAIN /var/lib/prosody/recorder%2e$F_NEW_DOMAIN

update-ca-certificates -f
echo "jitsi-videobridge jitsi-videobridge/jvb-hostname string $NEW_DOMAIN" | debconf-set-selections
echo "jitsi-meet jitsi-meet/jvb-hostname string $NEW_DOMAIN" | debconf-set-selections


# Start service
systemctl start nginx
prosodyctl start
systemctl start jitsi-*
systemctl start jicofo
service jibri start
systemctl restart jitsi-videobridge
systemctl restart jitsi-videobridge2