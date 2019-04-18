#!/bin/sh

###########################################################
# Server_addr dia chi zabbix server
SERVER_ADDR="10.10.10.160"
# Name_host ten cua host duoc cau hinh tren zabbix server
NAME_HOST="Host-10.162"
# Port la port tren zabbix server de thuc hien ket noi voi host
PORT="10051"
# Key la key cau hinh tren item cua host nhan gia tri 
KEY="test.send.notified"
###########################################################

while [ 1 != 0 ]
do
a=`uptime | awk '{print $4}'`
zabbix_sender -z ${SERVER_ADDR} -s ${NAME_HOST} -p ${PORT} -k ${KEY} -o $a > /dev/null 2>&1
sleep 60
done

