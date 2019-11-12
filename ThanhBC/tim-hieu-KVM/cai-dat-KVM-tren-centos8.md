# Hướng dẫn cài đăt KVM trên CentOS 8.


[1. Tổng quan. ](#1)

[2. Chuẩn bị.](#2)

[3. Cài đặt KVM.](#3)

[4.Cài đặt máy ảo bằng virt-manager.](#4)

[5.Cài đặt máy ảo bằng virt-install.](#5)

---- 
<a name="1"></a>
## 1. Tổng quan. 

CentOS 8 mới được ra mắt ngày 25/09/2019 có nhiều thay đổi và các tính năng mới.

CentOS 8 hiện có 2 phiên bản GUI và CLI.Phiên bản CLI là minimal nên nhẹ hơn.

KVM (Kernel-based Virtual Machine) được biết đến là một cơ sở hạ tầng ảo hóa cho nhân Linux dành cho những CPU hỗ trợ công nghệ ảo hóa như Intel VT hoặc ADM-V.

Trong bài viết này tôi sẽ hướng dẫn các bạn cài đặt KVM trên CentOS 8 phiên bản CLI và cài máy ảo trên KVM.

<a name="2"></a>
## 2. Chuẩn bị.

- Một máy chạy hệ điều hành CentOS 8  với cấu hình tối thiểu 2 CPU, 2GB RAM, 20GB disk. Các bạn có thể  tham khảo cách cài CentOS của anh Công Tô [tại đây](https://news.cloud365.vn/centos-8-huong-dan-cai-dat-centos-8/).

- Một file ISO của  một hệ điêu hành khác.

Lưu ý để cài được KVM thì cần phải được CPU hỗ trợ. Để kiểm tra xem CPU có hỗ trợ hay không sử dụng lệnh
```

egrep -c "svm|vmx" /proc/cpuinfo
```

Nếu kết quả trả về là khác 0 thì CPU có hỗ trợ.

<a name="3"></a>
## 3. Cài đặt KVM.

Cài KVM và các gói liên quan.

```
dnf install qemu-kvm qemu-img libvirt virt-install virt-manager -y
```

Trong đó:
- qemu-kvm: Phần phụ trợ cho KVM.
- libvirt: cung cấp libvirt mà bạn cần quản lý qemu và KVM bằng libvirt.
- bridge-utils: chứa một tiện ích cần thiết để tạo và quản lý các thiết bị bridge.
- virt-manager: cung cấp giao diện đồ họa để quản lý máy ảo.
- virt-install: Cung cấp lệnh để cài đặt máy ảo.

Kiểm tra xem KVM đã được cài đặt hay chưa.

```
# lsmod | grep kvm
kvm_intel             204800  0
kvm                   593920  1 kvm_intel
irqbypass              16384  1 kvm
```

Đối với bản Minimal để dùng được công cụ đồ họa virt-manager người dùng phải cài đặt gói x-window bằng câu lệnh
```
dnf install  xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y
```
Start dịch vụ libvirt và cho dịch vụ chạy cùng hệ thống.
```
systemctl start libvirtd
systemctl enable libvirtd
```
Khởi động lại máy.

<a name="4"></a>
## 4.Cài đặt máy ảo bằng virt-manager.

Mở Vitual Machine Manager bằng lệnh.
```
virt-manager
```
Sau đó cửả sổ  **virtual machine manager** hiện lên.

![](anhcentos8/anh1.png)

Sau đó tiến hành tạo máy ảo như bình thường.

<a name="5"></a>
## 5.Cài đặt máy ảo bằng virt-install.

Tôi muốn lưu file images tại thư mục ```/var/kvm/images``` hoăc có thể đặt mặc định ```/var/lib/libvirt/images```.
```
mkdir -p /var/kvm/images
```
Cài máy ảo từ internet. Ở đây tôi sử dụng centos7 để cái máy ảo.
```
virt-install \
--name centos7 \
--ram 1024 \
--disk path=/var/kvm/images/centos7.img,size=10 \
--vcpus 1 \
--os-type linux \
--os-variant rhel7 \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/' \
--extra-args 'console=ttyS0,115200n8 serial'
```
nguồn: https://www.server-world.info/en/note?os=CentOS_7&p=kvm&f=2

Những thông số đáng chú ý:

- --name đặt tên cho máy ảo.
- --ram dung lượng RAM tạo cho máy ảo (đơn vị MiB).
- --disk chỉ ra vị trí lưu disk của máy ảo.
- --vcpus số CPU tạo cho máy ảo.
size chỉ ra dung lượng disk của máy ảo (đơn vị GiB).
- --os-variant loại OS đang tạo. Option này có thể chỉ ra hoặc không nhưng nên sử dụng nó vì nó sẽ cải thiện hiệu năng của máy ảo sau này. Nếu bạn không biết HĐH bạn đang tạo thuộc loại nào bạn có thể tìm kiếm thông tin này bằng cách dùng lệnh osinfo-query os
- --network loại mạng mà VM sử dụng.
- --graphics none không sử dụng đồ họa.
- --location đường dẫn đến file trên internet.

Trên đây chỉ là một số option cở bản cho việc tạo VM. Bạn có thể tìm hiểu thêm bằng cách sử dụng lệnh ```virt-install --help```
Sau đó ta cài đăt bình thường.

## 6. Kết luận.
 Vậy là ta đã cài thành công KVM trên CentOS8.
 Việc cài KVM trên  CentOS8 không có gì quá  khác biệt so với CentOS7.

 Chúc các bạn thành công!!!.d

### Tham khảo.
1. https://www.server-world.info/en/note?os=CentOS_8&p=kvm&f=1




