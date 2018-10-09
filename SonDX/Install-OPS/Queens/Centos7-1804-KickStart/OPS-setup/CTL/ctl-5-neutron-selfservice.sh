#!/bin/bash
# Author Son Do Xuan

source ../function.sh
source ../config.sh

# Function create database for Neutron
neutron_create_db () {
	echocolor "Create database for Neutron"
	sleep 3

	cat << EOF | mysql
CREATE DATABASE neutron;
GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' \
IDENTIFIED BY '$NEUTRON_DBPASS';
GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' \
IDENTIFIED BY '$NEUTRON_DBPASS';
GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'$CTL_MGNT_IP' \
IDENTIFIED BY '$NEUTRON_DBPASS';
EOF
}

# Function create the neutron service credentials
neutron_create_info () {
	echocolor "Set environment variable for admin user"
	source /root/admin-openrc
	echocolor "Create the neutron service credentials"
	sleep 3

	openstack user create --domain default --password $NEUTRON_PASS neutron
	openstack role add --project service --user neutron admin
	openstack service create --name neutron \
	  --description "OpenStack Networking" network
	openstack endpoint create --region RegionOne \
	  network public http://$HOST_CTL:9696
	openstack endpoint create --region RegionOne \
	  network internal http://$HOST_CTL:9696
	openstack endpoint create --region RegionOne \
	  network admin http://$HOST_CTL:9696
}

# Function install the components
neutron_install () {
	echocolor "Install the components"
	sleep 3
	
	yum install openstack-neutron openstack-neutron-ml2 \
	openstack-neutron-openvswitch ebtables -y
	
	systemctl restart openvswitch
}

# Function configure the server component
neutron_config_server_component () { 
	echocolor "Configure the server component"
	sleep 3
	neutronfile=/etc/neutron/neutron.conf
	neutronfilebak=/etc/neutron/neutron.conf.bak
	cp $neutronfile $neutronfilebak
	egrep -v "^$|^#" $neutronfilebak > $neutronfile

	ops_add $neutronfile database \
		connection mysql+pymysql://neutron:$NEUTRON_DBPASS@$HOST_CTL/neutron

	ops_add $neutronfile DEFAULT \
		core_plugin ml2
	ops_add $neutronfile DEFAULT \
		service_plugins router
	ops_add $neutronfile DEFAULT \
		allow_overlapping_ips true

	ops_add $neutronfile DEFAULT \
		transport_url rabbit://openstack:$RABBIT_PASS@$HOST_CTL

	ops_add $neutronfile DEFAULT \
		auth_strategy keystone
	ops_add $neutronfile keystone_authtoken \
		auth_uri http://$HOST_CTL:5000
	ops_add $neutronfile keystone_authtoken \
		auth_url http://$HOST_CTL:5000
	ops_add $neutronfile keystone_authtoken \
		memcached_servers $HOST_CTL:11211
	ops_add $neutronfile keystone_authtoken \
		auth_type password
	ops_add $neutronfile keystone_authtoken \
		project_domain_name default
	ops_add $neutronfile keystone_authtoken \
		user_domain_name default
	ops_add $neutronfile keystone_authtoken \
		project_name service
	ops_add $neutronfile keystone_authtoken \
		username neutron
	ops_add $neutronfile keystone_authtoken \
		password $NEUTRON_PASS

	ops_add $neutronfile DEFAULT \
		notify_nova_on_port_status_changes true
	ops_add $neutronfile DEFAULT \
		notify_nova_on_port_data_changes true
	ops_add $neutronfile nova \
		auth_url http://$HOST_CTL:5000
	ops_add $neutronfile nova \
		auth_type password
	ops_add $neutronfile nova \
		project_domain_name default
	ops_add $neutronfile nova \
		user_domain_name default
	ops_add $neutronfile nova \
		region_name RegionOne
	ops_add $neutronfile nova \
		project_name service
	ops_add $neutronfile nova \
		username nova
	ops_add $neutronfile nova \
		password $NOVA_PASS
	
	ops_add $neutronfile oslo_concurrency \
		lock_path /var/lib/neutron/tmp
}

# Function configure the Modular Layer 2 (ML2) plug-in
neutron_config_ml2 () {
	echocolor "Configure the Modular Layer 2 (ML2) plug-in"
	sleep 3
	ml2file=/etc/neutron/plugins/ml2/ml2_conf.ini
	ml2filebak=/etc/neutron/plugins/ml2/ml2_conf.ini.bak
	cp $ml2file $ml2filebak
	egrep -v "^$|^#" $ml2filebak > $ml2file

	ops_add $ml2file ml2 type_drivers flat,vlan,vxlan
	ops_add $ml2file ml2 tenant_network_types vxlan
	ops_add $ml2file ml2 mechanism_drivers openvswitch,l2population
	ops_add $ml2file ml2 extension_drivers port_security
	ops_add $ml2file ml2_type_flat flat_networks provider
	ops_add $ml2file ml2_type_vlan network_vlan_ranges provider
	ops_add $ml2file ml2_type_vxlan vni_ranges 1:1000
	ops_add $ml2file securitygroup enable_ipset true
}

# Function configure the Open vSwitch agent
neutron_config_ovs () {
	echocolor "Configure the Open vSwitch agent"
	sleep 3
	ovsfile=/etc/neutron/plugins/ml2/openvswitch_agent.ini
	ovsfilebak=/etc/neutron/plugins/ml2/openvswitch_agent.ini.bak
	cp $ovsfile $ovsfilebak
	egrep -v "^$|^#" $ovsfilebak > $ovsfile
	
	ops_add $ovsfile agent tunnel_types vxlan
	ops_add $ovsfile agent l2_population True

	ops_add $ovsfile ovs bridge_mappings provider:br-provider
	ops_add $ovsfile ovs local_ip $CTL_DATAVM_IP
	
	ops_add $ovsfile securitygroup firewall_driver iptables_hybrid
}

# Function configure the L3 agent
neutron_config_l3 () {
	echocolor "Configure the L3 agent"
	l3file=/etc/neutron/l3_agent.ini
	l3filebak=/etc/neutron/l3_agent.ini.bak
	cp $l3file $l3filebak
	egrep -v "^$|^#" $l3filebak > $l3file
	ops_add $l3file DEFAULT interface_driver openvswitch
	ops_add $l3file DEFAULT external_network_bridge
}

# Function configure the DHCP agent
neutron_config_dhcp () {
	echocolor "Configure the DHCP agent"
	sleep 3
	dhcpfile=/etc/neutron/dhcp_agent.ini
	dhcpfilebak=/etc/neutron/dhcp_agent.ini.bak
	cp $dhcpfile $dhcpfilebak
	egrep -v "^$|^#" $dhcpfilebak > $dhcpfile

	ops_add $dhcpfile DEFAULT interface_driver openvswitch
	ops_add $dhcpfile DEFAULT enable_isolated_metadata true
	ops_add $dhcpfile DEFAULT force_metadata True
}

# Function configure things relation
neutron_config_relation () {
	ovs-vsctl add-br br-provider
	ovs-vsctl add-port br-provider $CTL_EXT_IF
	ip a flush $CTL_EXT_IF
	ip a add $CTL_EXT_IP/$PREFIX_EXT dev br-provider
	ip link set br-provider up
	

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$CTL_EXT_IF
# DEVICE=$CTL_EXT_IF
# BOOTPROTO=none
# ONBOOT=yes
# IPADDR=$CTL_EXT_IP
# NETMASK=$CTL_EXT_NETMASK
# DEFROUTE=no


DEVICE=$CTL_EXT_IF
ONBOOT=yes
DEVICETYPE=ovs
TYPE=OVSPort
OVS_BRIDGE=br-provider
BOOTPROTO=none
EOF
	
	touch /etc/sysconfig/network-scripts/ifcfg-br-provider
	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-br-provider
DEVICE=br-provider
ONBOOT=yes
DEVICETYPE=ovs
TYPE=OVSBridge
BOOTPROTO=none
EOF

	touch /sbin/ifup-local
	chmod +x /sbin/ifup-local
	cat << EOF > /sbin/ifup-local
if [[ "\$1" == "$CTL_EXT_IF" ]]
then
	ip a add $CTL_EXT_IP/$PREFIX_EXT dev br-provider
fi
EOF
}

# Function configure the metadata agent
neutron_config_metadata () {
	echocolor "Configure the metadata agent"
	sleep 3
	metadatafile=/etc/neutron/metadata_agent.ini
	metadatafilebak=/etc/neutron/metadata_agent.ini.bak
	cp $metadatafile $metadatafilebak
	egrep -v "^$|^#" $metadatafilebak > $metadatafile

	ops_add $metadatafile DEFAULT nova_metadata_ip $HOST_CTL
	ops_add $metadatafile DEFAULT metadata_proxy_shared_secret $METADATA_SECRET
}


# Function configure the Compute service to use the Networking service
neutron_config_compute_use_network () {
	echocolor "Configure the Compute service to use the Networking service"
	sleep 3
	novafile=/etc/nova/nova.conf

	ops_add $novafile neutron url http://$HOST_CTL:9696
	ops_add $novafile neutron auth_url http://$HOST_CTL:5000
	ops_add $novafile neutron auth_type password
	ops_add $novafile neutron project_domain_name default
	ops_add $novafile neutron user_domain_name default
	ops_add $novafile neutron region_name RegionOne
	ops_add $novafile neutron project_name service
	ops_add $novafile neutron username neutron
	ops_add $novafile neutron password $NEUTRON_PASS
	ops_add $novafile neutron service_metadata_proxy true
	ops_add $novafile neutron metadata_proxy_shared_secret $METADATA_SECRET
}

# Function populate the database
neutron_populate_db () {
	echocolor "Populate the database"
	sleep 3
	
	ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini
	
	su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf \
	  --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head" neutron
}

# Function restart installation
neutron_restart () {
	systemctl restart openstack-nova-api.service

	systemctl enable neutron-server.service \
	neutron-openvswitch-agent.service neutron-dhcp-agent.service \
	neutron-metadata-agent.service

	systemctl start neutron-server.service \
	neutron-openvswitch-agent.service neutron-dhcp-agent.service \
	neutron-metadata-agent.service

	systemctl enable neutron-l3-agent.service
	systemctl start neutron-l3-agent.service
}

#######################
###Execute functions###
#######################

# Create database for Neutron
neutron_create_db

# Create the neutron service credentials
neutron_create_info

# Install the components
neutron_install

# Configure the server component
neutron_config_server_component

# Configure the Modular Layer 2 (ML2) plug-in
neutron_config_ml2

# Configure the Open vSwitch agent
neutron_config_ovs

# Configure the L3 agent
neutron_config_l3
	
# Configure the DHCP agent
neutron_config_dhcp

# Configure things relation
neutron_config_relation

# Configure the metadata agent
neutron_config_metadata

# Configure the Compute service to use the Networking service
neutron_config_compute_use_network

# Populate the database
neutron_populate_db

# Function restart installation
neutron_restart