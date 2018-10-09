#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh
source com_num.sh
source ../folder-name_config.sh

yum install fping -y
fping $CTL_EXT_IP
if [ $? != "0" ]
then
	echocolor "Node Controller not known"
	exit 1;
fi

mkdir /root/.ssh
cat << EOF > /root/.ssh/config
Host *
	StrictHostKeyChecking no
	UserKnownHostsFile /dev/null
EOF

yum install sshpass -y
sshpass -p $CTL_PASS ssh root@$CTL_EXT_IP "cd $FOLDER_ROOT_NAME/$CTL_FOLDER_NAME && source ctl-4-nova_discoveryhost.sh"
cd ../$UPDATE_FOLDER_NAME
source ssh_update_hosts.sh
