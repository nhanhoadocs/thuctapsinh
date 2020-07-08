# Cấu hình bonding 2 interface mạng trên 1 server

Thêm cho server 2 card mạng cùng ở dải VLAN34

Kích hoạt bondng driver

    modprobe bonding

Kiểm tra driver bằng lệnh

    modinfo bonding

![alt](https://image.prntscr.com/image/E8HB2qeQTrO6gYPiG0IsDw.png)

**Bước 1:** Tạo bond interface

    nano /etc/sysconfig/network-scripts/ifcfg-bond0

Nội dung:

    DEVICE=bond0
    TYPE=Bond
    NAME=bond0
    BONDING_MASTER=yes
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=10.10.34.178
    NETMASK=255.255.255.0
    GATEWAY=10.10.34.1
    BONDING_OPTS="mode=5 miimon=100"
    DNS1=8.8.8.8
    DNS2=8.8.4.4

Mode 5 ở đây là load balancing. **Nhân Hòa chỉ dùng bonding mode 4.**

**Bước 2:** Sửa các interface mạng, ở đây 2 interface là `eth0` và `eth1`

    nano /etc/sysconfig/network-scripts/ifcfg-eth0

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=eth0
    ONBOOT=yes
    HWADDR="08:00:27:69:60:ceth09"
    MASTER=bond0
    SLAVE=yes

Và

    nano /etc/sysconfig/network-scripts/ifcfg-eth1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=eth1
    ONBOOT=yes
    HWADDR="08:00:27:ea:71:8d"
    MASTER=bond0
    SLAVE=yes

**Bước 3:** Khởi động lại dịch vụ mạng

    systemctl restart network

**Bước 4:** Kiểm tra

    ip a

![alt](https://image.prntscr.com/image/rroB1BZDRgGb5B90A1Flkw.png)

    cat /proc/net/bonding/bond0

![alt](https://image.prntscr.com/image/BWru2ubkTIaaSPdN_iAKVw.png)

**Bước 5:** Test. 

Tắt card mạng `eth1` đi

    ifdown eth1

![alt](https://image.prntscr.com/image/1VpnDNbARimQGz6lr53wPg.png)

Card `eth1` đã down nhưng vẫn ping được vào google.com

Tương tự với card `eth0`

    ifup eth1
    ifdown eth0

![alt](https://image.prntscr.com/image/gG4X1nkvRbCsTtLaYNkjWA.png)

Máy khác vẫn ping được đến địa chỉ 10.10.34.178

![alt](https://image.prntscr.com/image/Wa5h9DsKQ5qmyGrt19gwvw.png)

## Các mode bonding

![alt](https://image.prntscr.com/image/iBvg01MSQ7qqWHfq-am37Q.png)

**Mode 0:** Round Robin. Đấy là mode mặc định. Chuyển mạng theo thứ tự tuần tự slave 1 -> slave 2.

**Mode 1:** Active Backup. 1 card mạng active, 1 card mạng chờ. Nếu card active chết thì card chờ lên thay thế. Chỉ hỗ trợ môi trường x86

**Mode 2:** XOR [exclusive OR]. Địa chỉ MAC của card mạng slave được match với MAC của request đang đến. Khi kết nối được thành lập thì vẫn card mạng slave đó transmit/receive đến MAC đích.

**Mode 3:** Broadcast. Tất cả transmissions truyền đến tất cả slave

**Mode 4:** Dynamic Link Aggregation. Các card mạng hoạt động như một card mạng với thông lượng cao hơn, nhưng cũng cung cấp chuyển đổi dự phòng trong trường hợp một card mạng chết. Yêu cầu switch hỗ trợ IEEE 802.3ad.

**Mode 5:** Transmit Load Balancing (TLB). Lưu lượng được phân phối phụ thuộc vào tải hiện tại của các card mạng slave. Lưu lượng truy cập đến được nhận bởi slave hiện tại. Nếu slave hiện tại chết, slave khác sẽ lấy địa chỉ MAC của slave đã chết

**Mode 6:** Adaptive Load Balancing (ALB). Không yêu cầu switch có cấu hình cụ thể nào. Chỉ hỗ trợ môi trương x86. Các packet nhận được sẽ được cân bằng tải qua đàm phán ARP (ARP negotiation)

**Tham khảo:**

https://www.linuxtechi.com/configure-nic-bonding-in-centos-7-rhel-7/

https://www.thegeekdiary.com/what-are-the-network-bonding-modes-in-centos-rhel/