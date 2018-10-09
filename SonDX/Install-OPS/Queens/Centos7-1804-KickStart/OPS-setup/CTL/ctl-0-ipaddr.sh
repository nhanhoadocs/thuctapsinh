#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh

# Function config hostname
config_hostname () {
	echo "$HOST_CTL" > /etc/hostname
	hostnamectl set-hostname $HOST_CTL

	cat << EOF >/etc/hosts
127.0.0.1	localhost

$CTL_MGNT_IP	$HOST_CTL
EOF

	for (( i=1; i <= ${#HOST_COM[*]}; i++ ))
	do
		echo "${COM_MGNT_IP[$i]}	${HOST_COM[$i]}" >> /etc/hosts
	done
	
	for (( i=1; i <= ${#HOST_BLK[*]}; i++ ))
	do
		echo "${BLK_MGNT_IP[$i]}	${HOST_BLK[$i]}" >> /etc/hosts
	done
}

# Function IP address
config_ip () {
	rm -f $CTL_EXT_IF
	rm -f $CTL_MGNT_IF
	rm -f $CTL_DATAVM_IF
	touch /etc/sysconfig/network-scripts/ifcfg-$CTL_EXT_IF
	touch /etc/sysconfig/network-scripts/ifcfg-$CTL_MGNT_IF
	touch /etc/sysconfig/network-scripts/ifcfg-$CTL_DATAVM_IF

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$CTL_EXT_IF
DEVICE=$CTL_EXT_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$CTL_EXT_IP
NETMASK=$CTL_EXT_NETMASK
DEFROUTE=no
EOF

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$CTL_MGNT_IF
DEVICE=$CTL_MGNT_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$CTL_MGNT_IP
NETMASK=$CTL_MGNT_NETMASK
GATEWAY=$GATEWAY_MGNT_IP
DNS1=8.8.8.8
DNS2=8.8.4.4
EOF

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$CTL_DATAVM_IF
DEVICE=$CTL_DATAVM_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$CTL_DATAVM_IP
NETMASK=$CTL_DATAVM_NETMASK
DEFROUTE=no
EOF

	ip a flush $CTL_EXT_IF
	ip a flush $CTL_MGNT_IF
	ip a flush $CTL_DATAVM_IF
	systemctl restart network
}

# Function config software of Centos
config_software () {
	systemctl stop firewalld
	systemctl disable firewalld
}

#######################
###Execute functions###
#######################

# Config CONTROLLER node
echocolor "Config CONTROLLER node"
sleep 3

## Config hostname
config_hostname

## IP address
config_ip

## Config software of Centos
config_software
