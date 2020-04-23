#!/bin/bash

agent_ubuntu='http://10.10.35.121/monitoring/check_mk/agents/check-mk-agent_1.6.0p10-1_all.deb'
agent_centos='http://10.10.35.121/monitoring/check_mk/agents/check-mk-agent-1.6.0p10-1.noarch.rpm'
ip_server='10.10.35.121'
os=`head -1 /etc/os-release | cut --delimiter='=' -f 2`

if [ "$os" = '"Ubuntu"' ]
then
    if ( apt list --installed | grep -q wget )
    then
        echo "========================="
    else
        apt-get install -y wget
    fi
    wget $agent_ubuntu
    dpkg -i check-mk-agent_1.6.0p10-1_all.deb
    apt-get install -y xinetd
    systemctl start xinetd
    systemctl enable xinetd
    sed -i "s/#only_from      = 127.0.0.1 10.0.20.1 10.0.20.2/only_from      = $ip_server/g" /etc/xinetd.d/check_mk
    systemctl restart xinetd
    ufw allow 6556/tcp
    ufw reload
elif [ "$os" = '"CentOS Linux"' ]
then
    if ( yum list installed | grep -q wget )
    then
        echo "========================="
    else
        yum install -y wget
    fi
    wget $agent_centos
    rpm -ivh check-mk-agent-1.6.0p10-1.noarch.rpm
    yum install xinetd -y
    systemctl start xinetd
    systemctl enable xinetd
    sed -i "s/#only_from      = 127.0.0.1 10.0.20.1 10.0.20.2/only_from      = $ip_server/g" /etc/xinetd.d/check_mk
    systemctl restart xinetd
    firewall-cmd --add-port=6556/tcp --permanent
    firewall-cmd --reload
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0

else
    echo "Không đúng HĐH"
fi