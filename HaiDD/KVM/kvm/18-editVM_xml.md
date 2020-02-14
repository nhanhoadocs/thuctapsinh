# Thêm Disk, Card vào VM

## I. Thêm Disk vào VM
### 1. Thêm disk vào VM
```    
- Tạo đĩa ảo
- Gắn đĩa ảo vào VM
```

- Kiểm tra số lượng Disk của VM
    ```
    fdisk -l | grep vd
    ```

<img src="..\images\Screenshot_165.png">

Ta thấy có 1 đĩa ảo vda (2 phân vùng`vda1` và `vda2`) trên VM này.

- Tắt VM

<img src ="..\images\Screenshot_166.png">

- Tạo 1 đĩa ảo trên host KVM bằng lệnh `qemu-img`. Ở đây, ta tạo 1 đĩa ảo dung lượng 3 GB và lưu tại `/var/lib/libvirt/images/`
    ```
    cd /var/lib/libvirt/images/

    qemu-img create -f qcow2 demodisk2.qcow2 3G
    ```
- Chỉnh sửa file xml của VM:
    ```
    virsh edit demo
    ```

- Thêm đoạn như sau và lưu lại
    ```xml
    <disk type='file' device='disk'>
        <driver name='qemu' type='qcow2'/>
        <source dev='/var/lib/libvirt/images/demodisk2.qcow2'/>
        <target dev='vdb' bus='virtio'/>
    </disk>
    ```
    **Trong đó:**
    - `<driver name='qemu' type='qcow2'/>` :tên driver và kiểu disk
    - `<source dev='/var/lib/libvirt/images/demodisk2.qcow2'/>` : đường dẫn tới đĩa ảo trên host KVM
    - `<target dev='vdb' bus='virtio'/>` : cần tạo tên khác với những disk ảo đã có của VM. Như ở đây, ta đặt là `vdb`

- Define lại file xml của VM
    ```
    virsh define /etc/libvirt/qemu/demo.xml
    ```

    <img src="..\images\Screenshot_167.png">

- Start VM và kiểm tra disk ta tạo trên VM

<img src="..\images\Screenshot_168.png">

<img src="..\images\Screenshot_169.png">

### 2. Phân vùng disk
Trên VM mới thêm disk `vdb`, ta thực hiện phân vùng.

- Dùng lệnh `fdisk`
    ```
    fdisk /dev/vdb

    Command (m for help):
    ```

- Gõ `n` để tạo phân vùng mới

    <img src="..\images\Screenshot_170.png">

- Nhập `p` để tạo phân vùng chính.

- Chọn phân vùng có sẵn. Ở đây, ta chọn phân vùng 1.

    <img src="..\images\Screenshot_171.png">

- Sau khi hoàn thành, gõ `w` để xác nhận thay đổi
    ```
    Command (m for help): w
    ```

- Định dạng phân vùng với với hệ thống file `ext3`
    ```
    mke2fs -j /dev/vdb1
    ```

    <img src="..\images\Screenshot_172.png">

- Sau khi phân vùng xong, ta kiểm tra 

    <img src="..\images\Screenshot_173.png">

**Tham khảo thêm:**
- [TheGeekStuff](https://www.thegeekstuff.com/2015/02/add-memory-cpu-disk-to-kvm-vm/)

- [Redhat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/sect-virtualization-virtualized_block_devices-adding_storage_devices_to_guests#sect-Virtualization-Adding_storage_devices_to_guests-Adding_file_based_storage_to_a_guest)

## II. Thêm card mạng cho VM
### 1. Thêm card mạng
- Xem những card mạng hiện tại có trên VM
```
virsh domiflist demo
```

<img src="..\images\Screenshot_174.png">

- Chỉnh sửa file xml của VM
- Thêm đoạn `interface` như sau vào file xml

```xml
<interface type='network'>
      <source network='hostonly'/>
      <model type='virtio'/>
</interface>
```

**Trong đó:**
- interface type : kiểu card mạng
- source : dải mạng mà card cắm vào

- `define` file xml của VM và khởi động lại VM

<img src= "..\images\Screenshot_175.png">

- Trên VM : 

<img src="..\images\Screenshot_176.png">

### 2. Xóa bỏ card mạng
Ta có thể xóa card mạng bằng 2 cách
- Xóa trong file xml của VM
- Sử dụng lệnh 
    ```
    virsh detach-interface --domain demo --type network --mac 52:54:00:2c:24:cb --config
    ```
