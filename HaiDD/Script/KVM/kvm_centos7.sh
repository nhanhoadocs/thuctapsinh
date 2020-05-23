#!/bin/bash
#
### Script Install KVM on CentOS-7


# Variable
set -e; OS=""

# Check OS
f_check_os(){
    echo "Checking your OS..."
    if cat /etc/*release | grep CentOS > /dev/null 2>&1; then {
        OS="CentOS_"
        if [ $(rpm --eval '%{centos_ver}') == 7 ]; then {
            OS="${OS}7";
            echo $OS
            return 0
        } else {
            return 1
        } fi
    } else {
        return 1
    } fi
}

# Check virt-support
f_check_virt_sup() {
    if [ $(egrep -c "svm|vmx" /proc/cpuinfo) == '0' ] > /dev/null 2>&1; then {
        echo "System not suport Virtualization !!!";
        return 1
    } else {
        return 0
    } fi
}

# Check user root
f_check_root () {
	if (( $EUID == 0)); then
		return 0
	else
		return 1
	fi
}

# Install KVM
f_install_kvm() {
    echo "Install KVM...";
    yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager
    systemctl start libvirtd
    systemctl enable libvirtd
}

# Install X-window
f_install_xwindow() {
    echo "Install X-Window..."
    yum install "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y
}

# Check exist_name for card bridge
f_check_exist_name () {
    check=1
    while [ $check -eq 1 ]
    do 
        # Enter and Standardized ifname for card bridge.
        nmcli con show
        echo -n "ENTER Interface_name for Bridge card (For example: br0, br1, ...):"
        read br_name
        br_name=$(echo $br_name | tr -d ' ')
        
        # Check name
        if [ $(nmcli device | grep -wc "^$br_name") == 0 ] > /dev/null 2>&1; then {
            if [ $(nmcli con show | grep -wc "^$br_name") == 0 ] > /dev/null 2>&1; then {
                echo "This name can be used..."
                check=0
                break
            } else {
                echo "This name can's be used. Please enter again !!!"
                check=1
            } fi
        } else {
            echo "This name can's be used. Please enter again !!!"
            check=1
        } fi
    done
    
    return 0
    echo "Continue......"
}

# Add and configure card bridge
f_conf_network() {
    echo "CONFIGURE NETWORK CARD FOR $br_name"

    # Chose interface
    nmcli device
    echo -n "Select interface assign to $br_name:"
    read if_net

    # Parameter for Bridge
    echo -n "Enter IP Address (Ex: 192.168.10.12, ...): "
    read ipadd
    echo -n "Enter Prefix (Ex: 16, 24, ...): "
    read prefix
    echo -n "Enter Gateway (Ex: 192.168.10.1, ...): "
    read gateway
    echo -n "Enter DNS (Ex: 8.8.8.8, ...): "
    read dns

    # Configure Bridge
    echo -e "DEVICE="$br_name"\nSTP=no\nTYPE=Bridge\nBOOTPROTO=none\nDEFROUTE=yes\nNAME="$br_name"\nONBOOT=yes\nDNS1="$dns"\nIPADDR="$ipadd"\nPREFIX="$prefix"\nGATEWAY="$gateway > "/etc/sysconfig/network-scripts/ifcfg-${br_name}"

    # Configure Interface Network
    uuid=$(uuidgen $if_net)
    echo -e "TYPE=Ethernet""\nNAME="$if_net"\nUUID="$uuid"\nDEVICE="$if_net"\nONBOOT=yes\nBRIDGE="$br_name > "/etc/sysconfig/network-scripts/ifcfg-${if_net}"
    #nmcli connection add type bridge-slave autoconnect yes con-name $if_net ifname $if_net master $br_name

    echo "__________INSTALL KVM SUCCESS__________"
    reboot
}


#--------------------------------------------------------------#
#-----------------------------MAIN-----------------------------#
#--------------------------------------------------------------#

f_main() {
    if f_check_os; then {
        if f_check_virt_sup; then {
            if f_check_root; then {
                f_install_kvm;
                f_install_xwindow;
                f_check_exist_name;
                f_conf_network;
            } else {
                echo "--->>PLEASE RUN THIS SCRIPT AS ROOT PREMISSION<<---"
            } fi
        } else {
            echo "--->>YOUR SYSTEM DOES NOT SUPPORT VIRTUALIZATION<<---"
        } fi
    } else {
        echo "--->>SORRY. THIS SCRIPT DOES NOT SUPPORT YOUR OPERATING SYSTEM<<---"
    } fi
}



#-------------RUN-------------#
f_main

exit