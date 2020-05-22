### Hướng dẫn tạo 1 hard disk trên Linux  

**I. Tìm hiểu về Logical Volume**  

`Logical Volume Management` được sử dụng để tạo nhiều ổ đĩa logic. Nó cho phép các bộ phận logic được thay đổi kích thước (giảm hoặc tăng) theo ý muốn của người quản trị. 
Logical Volume Manager (LVM) là phương pháp cho phép ấn định không gian đĩa cứng (Physical Volume) thành những Logical Volume khiến cho việc thay đổi kích thước trở nên dễ dàng hơn. Với kỹ thuật LVM ta có thể thay đổi kích thước mà không phải sửa lại bảng table của OS. Điều này rất hữu ích khi ta sử dụng hết phần bộ nhớ còn trống của partition (phân vùng) và muốn mở rộng dung lượng của nó. `Physical Volume` là những đĩa vật lý như `sda`,`sdb`,... `Group Volume` là một nhóm tập hợp nhiều `Physica Volume`, dung lượng tổng được sử dụng để tạo ra các `Logical Volume`. `Logical Volume` có thể xem là các "phân vùng ảo" trên "ổ đĩa ảo" ta có thể thêm vào, gỡ bỏ và thay đổi kích thước một cách nhanh chóng.  
<img src="https://i.imgur.com/sotY3mn.png">
  
**Ưu điểm**:  
- Có thể gom nhiều đĩa cứng vật lý thành 1 đĩa ảo có dung lượng lớn hơn.
- Có thể tạo ra các phân vùng có dung lượng lớn nhỏ tùy ý.  
- Có thể thay đổi kích thước các vùng dễ dàng và linh hoạt.  
**Nhược điểm**:  
- Các bước thiết lập phức tạp.  
- Càng gắn nhiều ổ đĩa và thiết lập LVM thì hệ thống khởi động càng lâu.  
- Có thể bị mất dữ liệu khi 1 trong các đĩa cứng vật lý bị hỏng.  


**1. Kiểm tra Hard Disk**  
`Logical Volume Management` được sử dụng để tạo nhiều ổ đĩa logic. Nó cho phép các bộ phận logic được thay đổi kích thước (giảm hoặc tăng) theo ý muốn của người quản trị.  

<img src="https://i.imgur.com/fNCFJRO.png">

Kiểm tra `Hard Drivers` có trên hệ thống bằng lệnh `lsblk`   

<img src="https://i.imgur.com/eUhBMre.png">

Ta thấy hệ thống đang có 1 hard disk nằm trong `/dev/sda` vậy nên ta sẽ tiếp tục add thêm 1 hard disk `/dev/sdb` nữa.  

Mở `Edit visual machine setting` ở cửa sổ VMWare. Chọn `Add` và click vào phần `Harddisk`.  

<img src="https://i.imgur.com/MTi0zij.png">  

Tiếp tục thiết lập thông số cho hard disk. Ở đây chọn dung lượng đĩa size = 10G. Sau đó chọn `Next` và `Finish`.  

<img src="https://i.imgur.com/mK6xhmO.png">

Sau đó ta kiểm tra lại `/sdb` đã được tạo chưa:

<img src="https://i.imgur.com/zttgS3i.png">  

**2. Phân vùng hard disk**  

Bây giờ chúng ta sẽ phân vùng cho hard disk `/sdb`. Để thao tác phân vùng đĩa, hãy mở nó và bắt đầu bằng lệnh dưới đây:   
```
# fdisk /dev/sdb
```
Tiếp theo ấn phím `m` để xem các tùy chọn.  

<img src="https://i.imgur.com/EdnlHLf.png">

Muốn phân vùng ta sử dụng lệnh `p`.   
Để tạo một phân vùng mới, hãy dùng lệnh `n` và sau đó chọn `p` cho `primary` và depending 1-4 vào phân vùng trên ổ đĩa này.  
Ta để các thông số cài đặt theo chế độ mặc định (default) ngoại trừ `Last sector` ta để `+5G`.  
- `n` (tạo một phân vùng mới)  
- `p` (tạo phân vùng chính)  
- `1` (số `1` biểu thị phân vùng sẽ là `/dev/sdb1`)  
Sau đó ta dùng lệnh `w` để lưu và thoát.

<img src="https://i.imgur.com/KqYOZQm.png">

**3. Định dạng lại partition thành LVM**  

 Tiếp tục gõ lệnh `fdisk /dev/sdb` và sử dụng lệnh `t` để thay đổi định dạng partition. Chọn `8e` để thay đổi thành `LVM` rồi chọn `w` để lưu.  

<img src="https://i.imgur.com/ejguw40.png">

Tương tự tạo các partition khác của `/sdb` là `sdb2`, `sdb3`.  
Và tạo thêm hard disk `/sdc` kèm theo các partition `sdc1`, `sdc2`.

<img src="https://i.imgur.com/dlFl6aZ.png">  

**4. Tạo Physical Volume (PV)**  

Sử dụng lệnh `pvcreate` để tạo các Physical Volume.
```
# pvcreate /dev/sdb1
# pvcreate /dev/sdc1
```
Nếu bạn không thực hiện được lệnh `pvcreate` thì tiến hành cài đặt `yum install -y lvm2`.  

<img src="https://i.imgur.com/cJtwF5v.png">

Kiểm tra danh sách các Physical Volume được tạo bằng lệnh `pvs` hoặc `pvdisplay`.  

<img src="https://i.imgur.com/M3uJaFj.png">

**5. Tạo Volume Group**  
Tiếp theo ta sẽ nhóm các Physical Volume vào Volume Group. Cú pháp lệnh:  
```
# vgcreate vgcreate tên_group_volume Physical_volume1 Physical_volume2 Physical_volume3 ...
```
<img src="https://i.imgur.com/wDY1I6x.png">

Ta sử dụng lệnh `vgs` hoặc `vgdislay` để xem kết quả Volume Group vừa tạo. 

**6. Tạo Logical Volume**  
Từ 1 `Volume Group` ta có thể tạo ra các `Logical Volume` bằng cách sử dụng lệnh theo cú pháp:  
```
# lvcreate -L size_volume -n logical_volume_name group_volume_name
```
<img src="https://i.imgur.com/taXsOHU.png">  

Sử dụng lệnh `lvs` để kiểm tra kết quả.  

**7. Định dạng Logical Volume**  
Để format `Logical Volume` thành các định dạng như `ext2`, `ext3`, `ext4` ta thực hiện như sau:  
<img src="https://i.imgur.com/fHN8nif.png">  

**8. Mount và sử dụng**  

Ta tạo 1 thư mục và mount Logical Volume vào đó.

<img src="https://i.imgur.com/fQ7Kc9z.png">  


**II. Thay đổi dung lượng Logical Volume, Volume Group trên LVM**  

**1. Thay đổi dung lượng Logical Volume**  

*Lưu ý*: trước khi thay đổi ta cần kiểm tra lại thông tin hiện có bằng các lệnh `pv`s `vgs` `lvs`.  
Cần lưu ý rằng nếu muốn tăng kích thước của 1 `logical volume` thì `group volume` chứa `logical volume` đó còn dư dung lượng và chưa cấp phát cho logical volume khác.  
- Tăng dung lượng Logical Volume  
Cú pháp lệnh:  
```
# lvextend -L +size logical_volume_name
```
Ví dụ: `lvextend -L +1G /dev/gv_demo/lv_demo`  

Sau khi tăng kích thước cho Logical volume thì Logical volume đã được tăng. Để cập nhật thay đổi và có thể sử dụng ta dùng lệnh `resize2fs`. Cụ thể trong trường hợp này ta dùng lệnh `resize2fs /dev/gv_demo/lv_demo`.  

- Giảm dung lượng Logical Volume:

Trước tiên để giảm kích thước của Logical Volume ta phải umount Logical Volume mà mình muốn giảm `umount /dev/gv_demo/lv_demo`. Tiến hành giảm kích thước của Logical Volume `lvreduce -L 0.5G /dev/g_volume/l_volume`. 

Tiến hành format lại Logical volume `mkfs -t ext4 /dev/gv_demo/lv_demo` Cuối cùng mount lại Logical volume `mount /dev/gv_demo/lv_demo test_folder`.  

**2. Thay đổi dung lượng Volume Group trên LVM** 

Trong phần này chúng ta sẽ tìm hiểu cách để mở rông và thu hồi kích thước của `Volume Group`. Việc thay đổi kích thước của `volume group` chính là việc thêm `Physical volume` hay thu hồi `Physical volume` ra khổi `Volume Group`. Trước tiên cần kiểm tra lại `partition` và `Volume group` bằng lệnh `lsblk` và `vgs`.  

- Thêm partition:  

Tiếp theo nhóm thêm 1 partition vào trong Volume Group. Cú pháp lệnh: 
```
# vlextend /dev/gv_demo/ /dev/sdb2
```  
- Giảm partition:  

 ```
# vlreduce /dev/gv_demo/ /dev/sdb2
 ``` 
 **3. Xóa Logical Volume, Volume Group, Physical Volume**

- Xóa Logical Volume 
 Trước tiên phải `umount` `logical volume` Sau đó tiến hành xóa `logical volume` bằng câu lệnh `lvremove`.  
 Cú pháp:
 ```
 # lvremove /dev/volume_group_name/logical_volum_name
 ```
- Xóa Volume Group 

Muốn xóa `Volume Group` thì cần phải tiến hành xóa hết `Logical Volume` trong Volume Group đó. Rồi dùng lệnh `vgremove`. 

- Xóa Physical Volume 
Cuối cùng ta dùng lệnh `pvremove` để xóa `Physical Volume`.  
```
# pvremove /dev/sdb1
```









