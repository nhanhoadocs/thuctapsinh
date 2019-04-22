# 1. khái niệm
- `Mout` là gì? và tại sao ta luôn phải `mout` các phân vùng trước khi sử dụng? 
- Tất cả các file có thể truy cập trong một hệ thống unix được sắp xếp theo một hệ thống cây lớn, hệ thống phân cấp tệp tin. Và thư mục cao nhất là (/)
- Lệnh `mount`: để gắn hay để liên kết một thiết bị lưu trữ đến một vị trí trong cây thư mục 
- Nếu ta không mount thiết bị lưu trữ vào thì ta không thể sử dụng được nó. 
# 2. Cách dùng
- Có hai cách mount đó là mount thủ công và mount tự động
- Lệnh mount có rất nhiều các option ở đây tôi sẽ nói ví dụ một số option
- `-h` để hiển thị các option
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2014-41-08.png)
- `-V` để hiển thị phiên bản của mount đang dùng 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2014-39-36.png)
### Mount tự động 
- Khi ta thực hiện mount xong thì xong mỗi lần ta reboot ta không cần mout lại nữa nó sẽ tự động mount cho ta. 
- Để có thể mout tự động thì ta cần phải vào file `/etc/fstab` để thêm thiết bị cần mout vào file `fstab`. sau khi máy khởi động máy sự tự động đọc file này và mount những gì được ghi ở trong file 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2014-49-03.png)
- Giải thích các trường của dòng `mount`
    - Trường đầu tiên `/dev/sda1`: đây là (UUID) hay còn có thể viết bằng đường dẫn
    - Để kiểm tra UUID của thiết bị lưu trữ ta có thể dùng lệnh `blkid`
    - ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2014-39-36.png) 
    - Trường thứ 3 ( ext4): là trường được gọi là filesystem của thiết bị ( định dạng file) đã được nói đến ở phần định dạng ổ cứng 
    - Trường thứ 4 ( defaults): ta  sẽ để ở dạng defaults chứ còn một số option của trường này 
        - auto: tự động mount khi máy khởi động 
        - noauto: không tự động mount 
        - user: cho phép bất cứ người dùng nào cũng có thể mount 
    - Trường thứ 5: cho chương trình sao lưu filesystem. 0 là là bỏ qua còn 1 là thực hiện sao lưu 
    - Trường thứ 6: Cho fdisk dò lỗi trên filesystem. 0 là là bỏ qua còn 1 là thực hiện 

- Sau khi mount thì hãy kiểm tra bằng lệnh `df -h` xem những gì đã được mount lại và cây thư mục 

### Mount thủ công 
- Khi mout thủ công thì ta sử dụng câu lệnh. Nhưng khi mout thủ công thì mỗi lần reboot máy sẽ đọc file `/etc/fstab`
sẽ không thấy có phần mount tự động do đó ta phải mount lại một lần nữa để có thể sử dụng được thiết bị lưu trữ
- Cấu trúc câu lệnh: `mount -t (định dạng file ) (đường dẫn) ( nơi mount )
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2016-36-59.png)
- Các định dạng hỗ trợ như: ext2, ext3, ext4, swap, FAT32, NTFS, auto... Nếu file được định dạng từ trước thì có thể bỏ qua option định dạng file này 
- Ta định dạng file 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2016-35-47.png)
- Đường dẫn chính là đường dẫn đến thiết bị mà ta muốn mount
- Nơi mount là nơi mà ta gắn nó vào để kết nối tới thư mục (/)
- Kiểm tra lại 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/mount/Screenshot%20from%202018-11-29%2016-37-05.png)