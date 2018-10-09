#!/bin/bash
#Author Son Do Xuan

echo "###Install and config APT-CACHER-NG on Ubuntu 16.04###"

# Environment variable
echo "###Setup environment variable###"

IP_APT_CACHER_NG=10.10.10.152
PORT=3142

# Install and config APT-CACHER-NG
echo "###Install and config APT-CACHER-NG###"

## Install packages
apt update -y
apt install curl -y
apt-get install apt-cacher-ng -y

## Config /etc/apt-cacher-ng/acng.conf
aptcacherngfile=/etc/apt-cacher-ng/acng.conf 
aptcacherngfilebak=/etc/apt-cacher-ng/acng.conf.bak
cp $aptcacherngfile $aptcacherngfilebak

sed -i 's/^# BindAddress:.*/BindAddress: 0.0.0.0/g' $aptcacherngfile
sed -i 's|^# Port:3142|'"Port:$PORT"'|g' $aptcacherngfile
sed -i 's/^# VerboseLog: 1/VerboseLog: 1/g' $aptcacherngfile
sed -i 's|^# PidFile:.*|PidFile: /var/run/apt-cacher-ng|g' $aptcacherngfile

echo -e "VfilePatternEx: ^/\?release=[0-9]+&arch=" >> $aptcacherngfile
echo -e "VfilePatternEx: ^(/\?release=[0-9]+&arch=.*|.*/RPM-GPG-KEY-examplevendor)$" >> $aptcacherngfile

sed -i 's|^Remap-gentoo:.*|Remap-gentoo: file:gentoo_mirrors.gz /gentoo ; file:backends_gentoo # Gentoo Archives\
Remap-centos: file:centos_mirrors /centos|g' $aptcacherngfile
curl https://www.centos.org/download/full-mirrorlist.csv | sed 's/^.*"http:/http:/' | sed 's/".*$//' | grep ^http >/etc/apt-cacher-ng/centos_mirrors

sed -i 's|^# PassThroughPattern: ^bugs.*|# PassThroughPattern: ^bugs.debian.org:443$\
PassThroughPattern: .*|g' $aptcacherngfile

systemctl restart apt-cacher-ng

# Finally
echo "###Finally###"
echo "###Access link: http://$IP_APT_CACHER_NG:$PORT/###"
