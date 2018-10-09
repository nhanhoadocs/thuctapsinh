#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh
source ../folder-name_config.sh
	
cat << EOF >/etc/hosts
127.0.0.1	localhost

$CTL_MGNT_IP	$HOST_CTL
EOF

for (( i=1; i <= ${#HOST_COM[*]}; i++ ))
do
	echo "${COM_MGNT_IP[$i]}	${HOST_COM[$i]}" >> /etc/hosts
done
	
for (( i=1; i <= ${#HOST_BLK[*]}; i++ ))
do
	echo "${BLK_MGNT_IP[$i]}	${HOST_BLK[$i]}" >> /etc/hosts
done