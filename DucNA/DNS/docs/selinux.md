# Mục lục 


## 1. Khái niệm và concepts.
SELINUX là một cơ chế kiểm soát truy cập có sẵn trên hầu hết các hệ điều hành linux hiện nay. Và log của nó được ghi trong 
```
/var/log/messages 
```
SELINUX modes bao gồm có 3 chế độ: 
- Enforcing : SELINUX sẽ thực thi chính sách của mình trên hệ thống và đảm bảo mọi truy cập không được phép của người dùng và tiến trình đều bị từ chối. Và được ghi vào trong file log của hệ thống
- Permissive : Đây là trạng thái bán hoạt động. Các truy cập đều được chấp nhận nhưng những truy cập nào không phù hợp với chính sách sẽ bị ghi lại 
- Disabled : Trạng thái này selinux sẽ không hoạt động 
- Lệnh dùng để check mode selinux
```
getenforce
```
- Lệnh dùng để xem trạng thái của DNS 
```
sestatus
```

`SELINUXTYPE` xác định chính sách mà selinux sẽ chọn để áp dụng.

## 2. File configuration
SELINUX được cấu hình tại file 
```
/etc/selinux/config
hay còn được lưu ở trong 
/etc/sysconfig/selinux
```




# Link tham khảo 
https://www.digitalocean.com/community/tutorials/an-introduction-to-selinux-on-centos-7-part-1-basic-concepts#selinux-modes

https://www.digitalocean.com/community/tutorials/an-introduction-to-selinux-on-centos-7-part-2-files-and-processes

