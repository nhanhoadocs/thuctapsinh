#!/bin/bash
#
##### Script Install Graylog server
#
# Variable
set -e; OS=""
#
# Check OS
f_check_os () {
    echo "Checking Your OS ..."
    if cat /etc/*release | grep CentOS > /dev/null 2>&1; then
        OS="CentOS_"

        if [ $(rpm --eval '%{centos_ver}') == '6' ] ;then 
            OS="${OS}6"; return 1
        elif [ $(rpm --eval '%{centos_ver}') == '7' ] ;then 
            OS="${OS}7"; return 0
        elif [ $(rpm --eval '%{centos_ver}') == '8' ] ;then 
            OS="${OS}8"; return 1
        fi
    elif cat /etc/*release | grep ^NAME | grep Ubuntu > /dev/null 2>&1; then
        OS="Ubuntu_"

        if [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'trusty' ] ;then 
            OS="${OS}14"; return 1
        elif [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'xenial' ] ;then 
            OS="${OS}16"; return 1
        elif [ $(lsb_release -c | grep Codename | awk '{print $2}') == 'bionic' ] ;then 
            OS="${OS}18"; return 1
        fi 
    else
        return 1
    fi
}

#Function check user root
f_check_root () {
	if(( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

#Function to disable SElinux
f_disable_selinux () {
	SE=`cat /etc/selinux/config | grep ^SELINUX= | awk -F'=' '{print$2}'`
	echo "Checking SElinux status..."
	echo ""
	sleep 1
	
	if [[ "$SE" == "enforcing" ]]; then
		sed -i 's|SELINUX=enforcing|SELINUX=disabled|g' /etc/selinux/config
		echo "SElinux is disabled"
	elif [[ "$SE" == "enable"  ]]; then
		sed -i 's|SELINUX=enable|SELINUX=disabled|g' /etc/selinux/config
		echo "SElinux is disabled"
	fi
}

#Update OS
f_update_os () {
	echo "Starting update OS..."
	sleep 1
	
	yum install epel-release -y
	yum update -y
	yum install -y git wget curl byobu
	yum install -y pwgen
	
	echo ""
	sleep 1
}

#Install java
f_install_java () {
echo "Install java"
yum install -y java-1.8.0-openjdk-headless.x86_64
}

#Install Mongodb
f_install_mongodb () {
echo "Install mongodb"
cat << EOF > /etc/yum.repos.d/mongodb-org-4.0.repo
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc
EOF

	yum install -y mongodb-org
	systemctl daemon-reload
	systemctl enable mongod.service
	systemctl start mongod.service
}

# Install Elastichsearch

f_install_elasticsearch () {
echo "Install Elastichsearch"
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cat << EOF > /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-6.x]
name=Elasticsearch repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/oss-6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

yum install -y elasticsearch-oss

sed -i 's/#cluster.name: my-application/cluster.name: graylog/g' /etc/elasticsearch/elasticsearch.yml
echo "action.auto_create_index: false" >> /etc/elasticsearch/elasticsearch.yml
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl restart elasticsearch.service
}

# Install_graylog_server
f_install_graylog () {

echo "Install graylog server"

rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.rpm
yum install -y graylog-server 

#create pass_secret
pass_secret=$(pwgen -N 1 -s 96)
sed -i -e 's|password_secret =|password_secret = '$pass_secret'|' /etc/graylog/server/server.conf

#create pass_admin
echo -n "Enter Password: "
read pass
pass_admin=`echo $pass | sha256sum | cut -d" " -f1`
sed -i 's|root_password_sha2 =|root_password_sha2 = '$pass_admin'|' /etc/graylog/server/server.conf

#set timezone
sed -i 's|#root_timezone = UTC|root_timezone = Asia/Ho_Chi_Minh|' /etc/graylog/server/server.conf

#set http_bind_address
sed -i 's|#http_bind_address = 127.0.0.1:9000|http_bind_address = 192.168.152.101:9000|' /etc/graylog/server/server.conf

chkconfig --add graylog-server
systemctl daemon-reload
systemctl enable graylog-server.service
systemctl start graylog-server.service
}

f_main(){

    if f_check_os; then
		if f_check_root; then
			f_update_os
			f_disable_selinux
			f_install_java
			f_install_mongodb
			f_install_elasticsearch
			f_install_graylog
			echo "Install success"		
		else
		echo "Please run this script as root premission"
		fi
	else
	echo "Sorry. This script does not support your operating system :("
	fi
}

f_main
exit