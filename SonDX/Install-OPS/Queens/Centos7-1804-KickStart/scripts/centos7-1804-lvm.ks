#Generic Kickstart template for Centos 7
#Platform: x86 and x86-64

#System language
lang en_US

#System keyboard
keyboard us

#System timezone
timezone Asia/Ho_Chi_Minh

#Root password
rootpw welcome123

# Creates a new user on the system
user centos --name=centos --password=welcome123

#System authorization infomation
auth  --useshadow  --enablemd5 

#System bootloader configuration
bootloader --location=mbr --append="biosdevname=0 net.ifnames=0"
#Partition clearing information
clearpart --all
#Basic disk partition
part /boot --fstype xfs --size 1024 --ondisk=vda
part pv.01 --size=5 --grow --asprimary --ondisk=vda
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
url --url http://10.10.10.151/cblr/links/Centos7-x86_64

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
cd /root
mkdir test
%end
