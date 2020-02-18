# Install KVM Slave
[1. Yêu cầu phần cứng](#1)

[2. Phân vùng KVM Slave](#2)

[3. Cấu hình bridge cho KVM Slave](#3)

[4. Install KVM Slave](#4)

[5. Khắc phục sự cố cài đặt](#5)

[6. Kết nối SolusVM KVM với nod SolusVM Master](#6)

[7. Libguestfs cho CentOS 7](#7)

## I. Yêu cầu phần cứng <a name="1"></a>
Node SolusVM KVM Slave phải phù hợp với các yêu cầu phần cứng tương tự như node KVM thông thường không có phần mềm SolusVM. Đây là 1 ví dụ về cài đặt được đề xuất:
- Mỗi core hoặc thread cho mỗi CPU ảo hóa và 1 host.
- RAM: 2GB cho các dịch vụ hệ thống + RAM cho máy ảo
- KVM templates & iso sẽ được lưu tại `/home/solusvm/kvm` + không gian đĩa dành cho máy ảo.
- SWAP 4GB++

**Xác định ảo hóa CPU:**
```
egrep -c "svm|vmx" /proc/cpuinfo
```

### OS đề nghị : **CentOS 7**
- Giải pháp vững chắc, ổn định và được đề nghị
- Không làm việc với hệ thống tệp NTFS bên ngoài
- Các sửa đổi bổ sung là cần thiết
- Xem [Libguestfs](#7)

## II. Phân vùng cho KVM Slave <a name="2"></a>
Ở đây, ta có 2 disk là vda(50G) và vdb(50G). 

The physical extent size nên để là 32M chứ không để mặc định là 4M

<img src= "..\images\Screenshot_1.png">

```
# lsblk
# pvcreate /dev/vdb
# vgcreate -s 32M solusvm /dev/vdb
# vgs
```

## III. Cấu hình bridge cho KVM Slave <a name="3"></a>
