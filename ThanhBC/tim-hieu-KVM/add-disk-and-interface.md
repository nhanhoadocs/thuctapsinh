# Thêm ổ cứng và thêm interface vào VM trên KVM


Mục Lục.

[1. Thêm ổ cứng.](#1)

[2. Thêm interface trên máy ảo.](#2)

[2.1 Thêm interface NAT vào KVM.](#2.1)

[2.2 Cấu hình linux-bridge vào KVM.](#2.2)

---

<a name="1"></a>
## 1. Thêm ổ cứng.

Ta sử dụng lệnh để tao một ổ cứng mới.
```
qemu-img create -f raw disk-1.img 6G
```

Sau đó sử dụng lệnh để thêm vào trong VM. VM phải trong trang thái tắt.

```
virsh attach-disk centos7.0-3 --source /var/lib/libvirt/images/disk-1.img --target vdb --persistent
```

Sau đó khởi động VM 

Kiểm tra ổ cứng băng lệnh ```lsblk```
thí ta thấy đã có ổ cứng gắn vào.

![](anhcentos8/anh2.png)
 
Tiếp tuc mount vào thư muc để sử dụng.

```
mkfs.ext4 /dev/vdb 
mkdir -p /mnt/disk
mount /dev/vdb /mnt/disk
```

Kiểm tra lại ```lsblk```

![](anhcentos8/anh3.png).

Để gỡ ổ cứng trước tiên ta phải unmount thư mục.
```
umount /dev/vdb /mnt/disk
```

Trên máy vật lý ta detach-disk.
```
virsh detach-disk --domain centos7.0-3 /var/lib/libvirt/images/disk-1.img  --persistent --config --live
```
<a name="2"></a>
## 2. Thêm interface trên máy ảo.
<a name="2.1"></a>
### 2.1 Thêm interface NAT vào KVM.
Vào thư mục **/etc/libvirt/qemu/network**
```
cd /etc/libvirt/qemu/network
```

Tạo file **nat.xml**
```
touch nat.xml
```
VIết têm các dòng sau vào file nat.xml sử dụng **vim**.

```
<network>
  <name>nat</name>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <domain name='nat'/>
  <ip address='192.168.123.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.123.2' end='192.168.123.254'/>
    </dhcp>
  </ip>
</network>
```
trong đó:
- **name**là tên của interface.
- **bridge name** là tên của bridge.
- **ip address** là địa chỉ của bridge.
- **range start** là dải địa chỉ được sử dụng.

Sau đó sử dụng lệnh để cập nhật interface vào KVM.

```
virsh net-define nat.xml
```
Lệnh bật interface
```
virsh net-autostart nat
virsh net-start nat
```
sử dụng lệnh ```ip a``` để xem đã thành công chưa.

![](anhcentos8/anh7.png)

Thêm interface vào VM trong KVM.
```
virsh attach-interface centos7-migrate bridge virbr0 --mac 52:54:00:9e:5c:7c
```
trong đó:
- centos7-migrate là tên máy VM
- virbr0 tên bridge vừa được tạo.
- mac lấy từ interface virbr0.

Khởi động máy ảo  lên kiểm tra  địa chỉ ip.
```
ip a
```
![](anhcentos8/anh8.png)

Ta thây máy ảo đã nhận địa chỉ đã được cấu hình trong file nat.xml ta vừa cấu hình.

Kiểm tra ping trên máy ảo.
![](anhcentos8/anh9.png)

<a name="2.2"></a>
### 2.2 Cấu hình linux-bridge vào KVM.

Trên máy vật lý cấu hình:

```
brctl addbr bridge0             //tạo bridge
brctl addif bridge0 eth0        //kết nối uplink bridge và card mạng
dhclient bridge0                //cấu hình dhcp lấy tự động địa chỉ ip
```
Khởi động máy ảo.

Kiểm tra ip trên máy vật lý.

![](anhcentos8/anh16.png)

Mở virt-manager lên thay đổi interface cho máy ảo.
![](anhcentos8/anh14.png)


Kiểm tra trên ip máy ảo.
![](anhcentos8/anh11.png)
Kiểm tra ping 

![](anhcentos8/anh12.png)



