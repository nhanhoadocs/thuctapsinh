#!/bin/bash
#Author Son Do Xuan

##########################################
#### Set local variable  for scripts #####
##########################################

# Variable
## IP address of COBBLER and path for repo Centos 7.5.18.04
REPO_HOSTNAME=http://10.10.10.151
REPO_FOLDER=/cblr/links/Centos7-x86_64

## IP address of Cacher-NG
CACHER_SERVER=10.10.10.152

## PATH scripts to install OpenStack
PATH_OPSsetup="http://10.10.10.151/OPS-setup"

## Folder name OPS
FOLDER_ROOT_NAME=OPS-setup
CTL_FOLDER_NAME=CTL
COM_FOLDER_NAME=COM
BLK_FOLDER_NAME=BLK
UPDATE_FOLDER_NAME=UPDATE

## User name, user password and root password
USER_NAME=centos
USER_PASS=welcome123
ROOT_PASS=welcome123

## Compute number and Block number
com_num=1
blk_num=1