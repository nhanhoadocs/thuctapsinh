# 1. Lệnh hiển thị danh sách máy ảo
```
virt list --all 
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-49-16.png)
# 2. Xóa một máy ảo 
```
virsh undefine (ten may)
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-59-26.png)
# 3. Chỉnh sửa thông số CPU hoặc memory 
```
virsh (ten may)
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-57-31.png)
# 4.Chạy một máy ảo
```
virsh start (ten may)
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-49-56.png)
# 5. Shutdown một máy ảo 
```
virsh shutdown (ten may)
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-50-13.png)
# 6. Reboot một máy ảo 
```
virsh reboot (ten may)
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-51-10.png)
# 7. Tạo ra một bảo snapshot 
```
virsh snapshot-create-as --domain tên_máy --name tên_bản_snapshot --description "mô tả bản snapshot"
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-52-26.png)
# 8.Liệt kê danh sách bản snapshot 
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-53-05.png)
# 9.Xem một thông tin chi tiết của bản snapshot 
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-55-23.png)
# 10. Chạy một bản snapshot 
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-56-09.png)
# 11. Xóa một bản snapshot 
![](https://github.com/duckmak14/linux/blob/master/KVM/images/virsh/Screenshot%20from%202019-02-21%2014-56-57.png)