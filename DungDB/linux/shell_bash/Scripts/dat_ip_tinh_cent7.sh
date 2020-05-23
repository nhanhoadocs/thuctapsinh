#!/bin/bash
if [ $# -eq 5 ] 
then

nmcli con mod $1 ipv4.addresses $2/$3

nmcli con mod $1 ipv4.gateway $4

nmcli con mod $1 ipv4.method manual

nmcli con mod $1 ipv4.dns “$5”

nmcli con up $1

ip addr show $1

else

echo "Cach dung: Nhap <interface> <IP> <prefix> <gateway> <dns>"

echo "Vi du: ./ip.sh eth0 192.168.10.21 24 192.168.10.2 8.8.8.8"
fi
