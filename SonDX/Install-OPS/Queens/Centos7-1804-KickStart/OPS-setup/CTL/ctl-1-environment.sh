#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh

# Function update and upgrade for CONTROLLER
update_upgrade () {
	echocolor "Update controller"
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

	sed -i 's/server 0.centos.pool.ntp.org iburst/ \
server 0.asia.pool.ntp.org iburst \
server 1.asia.pool.ntp.org iburst/g' $ntpfile

	sed -i 's/server 1.centos.pool.ntp.org iburst//g' $ntpfile
	sed -i 's/server 2.centos.pool.ntp.org iburst//g' $ntpfile
	sed -i 's/server 3.centos.pool.ntp.org iburst//g' $ntpfile
	sed -i 's|#allow 192.168.0.0/16|'"allow $CIDR_MGNT"'|g' $ntpfile

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

# Function install mysql
install_sql () {
	echocolor "Install SQL database - Mariadb"
	sleep 3

	yum install mariadb mariadb-server python2-PyMySQL  -y

	sqlfile=/etc/my.cnf.d/openstack.cnf
	touch $sqlfile
	cat << EOF >$sqlfile
[mysqld]
bind-address = $CTL_MGNT_IP
default-storage-engine = innodb
innodb_file_per_table = on
max_connections = 4096
collation-server = utf8_general_ci
character-set-server = utf8
EOF

	systemctl enable mariadb.service
	systemctl start mariadb.service
}

# Function install message queue
install_mq () {
	echocolor "Install Message queue (rabbitmq)"
	sleep 3

	yum install rabbitmq-server -y
	systemctl enable rabbitmq-server.service
	systemctl start rabbitmq-server.service
	
	rabbitmqctl add_user openstack $RABBIT_PASS
	rabbitmqctl set_permissions openstack ".*" ".*" ".*"
}

# Function install Memcached
install_memcached () {
	echocolor "Install Memcached"
	sleep 3

	yum install memcached python-memcached -y
	memcachefile=/etc/sysconfig/memcached 
	sed -i 's|-l 127.0.0.1,::1|'"-l 127.0.0.1,::1,$HOST_CTL"'|g' $memcachefile

	systemctl enable memcached.service
	systemctl start memcached.service
} 


#######################
###Execute functions###
#######################

# Update and upgrade for CONTROLLER
update_upgrade

# Install crudini
install_crudini

# Install and config NTP
install_ntp

# Install OpenStack packages (python-openstackclient)
install_ops_packages

# Install SQL database (Mariadb)
install_sql

# Install Message queue (rabbitmq)
install_mq

# Install Memcached
install_memcached
