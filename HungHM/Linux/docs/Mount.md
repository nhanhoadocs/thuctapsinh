<a name ="Mount">

# Mount
- Trong Linux để sử dụng được một thiết bị lưu trữ ta phải ``mount`` nó vào một thư mục nào đó để có thể sử dụng. Như vậy ``mount`` là gì?
- Nếu ta không mount thiết bị lưu trữ vào thì ta không thể sử dụng được nó.
- Lệnh mount có rất nhiều các option ở đây ta sẽ nói ví dụ một số option:
  - ``-h`` để hiển thị các option
  ![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/65631742_354535545210928_8233336097501872128_n.png?_nc_cat=103&_nc_oc=AQm0-EUHM_zmGPk00PJRwxZkqYAHhcPtar8CgTrSmhy0DBoYh8N-6asuaqOX5KilsDQ&_nc_ht=scontent.fhan5-7.fna&oh=d1816e330509d89ae5d30d9e369e3221&oe=5DC2EA47)

- Mount là hành động liên kết một thiết bị lưu trữ đến một cây thư mục. Chúng ta có 2 cách để mount thiết bị:

  - Mount thủ công
  - Mount tự đông
  
**1: Mount thủ công**
- Cách ``monut`` này thì khi ta reboot thì ta lại phải tiến hành ``mount`` lại. 
  - Câu lệnh: ``mount -t định_dạng đường_dẫn_thiết_bị điểm_mount``
- Trong đó:
- Các định dạng hỗ trợ như: ext2, ext3, ext4, reiserFS, swap, FAT32, NTFS, auto,... Nếu thiết bị đã được định dạng từ trước thì ta có thể bỏ qua option này.
- Đường dẫn thiết bị là thiết bị ta muốn tiến hành mount. Các thiết bị thường nằm trong /dev
- Điểm mount là thư mục ta muốn tiến hành gắn thiết bị vào.
  - VD: Ta muốn tiến hành mount phân vùng /dev/sdb2 của ổ sdb vào thư mục /test
```  
mount -t /dev/sdb2 /test
``` 
Sau khi mount xong ta có thể dùng lệnh ``lsblk`` để thấy được thiết bị đó đã có điểm mount.
```
lsblk
```
![](https://scontent.fhan5-6.fna.fbcdn.net/v/t1.15752-9/65054393_699349527192687_2971132932262985728_n.png?_nc_cat=105&_nc_oc=AQke3wkyQjjU2xcD8zYad3qzypkYWYYxYYRpjjdS9DFWKHmAX6qApRWPsJdCv-Rd3q0&_nc_ht=scontent.fhan5-6.fna&oh=8c3119712e246f029324c21e9cded373&oe=5DBBE78B)

- Như vậy là ta đã mount được. Bây giờ khi ta thao tác với thư mục /test thì tất cả các dữ liệu ta ghi lên thư mục /test sẽ được ghi lên thiết bị ta gán vào, dù ta tháo đĩa thiết bị đó ra mang đi nơi khác ta vẫn có thể đọc được dữ liệu đó.

- Khi không dùng ta có ngắt kết nối thiết bị với thư mục bằng cách dùng lệnh:
```
umount 
``` 
- Có 2 cách để umount thiết bị. Ta có thể dùng lện:
  -  umount đường_dẫn_thiết_bị
     - VD: ``umount /dev/sdb2``
  -  umount điểm_mount
     - VD: ``umount /test``
- Ta có thể dùng lại lệnh ``lsblk`` để kiểm tra xem đã umount chưa.
![](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/65467843_2261697300827610_8701832788006928384_n.png?_nc_cat=101&_nc_oc=AQk3EmPstxF7vYCa9sOEscwXKs7LUHIMDv998l-dKGjPAT6LEAUYJGjiGic0d3h1EgA&_nc_ht=scontent.fhan5-5.fna&oh=7bed3355691f1354b2cbb6594d82e5e7&oe=5DBAE786)
Như vậy là đã umount thành công!

- Ta có thể định dạng cho file và sau đó có thể mount mà không cần định dạng nữa ta dùng lệnh:
     ```
     mkfs -t ext4 /dev/sdb2
     ```
 - Sau đó dùng lệnh df -Th để xem các kiểu định dạng đã gán.
  ![](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/65439363_634899966921459_8010511811205922816_n.png?_nc_cat=110&_nc_oc=AQn9ygAlLQKx3wEOtjg0dALQ89Wrj1Yx0A7x-m4uIcXv6Md0SV9SwjIB0rBCf2KA1d0&_nc_ht=scontent.fhan5-2.fna&oh=b8a79b6b220f90fe9ca184a9b4b9f11b&oe=5DC14987)

**Lưu ý là không thể mount 2 thiết bị cùng 1 thư mục và ngược lại**

**2: Mount tự động**
- Khi ta thực hiện mount xong thì mỗi lần ta reboot ta không cần mount lại nữa vì nó sẽ tự động mount cho ta.

- Để có thể mount tự động thì ta cần phải vào file ``/etc/fstab`` để thêm thiết bị cần mount vào file fstab. sau khi máy khởi động nó sẽ tự động đọc file này và mount những gì được ghi ở trong file.

![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/mo3.png)
**cột 1**: Lưu tên thiết bị (UUID) hoặc đường dẫn tới file thiết bị trong thư mục /dev. Để biết UUID của thiết bị ta có thể dùng lệnh:
```
blkid
```
![](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/65093189_315602896010645_5503392830476779520_n.png?_nc_cat=108&_nc_oc=AQl90uDymRADR2wWcnZ_zaa7GgxMviUkIJCFjbSaGEIEJokj9OvZWZS4QIm1XFKfGQM&_nc_ht=scontent.fhan5-5.fna&oh=6388214709cd1672eca5d78771efa8d3&oe=5DB94BF2)

Nhưng thông thường ta dùng đường dẫn tới file cho đỡ dài và dễ hiểu hơn.

**Cột 2**: Cho biết điểm mount.

**Cột 3**: Cho biết định dạng file system của thiết bị.
- Thông thường là ext3, ext4, ReiserFS, swap, FAT32, NTFS, nfs, xfs, auto...

**Cột 4**:  Các tùy chọn. Nếu có nhiều tùy chọn thì chúng được phân biệt bởi dấu ,
- Có một số tùy chọn đáng chú ý sau:
  - Mặc định là ``defaults``: tương ứng với tập các tùy chọn rw, suid,dev, exec, auto, nouser, async. 
  - ``auto``:tự động mount khi máy tính khởi động
  - ``noauto``:phải tự chạy lệnh mount sau khi reboot
  - ``user`` cho phép người dùng thông thường được quyền mount
  - ``nouser``: chỉ có root mới có quyền mount
  - ``exec``: cho phép chạy các file nhị phân (binary) trên thiết bị.
  - ``noexec``: không cho phép chạy file binary trên thiết bị.
  - ``ro``: read only chỉ cho phép quyền đọc trên thiết bị.
  - ``rw``: cho phép cả đọc và ghi trên thiết bị.
  - ``sync``: thao tác nhập xuất (I/O) trên filesystem được đồng bộ hóa.
  - ``async``: thao tác nhập xuất (I/O) trên filesystem diễn ra không đồng bộ.
  
**Cột 5**: Là tùy chọn cho chương trình sao lưu filesystem. 
- Để **0** nếu muốn bỏ qua việc sao lưu.
- Để **1** nếu muốn thực hiện việc sao lưu. 

**Cột 6**: Là tùy chọn cho chương trình fsck dò lỗi trên filesystem. 
- Để **0**: bỏ qua việc kiểm tra. 
- Để **1**: thực hiện việc kiểm tra.

Để làm việc với file /etc/fstab ta có thể sử dụng bất kỳ trình soạn thảo nào có trên máy.Có thể dùng vi. Lệnh vi /etc/fstab

![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/mo5.png)

Sau khi thực hiện xong chúng ta lưu lại. Sau đó reboot lại máy và kiểm tra xem đã mount thành công chưa bằng cách dùng lệnh
```
df -h
```
Khi ta để tự động mount mỗi lần reboot mỗi khi reboot nó sẽ tự động mount cho ta. Khi muốn umount tạm thời ta vẫn có thể dùng lệnh umount bình thường nhưng khi reboot lại thì thiết bị lại được mount lại.

## Tài liệu tham khảo:
https://github.com/letuananh19/thuctapsinh/blob/master/NiemDT/Linux/docs/Mount.md

https://github.com/letuananh19/thuctapsinh/blob/master/Anhduc/liunux/docs/mount.md