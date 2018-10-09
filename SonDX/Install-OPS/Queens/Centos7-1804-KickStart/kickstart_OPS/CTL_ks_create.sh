#!/bin/bash
source config.sh

cat << HERE > ks_CTL.ks
#Generic Kickstart template for Centos 7
#Platform: x86 and x86-64

#System language
lang en_US

#System keyboard
keyboard us

#System timezone
timezone Asia/Ho_Chi_Minh

#Root password
rootpw $ROOT_PASS

# Creates a new user on the system
user $USER_NAME --name=centos --password=$USER_PASS

#System authorization infomation
auth  --useshadow  --enablemd5 

#System bootloader configuration
bootloader --location=mbr --append="biosdevname=0 net.ifnames=0"
#Partition clearing information
clearpart --all
#Basic disk partition
part /boot --fstype xfs --size 1024 --ondisk=sda
part pv.01 --size=5 --grow --asprimary --ondisk=sda
volgroup vg1 pv.01
logvol swap --fstype="swap" --name=centos-swap --vgname=vg1 --size=2048
logvol / --fstype=xfs --name=centos-root --vgname=vg1 --size=5 --grow

#Use text mode install
text

# Firewall configuration
firewall --enabled
# SELinux configuration
selinux --disabled

#Network information
#network --bootproto=dhcp --device=eth0 --onboot=on

# config repo source.list
url --url $REPO_HOSTNAME$REPO_FOLDER

# Do not configure the X Window System
skipx

#Reboot after installation
reboot

#Install packages
%packages --ignoremissing

%end

#Run command when system installation is complete
%post
yum update -y
mkdir /root/test

echo "proxy=http://$CACHER_SERVER:3142" >> /etc/yum.conf

cp /etc/rc.d/rc.local /etc/rc.d/rc.local.bak
chmod 755 /etc/rc.d/rc.local

	cat << EOF > /etc/rc.d/rc.local
#!/bin/bash
yum update -y
yum install wget -y
cd /root
wget --no-parent --recursive -nH --reject="index.html*" $PATH_OPSsetup
cd /root/$FOLDER_ROOT_NAME/$CTL_FOLDER_NAME
source ctl-all.sh
rm /etc/rc.d/rc.local
mv /etc/rc.d/rc.local.bak /etc/rc.d/rc.local
exit 0
EOF

%end

HERE