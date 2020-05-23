#!/bin/bash

if [ $# -eq 7 ]
then

echo ""
echo "Back up file cau hinh IP hien tai"
echo ""

cp /etc/network/interfaces /etc/network/interfaces.backup

cat <<EOF > /etc/network/interfaces

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto $1
iface $1 inet static
address $2
netmask $3
gateway $4
network $5
broadcast $6
dns-nameservers $7
EOF


echo "Khoi dong lai dich vu mang"

service networking restart


else

echo "Cach dung: Nhap <interface> <IP> <netmask> <gateway> <network> <broadcast> <dns>"

echo "Vi du: ./ip.sh eth0 192.168.10.21 255.255.255.0 192.168.10.2 192.168.10.0 192.168.10.255 8.8.8.8"


fi
