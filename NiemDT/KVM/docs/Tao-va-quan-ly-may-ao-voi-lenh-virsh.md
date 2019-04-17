# Tạo và quản lý máy ảo bằng giao diện dọng lệnh với virsh

## 1. Tạo máy ảo với lệnh virsh
Để tạo máy ảo bằng command line ta dùng lệnh `virt-install`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt1a.png)

```
$ virt-install \
> --name=Centos7-may4 \
> --vcpus=1 \
> --memory=1024 \
> --cdrom=CentOS-7-x86_64-Minimal-1804.iso \
> --disk=may4,size=10 \
> --os-variant=rhel7 \
> --network bridge=virbr1
```

Trong đó 
 * `--name` đặt tên cho máy ảo định tạo
 * `--vcpus` là tổng số CPU đinhj tạo cho máy ảo
 * `--memory` chỉ ra dung lượng RAM cho máy ảo (tính bằng MB)
 * `--cdrom` sau đó chỉ ra đường dẫn đến file ISO. Nếu muốn boot bằng cách khác ta dùng option `--locaion` sau đó chỉ ra đường dẫn đến file (có thể là đường dẫn trên internet).
 * `--disk` chỉ ra vị trí lưu disk của máy ảo. `size` chỉ ra dung lượng disk của máy ảo(tính bằng GB)
 * `--os-variant` chỉ ra kiểu của HĐH của máy ảo đang tạo. Option này có thể chỉ ra hoặc không nhưng nên sử dụng nó vì nó sẽ cải thiện hiệu năng của máy ảo. Nếu bạn không biết HĐH hành của mình thuộc loại nào bạn có thể tìm kiếm thông tin bằng cách dùng lệnh `osinfo-query os`
 * `--network` chỉ ra cách kết nối mạng của máy ảo.
Trên đây là một số option cơ bản để tạo máy ảo. Bạn có thể tìm hiểu thêm bằng cách sử dụng lệnh `virt-install --help`

## 2. Hiển thị danh sách máy ảo
Ta dùng lệnh `virsh list --all`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt2.png)

## 3. Tắt máy
Để tắt máy ta dùng lệnh `virsh shutdown tên_máy_ảo`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt3.png)

## 4. Bật máy
Dùng lệnh `virsh start tên_máy` 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt4.png)

## 5. Reboot máy
Dùng lệnh `virsh reboot tên_máy`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%205.png)

## 6. Xóa máy ảo
Để xóa một máy ảo ta dùng lệnh `virsh undefine tên_máy_ảo`
Chú ý phải tắt máy ảo trước khi thực hiện lệnh xóa. Với lệnh này sẽ thực hiện xóa tất cả những gì liên quan đến máy ảo đó 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt6.png)

## 7. Tạo bản snapshot
Để tạo bản snapshot ta dùng lệnh `virsh snapshot-create-as --domain tên_máy --name tên_bản_snapshot --description "mô tả bản snapshot"`.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%207.png)

*Lưu ý* snapshot chỉ tạo được khi định dạng disk ảo của ta sử dụng là `qcow2` chính vì vậy nếu bạn đang sử dụng định dạng `raw` mà muốn tạo snapshot thì cần phải chuyển sang ddingj dạng `qcow2`. 

Xem danh sách các bản snapshot đã tạo trên 1 VM. Dùng lệnh `virsh snapshot-list tên_máy`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%208.png)

Xem thông tin chi tiết của một bản snapshot

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%209.png)

Revert để chạy lại một bản snapshot đã tạo ta dùng lệnh 
`virsh snapshot-revert tên_VM tên-bản-snapshot`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%2010.png)

Để xóa bản snapshot đã tạo `virsh snapshot-delete --domain tên_VM --snapshotname tên_bản_snapshot`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%2011.png)

## 8. Sửa thông tin CPU hoặc memory

Để sửa thông tin CPU hoặc memory trên máy ảo ta dùng lệnh `virsh edit Tên_VM`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%2012.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virt%2012a1.png)

## 9. Một số lệnh khác để xem thông tin VM

`qemu-img info file-disk` câu lệnh này dùng để xem thông tin chi tiết về file disk của VM

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/1.png)

`virsh dominfo tên-VM` để xem thông tin cơ bản về VM

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/2.png)

Ngoài ra ta muốn biết thông tin chi tiết của VM ta có thể vào đọc file `xml` của VM đó.
