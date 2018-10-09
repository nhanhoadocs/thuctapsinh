#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh
source ../folder-name_config.sh

node_hostname=$(hostname)

# Controller

mkdir /root/.ssh
cat << EOF > /root/.ssh/config
Host *
	StrictHostKeyChecking no
	UserKnownHostsFile /dev/null
EOF

yum install fping -y
yum install sshpass -y

fping $CTL_EXT_IP
if [ $? != "0" ]
then
	echocolor "Node Controller not known"
	sshpass -p $CTL_PASS ssh root@$CTL_EXT_IP "rm -rf /root/$FOLDER_ROOT_NAME"
	sshpass -p $CTL_PASS scp -r ../../$FOLDER_ROOT_NAME root@$CTL_EXT_IP:
	sshpass -p $CTL_PASS ssh -t -t root@$CTL_EXT_IP "cd $FOLDER_ROOT_NAME/$UPDATE_FOLDER_NAME && source update_hosts.sh"
	exit 1;
else
	echocolor "Node Controller known"
fi

# Compute
for (( i=1; i <= ${#HOST_COM[*]}; i++ ))
do
	if [ "$node_hostname" = "${HOST_COM[$i]}" ]
	then
		continue
	fi
	
	fping ${COM_EXT_IP[$i]}
	if [ $? != "0" ]
	then
		echocolor "Node ${HOST_COM[$i]} not known"
		continue
	else
		echocolor "Node ${HOST_COM[$i]} known"
	fi
	sshpass -p ${COM_PASS[$i]} ssh root@${COM_EXT_IP[$i]} "rm -rf /root/$FOLDER_ROOT_NAME"
	sshpass -p ${COM_PASS[$i]} scp -r ../../$FOLDER_ROOT_NAME root@${COM_EXT_IP[$i]}:
	sshpass -p ${COM_PASS[$i]} ssh -t -t root@${COM_EXT_IP[$i]} "cd $FOLDER_ROOT_NAME/$UPDATE_FOLDER_NAME && source update_hosts.sh"
	
done

# Block
for (( i=1; i <= ${#HOST_BLK[*]}; i++ ))
do
	if [ "$node_hostname" = "${HOST_BLK[$i]}" ]
	then
		continue
	fi
	
	fping ${BLK_EXT_IP[$i]}
	if [ $? != "0" ]
	then
		echocolor "Node ${HOST_BLK[$i]} not known"
		continue
	else
		echocolor "Node ${HOST_BLK[$i]} known"
	fi
	sshpass -p ${BLK_PASS[$i]} ssh root@${BLK_PASS[$i]} "rm -rf /root/$FOLDER_ROOT_NAME"
	sshpass -p ${BLK_PASS[$i]} scp -r ../../$FOLDER_ROOT_NAME root@${BLK_EXT_IP[$i]}:
	sshpass -p ${BLK_PASS[$i]} ssh -t -t root@${BLK_EXT_IP[$i]} "cd $FOLDER_ROOT_NAME/$UPDATE_FOLDER_NAME && source update_hosts.sh"
	
done
