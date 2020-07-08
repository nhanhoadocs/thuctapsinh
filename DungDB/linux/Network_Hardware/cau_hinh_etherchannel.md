# Cấu hình etherchannel

Cấu hình bonding trên server từ trước. Bond interface em1 và em3. Bond mode 4. IP 172.16.2.222/20

Cấu hình như sau:

Kích hoạt bondng driver

    modprobe bonding

Kiểm tra driver bằng lệnh

    modinfo bonding

Tạo interface `bond0`

    nano /etc/sysconfig/network-scripts/ifcfg-bond0

    DEVICE=bond0
    TYPE=Bond
    NAME=bond0
    BONDING_MASTER=yes
    BOOTPROTO=static   
    ONBOOT=yes
    IPADDR=172.16.2.222
    NETMASK=255.255.240.0
    BONDING_OPTS="mode=4 miimon=100 lacp_rate=1"
    NMCONTROLLED=no

Card `em1`

    nano /etc/sysconfig/network-scripts/ifcfg-em1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=em1
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes
    NMCONTROLLED=no

Card `em3`

    nano /etc/sysconfig/network-scripts/ifcfg-em3

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=em3
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes
    NMCONTROLLED=no

Khởi động lại dịch vụ mạng

    systemctl restart network

Kiểm tra bằng

    ip a

Hoặc 

    cat /proc/net/bonding/bond0

## Cấu hình etherchannel trên switch cisco castalyst 2960

Chỉ sử dụng LACP

    Sw0(config)#int range F0/0-1
    Sw0(config-if-range)#channel-protocol lacp
    Sw0(config-if-range)#channel-group 1 mode active
    SW0(config-if-range)#no shut
    Sw0(config-if-range)#ex

    Sw0#show etherchannel summary

![Imgur](https://i.imgur.com/oQZKQrU.png)

Nối 2 dây mạng vào 2 interface đã bond vào port F0/1 và F0/2 của SW. Nối thêm 1 dây vào laptop để test.

Ping từ laptop sang IP bond0. 

    ping -t 172.16.2.222

Rút thử dây F0/1. Vẫn ping được. Cắm lại F0/1 và rút thử dây F0/2. Nếu vẫn ping được là OK.

## Cấu hình etherchannel trên switch stack cisco castalyst 3750G

2 Con SW phải có cấu hình giống nhau. Khởi động cả 2 SW và kết nối dây stack chéo nhau.

Các bước kết nối:

Bật SW1 -> Nối dây stack -> Bật SW2 (Lý thuyết)

Thực tế khi lab: Khởi động cùng lúc cả 2 SW.

Khi khởi động, 2 SW sẽ tự bầu cử xem SW nào là Master

Nối dây console vào 1 SW và gõ lệnh:

    SW1#show switch

![Imgur](https://i.imgur.com/5IpShCm.png)

**Thao tác trên SW2 (Master):** 

Xem tên, trạng thái các port trên SW:

    show ip int brief

Cấu hình etherchannel

    SW2#conf t
    SW2(config)#int g1/0/1
    SW2(config-if)#channel-group 2 mode on
    SW2(config-if)#no shut
    SW2(config-if)#exit
    SW2(config)#int g2/0/1
    SW2(config-if)#channel-group 2 mode on
    SW2(config-if)#no shut
    SW2(config-if)#exit

    SW2#show etherchannel sum

    Group  Port-channel  Protocol    Ports
    ------+-------------+-----------+-----------------------------------------------
    1      Po1(SU)         LACP      Gi1/0/1(D)    Gi2/0/1(D)

Nối 2 dây mạng đã cấu hình bonding vào 2 port trên. Kết nối thêm 1 dây vào laptop, set IP cho laptop cùng dải mạng với IP của server. Test bằng cách ping đến server từ laptop.

Ping từ laptop sang IP bond0. 

    ping -t 172.16.2.222

Rút dây ở port G1/0/1, nếu vẫn ping được là OK.

Cắm lại port G1/0/2, rút dây ở port G2/0/1. Nếu vẫn ping được là OK.

**Lưu ý:** Khi rút dây mạng ở switch stack sẽ có vài giây time out. Khi chỉ dùng 1 SW sẽ ít gặp hiện tượng này.

![Imgur](https://i.imgur.com/lpJ3RfH.png)

Chỉ có thể dùng LACP ở trường hợp này. Không thể dùng PAGP vì tất cả các port trong channel PAGP phải nằm trên cùng một switch.

    %With PAgP enabled, all ports in the Channel should belong to the same switch
    Command rejected (Port-channel3, Gi2/0/20): Invalid etherchnl mode

Nhớ lưu cấu hình sau khi cấu hình xong

    SW2#copy running-config startup-config

**Tham khảo:** https://itforvn.com/tu-hoc-ccna-lab-7-cau-hinh-etherchannel/

https://community.cisco.com/t5/networking-documents/how-to-configure-cross-stack-etherchannel-on-cisco-catalyst-3750/ta-p/3128099#:~:text=The%20EtherChannel%20on%20multiple%20switches,is%20called%20cross%2Dstack%20EtherChannel.&text=within%20the%20EtherChannel.,EtherChannel%2C%20and%20the%20failed%20link.&text=link%20of%20the%20EtherChannel.