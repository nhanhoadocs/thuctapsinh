# LAB CẤU HÌNH DHCP SERVER TRÊN CENTOS 7

## I. Mô hình LAB

<img src = "https://i.imgur.com/lQtcd5j.png">

||IP|Ethernet|
|-|-|-|
|DCHP-Server|192.168.24.5|ens37|
|CentOS-7|?|ens37|
|Window 10|?|ens37|

## II. Các bước cấu hình DHCP Server
### 1. Kiểm tra gói dhcp đã được cài đặt chưa. Nếu chưa thì cài đặt.
```
[root@localhost ~]# rpm -pa | grep dhcp
[root@localhost ~]# yum install dhcp
```

### 2. Cấu hình dịch vụ DHCP
File cấu hình DHCP gồm 2 phần:
- Cấu hình toàn cục ( `global` ) : quy định những thông tin giá trị mặc định cho các khai báo lớp mạng ( subnet ) cấp pháp IP động DHCP .
- Cấu hình lớp mạng cấp phát IP động ( `scope` ) : quy định những giá trị thông tin cho việc cấp phát IP động thông qua DHCP .

Chỉnh sửa file cấu hình `/etc/dhcp/dhcpd.conf`:
Do file cấu hình ban đầu sẽ không có thông số nên ta copy file mẫu và chỉnh sửa:
```
[root@localhost ~]#  cp /usr/share/doc/dhcp-4.2.5/dhcpd.conf.example /etc/dhcp/dhcpd.conf
cp: overwrite ‘/etc/dhcp/dhcpd.conf’? y

[root@localhost ~]# vi /etc/dhcp/dhcpd.conf
```

#### Cấu hình Global:
Cấu hình `domain name` và `domain name-server`:

<img src = "https://i.imgur.com/uCbCv0f.png">

Thời gian mặc định cấp IP cho 1 Client và Thời gian tối đa cấp IP cho 1 Client.

<img src = "https://i.imgur.com/xoiBF0Q.png">

Nếu máy chủ là máy chủ chính thức trong mạng nội bộ, bạn hãy bỏ comment tùy chọn `authoritative`:

<img src = "https://i.imgur.com/Bib1Z0t.png">

Log của DHCP tại `/var/log/boot.log`:

<img src = "https://i.imgur.com/FqxZan8.png">

#### Cấu hình Scope:
<img src = "https://i.imgur.com/nbgyjBH.png">

Trong đó:
- `range` : vùng địa chỉ IP được dùng để cấp phát cho Client
- `option domain-name-servers`: DNS Server
- `option domain-name` : Tên Domain
- `option routers` : Default gateway
- `option broadcast-address` : Địa chỉ broadcast của dải mạng
- `default-lease-time` : Thời gian mặc định cấp IP cho một Client (ưu tiên hơn global)                   
- `max-lease-time` : Thời gian tối đa cấp IP cho một Client (ưu tiên hơn global)

#### Các file cần lưu ý
- Để xem những địa chỉ IP đã được cấp phát bởi DHCP Server trên CentOS ta có thể xem ở file: `/var/lib/dhcpd/dhcpd.leases`

<img src = "https://i.imgur.com/oi6kw4n.png">

- File log qúa trình cấp phát của dịch vụ DHCP thì xem log tại file log `message`:
```
[root@localhost log]# tail /var/log/messages | grep -i "dhcp"

Dec 24 09:36:22 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:40 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:40 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:36:40 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:59 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:59 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:09 localhost dhcpd: DHCPREQUEST for 192.168.24.135 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:09 localhost dhcpd: DHCPACK on 192.168.24.135 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:15 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:15 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37

```

- Có thể xem Log của DHCP tại `/var/log/boot.log`

Sử dụng lệnh `tailf` để theo dõi sự thay đổi của file log
```
[root@localhost log]# tailf /var/log/boot.log | grep -i "dhcp"
Dec 24 09:43:44 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:43:44 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:43:52 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:43:52 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:00 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:00 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:17 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:17 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:26 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:26 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:47:38 localhost dhcpd: DHCPREQUEST for 192.168.24.135 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:47:38 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:47:38 localhost dhcpd: DHCPACK on 192.168.24.135 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:48:04 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:48:04 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
```

Xem thêm tại [đây](https://linux.die.net/man/5/dhcpd.conf) .

### 3. Khởi động dịch vụ dhcp và kích hoạt tự khởi động:
```
[root@localhost ~]# systemctl start dhcpd
[root@localhost ~]# systemctl enable dhcpd
Created symlink from /etc/systemd/system/multi-user.target.wants/dhcpd.service to /usr/lib/systemd/system/dhcpd.service.
```

### 4. Cấu hình Firewall cho dịch vụ `dhcp`:
```
[root@localhost ~]# firewall-cmd --add-service=dhcp --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```

### 5. Kiểm tra trạng thái dịch vụ:
```
[root@localhost ~]# systemctl status dhcpd
```
<img src = "https://i.imgur.com/4MlHB8a.png">

## III. Cấu hình trên DHCP Client
### 1. Trên Client CentOS-7:

Cài đặt Interface mạng nhận DHCP của Server ta tạo ở trên:
```
[root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens37
```
<img src = "https://i.imgur.com/9bUXrVk.png">

Sau đó khởi động lại dịch vụ mạng:
```
[root@localhost ~]# systemctl restart network
```

Kiểm tra IP trên interface `ens37`:
<img src = "https://i.imgur.com/ftV7tNP.png">

Như vậy địa chỉ IP trên interface `ens37` là `192.168.24.129/24` trong range `192.168.24.128 - 192.168.24.254` mà ta đã thiết lập tại DHCP Server.

### 2. Trên Client Window 10
Vào Run gõ `ncpa.cpl` để mở cửa sổ Network Connections

<img src = "https://i.imgur.com/mcXPLZ1.png">

<img src = "https://i.imgur.com/uXdSYic.png">

Ta vào cài đặt để set DHCP :

<img src = "https://i.imgur.com/FVToo9e.png">

Chọn 'IPv4' - > 'Properties':

<img src = "https://i.imgur.com/H7lA48i.png">

Thiết lập như hình:

<img src = "https://i.imgur.com/8p1yxUx.png">

Vào `cmd` thực hiện các lệnh sau:
```
> ipconfig /release
> ipconfig /renew
> ipconfig
```

Ta được kết quả IP của Client Window 10 :
<img src = "https://i.imgur.com/fbJKlNN.png">

Địa chỉ IP của Client Window 10 là `192.168.24.130`

## Một số chú ý
- Để xem những IP đã được cấp phát bởi DHCP Server. Ta mở file `/var/lib/dhcpd/dhcpd.leases`
```
[root@localhost ~]# cat /var/lib/dhcpd/dhcpd.leases
```
<img src = "https://i.imgur.com/gp7aFFN.png">



## IV. Phân tích gói tin khi Client nhận IP từ DHCP Server

### Sử dụng lệnh `tcpdump`
Các option lệnh `tcpdump`
- Hiển thị các giao diện mạng: `# tcpdump -D`
- Bắt gói tin ở các giao diện mạng: `# tcpdump -i <giao_diện_mạng(ens33, ens37,...)>`
- Bắt gói tin với n gói tin: `# tcpdump -i <giao_diện_mạng> -c <n>`
- Hiển thị gói tin dưới dạng HEX và ASCII: `# tcpdump -xx -i <giao_diện_mạng> -c 2`
- Bắt gói tin với địa chỉ IP: `# tcpdump -i <giao_diện_mạng> -n`
- Thêm trường ngày khi bắt gói tin: `# tcpdump -i <giao_diện_mạng> -tttt`
- Bắt gói tin với 1 kiểu giao thức cụ thể: `# tcpdump -i <giao_diện_mạng> tcp`
- Bắt gói tin với 1 port cụ thể: `# tcpdump -i <giao_diện_mạng> port <số_hiệu_port>`
- Bắt gói tin lưu vào 1 file: `# tcpdump -i <giao_diện_mạng> -c 5 -w tcpdump_test.pcap`

Kiểm tra và cài đặt `tcpdump`:
```
[root@localhost ~]# tcpdump -D
-bash: tcpdump: command not found
[root@localhost ~]# yum install tcpdump
```

Sau đó kiểm tra lại ta thấy được các interface đang có sẵn để theo dõi:

<img src = "https://i.imgur.com/jE39897.png">

`tcpdump` là 1 câu lệnh dùng để bắt và phân tích gói của 1 giao thức trong máy tính.

Để bắt gói tin DHCP cấp lần đầu tiên, ta phải setup lại Client không nhận IP từ DHCP Server.
Sửa file sau: `/etc/sysconfig/network-scripts/ifcfg-ens37` 

<img src = "https://i.imgur.com/T7B3blg.png">

Sau đó reboot lại. Kiểm tra lại interface `ens37`:
<img src = "https://i.imgur.com/Xwue2U4.png">

Bây giờ, interface `ens37` chưa được set địa chỉ IP.
Ta sẽ mở 2 terminal. 1 bên chỉnh sửa file cấu hình interface `ens37`- ta đặt `BOOTPROTO = "dhcp"`, 1 bên sử dụng `tcpdump` để bắt gói tin khi DHCP cung cấp IP

<img src = "https://i.imgur.com/lzBYlSs.png">

`tcpdump -nni ens37 -n port 67 and port 68`

Sau đó tiến hành restart network, ta được các gói tin:

<img src = "https://i.imgur.com/GmBtzcR.png">


### Có thể sử dụng WireShark (sử dụng trên Window) để đọc file `.pcap`
Ta có giao diện như sau:

<img src = "https://i.imgur.com/c2xEfwW.png">

Ta có thể xem từng thông tin từng gói tin.

<img src = "https://i.imgur.com/qpfNvb5.png">