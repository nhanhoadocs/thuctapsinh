#### NETWORK INTERFACE  
Mục lục  
[Network interface](#1)  
[Bảng định tuyến](#2)  
[Liệt kê thông tin bảng định tuyến](#3)  
[Thêm route vào routing table](#4)  
[Xóa route khỏi routing table](#5)  
[Reject route](#6)  
[Thêm default gateway route](#7)
<a name="1"></a>

**Network interface**  
Giao diện mạng (network interface) là kênh kết nối giữa thiết bị và mạng. Về mặt vật lý, nó có thể tiến hành thông qua card mạng (NIC) hoặc được triển khai trừu tượng hơn là các phần mềm. Nhiều giao diện mạng có thể hoạt động cùng một lúc. Các giao diện mạng có thể được up (kích hoạt) hoặc down (khử kích hoạt) bất cứ lúc nào.   
Lệnh `ifconfig` để hiển thị danh sách các giao diện mạng.  
Để đảm bảo được các giao diện mạng chính xác thì ta cần phải sử dụng đến các tập tin cấu hình mạng.  
Vị trí tệp cấu hình mạng ở các phiên bản Linux:  
**Debian**: `/etc/network/interfaces`  
**Red Hat**: `/etc/sysconfig/network`  
Kịch bản cấu hình giao diện mạng cho eth0 được đặt tại `/etc/sysconfig/network-scripts/ifcfg-eth0` .  
**SUSE**: `/etc/sysconfig/network`  

Sử dụng lệnh `ip` để xem thông tin:  
```
# ip addr show  
# ip route show
```

<a name="2"></a>  

**Bảng định tuyến**  
Lệnh `route` được dùng để xem và thay đổi bảng định tuyến.  
Khi bạn gõ `route` mà hệ thống báo lỗi `bass: route: command not found` thì ta cần phải tiến hành cài đặt bộ công cụ *net-tools*.   
Gõ lệnh sau để cài đặt:
```
# yum install net-tools
```
Tiếp theo bạn có thể thêm, xóa hoặc sửa đổi trong bảng định tuyến.    
<a name="3"></a>

**Liệt kê thông tin bảng định tuyến**

Xem bảng định tuyến ta sẽ dùng lệnh:  
```
# route -n    
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.152.2   0.0.0.0         UG    100    0        0 ens33
192.168.152.0   0.0.0.0         255.255.255.0   U     100    0        0 ens33
```
*Lưu ý*: Các giá trị của trường *Flags*:
 U - route đang up   
 H - đối tượng là `host`  
 G - sử dụng route này là route gateway  
 R - routing động  
 D - routing động tạo ra bởi một dịch vụ  
 M - được chỉnh sửa bởi một dịch vụ 
 A - được cài đặt bởi addrconf  
 C - cache entry  
 ! - route bị từ chối (*reject*)  
   
<a name="4"></a>

**Thêm route vào routing table**  
Lệnh `route` trên Linux cung cấp chức năng với 2 cấu trúc cơ bản gồm:  
-Thêm route tĩnh với 1 network  
-Thêm route tĩnh với 1 host cụ thể.  

 - Thêm route với một network    
Cú pháp lệnh:  
 #route add -net{network address}/{subnet} gw {IP gateway} {Interace-name}  
 Sau đó ta kiểm tra route đã được thêm vào bảng định tuyến hay chưa.  
 Ví dụ: 
 ```
 # route add 192.168.10.0/24 gw 192.168.152.2
 ```
 <img src="https://i.imgur.com/uRolDrp.png">  

- Thêm route với một *host* cụ thể:  
Cú pháp lệnh:
#route add -host{ip address} gw {IP gateway} {Interace-name}  

 Ví dụ: 
 ```
# route add -host 192.168.1.5/24 gw 192.168.1.1 eth0
 ```

 <a name="5"></a>

**Xóa route khỏi routing table**
- Xóa route của một network: 
```
route del -net{network address}/{subnet} gw {IP gateway} {Interace-name}  
```
- Xóa route của một host:   
```
route del -host{ip address} gw {IP gateway} {Interace-name}
```
<a name="6"></a>

**Reject route**  
Khi ta muốn khóa khả năng tìm kiếm 1 route, tức là khi kernel tìm cho route địa chi IP hoặc network đó thì sẽ thất bại, ta sử dụng lệnh:  
```
# route add -net{network address}/{subnet} reject 
# route add -host{ip address} reject
```
<a name="7"></a>

**Thêm default gateway route**  
Cú pháp:  
```
# route add default gateway {ip address} {interface-name}
```
Chú thích:  
{ip address} - địa chỉ IP của router gateway  
{interface-name} - địa chỉ cổng card mạng sẽ đi ra ngoài đến router gateway.  
