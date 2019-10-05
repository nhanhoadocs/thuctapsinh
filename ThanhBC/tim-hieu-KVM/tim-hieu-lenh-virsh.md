# Hướng dẫn sử dụng vish.

## Virsh là gì.
Libvirt là một bộ các phần mềm mà cung cấp các cách thuận tiện để quản lý máy ảo và các chức năng của ảo hóa. Những phần mềm này bao gồm một thư viện API daemon (libvirtd) và các gói tiện tích giao diện dòng lệnh (virsh).

Virsh là một tools kiểm soát và thực hiện hành động với các máy ảo.
### 1. Tất cả lệnh virsh được sử dụng.
virsh --help

### 2. Hiện tất cả máy ảo đã được cài đặt.
virsh list --all

```
root@iou:/etc/libvirt/qemu# virsh --all
error: unsupported option '--all'. See --help.
root@iou:/etc/libvirt/qemu# virsh list --all
 Id   Name          State
------------------------------
 3    thanhbc       running
 -    centos7.0     shut off
 -    centos7.0-3   shut off
```
### 3. Khởi động máy ảo.
virsh start <ten may ao>

```
root@iou:/etc/libvirt/qemu# virsh start thanhbc
Domain thanhbc started
```

### 4. Hiện thị các máy ảo đang hoạt động.
virsh list 
```
root@iou:/etc/libvirt/qemu# virsh list
 Id   Name      State
-------------------------
 3    thanhbc   running
```
### 5. Tắt 1 máy ảo.
virsh shutdown <ten may ao>
```
root@iou:/etc/libvirt/qemu# virsh shutdown thanhbc
Domain thanhbc is being shutdown
```
### 6. Xem thông tin 1 máy ảo
virsh dominfo <ten may ao>
```
root@iou:/etc/libvirt/qemu# virsh dominfo thanhbc
Id:             4
Name:           thanhbc
UUID:           072ebbd2-85c9-40ac-92a2-41d8251e033b
OS Type:        hvm
State:          running
CPU(s):         1
CPU time:       18,2s
Max memory:     2097152 KiB
Used memory:    2097152 KiB
Persistent:     yes
Autostart:      disable
Managed save:   no
Security model: apparmor
Security DOI:   0
Security label: libvirt-072ebbd2-85c9-40ac-92a2-41d8251e033b (enforcing)
```
### 7. CHỉnh sưả mốt số thông số trong của máy ảo

```
virsh edit <ten may ao>
```

![](anhkvm/anh47.png)

### 8. Clone 1 máy ảo mới
```
virt-clone \
> --original=thanhbc \
> --name=thanhbc-clone \
> --file=/var/kvm/images/thanhbc-clone.img
```
![](anhkvm/anh49.png)

### 9. xóa một máy ảo.
```
virsh destroy <tên máy ảo>
virsh undefine <tên may ao>
```
sau đó xóa file khởi tạo của máy ảo. Trên đây t lưu file ở 1 chỗ khác mặc định .
```
rm -rf /var/kvm/images/thanhbc-clone.img
```

![](anhkvm/anh48.png)
