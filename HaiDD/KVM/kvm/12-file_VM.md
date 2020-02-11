# Các file của VM trên KVM

### Một số các thư mục và file (mặc định) của VM trên KVM

1. Thư mục lưu các disk của VM
```
/var/lib/libvirt/images/
```
<img src="..\images\Screenshot_118.png">


2. Thư mục chứa các file `.xml` thông số kĩ thuật của VM
```
/etc/libvirt/qemu/
```
<img src="..\images\Screenshot_119.png">

3. Thư mục chứa các file liên quan đến network
```
/etc/libvirt/qemu/networks/
```
<img src="..\images\Screenshot_120.png">

4. Thư mục lưu các storage
```
/etc/libvirt/storage/
```
<img src="..\images\Screenshot_121.png">

5. Thư mục chứa các images của VM
```
/var/lib/libvirt/images/
```
<img src="..\images\Screenshot_122.png">

6. Thư mục lưu các bản snapshot của các VM
```
/var/lib/libvirt/qemu/snapshot/
```
<img src= "..\images\Screenshot_123.png">