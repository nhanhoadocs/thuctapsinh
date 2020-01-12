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
check_exist_name () {
    check=1
    while [ $check -eq 1 ]
    do 
        # Enter and Standardized ifname for card bridge.
        echo -n "ENTER Interface_name (For example: br0, br1, ...):"
        read if_name
        if_name=$(echo $if_name | tr -d ' ')
        
        # Check name
        if [ $(nmcli device | grep -wc "^$if_name") == 0 ] > /dev/null 2>&1; then {
            # Enter and Standardized con-name for card bridge
            echo -n "ENTER Connection_name (For example: br0, br1, ...):"
            read con_name
            con_name=$(echo $con_name | tr -d ' ')
            if [ $(nmcli con show | grep -wc "^$con_name") == 0 ] > /dev/null 2>&1; then {
                echo "OK"
                check=0
                break
            } else {
                echo "PLEASE ENTER INTERFACE NAME AND CONNECTION NAME AGAIN...."
                check=1
            } fi
        } else {
            check=1
        } fi
    done
    
    return 0
    echo "Continue......"
}

# Add and configure card bridge
#f_conf_network() {
#
#}


#--------------------------------------------------------------#
#-----------------------------MAIN-----------------------------#
#--------------------------------------------------------------#

f_main() {
    if f_check_os; then {
        if f_check_virt_sup; then {
            if f_check_root; then {
                f_install_kvm;
                f_install_xwindow;
                echo "__________INSTALL KVM SUCCESS__________"
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