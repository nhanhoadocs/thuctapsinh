# Tạo và quản lí máy ảo bằng giao CLI Virsh

## 1. Tạo VM với Virsh
Để tạo máy ảo bằng dòng lệnh, ta sử dụng lệnh `virt-install`.

Hầu hết các option đều không bắt buộc. Yêu cầu tối thiểu là: `--name`, `--memory`, lưu trữ (`--disk` hoặc `--filesystem`)

```
virt-install \
--name=VM1 \
--vcpus=1 \
--memory=1024 \
--cdrom=/var/lib/libvirt/file-iso/CentOS-7-x86_64-Minimal-1804.iso \
--disk=/var/lib/libvirt/images/vm1.img,size=10 \
--os-variant=rhel7 \
--graphics vnc \
--network bridge=br0
```

### Trong đó
- `--name`: đặt tên cho máy ảo định tạo
- `--vcpus`: là tổng số CPU định tạo cho máy ảo
- `--memory`: chỉ ra dung lượng RAM cho máy ảo (tính bằng MB)
- `--cdrom`: sau đó chỉ ra đường dẫn đến file ISO. Nếu muốn boot bằng cách khác ta dùng option `--locaion` sau đó chỉ ra đường dẫn đến file (có thể là đường dẫn trên internet).
- `--disk`: chỉ ra vị trí lưu disk của máy ảo. `size` chỉ ra dung lượng disk của máy ảo(tính bằng GB). Có thể tạo thêm disk bằng cách thêm 1 dòng nữa.
- `--os-variant`: chỉ ra kiểu của HĐH của máy ảo đang tạo. Option này có thể chỉ ra hoặc không nhưng nên sử dụng nó vì nó sẽ cải thiện hiệu năng của máy ảo. Nếu bạn không biết HĐH hành của mình thuộc loại nào bạn có thể tìm kiếm thông tin bằng cách dùng lệnh `osinfo-query os`
- `--graphics`: chọn kiểu màn hình tương tác
- `--network`: chỉ ra cách kết nối mạng của máy ảo. Nếu tạo nhiều card mạng, ta chỉ cần khai báo thêm


**Lưu ý:** Các option và arguments phải viết liền với dấu "=" và không được có space.

Trên đây là một số option cơ bản để tạo máy ảo. Bạn có thể tìm hiểu thêm bằng cách sử dụng lệnh `virt-install --help`

### Các trường hợp tạo máy ảo dùng virt-install
**1. Tạo máy ảo bằng file `.iso`**
- Sử dụng option `--cdrom`
- `disk` phải là không gian trống
```   
virt-install \
--connect qemu:///system \
--name iso \
--memory 1024 \
--vcpus 1 \
--disk /var/lib/libvirt/images/iso.img,size=10 \
--cdrom=/var/lib/libvirt/file-iso/CentOS-7-x86_64-Minimal-1804.iso \
--network network=default \
--graphics vnc,listen='0.0.0.0'
```    

**2. Tạo máy ảo bằng file image**
- Sử dụng option `--import`
- `disk` là đường dẫn đến file image

```
virt-install \
--connect qemu:///system \
--name template \
--memory 500 \
--vcpus 1 \
--disk /var/lib/libvirt/images/template.img \
--import \
--network network=default \
--graphics vnc,listen='0.0.0.0'    
```

**3. Tạo máy ảo qua Internet(netboot)**
- Sử dụng option `--location` : sau đó là đường dẫn url chứa file cài đặt netboot (netboot được cung cấp bởi hệ điểu hành)
```
virt-install \
--connect qemu:///system \
--name internet \
--ram 2048 \
--vcpus 1 \
--disk path=/var/lib/libvirt/images/internet.qcow2,size=10 \
--location 'http://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/' \
--network bridge=br0 \
--network network=default \
--graphics vnc,listen='0.0.0.0' \      
```

**Lưu ý**: Nếu khi boot gặp lỗi `dracut` như dưới đây
```
Warning: dracut-initqueue timeout - starting timeout scripts
...
Warning: could not boot.
Warning: /dev/root does not exist
```
Có nghĩa là bạn đang không thể truy xuất initramfs hoặc giải nén nó hay bạn đang không đủ dung lượng RAM cho nó. **Tối thiểu RAM là 1280MB**.

Đối với ubuntu, các file img được cung cấp miễn phí tại [Cloudy-Images Ubuntu](https://cloud-images.ubuntu.com/).

Hoặc bạn có thể sử dụng các file *.img đã được tạo ra trước đó khi tạo một VMs để có thể tạo ra một VM mới.

## 2. Hiển thị danh sách máy ảo
```
virsh list --all
```

<img src = "..\images\Screenshot_39.png">

## 3. Tắt VM
```
virsh shutdown <tên_máy_ảo>
```

<img src = "..\images\Screenshot_40.png">

## 4. Bật VM
```
virsh start <tên_máy_ảo>
```

<img src = "..\images\Screenshot_43.png">

## 5. Reboot VM
```
virsh reboot <tên_máy_ảo>
```

<img src = "..\images\Screenshot_41.png">

## 6. Xóa máy ảo
```
virsh undefine <tên_máy_ảo>
```

<img src= "..\images\Screenshot_42.png">

## 7. Tạo snapshot
```
virsh snapshot-create-as --domain tên_máy --name tên_bản_snapshot --description "mô tả bản snapshot"
```

<img src = "..\images\Screenshot_44.png">

**Lưu ý**: snapshot chỉ tạo được khi định dạng disk ảo của ta sử dụng là `qcow2` chính vì vậy nếu bạn đang sử dụng định dạng `raw` mà muốn tạo snapshot thì cần phải chuyển sang định dạng `qcow2`.

### Xem danh sách các bản snapshot trên 1 VM
```
virsh snapshot-list <tên_máy_ảo>
```

<img src = "..\images\Screenshot_45.png">

### Xem thông tin chi tiết của bản snapshot
```
virsh snapshot-info --domain <tên_máy_ảo> --snapshotname <tên_bản_snapshot>
```

<img src = "..\images\Screenshot_46.png">

### Revert để chạy lại một bản snapshot đã tạo
```
virsh snapshot-revert <tên_máy_ảo> <tên-bản-snapshot>
```

<img src = "..\images\Screenshot_47.png">

### Xóa 1 bản snapshot
```
virsh snapshot-delete --domain <tên_máy_ảo> --snapshotname <tên_bản_snapshot>
```

<img src ="..\images\Screenshot_48.png">

## 8. Sửa thông tin CPU hoặc Memory
```
virsh edit <tên_VM>
```

<img src ="..\images\Screenshot_49.png">

## 9. Một số lệnh khác
### Xem thông tin chi tiết về file disk của VM
```
qemu-img info <đường_dẫn_file-disk>
```

<img src= "..\images\Screenshot_50.png">

### Xem thông tin cơ bản của 1 VM
```
virsh dominfo <tên_VM>
```

<img src= "..\images\Screenshot_51.png">

Ngoài ra ta muốn biết thông tin chi tiết của VM ta có thể vào đọc file xml của VM đó.

**Link tham khảo:** https://github.com/meditechopen/meditech-thuctap/blob/6c279735a8904e33bc37fca61ee2018913fdd83c/ThaoNV/KVM/virt-install.md