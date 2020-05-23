Cách đặt IP trên Centos-7
===============

# **Cách 1:** Config Static IP sử dụng Network Manager
Trong các phiên bản từ CentOS 7 trở đi, gói NetworkManager đã cung cấp lệnh `nmcli` để thao tác việc đặt IP tĩnh hoặc IP động cho các interface. Trong hướng dẫn này cloud365 sẽ hướng dẫn bạn đặt IP cho các interface bằng lệnh `nmcli` và giới thiệu một số lệnh đi kèm để bạn có thể thao tác khi cần thiết.

Khi sử dụng lệnh `nmcli` (NetworkManager Command Line Interface) thì bản chất là cách dùng dòng lệnh để tạo ra file config cho các interface giống như các phiên bản CentOS trước kia. Điều này khá tiện lợi cho bạn khi thao tác thông qua CLI hoặc đưa và các bash shell sau này nếu có nhu cầu.

## Sử dụng Command-line Tool (`nmcli`)

Với công cụ dòng lệnh nmcli, bạn có thể tạo, hiển thị, chỉnh sửa, xóa, kích hoạt và hủy kích hoạt các kết nối mạng, cũng như kiểm soát và hiển thị trạng thái thiết bị mạng.

### **Hiển thị mạng sẵn có**
`# nmcli device`
```
[root@localhost ~]# nmcli device
DEVICE  TYPE      STATE      CONNECTION
ens33   ethernet  connected  ens33
ens37   ethernet  connected  Wired connection 1
lo      loopback  unmanaged  --
```

Lệnh này sẽ hiện thị ra toàn bộ các thiết bị mạng có sẵn trên hệ thống và trạng thái của chúng.

Tại cột `STATE` sẽ có 2 kiểu :
- `managed`: có nghĩa là thiết bị đó đặt dưới quyền kiểm soát của NetworkManager và thiết bị này có thể "connected" (Đã được config và active) hay disconnect (chưa được config những sẵn sàng để active trở lại)
- `unmanaged`: thiết bị mạng này chưa được dưới quyền kiểm soát của NetworkManager.

### **Kiểm tra file config của card mạng `ens33`**
`# cat /etc/sysconfig/network-scripts/ifcfg-ens33`
```
[root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens33
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="dhcp"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
UUID="907801c5-aa6a-499c-83e3-9018c8d415cf"
DEVICE="ens33"
ONBOOT="yes"
```

### **Đặt IP cho Interface `ens33`**
Ta thấy `ens33` đang nhận IP động, ta sẽ tiến hành đặt IP tĩnh. Ta sẽ đặt theo số liệu sau:
- IP address: `192.168.37.11`
- Gateway: `192.168.37.1`
- Subnetmask: `255.255.255.0/24`
- DNS-nameserver: `8.8.8.8`

**1. Đặt IP:**

`nmcli connection modify ens33 ipv4.addresses 192.168.37.11/24`

hoặc

`nmcli con mod ens33 ipv4.addresses 192.168.37.11/24`

```
-> "con" = "connection"
   "mod" = "modify"
```

**2. Đặt Gateway:**

`nmcli connection modify ens33 ipv4.gateway 192.168.37.1`

**3. Đặt DNS:**

`nmcli con mod ens33 ipv4.dns 8.8.8.8`

**4. Chọn phương thức `method`:** ở đây ta sẽ để `manual` có thể hiểu là cấu hình bằng tay:

`nmcli con mod ens33 ipv4.method manual`

**5. Chọn kiểu kết nối tự động:**

`nmcli con mod ens33 connection.autoconnect yes`

### **Kiểm tra lại xem IP đã đặt chính xác chưa** 
```
[root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens33
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
UUID=907801c5-aa6a-499c-83e3-9018c8d415cf
DEVICE=ens33
ONBOOT=yes
IPADDR=192.168.37.11
PREFIX=24
GATEWAY=192.168.37.1
DNS1=8.8.8.8
```

### **Ta sẽ cấu hình IP cho Interface `ens37`**
Ta thấy phần `CONNECTION` của `ens37` nhìn khá dài. Nên ta đổi lại thành `ens37` cho đồng bộ với `ens33`:

`nmcli con modify "Wired connection 1" connection.id ens7`

Ta được kết quả như hình:
```
[root@localhost ~]# nmcli con mod "Wired connection 1" connection.id ens37
[root@localhost ~]# nmcli device
DEVICE  TYPE      STATE      CONNECTION
ens33   ethernet  connected  ens33
ens37   ethernet  connected  ens37
lo      loopback  unmanaged  --
```

Bây giờ ta sẽ đặt IP cho `ens7` như sau:
- IP address: 192.168.37.12/24
- Subnet Mask: 255.255.255.0/24

Do `ens3` đã có `gateway` để kết nối ra Internet nên `ens7` không cần nữa.

```
nmcli con modify ens37 ipv4.addresses 192.168.37.12/24
nmcli con modify ens37 ipv4.method manual
nmcli con modify ens37 connection.autoconnect yes
```

Sau đó thực hiện lệnh `ifdown` và `ifup` để ens37 nhận IP vừa thiết lập.
Có thể dùng cùng lúc 2 lệnh như sau:
```
[root@localhost ~]# ifdown ens37 && ifup ens37

Device 'ens37' successfully disconnected.
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/5)
```

Kiểm tra file `/etc/sysconfig/network-scripts/ifcfg-ens37` để xem lại thiết lập bằng lệnh `cat`:
```

[root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens37
HWADDR=00:0C:29:A2:90:C8
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens37
UUID=7bfaf32d-2f9e-3d1a-ba1b-caab5300e54b
ONBOOT=yes
AUTOCONNECT_PRIORITY=-999
IPADDR=192.168.37.12
PREFIX=24
```

## **Cách 2:** Config IP sử dụng cách sửa file cấu hình

Mỗi Network Interface(NI) đều có 1 file `scrip` cấu hình nằm bên trong folder `/etc/sysconfig/network-scripts`.

Và file cấu hình của các NI đều có dạng `ifcfg-<ten_interface>`

Ta sẽ thay đổi IP của `ens37`
```
[root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens37
HWADDR=00:0C:29:A2:90:C8
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens37
UUID=7bfaf32d-2f9e-3d1a-ba1b-caab5300e54b
ONBOOT=yes
AUTOCONNECT_PRIORITY=-999
IPADDR=192.168.37.12
PREFIX=24
```

Một số dòng cấu hình cần quan tâm:
```
1. BOOTPROTO 
    - "none": khi chúng ta muốn sử dụng Static IP. 
    - "dhcp": khi chúng ta muốn đặt IP động nhận từ DHCP server
2. IPADDR - Địa chỉ IP
3. PREFIX(khi đã set Static IP) - Xác định Network Prefix (ví dụ: /24)
4. GATEWAY(khi đã set Static IP) - Xác định Default Gateway cho mạng
5. DNS(khi đã set Static IP) - Ta có thể sử dụng tùy chọn này để xác định nhiều DNS Server (Bắt đầu từ 1)
```

Mở file cấu hình bằng trình soạn thảo Vi để có thể đổi thông số của NI ens37:

`[root@localhost ~]# vi /etc/sysconfig/network-scripts/ifcfg-ens37
`

Sau khi chỉnh sửa xong cấu hình ta chỉ cần `ifdown` và `ifup` NI của ens37 lên là được.


----------------------------------