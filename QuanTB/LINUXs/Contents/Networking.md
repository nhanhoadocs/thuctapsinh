# Basic Network




## Network Interface
Network interface (Giao diện mạng) là kênh kết nối giữa thiết bị vầ mạng. Bạn có thể có nhiều interface hoạt động cùng lúc, các interface có thể được kích hoạt (activated) hoặc bỏ kích hoạt (de-activated).

File cấu hình network ở những nơi khác nhau tùy vào mỗi nền tảng:
- Debian: `/etc/network/interfaces`
- CentOS: `/etc/sysconfig/Network-scripts/`
- SUSE: `/etc/sysconfig/network`


Đây là thông tin cấu hình giao diện mạng end3:

```
[root@CentOS-7-1908 ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens33
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
UUID="f2750e90-c15b-48d1-b5dc-268503b625e3"
DEVICE="ens33"
ONBOOT="yes"
[root@CentOS-7-1908 ~]#
```


### `ip` Utils
`ip` utils là một phần của gói iproute2 được cài đặt trên tất cả các bản phân phối Linux hiện đại.

Cú pháp của lệnh ip như sau:

`ip [ OPTIONS ] OBJECT { COMMAND | help }`

OBJECT: là loại đối tượng mà bạn muốn quản lý. Các đối tượng được sử dụng thường xuyên nhất là:
- link (l) - Hiển thị và sửa đổi giao diện mạng.
- address (a) - Hiển thị và sửa đổi Địa chỉ IP.
- route (r) - Hiển thị và thay đổi bảng định tuyến.
- neigh (n) - Hiển thị và thao tác các đối tượng lân cận (bảng ARP).

Tiện ích `ip` rất mạnh mẽ, tuy nhiên nó không được áp dụng lâu dài, sau khi hệ thống bị tắt nó sẽ không còn hoạt động nữa. Để sửa đổi hoàn toàn cấu hình bạn phải sửa đổi trong các file cấu hình mạng.

Sau đây là một số lệnh `ip` phổ biến:

#### Hiển thi thông tin về địa chỉ IP
```
[root@CentOS-7-1908 ~]# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:43:27:19 brd ff:ff:ff:ff:ff:ff
    inet 172.16.2.58/20 brd 172.16.15.255 scope global noprefixroute dynamic ens33
       valid_lft 26432sec preferred_lft 26432sec
    inet6 fd95:cd9d:ca1b::4f3/128 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fd95:cd9d:ca1b:0:cfab:9351:3616:ce78/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 2001:ee0:4146:f93e:ecea:ec7d:65fd:bd65/64 scope global noprefixroute dynamic
       valid_lft 1116sec preferred_lft 1116sec
    inet6 fe80::d71a:cc1c:6d77:4d51/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@CentOS-7-1908 ~]#
```
#### Hiển thị thông tin IP của một giao diện mạng
```
[root@CentOS-7-1908 ~]# ip addr show dev ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:43:27:19 brd ff:ff:ff:ff:ff:ff
    inet 172.16.2.58/20 brd 172.16.15.255 scope global noprefixroute dynamic ens33
       valid_lft 26370sec preferred_lft 26370sec
    inet6 fd95:cd9d:ca1b::4f3/128 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fd95:cd9d:ca1b:0:cfab:9351:3616:ce78/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 2001:ee0:4146:f93e:ecea:ec7d:65fd:bd65/64 scope global noprefixroute dynamic
       valid_lft 1200sec preferred_lft 1200sec
    inet6 fe80::d71a:cc1c:6d77:4d51/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@CentOS-7-1908 ~]#
```
#### Gán IP cho một giao diện mạng
```
[root@CentOS-7-1908 ~]# ip addr add 172.16.2.59 dev ens33


[root@CentOS-7-1908 ~]# ip addr show dev ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:43:27:19 brd ff:ff:ff:ff:ff:ff
    inet 172.16.2.58/20 brd 172.16.15.255 scope global noprefixroute dynamic ens33
       valid_lft 25813sec preferred_lft 25813sec
    inet 172.16.2.59/32 scope global ens33
       valid_lft forever preferred_lft forever
    inet6 fd95:cd9d:ca1b::4f3/128 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fd95:cd9d:ca1b:0:cfab:9351:3616:ce78/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 2001:ee0:4146:f93e:ecea:ec7d:65fd:bd65/64 scope global noprefixroute dynamic
       valid_lft 1199sec preferred_lft 1199sec
    inet6 fe80::d71a:cc1c:6d77:4d51/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@CentOS-7-1908 ~]#
```
#### Gán nhiều IP cho một giao diện mạng
Để gán nhiều IP cho giao diện mạng ta làm tương tự như trên
#### Gỡ bỏ IP từ giao diện mạng
```

[root@CentOS-7-1908 ~]# ip addr del 172.16.2.60/20 dev ens33
[root@CentOS-7-1908 ~]# ip addr show ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:43:27:19 brd ff:ff:ff:ff:ff:ff
    inet 172.16.2.58/20 brd 172.16.15.255 scope global noprefixroute dynamic ens33
       valid_lft 25478sec preferred_lft 25478sec
    inet6 fd95:cd9d:ca1b::4f3/128 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fd95:cd9d:ca1b:0:cfab:9351:3616:ce78/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 2001:ee0:4146:f93e:ecea:ec7d:65fd:bd65/64 scope global noprefixroute dynamic
       valid_lft 1198sec preferred_lft 1198sec
    inet6 fe80::d71a:cc1c:6d77:4d51/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@CentOS-7-1908 ~]#
```
#### Hiển thị thông tin về một giao diện mạng
```
[root@CentOS-7-1908 ~]# ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:43:27:19 brd ff:ff:ff:ff:ff:ff
[root@CentOS-7-1908 ~]#
```
#### Thay đổi trạng thái giao diện mạng (Up/Down)
```
ip link set dev {DEVICE} {up|down}
ip link set ens33 down
```
#### Hiển thị bảng định tuyến
```
[root@CentOS-7-1908 ~]# ip route
default via 172.16.10.1 dev ens33 proto dhcp metric 100
172.16.0.0/20 dev ens33 proto kernel scope link src 172.16.2.58 metric 100
[root@CentOS-7-1908 ~]# ip route list
default via 172.16.10.1 dev ens33 proto dhcp metric 100
172.16.0.0/20 dev ens33 proto kernel scope link src 172.16.2.58 metric 100
[root@CentOS-7-1908 ~]# ip route list 172.16.2.0/20
172.16.0.0/20 dev ens33 proto kernel scope link src 172.16.2.58 metric 100
```
#### Thêm một định tuyến mới
```
# ip route add 172.16.2.0/24 via 172.16.2.1
```
#### Xóa một định tuyến
```
ip route del default
```
Hoặc chỉ định định tuyến cần xóa.



### Lệnh `route`
Lệnh `route` được sử dụng để xem hoặc thay đổi bảng định tuyến IP. Bạn có thể muốn thay đổi bảng định tuyến IP để thêm, xóa hoặc sửa đổi các tuyến tĩnh thành các máy chủ hoặc mạng cụ thể.

Cú pháp:

```
Usage: route [-nNvee] [-FC] [<AF>]           List kernel routing tables
       route [-v] [-FC] {add|del|flush} ...  Modify routing table for AF.

       route {-h|--help} [<AF>]              Detailed usage syntax for specified AF.
       route {-V|--version}                  Display version/author and exit.

        -v, --verbose            be verbose
        -n, --numeric            don't resolve names
        -e, --extend             display other/more information
        -F, --fib                display Forwarding Information Base (default)
        -C, --cache              display routing cache instead of FIB

  <AF>=Use -4, -6, '-A <af>' or '--<af>'; default: inet
  List of possible address families (which support routing):
    inet (DARPA Internet) inet6 (IPv6) ax25 (AMPR AX.25)
    netrom (AMPR NET/ROM) ipx (Novell IPX) ddp (Appletalk DDP)
    x25 (CCITT X.25)
```

#### Hiển thị bảng định tuyến

```
[root@CentOS-7-1908 ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.16.10.1     0.0.0.0         UG    100    0        0 ens33
172.16.0.0      0.0.0.0         255.255.240.0   U     100    0        0 ens33
```

#### Thêm một định tuyến
```
[root@CentOS-7-1908 ~]# route add -net 192.168.1.0 netmask 255.255.255.0 dev ens33
[root@CentOS-7-1908 ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.16.10.1     0.0.0.0         UG    100    0        0 ens33
172.16.0.0      0.0.0.0         255.255.240.0   U     100    0        0 ens33
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 ens33
[root@CentOS-7-1908 ~]#
```


### Xóa một định tuyến
```
[root@CentOS-7-1908 ~]# route del -net 192.168.1.0 netmask 255.255.255.0 dev ens33
[root@CentOS-7-1908 ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.16.10.1     0.0.0.0         UG    100    0        0 ens33
172.16.0.0      0.0.0.0         255.255.240.0   U     100    0        0 ens33
[root@CentOS-7-1908 ~]#
```