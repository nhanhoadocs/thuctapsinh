# Basic Network

## Network Interface
Network interface (Giao diện mạng) là kênh kết nối giữa thiết bị vầ mạng. Bạn có thể có nhiều interface hoạt động cùng lúc, các interface có thể được kích hoạt (activated) hoặc bỏ kích hoạt (de-activated).

Về mặt vật lý, giao diện mạng có thể tiến hành thông qua thẻ giao diện mạng (NIC) hoặc có thể được triển khai trừu tượng hơn dưới dạng phần mềm

File cấu hình network ở những nơi khác nhau tùy vào mỗi nền tảng:
- Debian: `/etc/network/interfaces`
- CentOS: `/etc/sysconfig/Network-scripts/`
- SUSE: `/etc/sysconfig/network`

## Lệnh `ip` : 
### Lệnh trả lại thông tin trên từng thiết bị Ethernet được kết nối.
`# ip addr show` 

```
[root@localhost ~]# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a2:90:be brd ff:ff:ff:ff:ff:ff
    inet 192.168.37.132/24 brd 192.168.37.255 scope global noprefixroute dynamic ens33
       valid_lft 1278sec preferred_lft 1278sec
    inet6 fe80::4e92:119f:6f23:fcd0/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

Để xem thông tin về `ens33`:
```
[root@localhost ~]# ip addr show ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a2:90:be brd ff:ff:ff:ff:ff:ff
    inet 192.168.37.132/24 brd 192.168.37.255 scope global noprefixroute dynamic ens33
       valid_lft 1005sec preferred_lft 1005sec
    inet6 fe80::4e92:119f:6f23:fcd0/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@localhost ~]#
```

### Hiện thị bảng định tuyến
`ip route show`
```
[root@localhost ~]# ip route show
default via 192.168.37.1 dev ens33 proto dhcp metric 100
192.168.37.0/24 dev ens33 proto kernel scope link src 192.168.37.132 metric 100
```

### Gán IP cho một giao diện mạng:
`# ip addr add 192.168.37.133 dev ens33`
```
[root@localhost ~]# ip addr add 192.168.37.133 dev ens33

[root@localhost ~]# ip addr show dev ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a2:90:be brd ff:ff:ff:ff:ff:ff
    inet 192.168.37.132/24 brd 192.168.37.255 scope global noprefixroute dynamic ens33
       valid_lft 1136sec preferred_lft 1136sec
    inet 192.168.37.133/32 scope global ens33
       valid_lft forever preferred_lft forever
    inet6 fe80::4e92:119f:6f23:fcd0/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### Gán nhiều IP cho một giao diện mạng:
Để gán nhiều IP cho giao diện mạng ta làm tương tự như trên

### Gỡ bỏ IP từ giao diện mạng

`# ip addr del 192.168.37.133/32 dev ens33`

```
[root@localhost ~]# ip addr del 192.168.37.133/32 dev ens33
[root@localhost ~]# ip addr show dev ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a2:90:be brd ff:ff:ff:ff:ff:ff
    inet 192.168.37.132/24 brd 192.168.37.255 scope global noprefixroute dynamic ens33
       valid_lft 1078sec preferred_lft 1078sec
    inet6 fe80::4e92:119f:6f23:fcd0/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### Hiển thị thông tin về một giao diện mạng
```
[root@localhost ~]# ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a2:90:be brd ff:ff:ff:ff:ff:ff
```
### Thay đổi trạng thái giao diện mạng (up/down)
`ip link set dev {DEVICE} {up|down}`

### Hiện thị bảng định tuyến
`# ip route`
```
[root@localhost ~]# ip route
default via 192.168.37.1 dev ens33 proto dhcp metric 100
192.168.37.0/24 dev ens33 proto kernel scope link src 192.168.37.132 metric 100
```

### Thêm một định tuyến mới
`# ip route add 192.168.37.0/24 via 192.168.37.1`
### Xóa một định tuyến
`ip route del default`

Hoặc chỉ định định tuyến cần xóa.

`ip route del <dia_chi_ip> via <gateway>`

## Lệnh Route
Hiện tại bộ công cụ `iproute2` đã được thay thế mặc định cho bộ công cụ `net-tools` ở các bản phân phối Linux mới như RHEL7, CentOS 7 ...vv, dẫn tới bạn sẽ hay gặp lỗi `-bash: ifconfig: command not found` trên CentOS 7.
Cài đặt `net-tools` trên Centos 7:

`yum install net-tools`

Lệnh `route` được sử dụng để xem hoặc thay đổi bảng định tuyến IP. Bạn có thể muốn thay đổi bảng định tuyến IP để thêm, xóa hoặc sửa đổi các tuyến tĩnh thành các máy chủ hoặc mạng cụ thể.

### Hiện thị bảng định tuyến
`# route -n`
```
[root@localhost ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.37.1    0.0.0.0         UG    100    0        0 ens33
192.168.37.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
```

### Thêm 1 định tuyến
`# route add -net 192.168.1.0 netmask 255.255.255.0 dev ens33`
```
[root@localhost ~]# route add -net 192.168.1.0 netmask 255.255.255.0 dev ens33

[root@localhost ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.37.1    0.0.0.0         UG    100    0        0 ens33
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 ens33
192.168.37.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
```
### Xóa 1 định tuyến
`# route del -net 192.168.1.0 netmask 255.255.255.0 dev ens33`
```
[root@localhost ~]# route del -net 192.168.1.0 netmask 255.255.255.0 dev ens33

[root@localhost ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.37.1    0.0.0.0         UG    100    0        0 ens33
192.168.37.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
```