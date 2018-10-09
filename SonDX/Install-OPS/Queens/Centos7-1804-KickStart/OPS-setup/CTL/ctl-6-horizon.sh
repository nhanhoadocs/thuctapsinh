#!/bin/bash
#Author Son Do Xuan

source ../function.sh
source ../config.sh

# Function install the packages
horizon_install () {
	echocolor "Install the packages"
	sleep 3
	yum install openstack-dashboard -y
}


# Function edit the /etc/openstack-dashboard/local_settings.py file
horizon_config () {
	echocolor "Edit the /etc/openstack-dashboard/local_settings file"
	sleep 3

	horizonfile=/etc/openstack-dashboard/local_settings
	horizonfilebak=/etc/openstack-dashboard/local_settings.bak
	cp $horizonfile $horizonfilebak
	egrep -v "^$|^#" $horizonfilebak > $horizonfile

	sed -i 's/OPENSTACK_HOST = "127.0.0.1"/'"OPENSTACK_HOST = \"$HOST_CTL\""'/g' $horizonfile
	sed -i "s/ALLOWED_HOSTS.*/ALLOWED_HOSTS = ['*']/g" $horizonfile
	
	echo "SESSION_ENGINE = 'django.contrib.sessions.backends.cache'" >> $horizonfile
	sed -i "s/'BACKEND'.*/'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',\n        'LOCATION': '$HOST_CTL:11211',/g" $horizonfile

	echo "OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True" >> $horizonfile
	cat << EOF >> $horizonfile
OPENSTACK_API_VERSIONS = {
    "identity": 3,
    "image": 2,
    "volume": 2,
}
EOF

	echo 'OPENSTACK_KEYSTONE_DEFAULT_DOMAIN = "Default"' >> $horizonfile
	sed -i 's/OPENSTACK_KEYSTONE_DEFAULT_ROLE = "_member_"/OPENSTACK_KEYSTONE_DEFAULT_ROLE = "user"/g' $horizonfile

	sed -i 's/TIME_ZONE = "UTC"/TIME_ZONE = "Asia\/Ho_Chi_Minh"/g' $horizonfile
	
	echo "WSGIApplicationGroup %{GLOBAL}" >> /etc/httpd/conf.d/openstack-dashboard.conf
	
}

# Function restart installation
horizon_restart () {
	echocolor "Restart installation"
	sleep 3
	systemctl restart httpd.service memcached.service
}

# Function horzion information
horizon_infomation () {
	echocolor "HORIZON INFORMATION"
	echo "LOGIN INFORMATION IN HORIZON"
	echo "URL: http://$CTL_EXT_IP/dashboard"
	echo "User: admin (or demo)"
	echo "Password: $ADMIN_PASS (or $DEMO_PASS)"
}

#######################
###Execute functions###
#######################

# Install the packages
horizon_install

# Edit the /etc/openstack-dashboard/local_settings.py file
horizon_config

# Restart installation
horizon_restart

# Horzion information
horizon_infomation