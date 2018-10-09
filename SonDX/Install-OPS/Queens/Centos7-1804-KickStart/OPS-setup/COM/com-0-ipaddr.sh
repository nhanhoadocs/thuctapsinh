#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh
source com_num.sh

# Function config COMPUTE node
config_hostname () {
	echo "${HOST_COM[$COM_NUM]}" > /etc/hostname
	hostnamectl set-hostname ${HOST_COM[$COM_NUM]}

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
	rm -f ${COM_EXT_IF[$COM_NUM]}
	rm -f ${COM_MGNT_IF[$COM_NUM]}
	rm -f ${COM_DATAVM_IF[$COM_NUM]}
	touch /etc/sysconfig/network-scripts/ifcfg-${COM_EXT_IF[$COM_NUM]}
	touch /etc/sysconfig/network-scripts/ifcfg-${COM_MGNT_IF[$COM_NUM]}
	touch /etc/sysconfig/network-scripts/ifcfg-${COM_DATAVM_IF[$COM_NUM]}

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-${COM_EXT_IF[$COM_NUM]}
DEVICE=${COM_EXT_IF[$COM_NUM]}
BOOTPROTO=none
ONBOOT=yes
IPADDR=${COM_EXT_IP[$COM_NUM]}
NETMASK=${COM_EXT_NETMASK[$COM_NUM]}
DEFROUTE=no
EOF

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-${COM_MGNT_IF[$COM_NUM]}
DEVICE=${COM_MGNT_IF[$COM_NUM]}
BOOTPROTO=none
ONBOOT=yes
IPADDR=${COM_MGNT_IP[$COM_NUM]}
NETMASK=${COM_MGNT_NETMASK[$COM_NUM]}
GATEWAY=$GATEWAY_MGNT_IP
DNS1=8.8.8.8
DNS2=8.8.4.4
EOF

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-${COM_DATAVM_IF[$COM_NUM]}
DEVICE=${COM_DATAVM_IF[$COM_NUM]}
BOOTPROTO=none
ONBOOT=yes
IPADDR=${COM_DATAVM_IP[$COM_NUM]}
NETMASK=${COM_DATAVM_NETMASK[$COM_NUM]}
DEFROUTE=no
EOF

	ip a flush ${COM_EXT_IF[$COM_NUM]}
	ip a flush ${COM_MGNT_IF[$COM_NUM]}
	ip a flush ${COM_DATAVM_IF[$COM_NUM]}
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

# Config COMPUTE node
echocolor "Config COMPUTE node"
sleep 3
## Config hostname
config_hostname

## IP address
config_ip

## Config software of Centos
config_software
