# Route command

## Review bảng định tuyến hiện tại trên Linux

```
[root@localhost ~]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         gateway         0.0.0.0         UG    100    0        0 ens33
192.168.60.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
[root@localhost ~]#
```

Nếu sử dụng option `-n` thì chương trình sẽ không cố phân giải địa chỉ `ip` thành hostname hay domain, mà chỉ hiển thị thông tin `ip` cụ thể: 

```
[root@localhost ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.60.2    0.0.0.0         UG    100    0        0 ens33
192.168.60.0    0.0.0.0         255.255.255.0   U     100    0        0 ens33
[root@localhost ~]#
```

### Flag
- với nội dung output ở trên, sau đây là một số ý nghĩa của:
    - `U` : route đang up
    - `H` : đối tượng là host
    - `G` : sử dụng route này là route gateway
    - `R` : routing động
    - `D` : routing động tạo ra bởi 1 dịch vụ
    - `M` : được chỉnh sửa bởi 1 dịch vụ
    - `A` : được cài đặt bởi addrconf
    - `C` : cache entry
    - `!` : route bị reject



xem thêm tại [đây](https://cuongquach.com/su-dung-lenh-route-tren-linux.html)

----------------------


# IP command

## Xem thông tin IP 
cú pháp :
```
ip address show [dev] [name]
```
- muốn xem toàn bộ thông tin IP, Subnet, MAC trên toàn hệ thống :
```
[root@localhost ~]# ip add show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a7:9b:e3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.60.128/24 brd 192.168.60.255 scope global noprefixroute dynamic ens33
       valid_lft 1220sec preferred_lft 1220sec
    inet6 fe80::973e:79f4:d81f:9b32/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@localhost ~]#
```
- muốn xem thông tin IP, Subnet, MAC của 1 card mạng cụ thể :
```
[root@localhost ~]# ip add show ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:a7:9b:e3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.60.128/24 brd 192.168.60.255 scope global noprefixroute dynamic ens33
       valid_lft 1107sec preferred_lft 1107sec
    inet6 fe80::973e:79f4:d81f:9b32/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@localhost ~]#
```

## Hiển thị thông tin card mạng 
cú pháp :
```
ip link show [ DEVICE ]
```

```
[root@localhost ~]# ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a7:9b:e3 brd ff:ff:ff:ff:ff:ff
[root@localhost ~]#
```
```
[root@localhost ~]# ip link show ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a7:9b:e3 brd ff:ff:ff:ff:ff:ff
[root@localhost ~]#
```

## Hiển thị thông tin bảng định tuyến
```
[root@localhost ~]# ip route show
default via 192.168.60.2 dev ens33 proto dhcp metric 100
192.168.60.0/24 dev ens33 proto kernel scope link src 192.168.60.128 metric 100
[root@localhost ~]#
```

Bạn có thể tham khảo [link sau](https://cuongquach.com/su-dung-lenh-ip-tren-linux.html#22_Show_thong_tin_card_mang)

-------------------------

# IP Config

## Using DHCP

chúng ta dùng câu lệnh sau
```
vi /etc/sysconfig/network-scripts/ifcfg-ens33
```

sau đó sửa file như sau
```
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
UUID="d0a4e589-ab09-4e41-b052-b74e17f38f0f"
DEVICE="ens33"
ONBOOT="yes"
ZONE=public
```




## IP static
chúng ta cũng làm tương tự

```
vi /etc/sysconfig/network-scripts/ifcfg-ens33
```
```
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="static"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
NAME="ens33"
UUID="7b54924e-aa69-4a71-8b5e-503998980a7d"
DEVICE="ens33"
ONBOOT="yes"

IPADDR=192.168.52.81
NETMASK=255.255.255.0
GATEWAY=192.168.52.2
DNS1=8.8.8.8
DNS2=8.8.4.4
```

Nguôn tham khảo :

https://www.youtube.com/watch?v=vI-3isexLrQ

https://www.cyberciti.biz/faq/howto-setting-rhel7-centos-7-static-ip-configuration/
