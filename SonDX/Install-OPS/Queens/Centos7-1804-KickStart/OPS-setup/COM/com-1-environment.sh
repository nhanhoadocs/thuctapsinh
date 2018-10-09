#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh
source com_num.sh

# Function update and upgrade for COMPUTE
update_upgrade () {
	echocolor "Update COMPUTE"
	sleep 3
	yum update -y
}

# Function install crudini
install_crudini () {
	echocolor "Install crudini"
	sleep 3
	yum install epel-release -y
	yum install crudini -y
	
	ops_add /etc/yum.repos.d/epel.repo epel enabled 0
	yum update -y
	yum repolist
}

# Function install and config NTP
install_ntp () {
	echocolor "Install NTP"
	sleep 3

	yum install chrony -y
	ntpfile=/etc/chrony.conf

	sed -i 's/server 0.centos.pool.ntp.org iburst/'"server $HOST_CTL iburst"'/g' $ntpfile

	sed -i 's/server 1.centos.pool.ntp.org iburst//g' $ntpfile
	sed -i 's/server 2.centos.pool.ntp.org iburst//g' $ntpfile
	sed -i 's/server 3.centos.pool.ntp.org iburst//g' $ntpfile

	systemctl enable chronyd.service
	systemctl start chronyd.service
}

# Function install OpenStack packages (python-openstackclient)
install_ops_packages () {
	echocolor "Install OpenStack client"
	sleep 3
	yum install centos-release-openstack-queens -y

	yum install python-openstackclient -y
	yum install openstack-selinux -y
}

#######################
###Execute functions###
#######################

# Update and upgrade for COMPUTE
update_upgrade

# Install crudini
install_crudini

# Install and config NTP
install_ntp

# Install OpenStack packages (python-openstackclient)
install_ops_packages
