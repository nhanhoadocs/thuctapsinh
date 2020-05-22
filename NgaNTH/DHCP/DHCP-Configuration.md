### Cấu hình DHCP Server  
Mục luc:  
1. [Chuẩn bị](#1)  
2. [Cấu hình trên server](#2)
3. [Cấu hình trên client](#3)
4. [Phân tích cơ chế DHCP bằng lệnh tcpdum](#4)  

<a name="1"></a>
### Chuẩn bị:  
Trên VMWare Workstation dựng 2 máy, 1 máy chủ server CentOS 7_1 và 1 máy client CentOS 7_2.   
Ý tưởng:  
Ta sẽ tiến hành cấu hình DHCP server trên máy chủ và máy client sẽ nhận địa chỉ IP động do máy chủ cấp phát. 
Trên máy server cài 2 card mạng, 1 card để chế độ `NAT` (ens33) để máy ping ra internet bên ngoài và 1 card là `Host-only` (ens37) để giao tiếp với các máy ảo. 
  

### Tiến hành:  

Mở Vitual Network Editor trên VMWare Workstation. Ở đây tôi chọn Card VNnet2 ở chế độ Host-only và sẽ tắt DHCP của nó đi bằng cách vào `Change Settings` và bỏ dấu tích ở phần `Use local DHCP service to distribute IP address to VMs`.  

<img src="https://i.imgur.com/fc0J2Oo.png">

<a name="2"></a>
**Cấu hình trên server**   

1. Đặt địa chỉ IP tĩnh cho server   

Kiểm tra lúc này trên máy có những interface nào bằng lệnh `nmcli dev status` thì ta sẽ thấy interface `ens33` được gắn 1 địa chỉ IP động do DHCP cấp phát còn interface `ens37` chưa có địa chỉ IP. Ta tiến hành cấu hình địa chỉ IP tĩnh cho nó bằng lệnh `nmcli`.  
```
# nmcli con modify ens37 ipv4.addresses 192.168.40.250/24  
# nmcli con modify ens37 ipv4.method manual
# nmcli con modify ens37 connection.autoconnect yes
```  

Lưu ý: ta không cấu hình địa chỉ IP gateway nữa vì đã có IP gateway ở interface ens33 do DHCP cấp rồi.

2. Cài đặt dhcp trên máy chủ  

```
# yum install -y dhcp
```  
3. Cấu hình dhcp server bằng cách chỉnh sửa file `/etc/dhcp/dhcpd.conf`.  

```
option domain-name "mydomain.org";
option domain-name-servers ns1.mydomain.org, ns2.mydomain.org;
lease-file-name "/var/lib/dhcpd/dhcpd.leases";
default-lease-time 600;
max-lease-time 7200;

subnet 192.168.40.0 netmask 255.255.255.0 {
  range 192.168.40.10 192.168.40.100;
  option domain-name-servers ns1.internal.mydomain.org;
  option domain-name "internal.mydomain.org";
  option routers 192.168.40.1;
  option broadcast-address 192.168.40.255;
  default-lease-time 600;
  max-lease-time 7200;
}

```
Ở đây: 
- Cấu hình toàn cục (global) cho DHCP server
    - option domain-name: khai báo tên miền lớp mạng chung.
    - option domain-name-servers: khai báo tên server của domain bạn đã cung cấp ở trên.
    - lease-file-name: chỉ định file chứa thông tin IP đã được cấp phát qua DHCP.
    - default-lease-time: thời gian tồn tại mặc định của IP DHCP cấp phát cho người dùng.
    - max-lease-time: thời gian tồn tại tối đa mà địa chỉ IP DHCP cấp phát cho người dùng. 

- Cấu hình cục bộ (local) cho DHCP server  
    - range <ip_1> <ip_2>: dải ip mà máy chủ cấp phát động.  
    - option domain-name-servers: cung cấp thông tin DNS của server cho client.
    - option domain-name: tên miền của server
    - option routers: thông tin địa chỉ IP của router gateway mà client sẽ sử dụng khi nhận IP DHCP. 
    - option broadcast-address: thông tin broadcast của lớp mạng mà client sẽ nhận IP sử dụng.
    - default-lease-time:  
    - max-lease-time:  

Sau khi chỉnh sửa file cấu hình, cần khởi động lại bằng lệnh restart  
```
# systemctl restart dhcpd
```  
4. Lease Database  

Khi DHCP gán IP cho 1 client nào đó, DHCP Server sẽ ghi nhận lại các IP mà nó đã gán cho các host vào lease database file, ta có thể xem chi tiết tại:
```
# cat /var/lib/dhcpd/dhcpd.leases
```
*Lưu ý chung:*  
- Lease database sẽ được tái tạo lại thường xuyên để kích thước file không quá lớn.  
- Không tự ý xóa và tạo file mới. trước khi thay đổi nên tạo backup. 
- Nếu khởi động dịch vụ DHCP thất bại, nguyên nhân có thể do file dhcpd.lease không tồn tại. Tạo file này bằng lệnh sau:  
```
# touch /var/lib/dhcpd/dhcpd.lease
```  
- Trường hợp Server có nhiều network interfaces, một interface được cấu hình làm dhcp client nhận Public IP address để ra Internet, interface còn lại ta cấu hình (cho mạng nội bộ đứng sau firewall) nhận request từ local client bằng cách thêm dòng sau vào file `/etc/sysconfig/dhcpd`:
```
DHCPDARGS=interface_name
```
Ở đây tôi chọn gắn vào `ens37` trên máy của tôi. 

<img src="https://i.imgur.com/GdFrLvN.png">

5.  Khởi động DHCP server và set rule firewall.  

- Bây giờ ta sẽ khởi động dịch vụ dhcp trên server:  
```
# systemctl start dhcpd
```  
Nếu đang chạy Firewalld, hãy cho phép dịch vụ DHCP. DHCP Server sử dụng port 67/UDP
```
# firewall-cmd --add-service=dhcp --permanent 
success
# firewall-cmd --reload 
success
```

Kiểm tra xem tiến trình dịch vụ dhcpd có đang chạy trên hệ thống không bằng lệnh `ps`. 

<img src="https://i.imgur.com/2ELDmDj.png">

<a name="3"></a>
**Cấu hình máy client**  
Trước tiên bạn cần xác định chính xác card mạng nào đang nằm cùng lớp mạng thiết bị hay VLAN với server cấp IP DHCP. Giả sử trên máy client tôi sử dụng card mạng Host-only ens37 để nhận địa chỉ IP do máy server cấp. Khi đó tôi sẽ chỉnh sửa trong file cấu hình `/etc/sysconfig/network-scripts/ifcfg-ens37`. Đặt giá trị **BOOTPROTO="dhcp"** và khởi động lại dịch vụ mạng bằng lệnh `systemctl restart network.service` và xem kết quả. 

<img src="https://i.imgur.com/k4JZePI.png">

Như vậy máy client đã nhận được địa chỉ IP do máy server cấp phát. Đối chiếu với IP của máy client là `192.168.40.10` đã nằm trong dải `192.168.40.10` - `192.168.40.100` của range IP bên phía server đặt.  

Tuy nhiên máy client chưa thể ping ra ngoài Internet được. Quan sát hình trên ta thấy interface `ens33` chưa được gắn địa chỉ IP. Có 2 cách chỉnh cơ chế `Network connection` của `ens33` trong `Virtual Machine Setting` của máy client:  
1. Chọn chế độ `NAT`. `ens33` sẽ nhận địa chỉ IP động do VMnet8 trên VMWare Workstation cấp. Từ đó sẽ kết nối được Internet và ping được ra ngoài.  

<img src="https://i.imgur.com/5SgPYYx.png">  

2. Chọn chế độ `Custom: Specific vitual network` rồi chọn `VMnet2`. Khi đó `ens33` sẽ được gán địa chỉ IP động từ phía server cấp. Tuy nhiên máy sẽ không ping được ra ngoài vì IP được cấp chỉ là local (cục bộ). 

<img src="https://i.imgur.com/jF52Hum.png">  
.
<img src="https://i.imgur.com/vGpqhMQ.png">  

<a name="4"></a>
**Phân tích DHCP bằng lệnh tcpdump**  

Ta sử dụng lệnh `tcpdump` để phân tích cơ chế gửi nhận các gói tin của DHCP qua interface `ens37` trên máy client.   
- Trước tiên cần chỉnh sửa file cấu hình `/etc/sysconfig/network-scripts/ifcfg-ens37`, ta để chế độ `BOOTPROTO=none`. Sau đó lưu file cấu hình và reboot máy.    

<img src="https://i.imgur.com/hZQEqlk.png">  

- Tiếp theo mở 2 cửa sổ terminal. Một cửa sổ ta chỉnh lại file cấu hình `/etc/sysconfig/network-scripts/ifcfg-ens37`, chuyển về chế độ `BOOTPROTO=dhcp` rồi lưu lại.   
- Ở terminal thứ 2 ta gõ lệnh `tcpdump -nnvi ens37 -n port 67 and port 68`. (Chú ý DHCP hoạt động theo giao thức UDP, sử dụng Port 67 cho server và 68 cho client). 

- Quay trở lại terminal 1 ta restart lại network bằng lệnh `systemctl restart network.service`.  
Theo dõi lệnh tcpdump capture các gói tin ở bên terminal 2 để xem kết quả:  
<img src="https://i.imgur.com/3w422lx.png">  

**Phân tích**:   
1. *DHCP client gửi Broadcast một request đến DHCP Server được gọi là bản tin DHCP Discover.*   

Client hỏi ai là DHCP Server.  
- IP nguồn (sử dụng cổng 68): Vì lúc này client chưa có IP nên 0.0.0.0 đại diện cho các địa chỉ trong mạng (Client IP Address, Your IP Address).  
- IP đích - broadcast (sử dụng cổng 67): 255.255.255.255
00:0c:29:b8:2 : địa chỉ MAC của card mạng Ens33.

2. *DHCP cung cấp Unicast một địa chỉ IP cho client gọi là bản tin DHCP OFFER.*  
DHCP server reply bằng 1 gói tin Offer. Trong gói tin này đã đề nghị cấp 1 địa chỉ IP cho client.  
- IP nguồn: là IP của Server  
- IP đích - Unicast: là địa chỉ IP của client mà DHCP Server sẽ cấp.   
3. *Máy client gửi một bản tin Request để chấp nhận.* 

4. *DHCP Server sẽ gửi 1 bản tin ACK xác nhận rằng máy Client sử dụng địa chỉ IP này và xác định lượng thời gian mà thiết bị có thể sử dụng địa chỉ trước khi nhận địa chỉ mới.*  
DHCP server gửi về gói ACK xác nhận đồng ý cấp Ip với địa chỉ 192.188.161.3 cho DHCP client.  

Lưu ý: Có 2 loại Broadcast:  
- Directed Broadcast: Broadcast cho một mạng cụ thể. Ví dụ: Subnet: 192.168.10.0/24 -> Broadcast: 192.168.10.255.  
- Local Broadcast: Khi một gói tin được gửi với 1 địa chỉ local broadcast 255.255.255.255 thì tất cả các host đều nhận được.  

