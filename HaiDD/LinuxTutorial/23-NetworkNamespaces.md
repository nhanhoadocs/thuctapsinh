# Linux Network Namespaces

**Network namspace** là khái niệm cho phép bạn cô lập môi trường mạng network trong một host. Namespace phân chia việc sử dụng các khác niệm liên quan tới network như devices, địa chỉ addresses, ports, định tuyến và các quy tắc tường lửa vào trong một hộp (box) riêng biệt, chủ yếu là ảo hóa mạng trong một máy chạy một kernel duy nhất.

Các thiết bị mạng chuyên sử dụng Virtual Routing and Forwarding (VRF), nghĩa là nhiều hơn 1 bộ định tuyến ảo(chuyển tiếp Layer 3) có thể chạy trên cùng một thiết bị vật lí. Trong không gian mạng ảo Linux, các Network Namespaces cho phép các giao diện mạng và bảng định tuyến hoạt động riêng biệt với nhau.

## Các thao tác cơ bản trên Namespaces
Trong Linux, chỉ cần là `root` cho tất cả các hoạt động thay đổi cấu hình của network stack.

Tạo 1 `network namespace`:
```
[root@localhost ~]# ip netns add Blue
[root@localhost ~]# ip netns list
Blue
[root@localhost ~]# ll /var/run/netns/
total 0
-r--r--r--. 1 root root 0 Dec 17 16:46 Blue
```

Mỗi Network namespace có một giao diện loopback riêng, bảng định tuyến riêng và iptables riêng cung cấp nat và filtering.
```
[root@localhost ~]# ip netns exec Blue ip addr list
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```

Đảm bảo hiện thị giao diện đó trước khi làm việc với Network Namespace
```
[root@localhost ~]# ip netns exec Blue ip link set dev lo up
[root@localhost ~]# ip netns exec Blue ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Network Namespaces cung cấp thêm khả năng chạy các tiến trình với network namespace.
Ví dụ chạy 1 session trên namespace Blue:
```
[root@localhost ~]# ip netns exec Blue bash

[root@localhost ~]# ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[root@localhost ~]# netstat -nr
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
[root@localhost ~]# exit
```

Xóa 1 namespace:
```
[root@localhost ~]# ip netns add White
[root@localhost ~]# ip netns list
White
Blue
[root@localhost ~]# ip netns delete White
[root@localhost ~]# ip netns list
Blue
```

## Thêm giao diện vào Network Namespace
Để có thể kết nối ra mạng bên ngoài, ta gắn một giao diện ảo vào "default" hoặc "global" namespace nơi giao diện vật lí tồn tại.

Để thực hiện điều này, hãy tạo một vài giao diện ảo, đặt là `vetha` và `vethb`
```
[root@localhost ~]# ip link add vetha type veth peer name vethb
```

Gắn `vethb` vào namespace Blue:
```
[root@localhost ~]# ip link set vethb netns Blue
[root@localhost ~]# ip netns exec Blue ip link set dev vethb up
[root@localhost ~]# ip netns exec Blue ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vethb: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether fe:b4:55:6a:f0:fc  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Giao diện mạng ảo `vetha` vẫn gắn vào namespace global:
```
[root@localhost ~]# ip link set dev vetha up
[root@localhost ~]# ifconfig
ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.37.11  netmask 255.255.255.0  broadcast 192.168.37.255
        inet6 fe80::4e92:119f:6f23:fcd0  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:a2:90:be  txqueuelen 1000  (Ethernet)
        RX packets 1655  bytes 169591 (165.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 875  bytes 99496 (97.1 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ens37: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 00:0c:29:a2:90:c8  txqueuelen 1000  (Ethernet)
        RX packets 190  bytes 15304 (14.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 350  bytes 57108 (55.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vetha: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::7810:70ff:fedf:a287  prefixlen 64  scopeid 0x20<link>
        ether 7a:10:70:df:a2:87  txqueuelen 1000  (Ethernet)
        RX packets 7  bytes 586 (586.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 7  bytes 586 (586.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Cấu hình giao diện trong network namespace global:
