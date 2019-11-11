#!/bin/bash

HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/sh
PWD=/root

#echo -n "Nhap mat khau may backup "
rootpass=hung123456

NOW=`date '+%F_%H:%M:%S'`;
yum --enablerepo=epel -y install sshpass

vgcfgbackup -f /home/thanhhung98/lv_backup_file/vg_backup_$NOW vg_backup

file=$(ls -t /home/thanhhung98/lv_backup_file | head -1)

#Chỉ chuyển file mới nhất
sshpass -p $rootpass scp -r /home/thanhhung98/lv_backup_file/$file root@4.4.4.4:/home/relayserver/backup_lvm


#Chuyển cả directory backup
#sshpass -p $rootpass scp -r /home/thanhhung98/lv_backup_file root@4.4.4.4:/home/relayserver/backup_lvm
