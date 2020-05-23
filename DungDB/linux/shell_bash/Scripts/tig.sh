#!/bin/bash

check_os(){
    os_raw=$(cat /etc/os-release | grep 'NAME')
    if grep -q "CentOS" <<< $os_raw
    then
        os='CentOS'
    elif grep -q "Ubuntu" <<< $os_raw
    then
        os='Ubuntu'
    else
        echo -e "Other OS"
    fi
    echo $os
}

install_influxdb_centos(){
    yum install influxdb curl -y
    systemctl start influxdb
    systemctl enable influxdb
    firewall-cmd --permanent --add-port=8086/tcp
    firewall-cmd --permanent --add-port=8088/tcp
    firewall-cmd --reload
    curl "http://localhost:8086/query" --data-urlencode "q=CREATE DATABASE telegraf"
    curl "http://localhost:8086/query" --data-urlencode "q=CREATE USER telegraf WITH PASSWORD 'telegraf'"
    curl "http://localhost:8086/query" --data-urlencode "q=GRANT ALL ON 'telegraf' TO 'telegraf'"
}

install_telegraf_centos(){
    echo -e '[influxdb]\nname = InfluxDB Repository - RHEL $releasever\nbaseurl = https://repos.influxdata.com/rhel/$releasever/$basearch/stable\nenabled = 1\ngpgcheck = 1\ngpgkey = https://repos.influxdata.com/influxdb.key' > /etc/yum.repos.d/influxdb.repo
    yum repolist
    yum install -y telegraf
    systemctl start telegraf
    systemctl enable telegraf
    cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.bak
}

install_grafana_centos(){
    echo -e '[grafana]\nname=grafana\nbaseurl=https://packages.grafana.com/oss/rpm\nrepo_gpgcheck=1\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.grafana.com/gpg.key\nsslverify=1\nsslcacert=/etc/pki/tls/certs/ca-bundle.crt' > /etc/yum.repos.d/grafana.repo
    yum repolist
    yum install grafana -y
    systemctl start grafana-server
    systemctl enable grafana-server
    firewall-cmd --zone=public --add-port=3000/tcp --permanent
    firewall-cmd --reload
    cp /etc/grafana/grafana.ini /etc/grafana/grafana.ini.bak
}

install_influxdb_ubuntu(){
    sudo apt install influxdb curl -y
    sudo systemctl start influxdb
    sudo systemctl enable influxdb
    sudo ufw allow 8086/tcp
    curl "http://localhost:8086/query" --data-urlencode "q=CREATE DATABASE telegraf"
    curl "http://localhost:8086/query" --data-urlencode "q=CREATE USER telegraf WITH PASSWORD 'telegraf'"
    curl "http://localhost:8086/query" --data-urlencode "q=GRANT ALL ON 'telegraf' TO 'telegraf'"
}

install_telegraf_ubuntu(){
    sudo apt-get install gnupg -y
    wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
    source /etc/lsb-release
    echo -e "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list
    sudo apt update -y
    sudo apt install telegraf -y
    sudo systemctl start telegraf
    sudo systemctl enable telegraf
    sudo cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.bak
}

install_grafana_ubuntu(){
    sudo apt-get install -y apt-transport-https
    sudo apt-get install -y software-properties-common wget
    wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
    sudo apt-get update -y
    sudo apt-get install grafana -y
    sudo systemctl start grafana-server
    sudo systemctl enable grafana-server
    sudo ufw allow 3000/tcp
    sudo cp /etc/grafana/grafana.ini /etc/grafana/grafana.ini.bak
}

check_status_telegraf(){
    IFS=' ' read -ra ver <<< "$(telegraf --version)"
    if [ -n "$(sudo systemctl status telegraf | grep 'active (running)')" ] 
    then
        echo -e "Telegraf Version: ${ver[1]} ----status: \033[1;32mactive (running)\033[0m"
    elif [ -n "$(sudo systemctl status telegraf | grep 'inactive (dead)')" ] 
    then
        echo -e "Telegraf Version: ${ver[1]} ----status: \033[1;31minactive (dead)\033[0m"
    else
        echo -e "Telegraf Version: ${ver[1]} ----status: \033[1;31mfailed\033[0m"
    fi
}

check_status_influxdb(){
    IFS=' ' read -ra ver <<< "$(influx -version)"
    if [ -n "$(sudo systemctl status influxdb | grep 'active (running)')" ] 
    then
        echo -e "InfluxDB Version: ${ver[3]} ----status: \033[1;32mactive (running)\033[0m"
    elif [ -n "$(sudo systemctl status influxdb | grep 'inactive (dead)')" ] 
    then
        echo -e "InfluxDB Version: ${ver[3]} ----status: \033[1;31minactive (dead)\033[0m"
    else
        echo -e "InfluxDB Version: ${ver[3]} ----status: \033[1;31mfailed\033[0m"
    fi
}

check_status_grafana(){
    IFS=' ' read -ra ver <<< "$(grafana-server -v)"
    if [ -n "$(sudo systemctl status grafana-server | grep 'active (running)')" ] 
    then
        echo -e "Grafana Version: ${ver[1]} ----status: \033[1;32mactive (running)\033[0m"
    elif [ -n "$(sudo systemctl status grafana-server | grep 'inactive (dead)')" ] 
    then
        echo -e "Grafana Version: ${ver[1]} ----status: \033[1;31minactive (dead)\033[0m"
    else
        echo -e "Grafana Version: ${ver[1]} ----status: \033[1;31mfailed\033[0m"
    fi
}

main(){
    
    clear
    printf "=========================================================================\n"
    printf "*******************TIG Installation - Edited by Cuo**********************\n"
    printf "=========================================================================\n"
    printf "====================================\n"
    printf "********************** 1. Install TIG (Server)     **********************\n"
    printf "********************** 2. Install Telegraf (Agent) **********************\n"
    printf "********************** q. Quit                     **********************\n"
    read -p "Type your answer :" answer
    os=$(check_os)
    echo "$os"
    if [[ $os == "CentOS" ]]
    then
        if [[ "$answer" -eq '1' ]]
        then
            clear
            printf "=========================================================================\n"
            printf "First Step: Install Telegraf \n"
            printf "====================================\n"
            install_telegraf_centos

            clear
            printf "=========================================================================\n"
            printf "Second Step: Install InfluxDB \n"
            printf "===========================================\n"
            install_influxdb_centos

            clear
            printf "=========================================================================\n"
            printf "Last Step: Install Grafana \n"
            printf "===========================================\n"
            install_grafana_centos

            clear
            printf "=========================================================================\n"
            printf "Install successfully , enjoy TIG! \n"
            printf "Database Created : telegraf [user: telegraf - passwd: telegraf]\n"
            printf "=========================================================================\n"
            sleep 5

            read -p "Do you want to show TIG status? [Y/n]" choice
            case $choice in
                [yY][eE][sS]|[yY])
                    check_status_telegraf
                    check_status_influxdb
                    check_status_grafana
                    ;;
                [nN][oO]|[nN])
                    ;;
                *)
                    echo "Sorry, invalid input..."
                    ;;
            esac
        elif [[ "$answer" -eq '2' ]]
        then 
            clear
            printf "=========================================================================\n"
            printf "Installing Telegraf...... \n"
            printf "====================================\n"
            install_telegraf_centos

            clear
            printf "=========================================================================\n"
            printf "Install successfully! \n"
            check_status_telegraf
            printf "=========================================================================\n"

        elif [[ "$answer" -eq 'q' ]]
        then
            clear
            exit
        else
            clear
            printf "Invalid option!"
            exit
        fi
    elif [[ $os == "Ubuntu" ]]
    then    
        if [[ "$answer" -eq '1' ]]
        then
            clear
            printf "=========================================================================\n"
            printf "First Step: Install Telegraf \n"
            printf "====================================\n"
            install_telegraf_ubuntu

            clear
            printf "=========================================================================\n"
            printf "Second Step: Install InfluxDB \n"
            printf "===========================================\n"
            install_influxdb_ubuntu

            clear
            printf "=========================================================================\n"
            printf "Last Step: Install Grafana \n"
            printf "===========================================\n"
            install_grafana_ubuntu

            clear
            printf "=========================================================================\n"
            printf "Install successfully , enjoy TIG! \n"
            printf "Database Created : telegraf [user: telegraf - passwd: telegraf]\n"
            printf "=========================================================================\n"
            sleep 5

            read -p "Do you want to show TIG status? [Y/n]" choice
            case $choice in
                [yY][eE][sS]|[yY])
                    check_status_telegraf
                    check_status_influxdb
                    check_status_grafana
                    ;;
                [nN][oO]|[nN])
                    ;;
                *)
                    echo "Sorry, invalid input..."
                    ;;
            esac
        elif [[ "$answer" -eq '2' ]]
        then 
            clear
            printf "=========================================================================\n"
            printf "Installing Telegraf...... \n"
            printf "====================================\n"
            install_telegraf_ubuntu

            clear
            printf "=========================================================================\n"
            printf "Install successfully! \n"
            check_status_telegraf
            printf "=========================================================================\n"
        
        elif [[ "$answer" -eq 'q' ]]
        then
            clear
            exit
        else
            clear
            exit
            echo -e '\nInvalid option!\n'
        fi
    else
        clear
        printf "OS Not Supported!"
        exit
    fi
}
main
