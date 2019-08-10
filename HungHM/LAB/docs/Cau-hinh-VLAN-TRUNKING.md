 <a name ="Cấu hình Vlan Trungking">
 
 # Chia VLAN 
## Mô hình  


![topo](../images/Vlan/topo.png)

- Để thực hiện cấu hình Vlan chúng ta thực hiện các bước sau đây :  
+Đầu tiên cấu hình Vlan trên cả 2 con switch.  

Cấu hình như sau :
```
Switch(config)#vlan 20
Switch(config-vlan)#name PKT // Đặt tên cho Vlan đó
Switch(config-vlan)#vlan 10
Switch(config-vlan)#name PNS
Switch(config-vlan)#vlan 30
Switch(config-vlan)#name PKTOAN
Switch(config-vlan)#vlan 99
Switch(config-vlan)#name management
Switch(config-vlan)#exit
Switch(config)#hostname SW2
SW2(config)#end
```
 - Gán port cho các Vlan:
 ```
 SW1(config)#interface range f0/6-10
SW1(config-if-range)#switchport mode access 
SW1(config-if-range)#switchport access vlan 30
SW1(config-if-range)#exit

SW1(config)#interface range f0/11-17
SW1(config-if-range)#switchport mode access 
SW1(config-if-range)#switchport access vlan 10
SW1(config-if-range)#exit

SW1(config)#interface  range f0/18-24
SW1(config-if-range)#switchport mode access 
SW1(config-if-range)#switchport access vlan 20
SW1(config-if-range)#exit

SW1(config)#interface  range f0/1-5
SW1(config-if-range)#switchport mode access 
SW1(config-if-range)#switchport access vlan 99
SW1(config-if-range)#

 ```