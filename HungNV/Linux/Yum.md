# Yum (Yellowdog Updater Modified)
Yum là 1 dòng lệnh mã nguồn mở cho phép người dùng và quản trị viên hệ thống dễ dàng cài đặt, cập nhật, gỡ bỏ hoặc tìm kiếm các gói phần mềm hệ thống. 

**Cấu trúc:**   
yum [tùy chọn] [lệnh] [tên gói]

###### 1.Kiểm tra các cập nhật
Kiểm tra các gói nào đã cài đặt đang có sẵn phiên bản cập nhật
``` 
[root@host ~]# yum check-update
```
Cập nhật tất cả các gói đã cài đặt
```
[root@host ~]# yum update
```
Cập nhật 1 gói cụ thể hoặc 1 phiên bản cụ thể của gói
``` 
[root@host ~]# yum update [tên gói]
```
###### 2.Cài đặt gói
Cài đặt 1 gói hoặc phiên bản cụ thể của gói
```
[root@host ~]# yum install [gói]
```
Cài đặt gói mà không cần xác nhận
```
[root@host ~]# yum -y install [gói]
```
###### 3. Liệt kê gói
Để tìm kiếm 1 gói cụ thể ta dùng `list`
```
[root@host ~]# yum list [gói]
```
###### 4. Xem thông tin gói
Để biết thông tin 1 gói trước khi ta cài đặt nó, ta sử dụng `info`
```
[root@host ~]# yum info [gói]
```
###### 5. Xóa gói bằng yum
lệnh này sẽ xóa gói được chỉ định cùng với tất cả các phụ thuộc của nó
```
[root@host ~]# yum remove [tên gói]
```
###### 6. Tải 1 gói mà không cài đặt
Trước tiên ta phải cài đặt gói  `plugin"downloadonly"`
```
[root@host ~]# yum install yum-plugin-dowloadonly
```
sau đó ta chạy lệnh yum với tùy chọn `--downloadonly`
```
[root@host ~]# yum install --downloadonly --downloaddir=<tên ổ đĩa lưu> <gói cài đặt>
```
sau khi tải, ta vào lại ổ đĩa lưu và kiểm tra xác nhận gói đã tồn tại.

