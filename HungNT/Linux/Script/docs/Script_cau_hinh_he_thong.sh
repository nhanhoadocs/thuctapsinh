#Set hostname

echo "Dien ten hostname moi "
read HOSTNAME

hostnamectl set-hostname $HOSTNAME

#sed -i "s/HOSTNAME=.*/HOSTNAME=$HOSTNAME/g" /etc/sysconfig/network
#Cau hinh tuong lua
systemctl stop firewalld
systemctl disable firewalld
sed -i "s/SELINUX=.*/SELINUX=disabled/" /etc/selinux/config
#Disable IPv6

cat > /etc/sysctl.conf << EOF
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF

sysctl -p

# Caif epel release va remi
yum -y install epel-release

#update
yum update

#reboot
init 6
