#!/bin/bash
#
##### Script Install Graylog server
#
# Variable
set -e; OS=""
gr='\033[1;032m'
#
# Check OS
f_check_os () {
    echo -e "${gr}Checking Your OS ...\033[0m"
	echo ""
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
	echo -e "${gr}Checking root...\033[0m"
	echo ""
	if(( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

#Function to disable SElinux
f_disable_selinux () {
	echo -e "${gr}Disable firewall...\033[0m"
	echo ""
	systemctl stop firewalld
	systemctl disable firewalld
	SE=`cat /etc/selinux/config | grep ^SELINUX= | awk -F'=' '{print$2}'`
	echo -e "${gr}Checking SElinux status...\033[0m"
	echo ""
	sleep 2
	
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
	echo -e "${gr}Starting update OS...\033[0m"
	sleep 2
	
	yum install epel-release -y
	yum update -y
	yum install -y git wget curl byobu
	yum install -y pwgen
	
	echo ""
	sleep 2
}

#Funtion Install chrony
f_chrony(){
	yum install -y chrony
	systemctl start chronyd
	systemctl enable chronyd
}

#Function Install sidecar
f_install_sidecar(){
	echo -e "${gr}Installing sidecar...\033[0m"
	echo ""
    read -p "Enter Graylog Server IP Address: " IP_GRAYLOG_SERVER
	read -p "Enter Server API token: " graylog_token
	echo -e "${gr}Installing packages...\033[0m"
	sleep 3
	wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.2-x86_64.rpm
	rpm -i filebeat-7.4.2-x86_64.rpm
	systemctl start filebeat
	systemctl enable filebeat	
	wget https://github.com/Graylog2/collector-sidecar/releases/download/1.0.2/graylog-sidecar-1.0.2-1.x86_64.rpm
	rpm -i graylog-sidecar-1.0.2-1.x86_64.rpm
	cp /etc/graylog/sidecar/sidecar.yml /etc/graylog/sidecar/sidecar.yml.bak
cat << EOF > /etc/graylog/sidecar/sidecar.yml
server_url: http://$IP_GRAYLOG_SERVER:9000/api/
update_interval: 10
tls_skip_verify: false
send_status: true
list_log_files:
  - "/var/log/"
server_api_token: $graylog_token
cache_path: "/var/cache/graylog-sidecar"
log_path: "/var/log/graylog-sidecar"
EOF
	graylog-sidecar -service install
	systemctl start graylog-sidecar.service
	systemctl enable graylog-sidecar.service	
}

#Function config syslog
f_config_syslog(){
    echo -e "${gr}Configuring sidecar...\033[0m"
    echo ""
    sleep 2
    echo -n "Enter IP_adress of graylog server with port 1514 (Example: 192.168.10.100:1514): "
    read ip
    echo "*.* @${ip};RSYSLOG_SyslogProtocol23Format" >> /etc/rsyslog.conf
    systemctl restart rsyslog
}

f_main(){
    if f_check_os; then
        if f_check_root; then
            {
                f_disable_selinux
                f_update_os
                f_chrony
                echo "Choose input to graylog: "
                echo "1: syslog "
                echo "2: sidecar"
                check=1
                while [ $check -eq 1 ]
                do 
	                read number
	                if [ $number == '1' ] ; then {
		                f_config_syslog
		                check=0
		                break
	                } 
                    elif [ $number == '2' ] ; then {
		                f_install_sidecar
		                check=0
		                break
	                } 
                    else 
		                echo "Input is not true. Please enter again: "
		                check=1
	                fi
                done
                echo "Install success"
            }
        else
        echo "Please run this script as root permission"
        fi
    else 
    echo "Sorry. This script does not support your operating system"
    fi
}

f_main
exit