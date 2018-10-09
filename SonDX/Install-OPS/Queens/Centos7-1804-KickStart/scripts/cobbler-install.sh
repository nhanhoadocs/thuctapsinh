#!/bin/bash
#Author Son Do Xuan

echo "Install and config Cobbler on Centos7"

# Environment variable
echo "Setup environment variable"

IF_NAME=eth0   # interface name of Cobbler server
IP_COBBLER=172.16.69.21   #ip address of Cobbler server
SUBNET=172.16.69.0
SUBNET_MASK=255.255.255.0
IP_DHCP_START=172.16.69.100
IP_DHCP_END=172.16.69.200
GATEWAY=172.16.69.1
DNS=8.8.8.8
pass_encrypt=cobbler


# Install and config Cobbler
echo "Install and config Cobbler"

## Install packages
yum update -y
yum install epel-release -y
yum install cobbler cobbler-web dnsmasq syslinux xinetd bind bind-utils dhcp debmirror pykickstart fence-agents-all -y

## Start and enable services
systemctl start cobblerd
systemctl enable cobblerd
systemctl start httpd
systemctl enable httpd

## Disable SELinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

## Config firewall
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --add-service=dhcp --permanent
firewall-cmd --add-port=69/tcp --permanent
firewall-cmd --add-port=69/udp --permanent
firewall-cmd --add-port=4011/udp --permanent
firewall-cmd --reload

## Config Cobbler
cobblerfile=/etc/cobbler/settings
cobblerfilebak=/etc/cobbler/settings.bak
cp $cobblerfile $cobblerfilebak

pass=`openssl passwd -1 $pass_encrypt`
sed -i 's|^default_password_crypted.*|'"default_password_crypted: \"$pass\""'|g' $cobblerfile
sed -i 's/manage_dhcp: 0/manage_dhcp: 1/g' $cobblerfile
sed -i 's/manage_dns: 0/manage_dns: 1/g' $cobblerfile
sed -i 's/pxe_just_once: 0/pxe_just_once: 1/g' $cobblerfile
sed -i 's|next_server: 127.0.0.1|'"next_server: $IP_COBBLER"'|g' $cobblerfile
sed -i 's|server: 127.0.0.1|'"server: $IP_COBBLER"'|g' $cobblerfile

## Config DHCP and DNSMASQ
dhcpfile=/etc/cobbler/dhcp.template
dhcpfilebak=/etc/cobbler/dhcp.template.bak
cp $dhcpfile $dhcpfilebak

echo "DHCPDARGS=$IF_NAME" >> /etc/sysconfig/dhcpd
sed -i 's|subnet 192.168.1.0 netmask 255.255.255.0 {|'"subnet $SUBNET netmask $SUBNET_MASK {"'|g' $dhcpfile
sed -i 's|192.168.1.5;|'"$GATEWAY;"'|g' $dhcpfile
sed -i 's|192.168.1.1;|'"$DNS;"'|g' $dhcpfile
sed -i 's|255.255.255.0;|'"$SUBNET_MASK;"'|g' $dhcpfile
sed -i 's|192.168.1.100 192.168.1.254;|'"$IP_DHCP_START $IP_DHCP_END;"'|g' $dhcpfile

dnsmasq=/etc/cobbler/dnsmasq.template
dnsmasqbak=/etc/cobbler/dnsmasq.template.bak
cp $dnsmasq $dnsmasqbak

sed -i 's|^dhcp-range.*|'"dhcp-range=$IP_DHCP_START $IP_DHCP_END"'|g' $dnsmasq

## Config xinetd
sed -i 's|disable.*|'"disable                 = no"'|g' /etc/xinetd.d/tftp

## Config to support distro debian
sed -i 's|@dists="sid";|#@dists="sid";|g' /etc/debmirror.conf
sed -i 's|@arches="i386";|#@arches="i386";|g' /etc/debmirror.conf

## Restart and enable services, then sync cobbler
systemctl enable rsyncd.service
systemctl restart rsyncd.service
systemctl restart cobblerd
systemctl restart xinetd
systemctl enable xinetd

cobbler get-loaders
cobbler check
cobbler sync   # This command also restart dhcpd
systemctl enable dhcpd

# Finally
echo "Finally"