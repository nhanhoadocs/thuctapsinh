#!/bin/bash
#Author Son Do Xuan

# Note: Install Nexus Repository on Centos 7.5.18.04
echo "###Install and config Nexus Repository on Centos 7.5.18.04###"
sleep 3

# Pre install
echo "###Pre install###"
sleep 3
yum update -y
yum install wget -y

## Stop firewalld serivce
systemctl stop firewalld
systemctl disable firewalld

## Stop SELINUX
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

# Install Java Runtime Environment
echo "###Install Java Runtime Environment###"
sleep 3
cd /root
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
yum localinstall jdk-8u181-linux-x64.rpm -y

# Install Nexus Repo 3.9
echo "###Install Nexus Repo 3.9###"
sleep 3
wget http://download.sonatype.com/nexus/3/nexus-3.9.0-01-unix.tar.gz -O /root/nexus-3.9.0-01-unix.tar.gz
cp /root/nexus-3.9.0-01-unix.tar.gz /opt
cd /opt
tar xvzf nexus-3.9.0-01-unix.tar.gz
mv nexus-3.9.0-01 nexus

# Run Nexus Repo as a Service
echo "###Run Nexus Repo as a Service###"
sleep 3
adduser nexus
usermod -d /opt/nexus nexus
chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
echo -e "\nrun_as_user=\"nexus\"" >> /opt/nexus/bin/nexus.rc
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
cd /etc/init.d
chkconfig --add nexus
chkconfig --levels 345 nexus on
service nexus start

# Install plugin Nexus repository APT
echo "###Install plugin Nexus repository APT###"
sleep 3

## Install git
yum install git -y

## Download nexus-repository-apt
cd /root
git clone https://github.com/sonatype-nexus-community/nexus-repository-apt
cd nexus-repository-apt
git tag -l
git checkout 1.0.5
git branch -D master
git checkout -b master

## Install Apache Maven
cd /usr/local/src
wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -xf apache-maven-3.5.4-bin.tar.gz
mv apache-maven-3.5.4/ apache-maven/ 
touch /etc/profile.d/maven.sh
cat << EOF > /etc/profile.d/maven.sh
# Apache Maven Environment Variables
# MAVEN_HOME for Maven 1 - M2_HOME for Maven 2
export M2_HOME=/usr/local/src/apache-maven
export PATH=\${M2_HOME}/bin:\${PATH}
EOF

chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

## Build plugin
cd /root/nexus-repository-apt
mvn

## Install
service nexus stop
mkdir -p /opt/nexus/system/net/staticsnow/nexus-repository-apt/1.0.4
cp /root/nexus-repository-apt/target/nexus-repository-apt-1.0.4.jar /opt/nexus/system/net/staticsnow/nexus-repository-apt/1.0.4
nexusfile=/opt/nexus/system/com/sonatype/nexus/assemblies/nexus-oss-feature/3.9.0-01/nexus-oss-feature-3.9.0-01-features.xml
nexusfilebak=/opt/nexus/system/com/sonatype/nexus/assemblies/nexus-oss-feature/3.9.0-01/nexus-oss-feature-3.9.0-01-features.xml.bak
cp $nexusfile $nexusfilebak
yum install sed -y

sed -i '20i\<feature prerequisite="false" dependency="false">nexus-repository-apt</feature>' $nexusfile

sed -i '188i\<feature name="nexus-repository-apt" description="net.staticsnow:nexus-repository-apt" version="1.0.4">' $nexusfile
sed -i '189i\    <details>net.staticsnow:nexus-repository-apt</details>' $nexusfile
sed -i '190i\    <bundle>mvn:net.staticsnow/nexus-repository-apt/1.0.4</bundle>' $nexusfile
sed -i '191i\</feature>' $nexusfile

## Start nexus service
service nexus start

# Finally
echo "###Install complete!###"
echo "###Access link: <Host_IP_address>:8081###"
echo "###Username: admin ### Password: admin123###"
