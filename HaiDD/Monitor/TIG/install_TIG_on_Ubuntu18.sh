#!/bin/bash

# Script install TIG stack on Ubuntu 18.04 LTS

# Variable Color text
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#---------------------------------#

# Check OS
OS=""
f_check_os(){
        echo "Checking your OS......."
        if cat /etc/*release | grep Ubuntu > /dev/null 2>&1; then {
            OS="Ubuntu"
			if [ $(cat /etc/*release | grep ^DISTRIB_RELEASE | tr -d 'DISTRIB_RELEASE=') == "18.04" ]; then {
				echo -e "${GREEN}-----YOUR OS : UBUNTU 18.04-----${NOCOLOR}"
				return 0
			} else {
				return 1
			} fi
				
        } else {
			return 1
		} fi
}

# Check user root
f_check_root () {
	if (( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}


# Update apt, support packet
f_install_support(){
	apt update
	apt -y install wget
    apt -y install curl
    apt-get install -y gnupg2
    apt-get install -y apt-transport-https
    apt-get install -y software-properties-common
    apt-get update
    apt-get -y upgrade
}

# Install InfluxDB
f_install_influxdb(){
    # Add influxdata key
    wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
    
    # Add repo influxdata
    source /etc/lsb-release
    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list
    apt update -y

    # Install InfluxDB
    apt install influxdb -y

    systemctl start influxdb
    systemctl enable influxdb

    # Backups File Config
    cp /etc/influxdb/influxdb.conf /etc/influxdb/influxdb.conf.bak

    # Configure InfluxDB
    sed -i 's/^\[http\]/\[http\]\nlog-enabled = true/' /etc/influxdb/influxdb.conf
    sed -i 's/^\[http\]/\[http\]\nbind-address = ":8086"/' /etc/influxdb/influxdb.conf
    sed -i 's/^\[http\]/\[http\]\nflux-enabled = true/' /etc/influxdb/influxdb.conf
    sed -i 's/^\[http\]/\[http\]\nenable = true/' /etc/influxdb/influxdb.conf

    # Create account admin
influx<<CREATE_ADMIN
CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES
CREATE DATABASE telegraf
CREATE USER telegraf WITH PASSWORD 'telegraf' WITH ALL PRIVILEGES
exit
CREATE_ADMIN

    # Restart service
    systemctl restart influxdb    

}

f_install_telegraf(){
    # Install Telegraf
    wget https://dl.influxdata.com/telegraf/releases/telegraf_1.14.2-1_amd64.deb
    dpkg -i telegraf_1.14.2-1_amd64.deb

    systemctl start telegraf
    systemctl enable telegraf

    # Backups File Config
    cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.bak

    # Configure Telegraf
    sed -i 's/^\[\[outputs.influxdb\]\]/\[\[outputs.influxdb\]\]\npassword = "telegraf"/g' /etc/telegraf/telegraf.conf
    sed -i 's/^\[\[outputs.influxdb\]\]/\[\[outputs.influxdb\]\]\nusername = "telegraf"/g' /etc/telegraf/telegraf.conf
    sed -i 's/\# urls \= \[\"http\:\/\/127.0.0.1\:8086\"\]/urls \= \[\"http\:\/\/127.0.0.1\:8086\"\]/g' /etc/telegraf/telegraf.conf

    # Restart service
    systemctl restart influxdb
    systemctl restart telegraf
}

f_install_grafana(){
    # Install Grafana-server
    wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
    add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    apt-get update
    apt-get install -y grafana
    
    # Allow firewall
    ufw allow 3000

    # Service
    systemctl start grafana-server
    systemctl enable grafana-server
}



#~-------------------------MAIN-------------------------~#
main(){
    if f_check_os; then {
        if f_check_root; then {
            clear

            echo -e "${GREEN}CAI DAT CAC GOI HO TRO....${NOCOLOR}"
            echo -e "\n"
            f_install_support
            clear

            echo -e "${GREEN}_______CAI DAT INFLUXDB_______${NOCOLOR}"
            echo -e "\n"
            f_install_influxdb
            echo -e "${GREEN}CAI DAT INFLUXDB THANH CONG!!!${NOCOLOR}"
			sleep 1
            clear

            echo -e "${GREEN}_______CAI DAT TELEGRAF_______${NOCOLOR}"
            echo -e "\n"
            f_install_telegraf
            echo -e "${GREEN}CAI DAT TELEGRAF THANH CONG!!!${NOCOLOR}"
			sleep 1
            clear
            
            echo -e "${GREEN}_______CAI DAT GRAFANA-SERVER_______${NOCOLOR}"
            echo -e "\n"
            f_install_grafana
            echo -e "${GREEN}CAI DAT GRAFANA-SERVER THANH CONG!!!${NOCOLOR}"
			sleep 1
            clear
        } else {
            echo -e "${RED}--->>PLEASE RUN THIS SCRIPT AS ROOT PREMISSION<<---${NOCOLOR}"
        } fi
    } else {
        echo -e "${RED}--->>SORRY. THIS SCRIPT DOES NOT SUPPORT YOUR OPERATING SYSTEM<<---${NOCOLOR}"
    } fi

    clear
	
	echo -e "${GREEN}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${NOCOLOR}"
	echo -e "${GREEN}    >>>>>>>>>QUA TRINH CAI DAT TIG STACK HOAN TAT<<<<<<<<<    ${NOCOLOR}"
	echo -e "${GREEN}    Truy cap dia chi: ${RED}http://<IP>:3000 ${GREEN}De bat dau su dung     ${NOCOLOR}"
	echo -e "${GREEN}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${NOCOLOR}"
    echo -e "================================================"
    echo -e "${GREEN}THÔNG TIN InfluxDB :${NOCOLOR}"
    echo -e "Tài khoản Admin"
    echo -e "username : admin      |  password: admin"
    echo -e "========="
    echo -e "Database : telegraf"
    echo -e "username : telegraf   |  password: telegraf"
    echo -e "================================================"
}


#~~~~~~~~~~RUN MAIN~~~~~~~~~~#
main

exit