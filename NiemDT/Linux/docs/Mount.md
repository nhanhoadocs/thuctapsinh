Trong Linux để sử dụng được một thiết bị lưu trữ ta phải `mount` nó vào một thư mục nào đó để có thể sử dụng. Như vậy `mount` là gì? `Mount` là hành động liên kết một thiết bi lưu đến một cây thư mục.
Chúng ta có 2 cách để mount thiết bị:
 * Cách `mount` thủ công
 * `Mount` tự đông
### 1. Mount thủ công
Cách `monut` này thì khi ta reboot thì ta lại phải tiến hành mount lại.
Câu lệnh: `mount -t định_dạng đường_dẫn_thiết_bị điểm_mount`
Trong đó: 
 * Các định dạng hỗ trợ như: ext2, ext3, ext4, reiserFS, swap, FAT32, NTFS, auto,... Nếu thiết bị đã được định dạng từ trước thì ta có thể bỏ qua option này.
 * Đường dẫn thiết bị là thiết bị ta muốn tiến hành `mount`. Các thiết bị thường nằm trong `/dev/`
 * Điểm mount là thư mục ta muốn tiến hành gắn thiết bị vào.
VD: Tôi muốn tiến hành `mount` phân vùng `/dev/sdb1` của ổ `sdb` vào thư `/root/test`. Vì thư mục này tôi đã tiến hành format từ trước nên tôi không cần đinh dạng khi tiến hành `mount`
Lệnh: `mount /dev/sdb1 /root/test`. Sau kho `mount` xong ta có thể dùng lệnh `lsblk` để thấy được thiết bị đó đã có điểm mount.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo1.png)

Bây giờ khi ta thao tác với thư mục `test` thì tất cả các dữ liệu ta ghi lên sẽ ghi lên thiết bị ta gán vào và khi ta tháo đĩa thiết bị đó ra mang đi nơi khác ta vẫn có thể đọc được dữ liệu đó. 
Khi không dùng ta có ngắt kết nối thiết bị với thư mục bằng cách dùng lệnh `umount`
Có 2 cách để `umount` thiết bị. Ta có thể dùng lệnh `umount đường_dẫn_thiết_bị` hoặc `umount điểm_mount`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo2.png)

### 2. Mount tự động
Với cách này ta chỉ cần thực hiện một lần khi reboot ta cũng ko cần phải thực hiện mount lại.
Với cách `mount` này ta sẽ thực hiện nó trong file `/etc/fstab`. File `fstab` là một bảng lưu trữ thông tin về các thiết bị, mount point và các thiết lập của nó. Khi khởi động hệ thống sẽ đọc file này và tiến hành mount tự động thiết bị.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo3.png)

`Cột 1`: Lưu tên thiết bị (UUID) hoặc đường dẫn tới file thiết bị trong thư mục `/dev`.
Để biết `UUID` của thiết bị ta có thể dùng lệnh `blkid` 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo4.png)

Nhưng thông thường ta dùng đường dẫn tới file cho đỡ dài và dễ hiểu hơn.
`Cột 2`: Cho biết điểm mount
`Cột 3`: Định dạng file system của thiết bị. Thông thường là ext3, ext4, ReiserFS, swap, FAT32, NTFS, nfs, xfs, auto...
`Cột 4` Các tùy chọn. Nếu có nhiều tùy chọn thì chúng được phân biệt bởi dấy `,`. Có một số tùy chọn đáng chú ý sau:
 * `auto`:tự động mount khi máy tính khởi động
 * `noauto`:phải tự chạy lệnh mount sau khi reboot
 * `user` cho phép người dùng thông thường được quyền mount
 * `nouser`: chỉ có root mới có quyền mount 
 * `exec`: cho phép chạy các file nhị phân (binary) trên thiết bị.
 * `noexec`: không cho phép chạy file binary trên thiết bị.
 * `ro`: read only chỉ cho phép quyền đọc trên thiết bị.
 * `rw`: cho phép cả đọc và ghi trên thiết bị.
 * `sync`: thao tác nhập xuất (I/O) trên filesystem được đồng bộ hóa.
 * `async`: thao tác nhập xuất (I/O) trên filesystem diễn ra không đồng bộ.
 * `defaults`: tương ứng với tập các tùy chọn rw, suid,dev, exec, auto, nouser, async.
`Cột 5`: là tùy chọn cho chương trình sao lưu filesystem. Để `0` nếu muốn bỏ qua việc sao lưu. Để `1` nếu muốn thực hiện việc sao lưu.
`Cột 6`: là tùy chọn cho chương trình fsck dò lỗi trên filesystem. Để `0`: bỏ qua việc kiểm tra. Để `1`: thực hiện việc kiểm tra.

Để làm việc với file `/etc/fstab` ta có thể sử dụng bất kỳ trình soạn thảo nào có trên máy. Đây tôi dùng `vi`. Lệnh `vi /etc/fstab`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo5.png)

Sau khi thực hiện xong chúng ta lưu lại. Sau đó reboot lại máy và kiểm tra xem đã mount thành công chưa bằng cách dùng lệnh `df -h`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mo6.png)

Khi ta để tự động mount mỗi lần reboot mỗi khi reboot nó sẽ tự động mount cho ta. Khi muốn umount tạm thời ta vẫn có thể dùng lệnh `umount` bình thường nhưng khi reboot lại thì thiết bị lại được mount lại.