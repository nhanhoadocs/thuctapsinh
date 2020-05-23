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

Thời gian mặc định cấp IP cho 1 Client và Thời gian tối đa cấp IP cho 1 Client. (đơn vị: giây)

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
- `default-lease-time` : Thời gian mặc định cấp IP cho một Client (ưu tiên hơn global) (đơn vị: giây)                  
- `max-lease-time` : Thời gian tối đa cấp IP cho một Client (ưu tiên hơn global) (đơn vị: giây)


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
