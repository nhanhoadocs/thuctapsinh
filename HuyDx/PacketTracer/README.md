# Cấu hình VLAN TRUNKING PROTOCOL(VTP) trên Packet Tracer #

## I. Sơ đồ bài lab và yêu cầu thực hiện: ##

![Imgur](https://i.imgur.com/xAbIUkF.png)

Địa chỉ IP và VLAN:
- VLAN 10: 192.168.10.0/24
- VLAN 20: 192.168.20.0/24

Địa chỉ IP của các PC kết nối đến Switch 1 và 2:
- Switch 1:
    - VLAN 10:
        - PC 0: 192.168.10.11/24
        - PC 1: 192.168.10.12/24
    - VLAN 20
        - PC 2: 192.168.20.11/24
- Switch 2:
    - VLAN 10:
        - PC 3: 192.168.10.13/24
    - VLAN 20:
        - PC 4: 192.168.20.12/24
## II. Gán địa chỉ IP cho các PC: ##
- Chọn PC0 rôi chọn tab *Desktop*

![Imgur](https://i.imgur.com/O5BKCIQ.png)

- Click vào IP Configuration

![Imgur](https://i.imgur.com/X0dHPh9.png)

- Điền địa chỉ *IP Address* cho **PC0**. Tương tự đó ta làm với những PC còn lại

## III. Thiết lập VLAN trên các Switch:

### 1. Đặt tên cho các Switch. ###

   Switch>enable
    Switch#configure terminal  
    Switch(config)#hostname S1  
    S1(config)# 

Tương tự bạn làm với bên Switch 2

## 2. Tạo VLAN10 và VLAN20 trên các Switch: ##

Ta sẽ thiết lập cho port Fa0/1 của Switch 1 (đang nối với PC0) vào VLAN có ID là 10:

    S1>enable  
    S1#configure terminal  
    S1(config)#vlan 10  
    S1(config-vlan)#name VLAN10  
    S1(config-vlan)#exit  
    S1(config)#interface fastEthernet 0/1  
    S1(config-if)#switchport access vlan 10  
    S1(config-if)#exit  

Kiểm tra trạng thái VLan ta dùng lệnh *show vlan:*  

    S1#show vlan

Tương tự ta thiết lập các cổng của PC 1,2,3,4 với các Switch tương ứng
Ta sẽ được kết quả như sau.  
*Switch 1(S1):*

    10   VLAN10                           active    Fa0/1, Fa0/2
    20   VLAN20                           active    Fa0/3

*Switch 2(S2):*

    10   VLAN10                           active    Fa0/2
    20   VLAN20                           active    Fa0/3

## IV. Thiết lập VLAN Trunking Protocol(VTP) ##

### 1. Đặt địa chỉ IP cho các interface VLAN trên các Switch ###

Gán địa chỉ IP cho interface VLAN10 của Switch 1 là ``192.168.10.1``

    S1>enable
    S1#configure terminal
    S1(config)#interface vlan 10
    S1(config-if)#ip address 192.168.10.1 255.255.255.0
    S1(config-if)#no shutdown
    S1(config-if)#exit

VLAN 20 của Switch 1 là ``192.168.20.1``

    S1>enable
    S1#configure terminal
    S1(config)#interface vlan 20
    S1(config-if)#ip address 192.168.20.1 255.255.255.0
    S1(config-if)#no shutdown
    S1(config-if)#exit

Gán địa chỉ IP cho interface VLAN10 của Switch 2 là ``192.168.10.2``

    S2>enable
    S2#configure terminal
    S2(config)#interface vlan 10
    S2(config-if)#ip address 192.168.10.2 255.255.255.0
    S2(config-if)#no shutdown
    S2(config-if)#exit

Tương tự với VLAN 20 Switch 2 là ``192.168.20.2``

    S2>enable
    S2#configure terminal
    S2(config)#interface vlan 20
    S2(config-if)#ip address 192.168.20.2 255.255.255.0
    S2(config-if)#no shutdown
    S2(config-if)#exit

### 2. Tạo VTP Server và VTP Client: ###
Ta sẽ thiết lập:
- Switch 1: VTP Server.
- Switch 2: VTP Client.

Sau đó ta đổi *VTP domain* thành **ABC** và *VTP password* là **123**

Trên *Switch 1*:

    S1#vlan database
    S1(vlan)#vtp server
    S1(vlan)#vtp domain ABC
    S1(vlan)#vtp password 123
Trên *Switch 2*:

    S2#vlan database
    S2(vlan)#vtp client
    S2(vlan)#vtp domain ABC
    S2(vlan)#vtp password 123

### 3. Tạo đường trunk từ Switch 1 tới Switch 2.

Ta sẽ bật trunking trên các port nối giữa 2 switch là *F0/4* của **S1** và *F0/1* của **S2**.

*Switch 1*:

    S1#configure terminal
    S1(config)#interface fastEthernet 0/4
    S1(config-if)#switchport mode trunk
    S1(config-if)#end

*Switch 2*:

    S2#configure terminal
    S2(config)#interface fastEthernet 0/1
    S2(config-if)#switchport mode trunk
    S2(config-if)#end
