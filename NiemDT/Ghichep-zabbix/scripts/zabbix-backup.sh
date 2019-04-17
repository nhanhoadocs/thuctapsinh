#!/bin/sh

############################################################################################
USER_NAME="zabbix"
DBHOST="IP-zabbix-server"
DBNAME="zabbix"
DBPASSWORD="password"
DBPORT="3306"
SAVE_FILE="5"
#############################################################################################
PATH_DIR="/root/zabbix"
Logfile="/root/zabbix/zabbix-backup.log"
Backupfile="/root/zabbix/backup-file"
TABLE=`cat $PATH_DIR/tables.txt`
mysqldump -u ${USER_NAME} -h ${DBHOST} -P ${DBPORT} -p${DBPASSWORD} ${DBNAME} ${TABLE} > $Backupfile/zabbix-`date +"%Y-%m-%d-%H-%M-%S"`.sql
[ "$?" == 0 ] && echo "zabbix-`date +"%Y-%m-%d-%H-%M-%S"`: Backup zabbix succeed"     >> ${Logfile}
[ "$?" != 0 ] && echo "zabbix-`date +"%Y-%m-%d-%H-%M-%S"`: Backup zabbix not succeed" >> ${Logfile}
cd ${Backupfile}
[ "$?" == 0 ] && rm -rf zabbix-$(date +"%Y-%m-%d" --date="`$SAVE_FILE` days ago")*
