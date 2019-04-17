# Mục lục
[1. Logical Volume Manager(LVM) là gì?](#khainiem)
 * [Ưu điểm](#uudiem)
 * [Nhược điểm](#nhuocdiem)

[2.Hướng dẫn sử dụng LVM](#huongdansudunglvm)
 * [Tạo partition](#taopartitton)
 * [Tạo Physical Volume](#taophysicalvolume)
 * [Tạo Group Volume](#taogroupvolume)
 * [Tạo Logical Volume](#taologicalvolume)
 * [Định dạng Logical Volume](#dinhdanglogicalvolume)

[2.1.Thay đổi dung lượng Logical Volume trên LVM](#thaydoidungluonglogicalvolume)
 * [Tăng dung lượng](#tangdungluong)
 * [Giảm dung lượng](#giamdungluong)

[2.2 Thay đổi dung lượng Volume Group trên LVM](#thaydoidungluongvolumegroup)
 * [Thêm partiton](#thempartition)
 * [Bớt partition khỏi volume group](#botpartition)

[ 2.3 Xóa logical Volume, Volume Group, Physical Volume](#xoalogicalgroupphysical)
 * [Xóa Logical Volume](#xoalogicalvolume)
 * [Xóa Volume Group](#xoavolumegroup)
 * [Xóa Physical Volume](#xoaphysicalvolume)

<a name="khainiem">

## 1. Logical Volume Manager(LVM) là gì?

`Logical Volume Manager` (LVM) là phương pháp cho phép ấn định không gian đĩa cứng (Physical Volume) thành những Logical Volume khiến cho việc thay đổi kích thước trở nên dễ dàng hơn. Với kỹ thuật LVM ta có thể thay đổi ta có thể thay đổi kích thước mà không phải sửa lại bảng table của OS. Điều này rất hữu ích khi ta sử dụng hết phần bộ nhớ còn trống của partition và muốn mở rộng dung lượng của nó.
`Physical Volume` Là những đĩa vật lý như sda,sdb,... 
`Group Volume` Là một nhóm tập hợp nhiều Physica Volume, dung lượng tổng được sử dụng để tạo ra các Logical Volume.
`Logical Volume` có thể xam là các "phân vùng ảo" trên "ổ đĩa ảo" ta có thể thêm vào gỡ bỏ và thay đổi kích thước một cách nhanh chóng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM1.png)

<a name="uudiem">

### Ưu điểm
 * Có thể gom nhiều đĩa cứng vật lý lại thành một đĩa ảo dung lượng lớn hơn.
 * Có thể tạo ra các vùng dung lượng lớn nhỏ tùy ý.
 * Có thể thay đổi các vùng dung lượng đó dễ dàng linh hoạt.

<a name="nhuocdiem">

### Nhược điểm
 * Các bước thiết lập phức tạp.
 * Càng gắn nhiều đĩa cứng và thiết lập càng nhiều LVM thì hệ thống khởi động càng lâu.
 * Khả năng mất dữ liệu khi một trong đĩa cứng vật lý bị hỏng.
<a name="huongdansudunglvm">

## 2. Hướng dẫn sử dụng LVM
Để thực hiện kỹ thuật này máy của ta cần có nhiều hơn 1 ổ cứng. Chúng ta có thể hình dung nếu máy của ta chỉ có 1 ổ cứng thì nó tương đương với `Group Volume` và các `partition` thương đương như là `Logical Volume`.
<a name="taopartitton">

### Tạo partition
Trước tiên kiểm tra `Hard Drives` có trên hệ thống bằng lệnh `lsblk`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM2.png)

Từ các Hard drives trên hệ thống, ta tạo ra các partition. Sử dụng lệnh `fdisk`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM3.png)

Tiếp theo thay đổi định dạng của partition vùa tạo thành `Linux LVM`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM4.png)

Tương tự tạo các partition primary từ các disk còn lại.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM5.png)

<a name="taophysicalvolume">

### Tạo Physical Volume
Tạo `Physical Volume` bằng lệnh `pvcreate`
VD ở đây ta tạo 2 Physical volume là `/dev/sdb1` và `/dev/sdc1`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM6.png)

Kiểm tra danh sách các Physical Volume bằng lệnh `pvs` hoặc `pvdisplay`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM7.png)

<a name="taogroupvolume">

### Tạo Group Volume
Tạo `Group volume` bằng lệnh `vgcreate`
Ở đây ta nhóm các Physical volume vừa tạo ở trên thành 1 Group Volume
Cú pháp `vgcreate tên_group_volume Physical_volume1 Physical_volume2 Physical_volume3 ..`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM8.png)

Sử dụng câu lệnh `vgs` hoặc `vgdisplay` để kiểm tra lại Volume Group vừa tạo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM9.png)

<a name="taologicalvolume">

### Tạo Logical Volume 
Ta có thể tạo ra nhiều `logical volume` từ một group volume
Cú pháp `lvcreate -L size_volume -n tên_logical_volume tên_group_volume`
VD ta tạo 1 logical volume có dung lượng `2G` tên là `l_volume` từ group volume `g_volume` vừa tạo ở trên
`lvcreate -L 2G -n l_volume g_volume`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM10.png)

Sử dụng lệnh `lvs` hoặc `lvdisplay` để kiểm tra các Logical Volume đã tạo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM11.png)

<a name="dinhdanglogicalvolume">

### Định dạng Logical Volume
Để format các Logical Volume thành các định dạng như ext2, ext3, ext4 ta thực hiện như với partition

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM12.png)

Bây giờ ta chỉ việc `Mount` nó vào thư mục và sử dụng bình thường

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM13.png)

<a name="thaydoidungluonglogicalvolume">

## 2.1 Thay đổi dung lượng Logical Volume trên LVM
<a name="tangdungluong">

### Tăng dung lượng
Phần này ta tìm hiểu cách thay đổi dung lượng của Logical volume trong LVM mà ta đã tạo ở phần trước.
*Lưu ý* trước khi thay đổi ta cần kiểm tra lại thông tin hiện có bằng các lệnh `pvs` `vgs` `lvs`
Cần lưu ý rằng nếu muốn tăng kích thước của 1 logical volume thì group volume chứa logical volume đó còn dư dung lượng và chưa cấp phát cho logical volume khác.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM14.png)

Ta thấy ở đây dung lượng còn dư để có thể tăng cho các logical volume trong group này là 5,99G
Để tăng kích thước của Logical Volume ta dùng lệnh
`lvextend -L +size tên_logical_volume`
Vd ở đây ta tăng dung lượng `1G` cho logical volume `l_volume` nằm trong group volume `g_volume` 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM15.png)

Kiểm tra lại dùng lệnh `lvs`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM16.png)

Sau khi tăng kích thước cho Logical volume thì Logical volume đã được tăng. Để cập nhật thay đổi và có thể sử dụng ta dùng lệnh `resize2fs`
Cụ thể trong trường hợp này ta dùng lệnh `resize2fs /dev/g_volume/l_volume`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM17.png)

Bây giờ ta đã thấy sự thay đổi
<a name="giamdungluong">

### Giảm dung lượng
Trước tiên để giảm kích thước của Logical Volume ta phải umount Logical Volume mà mình muốn giảm
`umount /dev/g_volume/l_volume`
Tiến hành giảm kích thước của Logical Volume
`lvreduce -L 0.5G /dev/g_volume/l_volume`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM18.png)

Tiến hành format lại Logical volume
`mkfs -t ext4 /dev/g_volume/l_volume`
Cuối cùng mount lại Logical volume
`mount /dev/g_volume/l_volume test_volume`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM19.png)

<a name="thaydoidungluongvolumegroup">

## 2.2 Thay đổi dung lượng Volume Group trên LVM
Trong phần này chúng ta sẽ tìm hiểu cách để mở rông và thu hồi kích thước của Volume Group
Việc thay đổi kích thước của volume group chính là việc thêm Physical volume hay thu hồi Physical volume ra khổi Volume Group
Trước tiên cần kiểm tra lại partition và Volume group

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM20.png)

<a name="thempartition">

### Thêm partiton
Tiếp theo, nhóm thêm 1 partiton vào Volume Group
`vgextend /dev/g_volume /dev/sdb2`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM21.png)

<a name="botpartition">

### Bớt partition khỏi volume group
`vgreduce /dev/g_volume /dev/sdb2`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM22.png)

<a name="xoalogicalgroupphysical">

## 2.3 Xóa logical Volume, Volume Group, Physical Volume
<a name="xoalogicalvolume">

### Xóa Logical Volume
Trước tiên phải `umount` logical volume
Sau đó tiến hành xóa logical volume bằng câu lệnh `lvremove`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM23.png)

<a name="xoavolumegroup">

### Xóa Volume Group
Trước khi xóa Volume Group ta phải xóa tất cả các Logical Volume trong group đó
Để xóa Volume Group ta dùng lệnh `vgremove`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM24.png)

<a name="xoaphysicalvolume">

### Xóa Physical Volume
Cuối cùng là xóa Physical Volume
Dùng lệnh `pvremove`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/LVM25.png)
