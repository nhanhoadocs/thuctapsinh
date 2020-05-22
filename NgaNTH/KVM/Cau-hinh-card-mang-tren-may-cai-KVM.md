# Cài đặt KVM trên CentOS7 và cấu hình card mạng  

## 1. Mô hình  

<img src="https://i.imgur.com/U7oYcae.png">

## 2. IP planning

## 3. Cài đặt KVM trên CentOS7  

### 3.1 Một số cấu hình cần thiết  
Trên máy CentOS cài KVM ta cần có 2 card mạng. Một card `ens33` ở chế độ NAT và một card `ens37` ở chế độ host-only.
- Tạo card bridge `br0` trên CentOS 7 ở chế độ NAT để khi ta tạo các máy ảo KVM ta sẽ gắn các card mạng NAT vào bridge này.  
```
#nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
#nmcli connection modify br0 ipv4.addresses 192.168.95.10/24 ipv4.method manual  
#nmcli connection modify br0 ipv4.gateway 192.168.95.2
#nmcli connection modify br0 ipv4.dns 192.168.95.2  
#nmcli connection delete ens33
#nmcli connection add type bridge-slave autoconnect yes con-name ens33 ifname ens33 master br0
```
- Chỉnh sửa trong file cấu hình `/etc/sysconfig/network-scripts/ifcfg-br0` sửa dòng `BOOTPRO` 
```
BOOTPRO=static
```  
Khi đó nội dung của file cấu hình bridge `br0` sẽ như sau  
```
BRIDGING_OPTS=priority=32768
TYPE=Bridge
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=br0
UUID=4b44011c-dbc1-44a1-bccd-04fb307628ca
DEVICE=br0
ONBOOT=yes
IPADDR=192.168.95.100
PREFIX=24
GATEWAY=192.168.95.1
DNS1=192.168.95.1
```  
- Tiếp tục một bridge `br1` để gắn vào card `ens37`. Làm tương tự như bước phía trên.  Nội dung file cấu hình của `/etc/sysconfig/network-scripts/ifcfg-br1` như sau  
```
STP=yes
BRIDGING_OPTS=priority=32768
TYPE=Bridge
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=br1
UUID=3992a158-7ac3-4db3-8cfa-6f036f3abba5
DEVICE=br1
ONBOOT=yes
IPADDR=192.168.33.50
PREFIX=24
```
> CHÚ Ý: Bridge `br1` không cần cấu hình `gateway` và `dns` vì nó chỉ giao tiếp với các máy local.  

- Khởi động lại hệ thống
```
reboot
```

## 3.2. Cài KVM trên CentOS 7.

Tiếp theo ta cần kiểm tra máy có hỗ trợ ảo hóa hay không bằng lệnh  
```
egrep -c "svm|vmx" /proc/cpuinfo
0  
```
Nếu kết quả là hiển thị khác 0 thì tức là có hỗ trợ, còn kết quả là `0` thì ta cần phải cài đặt lại bằng cách chỉnh sửa trong `Virtual Machine Settings`, tích vào 2 chế độ hỗ trợ ảo hóa. 

<img src="https://i.imgur.com/69VroEM.png">  

Sau đó kiểm tra lại  
```
# egrep -c "svm|vmx" /proc/cpuinfo
2
```  
Sau đó tiếp tục cài KVM với các lệnh sau.  
- Cài đặt các gói cần thiết
```
yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager
```
- Sau khi cài xong ta kiểm tra xem module KVM bằng lệnh  
```
lsmod | grep kvm
kvm_intel             188688  0
kvm                   636931  1 kvm_intel
irqbypass              13503  1 kvm
```
- Bật libvirt và khởi động cùng hệ thống
```
systemctl start libvirtd
systemctl enable libvirtd
```

## 4. Sử dụng công cụ virt-manager để cài VM  

- Download file iso CentOS 7
```
cd /var/lib/libvirt
mkdir file-iso
wget http://repos-va.psychz.net/centos/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso
```

- Đối với bản Minimal để dùng được công cụ đồ họa `virt-manager` người dùng phải cài đặt gói x-window bằng câu lệnh  
```
yum install "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y
```
- Khởi động lại hệ thống  
```
reboot
```
- Vào virt-manager để cấu hình VM  
```
virt-manager 
```
Chọn File -> New Virtual Machine -> Local install media (ISO imange or CDROM) và click `Foward`  
Chọn đường dẫn đến file cài đặt và tiếp tục `Forward`  

<img src="https://i.imgur.com/Gb5mEuU.png">  

Ta tiếp tục cài đặt các thông số cho máy ảo.  
Lưu ý ở phần `Network selection` ta sẽ gắn card mạng `eth1` vào bridge `br0`.  

<img src="https://i.imgur.com/X6gNcUP.png">  

Sau đó chọn `Finish`  

Cuối cùng là chọn `Begin Install ` để bắt đầu quá trình cài máy ảo như thông thường.  

- Sau khi máy ảo đã được cài đặt xong, bạn có thể cấu hình IP tĩnh cho card mạng `eth1`. Bên cạnh đó muốn add thêm một card khác thì bạn chọn icon bóng đèn -> Chọn Add Hardware -> Network -> Finish. Lúc này một card `ens10` sẽ được tạo. Bạn gắn card này vào `br1` bằng cách chọn trong mục `Network source` và bấm OK. Chú ý **2 card mạng bạn add phải có cùng kiểu với nhau (ở đây tôi chọn virtio)**   

<img src="https://i.imgur.com/tEcf0Qs.png"> 

- Tiếp tục cấu hình IP cho card mạng này bằng cách chỉnh sửa file cấu hình, khai báo với BOOTPRO=static.  
- Sau khi đã hoàn tất các bước trên ta gõ lệnh `ip a` để kiểm tra thông tin các thiết bị mạng trên máy ảo  
```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:df:b3:2a brd ff:ff:ff:ff:ff:ff
    inet 192.168.33.51/24 brd 192.168.33.255 scope global noprefixroute ens10
       valid_lft forever preferred_lft forever
    inet6 fe80::a87:9375:984b:2107/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:db:e3:39 brd ff:ff:ff:ff:ff:ff
    inet 192.168.95.101/24 brd 192.168.95.255 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::82ea:f1eb:cbde:9c1c/64 scope link noprefixroute
       valid_lft forever preferred_lft forever

```
- Ta có thể tạo nhiều máy ảo KVM. Sau khi cài đặt xong  ta có thể xem danh sách cũng như trạng thái các máy ảo KVM bằng lệnh:
```
[root@centos7srv ~]# virsh list --all
 Id    Name                           State
----------------------------------------------------
 2     centos7.0-2                    running
 3     centos7.0                      running
```  
