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
    apt-get install -y gnupg2
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

    # Configure InfluxDB

}





#~-------------------------MAIN-------------------------~#
main(){
    if f_check_os; then {
        if f_check_root; then {
            f_install_support
            clear

            f_install_influxdb
        } else {
            echo -e "${RED}--->>PLEASE RUN THIS SCRIPT AS ROOT PREMISSION<<---${NOCOLOR}"
        } fi
    } else {
        echo -e "${RED}--->>SORRY. THIS SCRIPT DOES NOT SUPPORT YOUR OPERATING SYSTEM<<---${NOCOLOR}"
    } fi
}


#~~~~~~~~~~RUN MAIN~~~~~~~~~~#
main

exit