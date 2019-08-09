# Cấu hình EtherChannel 

### SW1 
enable  
conf t  
hostname SW1  
enable secret viethung  
service password-encryption  
line console 0   
pass viethung  
loggin synchrounos  
exit  
line vty 0 4  
pass viethung  
login  
exit  
banner motd "XIN CHAO"  
### SW2
enable   
conf t  
hostname SW2  
enable secret viethung  
service password-encryption  
line console 0  
pass viethung  
loggin synchrounos  
exit  
line vty 0 4  
pass viethung  
login  
exit    
### SW3  
enable   
conf t  
hosttname SW3  
enable secret viethung  
service password-encryption  
line console 0  
pass viethung  
loggin synchrounos  
exit  
line vty 0 4  
pass viethung  
login    
exit  
banner motd "XIN CHAO"  
### SW1
interface range fastethernet 0/1-24  
shutdown  
exit  
### SW2  
interface range fastethernet 0/1-24  
shutdown  
exit  
### SW3  
interface range fastethernet 0/1-24  
shutdown  
exit 
### SW1
vlan 10  
name Staff  
exit  
vlan 99  
name Manage  
exit  
### SW2
vlan 10  
name Staff   
exit  
vlan 99   
name Manage   
exit  
### SW3 
vlan 10  
name Staff  
exit  
vlan 99  
name Manage  
exit  
### SW1
interface vlan 99  
ip add 192.168.99.11 255.255.255.0  
ex  
### SW2
interface vlan 99   
ip add 192.168.99.12 255.255.255.0  
ex  
### SW3   
interface vlan 99   
ip add 192.168.99.13 255.255.255.0  
ex  
### SW1  
interface fastethernet 0/6  
switchport mode access   
switch port access vlan 10  
no shutdown  
ex  
### SW2
interface fastethernet 0/18  
switchport mode access  
switchport access vlan 10  
no shutdown  
ex  
### SW3 
interface fastethernet 0/18  
switchport mode access  
switchport access vlan 10  
no shutdown  
ex    
#### Gán ip cho pc và server  
pc1: 192.168.10.1  
pc2: 192.168.10.2  
pc3: 192.168.10.3  
#### Cấu hình PAgP trên SW1 và 3  
### SW1   
interface range fastethernet 0/3-4  
channel-group 1 mode desirabble   
no shutdown  
ex  
### SW3  
interface range fastethernet 0/3-4  
channel-group 1 mode auto  
no shutdown  
ex    
### SW1 
interface port-channel 1  
switchport mode trunk  
switchport trunk native vlan 99  
ex  
### SW3  
interface port-channel 1  
switchport mode trunk  
switchport trunk native vlan 99  
ex  

#### Cấu hình LACP trên SW1 và 3
### SW1  
interface range fastethernet 0/1-2  
switchport mode trunk  
switchport trunk native vlan 99  
channel-group 2 mode active   
no shutdown   
exit  
### SW2   
interface range fastethernet 0/1-2  
switchport mode trunk  
switchport native vlan 99  
channel-group 2 mode active  
no shutdown  
ex  
### SW2 
interface range fastethernet 0/3-4  
switchport mode trunk   
switchport trunk native vlan 99  
channel-group 3 mode active  
no shutdown  
ex 
### SW3   
interface range fastethernet 0/1-2  
switchport mode trunk  
switchport trunk native vlan 99  
channel-group 3 modde active   
no shutdown  
ex   