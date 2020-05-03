# Cấu hình Vlan Trunking Protocol (VTP) trên Cisco Packet Tracer

### [I. Yêu cầu và sơ đồ bài lab](#1)
### [II. Thiết lập địa chỉ IP cho các PC](#2)
### [III. Thiết lập VLAN trên các Switch](#3)
### [IV. Thiết lập VLAN Trunking Protocol(VTP)](#4)

# I. Yêu cầu và sơ đồ bài lab: <a name = "1"></a>
<img src = "https://i.imgur.com/qAfN33t.png">

Quy hoạch IP và VLAN:

- VLAN 10: `192.168.10.0/24`
- VLAN 20: `192.168.20.0/24`

Địa chỉ IP của các máy kết nối với Switch 1 và Switch 2:
- Switch 1: 
    - VLAN 10:
        - PC1:`192.168.10.11/24`
        - PC2:`192.168.10.12/24`
    - VLAN 20:
        - PC3:`192.168.20.11/24`
- Switch 2:
    - VLAN 10:
        - PC4:`192.168.10.13/24`
    - VLAN 20:
        - PC5:`192.168.20.12/24`

# II. Thiết lập địa chỉ IP cho các PC: <a name = "2"></a>
- Click chọn **PC1** -> Chọn tab *Destop*
<img src ="https://i.imgur.com/QrUgsoA.png">
- Chọn IP Configuration
<img src = "https://i.imgur.com/kBpJsa2.png">
- Điền địa chỉ *IP Address* cho **PC1**.
- Làm lần lượt trên các PC khác.

# III. Thiết lập VLAN trên các Switch:<a name = "3"></a>

## 1. Đặt tên cho Switch 1 và 2 là SW-1 và SW-2:

``` 
Switch>enable
Switch#configure terminal
Switch(config)#hostname SW-1
SW-1(config)#
```
## 2. Tạo VLAN10 và VLAN20 trên 2 Switch:
Mặc định, thì tất cả các cổng (*port*) trên switch đều nằm trong cùng VLAN có ID là 1 (VLAN 1). Nên chúng ta phải thiết lập cho *port Fa0/11* của Switch 1 (đang nối với PC1) vào VLAN có ID là 10:

```
SW-1>enable
SW-1#configure terminal
SW-1(config)#vlan 10
SW-1(config-vlan)#name VLAN10
SW-1(config-vlan)#exit
SW-1(config)#interface fastEthernet 0/11
SW-1(config-if)#switchport access vlan 10
SW-1(config-if)#exit
```

Để kiểm tra trạng thái các VLAN ta dùng lệnh *show vlan*:

```
SW-1#show vlan
```

Ta sẽ thấy VLAN 10 đã có cổng *Fa0/11* của PC1:
```
VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Fa0/1, Fa0/2, Fa0/3, Fa0/4, Fa0/5, Fa0/6, Fa0/7, Fa0/8 Fa0/9, Fa0/10, Fa0/12, Fa0/13, Fa0/14, Fa0/15, Fa0/16, Fa0/17 Fa0/18, Fa0/19, Fa0/20, Fa0/21,Fa0/22, Fa0/23, Fa0/24, Gig0/1, Gig0/2
10   VLAN10                           active    Fa0/11
1002 fddi-default                     active    
1003 token-ring-default               active    
1004 fddinet-default                  active    
1005 trnet-default                    active    
```

Tiếp tục thiết lập các cổng của các PC 2,3,4,5 với Switch tương ứng.

Ta được kết quả trên 2 Switch như sau.

*Switch 1:*
```
10   VLAN10                           active    Fa0/11, Fa0/12
20   VLAN20                           active    Fa0/13
```

*Switch 2:*
```
10   VLAN10                           active    Fa0/13
20   VLAN20                           active    Fa0/12
```

# IV. Thiết lập VLAN Trunking Protocol(VTP) <a name = "4"></a>
## 1. Đặt địa chỉ IP cho các interface VLAN trên các Switch
Đặt địa chỉ IP cho *interface VLAN10* của **Switch 1** là `192.168.10.1`
```
SW-1>enable
SW-1#configure terminal
SW-1(config)#interface vlan 10
SW-1(config-if)#ip address 192.168.10.1 255.255.255.0
SW-1(config-if)#no shutdown
SW-1(config-if)#exit
```

Tương tự làm với *VLAN20* của **Switch 1** là `192.168.20.1`
```
SW-1>enable
SW-1#configure terminal
SW-1(config)#interface vlan 20
SW-1(config-if)#ip address 192.168.20.1 255.255.255.0
SW-1(config-if)#no shutdown
SW-1(config-if)#exit
```

Sau đó đặt địa chỉ IP cho *interface VLAN 10* của **Switch 2** là `192.168.10.2`
```
SW-2>enable
SW-2#configure terminal
SW-2(config)#interface vlan 10
SW-2(config-if)#ip address 192.168.10.2 255.255.255.0
SW-2(config-if)#no shutdown
SW-2(config-if)#exit
```

Tương tự làm với *VLAN20* của **Switch 2** là `192.168.20.2`
```
SW-2>enable
SW-2#configure terminal
SW-2(config)#interface vlan 20
SW-2(config-if)#ip address 192.168.20.2 255.255.255.0
SW-2(config-if)#no shutdown
SW-2(config-if)#exit
```

## 2. Thiết lập VTP Server và VTP Client: 
Mặc định thì *Catalyst switch* sẽ được cấu hình làm **VTP Server**. Giờ ta sẽ thiết lập:
- *Switch 1*: VTP Server
- *Switch 2*: VTP CLient.

Ngoài ra, ta đổi *VTP domain* thành `ABC` và *VTP password* thành `123`.

Trên *Switch 1*:
```
SW-1#vlan database
SW-1(vlan)#vtp server
SW-1(vlan)#vtp domain ABC
SW-1(vlan)#vtp password 123
```

Trên *Switch 2*:
```
SW-1#vlan database
SW-1(vlan)#vtp client
SW-1(vlan)#vtp domain ABC
SW-1(vlan)#vtp password 123
```

## 3. Tạo đường trunk từ Switch 1 tới Switch 2.
Ta sẽ bật *trunking* trên các *port* nối giữa 2 switch là *Fa0/1* trên **SW1** và *Fa0/1* trên **SW2**.

*Switch 1*:
```
SW-1#configure terminal
SW-1(config)#interface fastEthernet 0/1
SW-1(config-if)#switchport mode trunk
SW-1(config-if)#end
```

*Switch 2*:
```
SW-2#configure terminal
SW-2(config)#interface fastEthernet 0/1
SW-2(config-if)#switchport mode trunk
SW-2(config-if)#end
```


## 4. Xem thông tin của VLAN mà SW2 cập nhật từ SW1:

*Tại Switch 2*: 

`
SW-2#show vlan
`

Để xem thông tin trạng thái làm việc của VTP:
`
SW-2#show vtp status
`
# Tổng kết

Bài viết dựa trên sự tìm hiểu về Vlan Trunking Protocol (VTP) của tôi.

Chắc chắn bài viết còn nhiều thiếu sót. Mong mọi người thông cảm và góp ý để bài viết của tôi được hoàn thiện hơn.

Xin chân thành cảm ơn !