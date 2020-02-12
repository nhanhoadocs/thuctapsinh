# Tạo và quản lí máy ảo bằng giao CLI Virsh

## 1. Tạo VM với Virsh
Để tạo máy ảo bằng dòng lệnh, ta sử dụng lệnh `virt-install`

```
virt-install \
> --name=VM1 \
> --vcpus=1 \
> --memory=1024 \
> --cdrom=/var/lib/libvirt/file-iso/CentOS-7-x86_64-Minimal-1804.iso \
> --disk=/var/lib/libvirt/images/vm1.img,size=10 \
> --os-variant=rhel7 \
> --graphics vnc \
> --network bridge=br0
```

### Trong đó
- `--name`: đặt tên cho máy ảo định tạo
- `--vcpus`: là tổng số CPU đinhj tạo cho máy ảo
- `--memory`: chỉ ra dung lượng RAM cho máy ảo (tính bằng MB)
- `--cdrom`: sau đó chỉ ra đường dẫn đến file ISO. Nếu muốn boot bằng cách khác ta dùng option `--locaion` sau đó chỉ ra đường dẫn đến file (có thể là đường dẫn trên internet).
- `--disk`: chỉ ra vị trí lưu disk của máy ảo. `size` chỉ ra dung lượng disk của máy ảo(tính bằng GB)
- `--os-variant`: chỉ ra kiểu của HĐH của máy ảo đang tạo. Option này có thể chỉ ra hoặc không nhưng nên sử dụng nó vì nó sẽ cải thiện hiệu năng của máy ảo. Nếu bạn không biết HĐH hành của mình thuộc loại nào bạn có thể tìm kiếm thông tin bằng cách dùng lệnh` osinfo-query os`
- `--graphics`: chọn kiểu màn hình tương tác
- `--network`: chỉ ra cách kết nối mạng của máy ảo. Trên đây là một số option cơ bản để tạo máy ảo. Bạn có thể tìm hiểu thêm bằng cách sử dụng lệnh `virt-install --help`

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