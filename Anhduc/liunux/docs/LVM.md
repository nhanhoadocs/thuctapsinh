# 1.Khái niệm 
a) LVM
-LVM: là phươn pháp ấn định không gian đĩa cứng thành những logical volume khiến cho việc thay đổi kích thước trở lên dễ hơn. Khi dùng LVM giúp ta có thể thay đổi khích thước mà không cần phải sửa table của OS.
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-17%2020-32-44.png)
- Physical volume: là một đĩa cứng vật lý hoặc là partition 
- Volume group: là một nhóm các physical volume ( ổ đĩa ảo )
- logical volume: là các phân vùng ảo của ổ đĩa ảo 

b) Những thành phần của LVM
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2009-06-00%20(copy).png)
- Ổ cứng (HDD): là thiết bị lưu trữ của máy tính. Nó là loại bộ nhớ không thay đổi và không bị mất dữ liệu khi ta ngừng cung cấp nguồn điện cho chúng 
- Partition: là các phân vùng của ổ cứng. Mỗi một ổ cứng có 4 partition. Trong đó bao gồm 2 loại là primary partition và extended partition 
    - primary partition: còn được gọi là phân vùng chính, có thể khởi động và mỗi ổ cứng chỉ có tối đa 4 phân vùng này 
    - extended partition: Hay còn được gọi là phân vùng mở rộng của ổ cứng

c) Vậy phân vùng có tác dụng gì? tại  sao phải phân vùng ổ cứng? 
- Sự phân chia ổ cứng có thể định dạng các loại tệp tin khác nhau để có thể cài đặt được nhiều hệ điều hành đồng thời trên cùng một ổ cứng.
- Phân chia ổ cứng không phải là một sự bắt buộc đối với một đĩa cứng 
- Phan vùng giúp cho việc quản lý các nội dung lưu trữ và phân loại dữ liệu được tốt hơn 
- Phân vùng gồm:
    - Phân vùng chính(primary): tối đa có 4 phân vùng chính 
    - Phân vùng Extended : là nơi có thể chia ra thành các phân vùng logical 
    - Phân vùng logical: Là loại phân vùng bé nhất nằm trong các phân vùng lớn hơn
- Một vài định dạng File System trong linux
    - Một ổ cứng mới sau khi phân vùng cần phải được định dạng 
    - Ext: là định dạng file system đầu tiên được thiết kế dành cho linux có tất cả gồm 4 phiên bản từ Ext1 đến Ext4. Hiện nay đa phần người dùng Ext4 vì nó có thể giảm bớt  hiện tượng phân mảnh dữ liệu trong ổ cứng, hỗ trợ các file và phân vùng có dung lượng lớn...
    - XFS: Nó khá giống với Ext4 về mốt số mặt. như hạn chế phân vùng dữ liệu, không cho phép các snapshot tự động kết hơp với nhau, hỗ trợ nhiều file dung lượng lớn...
    - JFS: Điểm mạnh của JFS là tiêu tốn tài nguyên hệ thống và đạt hiệu suất hoạt động tốt hơn, tốc độ kiểm tra ổ đĩa nhanh hơn so với các phiên bản Ext 

d) Quản lý phân vùng trong linux
- Qui tắc đặt tên đĩa
    - IDE hard disks:
        - `dev/hda` : Primary master IDE (often the hard disk)
        - `/dev/hdb`: Primary slave IDE
        - `/dev/hdc`: Secondary master IDE (often a CD-ROM)
        - `/dev/hdd`: Secondary slave IDE
    - SCSI device files
        - `/dev/sda`: First SCSI drive
        - `/dev/sdb`: Second SCSI drive
        - `/dev/sdc`:Third SCSI drive (and so on)
- Qui tắc đặt tên partition
    - Primary partitions
        - /dev/hda1
        - /dev/hda2
        - /dev/hda3
        - /dev/hda4
- Extended partitions
    - /dev/hda1 (primary)
    - /dev/hda2 (extended)
- Logical partitions
    - /dev/hda1 (primary)
    - /dev/hda2 (extended)
    - /dev/hda5 (logical)
    - /dev/hda6 (logical)
    - /dev/hda7 (logical)
    - /dev/hda8 (logical)

<a name="a">

- Quản lý phân vùng trên linux </a>
    - Lệnh liệt kê các phân vùng `fdisk -l` hoặc `lsblk`
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2009-37-59.png)
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2009-41-14.png)
    - Nếu muốn tạo ra một phân vùng trên ổ cứng thì ta dùng lệnh fdisk để vào 
        - ví dụ: `fdisk /dev/sda` 
        - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2010-08-38.png)
        - sau khi vào xong ấn m để hiển thị những trợ giúp 
        - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2010-08-03.png)
        - Một vài nút cơ bản 
            - `n`: tạo mới 
            - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2010-17-10.png)
            - Như ta nhìn thấy ở đây có 1 phân vùng primary 0 phân vùng extended 
            - chọn p để tạo ra một phân vùng primary và e để tạo extended
            - chọn số phân vùng mặc định ở đây là 2 bạn có thể chọn từ 2 tới 4
            - Cuối cùng, xác định sector cuối của phân vùng. Ấn Enter để chấp nhật sử dụng hết phần ổ đĩa còn trống. Thay vì chỉ định sector, bạn có thể chỉ định kích thước, chữ viết tắt tương ứng: K – Kilobyte, M – Megabyte và G – Gigabyte. Ví dụ, gõ “+5G” cho phân vùng với kích thước 5 Gigabyte. Nếu bạn không gõ đơn vị sau dấu “+”, fdisk sẽ lựa chọn sector làm đơn vị. Ví dụ, nếu bạn gõ “+10000”, fdisk sẽ cộng thêm 10000 sector để làm điểm kết thúc của phân vùng.
            - chọn loại phân vùng 
            - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2008-47-11.png) 
            - chọn `w` để lưu và thoát
            - `d`: xóa
            - `e`: để thêm một phân vùng extended
        * Note: Mỗi máy chỉ có tối đa 4 phân vùng primary
            - trước khi sử dụng ta nên định dạng phân vùng với lệnh `mkswap` hoặc `mkfs -t`
            - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2009-32-29.png)
            - Muốn sử dụng được phân vùng mới tạo ra thì ta phải mount nó. ta vào file `/etc/fstab` để sửa
            - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2008-54-40.png)

# 2. Ưu nhược điểm của LVM
- Ưu điểm:
    - Có thể gom nhiều đĩa cứng vật lý lại thành một đĩa ảo dung lượng lớn.
    - Có thể tạo ra các vùng dung lượng lớn nhỏ tuỳ ý.
    - Có thể thay đổi các vùng dung lượng một cách dễ dàng, linh hoạt
- Nhược điểm:

    - Các bước thiết lập phức tạp và khó khăn hơn
    - Càng gắn nhiều đĩa cứng và thiết lập càng nhiều LVM thì hệ thống khởi động càng lâu.
    - Khả năng mất dữ liệu cao khi một trong số các đĩa cứng bị hỏng.
    - Windows không thể nhận ra vùng dữ liệu của LVM. Nếu Dual-boot ,Windows sẽ không thể truy cập dữ liệu trong LVM.
- Vai trò của LVM
    - Không để hệ thống bị gián đoạn khi họat động.
    - Không làm học dịch vụ.
    - Có thể kết hợp Hot Swapping (thao tác thay thế nóng các thành phần bên trong máy tính)
# 3. Hướng dẫn sử dụng LVM
### Lưu ý: Để thực hiện kỹ thuật này máy của ta cần có nhiều hơn 1 ổ cứng. Chúng ta có thể hình dung nếu máy của ta chỉ có 1 ổ cứng thì nó tương đương với `Group Volume` và các partition thương đương như là `logical volum`
a) Tạo partition 
- Tạo ra các partition như phân chia ổ cứng đã nói ở trên 

b) Tạo ra Physical volume 
- Sử dụng lệnh `pvcreate` 
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2009-24-31.png)

c) Tạo Group volume 
- Sử dụng lệnh `vgcreate` 
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2009-26-35.png)

d) Tạo logical volume
- Sử dụng lệnh `lvcreate -L size_volume -n (ten logical) (tên group volume)`
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2009-28-53.png)

e) Định dạng logical 

f) Rồi ta mount lại và sử dụng nó 
# 4. Thay đổi dung lượng 
a) Logical volume 
- Giảm dung lượng 
    - Trước tiên để giảm kích thước của Logical Volume ta phải umount Logical Volume mà mình muốn giảm `umount /dev/g_volume/l_volume` Tiến hành giảm kích thước của `Logical Volume lvreduce -L 0.5G /dev/g_volume/l_volume`
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-36-38.png)
    - Tiến hành format lại Logical volume `mkfs -t ext4 /dev/g_volume/l_volume` Cuối cùng mount lại Logical volume `mount /dev/g_volume/l_volume test_volume`
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-38-29.png)
- Tăng dung lượng 
    - Trước tiên ta phải kiểm tra xem group volume còn dư dung lượng hay không bằng lệnh `vgs`
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-41-10.png)
    -để tăng kích thước ta dùng lệnh `lvextend -L +size (ten logical volume)` và dưới là đã thông báo size được chuyển từ 0.5 lên 1 dùng lệnh `lvs` để kiểm tra lại 
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-44-12.png)
    - Cập nhật thay đổi ta dùng lệnh `resize2fs`
    - ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-47-49.png)

b) Volume group 
- Trước tiên cần kiểm tra lại partition và Volume group
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-49-33.png)
- Thêm partition vào group 
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-51-17.png)
- Xóa partition vào group 
# 5 Xóa 
a) logical volume 
- Trước tiên phải `umount` logical volume Sau đó tiến hành xóa logical volume bằng câu lệnh `lvremove`
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-55-58.png)

b) volume group 
- Trước khi xóa Volume Group ta phải xóa tất cả các Logical Volume trong group đó Để xóa Volume Group ta dùng lệnh `vgremove`
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-57-23.png)

c) physical volume 
- Cuối cùng là xóa Physical Volume Dùng lệnh pvremove
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-22%2012-58-09.png)