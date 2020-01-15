# Linux Virtual Networking

Linux Virtual Networking có thể dễ dàng tạo thành từ `libvirt` và `linux virtual bridge`.

Cài đặt và bắt đầu kích hoạt `libvirt`:
```
# yum install libvirt
# systemctl start libvirtd
# systemctl enable libvirtd
```

`libvirt` hỗ trợ các loại mạng ảo sau:
1. Network Address Translation mode (chế độ dịch địa chỉ mạng - NAT)
2. Routed mode (chế độ định tuyến)
3. Isolated mode (chế độ cô lập)
4. Bridged Mode (chế độ bridged)

----

## Virtual Networking trong NAT mode
Khi trình nền `libvirt` được cài đặt lần đầu tiên trên máy chủ, nó đi kèm với cấu hình chuyển đổi mạng ảo mặc định ban đầu. Switch ảo mặc định ở chế độ NAT và được sử dụng bởi các máy ảo (VM - Virtual Machine) để liên lạc với mạng bên ngoài thông qua máy chủ vật lí.

Cấu hình được lưu trữ trong file XML: `/etc/libvirt/qemu/networks/default.xml`

Giao diện `virbr0` cũng được tạo trên máy chủ.
```
[root@localhost ~]# cat /etc/libvirt/qemu/networks/default.xml

<network>
  <name>default</name>
  <uuid>927f4393-3e4e-4a94-9e42-67c4ebe45555</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:b8:c9:9d'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>

[root@localhost ~]# ifconfig virbr0
virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:b8:c9:9d  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[root@localhost ~]# ping 192.168.122.1
PING 192.168.122.1 (192.168.122.1) 56(84) bytes of data.
64 bytes from 192.168.122.1: icmp_seq=1 ttl=64 time=0.047 ms
64 bytes from 192.168.122.1: icmp_seq=2 ttl=64 time=0.062 ms
64 bytes from 192.168.122.1: icmp_seq=3 ttl=64 time=0.061 ms
64 bytes from 192.168.122.1: icmp_seq=4 ttl=64 time=0.062 ms
64 bytes from 192.168.122.1: icmp_seq=5 ttl=64 time=0.060 ms
```

Lệnh `virsh` dùng để cấu hình và kiểm tra mạng ảo
```
[root@localhost ~]# virsh net-list
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes
```

Nếu không thấy thì hãy tải lại file cấu hình XML và kích hoạt lại:
```
# virsh net-list
 Name                 State      Autostart     Persistent
----------------------------------------------------------

# virsh net-define /etc/libvirt/qemu/networks/default.xml
Network default defined from /etc/libvirt/qemu/networks/default.xml
# virsh net-start default
Network default started
# virsh net-list
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes
```

Khi `libvirt` đang chạy mặc định, ta sẽ thấy 1 bridge bị cô lập. Bridge này không có bất kì interface vật lí nào thêm vào, vì nó sử dụng NAT để kết nối ra mạng ngoài. Đừng thêm interface vào bridge này.

```
[root@localhost ~]# brctl show
bridge name     bridge id               STP enabled     interfaces
virbr0          8000.525400b8c99d       yes             virbr0-nic
```

`libvirt` sẽ thêm các quy tắc  `iptable` để cho phép quá trình đến và từ khách gắn vào giao diện ảo. Nó cũng sẽ cố gắng kích hoạt `ip_forward`. Một số ứng dụng khác có thể vô hiệu hóa nó nên tốt nhất là thêm các mục sau để kiểm tra trước khi tiến hành.
```
# cat /etc/sysctl.conf
...
net.ipv4.ip_forward=1
...
```

Tạo 1 máy ảo (KVM - Virtual Machine) và gắn nó vào mạng ảo:
