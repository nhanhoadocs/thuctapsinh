#!/bin/bash

# SCRIPT CONFIGURE STATIC IP

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


