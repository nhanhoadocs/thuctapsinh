# Cấu hình DHCP Vlan

- Ta có mô hình:
![img](https://scontent.fhan5-6.fna.fbcdn.net/v/t1.15752-9/61337972_2287625834892488_1510150878261149696_n.png?_nc_cat=105&_nc_oc=AQnSu-J8qC6NpzMDEfWNn9JJmNbU_2L7q2hJD5MA_sFrAnsTM0_wPLtZV4zS_-RVl4U&_nc_ht=scontent.fhan5-6.fna&oh=2824bcef1cb7890e6895ea2528f00617&oe=5D5C5E26)

- Đầu tiên ta vào router0:

        Router(config)#int fastEthernet 0/0
        Router(config)#ip address 192.168.1.1 255.255.255.0
        Router(config)#no shut
        Router(config)#exit
        Router(config)#int fastEthernet 0/0.2
        Router(config-subif)#encapsulation dot1Q 2
        Router(config-subif)#ip address 192.168.2.1 255.255.255.0
        Router(config-subif)#exit
        Router(config)#int fastEthernet 0/0.3
        Router(config-subif)#encapsulation dot1Q 3
        Router(config-subif)#ip address 192.168.3.1 255.255.255.0
        Router(config-subif)#exit
        Router(config)#int fastEthernet 0/0.4
        Router(config-subif)#encapsulation dot1Q 4
        Router(config-subif)#ip address 192.168.4.1 255.255.255.0
        Router(config-subif)#exit
        Router(config)#ip dhcp pool KT
        Router(dhcp-config)#network 192.168.2.0 255.255.255.0
        Router(dhcp-config)#default-router 192.168.2.1
         Router(dhcp-config)#dns-server 0.0.0.0
        Router(dhcp-config)#exit
        Router(config)#ip dhcp pool HC 
        Router(dhcp-config)#network 192.168.3.0 255.255.255.0
        Router(dhcp-config)#default-router 192.168.3.1
        Router(dhcp-config)#dns-server 0.0.0.0
        Router(dhcp-config)#exit
        Router(config)#ip dhcp pool QL
        Router(dhcp-config)#network 192.168.4.0 255.255.255.0
        Router(dhcp-config)#default-router 192.168.4.1
        Router(dhcp-config)#dns-server 0.0.0.0
        Router(dhcp-config)#exit

- Trên switch0:

        Switch(config)#vlan 2
        Switch(config-vlan)#name KT
        Switch(config-vlan)#name 3
        Switch(config-vlan)#name KT
        Switch(config-vlan)#vlan 3
        Switch(config-vlan)#name HC
        Switch(config-vlan)#vlan 4
        Switch(config-vlan)#name QL
        Switch(config-vlan)#ex
        Switch(config)#int range fastEthernet 0/1-4
        Switch(config-if-range)#switchport mode trunk 
        Switch(config-if-range)#switchport trunk allowed vlan all 
        Switch(config-if-range)#ex
        Switch(config)#vtp version 2
        Switch(config)#vtp domain nhanhoa
        Switch(config)#vtp password 123
        Switch(config)#vtp mode server

- Trên switch1:

        Switch(config)#vlan 2
        Switch(config-vlan)#name KT
        Switch(config-vlan)#name 3
        Switch(config-vlan)#name KT
        Switch(config-vlan)#vlan 3
        Switch(config-vlan)#name HC
        Switch(config-vlan)#vlan 4
        Switch(config-vlan)#name QL
        Switch(config-vlan)#ex
        Switch(config)#int fastEthernet 0/1
        Switch(config-if)#switchport mode trunk 
        Switch(config-if)#switchport trunk allowed vlan all
        Switch(config-vlan)#ex
        Switch(config)#int range fastEthernet 0/2-3
        Switch(config-if-range)#switchport access vlan 2

- Trên switch2:

        Switch(config)#vlan 2
        Switch(config-vlan)#name KT
        Switch(config-vlan)#name 3
        Switch(config-vlan)#name KT
        Switch(config-vlan)#vlan 3
        Switch(config-vlan)#name HC
        Switch(config-vlan)#vlan 4
        Switch(config-vlan)#name QL
        Switch(config-vlan)#ex
        Switch(config)#int fastEthernet 0/1
        Switch(config-if)#switchport mode trunk 
        Switch(config-if)#switchport trunk allowed vlan all
        Switch(config-vlan)#ex
        Switch(config)#int fastEthernet 0/2
        Switch(config-if-range)#switchport access vlan 3

- Trên switch3:

        Switch(config)#vlan 2
        Switch(config-vlan)#name KT
        Switch(config-vlan)#name 3
        Switch(config-vlan)#name KT
        Switch(config-vlan)#vlan 3
        Switch(config-vlan)#name HC
        Switch(config-vlan)#vlan 4
        Switch(config-vlan)#name QL
        Switch(config-vlan)#ex
        Switch(config)#int fastEthernet 0/1
        Switch(config-if)#switchport mode trunk 
        Switch(config-if)#switchport trunk allowed vlan all
        Switch(config-vlan)#ex
        Switch(config)#int fastEthernet 0/2
        Switch(config-if-range)#switchport access vlan 4
        
# END