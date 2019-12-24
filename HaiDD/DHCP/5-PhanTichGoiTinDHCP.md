# Phân tích gói tin DHCP

## I. Lệnh `tcpdump`
`tcpdump` là 1 câu lệnh dùng để bắt và phân tích gói của 1 giao thức trong máy tính.

### Các option lệnh `tcpdump`
- Hiển thị các giao diện mạng: `# tcpdump -D`
- Bắt gói tin ở các giao diện mạng: `# tcpdump -i <giao_diện_mạng(ens33, ens37,...)>`
- Bắt gói tin với n gói tin: `# tcpdump -i <giao_diện_mạng> -c <n>`
- Hiển thị gói tin dưới dạng HEX và ASCII: `# tcpdump -xx -i <giao_diện_mạng> -c 2`
- Bắt gói tin với địa chỉ IP: `# tcpdump -i <giao_diện_mạng> -n`
- Thêm trường ngày khi bắt gói tin: `# tcpdump -i <giao_diện_mạng> -tttt`
- Bắt gói tin với 1 kiểu giao thức cụ thể: `# tcpdump -i <giao_diện_mạng> tcp`
- Bắt gói tin với 1 port cụ thể: `# tcpdump -i <giao_diện_mạng> port <số_hiệu_port>`
- Bắt gói tin lưu vào 1 file: `# tcpdump -i <giao_diện_mạng> -c 5 -w tcpdump_test.pcap`

### Kiểm tra và cài đặt `tcpdump`:
```
[root@localhost ~]# tcpdump -D
-bash: tcpdump: command not found
[root@localhost ~]# yum install tcpdump
```

Sau đó kiểm tra lại ta thấy được các interface đang có sẵn để theo dõi:

<img src = "https://i.imgur.com/jE39897.png">

Để bắt gói tin DHCP cấp lần đầu tiên, ta phải setup lại Client không nhận IP từ DHCP Server.
Sửa file sau: `/etc/sysconfig/network-scripts/ifcfg-ens37` 

<img src = "https://i.imgur.com/T7B3blg.png">

Sau đó reboot lại. Kiểm tra lại interface `ens37`:

<img src = "https://i.imgur.com/Xwue2U4.png">

Bây giờ, interface `ens37` chưa được set địa chỉ IP.
Ta sẽ mở 2 terminal. 1 bên chỉnh sửa file cấu hình interface `ens37`- ta đặt `BOOTPROTO = "dhcp"`, 1 bên sử dụng `tcpdump` để bắt gói tin khi DHCP cung cấp IP
```
[root@localhost ~]# tcpdump -nni ens37 -n port 67 and port 68 -w dhcp.pcap
```
<img src = "https://i.imgur.com/lzBYlSs.png">

Ta sẽ giải phóng IP đã gán cho card `ens37` khi khởi động:
```
[root@localhost ~]# dhclient -r
```
Sau đó Yêu cầu cấp lại địa chỉ IP:
```
[root@localhost ~]# dhclient -v
```

Khi xong ta có thể thấy 4 gói tin ta đã bắt được:
```
[root@localhost ~]# tcpdump -nni ens37 -n port 67 and port 68 -w dhcp.pcap
tcpdump: listening on ens37, link-type EN10MB (Ethernet), capture size 262144 bytes
^C4 packets captured
4 packets received by filter
0 packets dropped by kernel
```

## II. WireShark
Có thể sử dụng WireShark (sử dụng trên Window) để đọc file `.pcap`
Ta có giao diện như sau:

<img src = "https://i.imgur.com/HlMj80m.png">

Ta có thể xem từng thông tin từng gói tin.

<img src = "https://i.imgur.com/6TrrZ35.png">

## III. Phân tích 4 gói tin
### 1. Client gửi bản tin DHCP Discover:
<img src = "https://i.imgur.com/HjZkap4.png"> 
- Client gửi thông điệp theo hình thức Broadcast.
- Nguồn gửi `Vmware_a2:90:c8` có địa chỉ MAC `00:0c:29:a2:90:c8` gửi tới Đích `Broadcast` có địa chỉ MAC `ff:ff:ff:ff:ff:ff`
- IP nguồn: `0.0.0.0` (Do lúc này Client chưa có địa chỉ IP) - port 68
- IP đích: `255.255.255.255` - port 67

### 2. DHCP Server cung cấp bản tin DHCP Offer:
<img src = "https://i.imgur.com/1PX2yWV.png">
- Server nhận được bản tin Discover sẽ gửi lại bản tin DHCP Offer theo hình thức Unicast có chứa IP `192.168.24.211` cho Client.
- Ethernet II, Src: Vmware_0a:de:99 (00:0c:29:0a:de:99), Dst: Vmware_a2:90:c8 (00:0c:29:a2:90:c8)
- Nguồn gửi `Vmware_0a:de:99` có địa chỉ MAC `(00:0c:29:0a:de:99)` gửi lại Client `Vmware_a2:90:c8 (00:0c:29:a2:90:c8)`
- IP nguồn của Server: `192.168.24.5` - port 67
- IP đích - Unicast: địa chỉ IP Server sẽ cấp cho Client: `192.168.24.211` - port 68

### 3. Client gửi lại bản tin DHCP Request để chấp nhận IP được Server cấp cho.
<img src = "https://i.imgur.com/SQ7EIHF.png">
- Client gửi bản tin theo dạng Broadcast.
- Tuy nhiên, bản tin đến Server sẽ chứa Request chấp nhận IP được cấp
- Port nguồn: 68. Port đích: 67

<img src = "https://i.imgur.com/jPqbJUF.png">

### 4. Server gửi bản tin DHCP ACK để xác nhận Client sử dụng địa chỉ IP cũng như thông tin cấu hình khác.
<img src ="https://i.imgur.com/OHLR0X0.png">
- Gói tin DHCP ACK gửi dưới dạng Unicast chứa các thông tin cần thiết để cấu hình Client
<img src = "https://i.imgur.com/q0PwLCV.png">
- Nguồn: Server có địa chỉ MAC : `00:0c:29:0a:de:99`. Địa chỉ IP: `192.168.24.5`(port 67)
- Đích: Client có địa chỉ MAC : `00:0c:29:a2:90:c8`. Địa chỉ IP: `192.168.24.211`(port 68)