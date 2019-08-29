# Cấu trúc File System trên Linux
<img src=https://i.imgur.com/atXWYl3.png>
<p align=center><i>Hệ thống File System trên CentOS 7</i></p>

<p align=center><img src=https://i.imgur.com/vn9yU7K.png></p>

## **1) `/root`**
- Thư mục home của user `root` .
- Chỉ có `root` mới có quyền `write` dưới thư mục này .

    <img src=https://i.imgur.com/G9jb5lU.png>

## **2) `/bin` - user binary**
- Chứa các tập tin thực thi nhị phân .
- Lệnh Linux phổ biến sử dụng ở chế độ ***single-user mode*** nằm ở thư mục này .
- Tất cả các user hệ thống nằm tại thư mục này đều có thể sử dụng lệnh .
## **3) `/sbin` - system binaries**
- Cũng giống như `/bin` , `/sbin` cũng chứa tập tin thực thi nhị phân .
- Những lệnh trong thư mục này chỉ được dùng bởi người quản trị hệ thống - tương đương user `root` .
## **4) `/etc` - configuration files**
- Chứa các tập tin cấu hình của hệ thống , các tập tin lệnh để khởi động các dịch vụ của hệ thống .
- Chứa shell scripts startup và shutdown , sử dụng để chạy / ngừng các chương trình cá nhân .

    <img src=https://i.imgur.com/QUtc7Jo.png>

## **5) `/dev/` - files device**
- Chứa thông tin nhận biết cho các thiết bị của hệ thống , bao gồm các thiết bị đầu cuối , USB hoặc các thiết bị được gắn trên hệ thống .
- Mỗi thiết bị đều có file đại diện và được đặt tên nhất định :
    - `cdrom` : đĩa CDROM / DVD
    - `hd*` : ổ đĩa IDE , ATA
        - `hda` : ổ cứng thứ nhất
        - `hdb` :	ổ cứng thứ hai
            - `hdb1` : phân vùng thứ nhất của ổ cứng thứ nhất    
    - `sd*` : ổ đĩa SCSI , SATA ( SSD , HDD ) , USB
        - `sda` : ổ cứng thứ nhất
        - `sdb` :	ổ cứng thứ hai
            - `sdb1` : phân vùng thứ nhất của ổ cứng thứ nhất
    - `nvme0*` : ổ cứng SSD NVMe
        - `nvme0n1` : ổ nvme thứ nhất
        - `nvme0n2` : ổ nvme thứ hai
            - `nvme0n2p1` : phân vùng thứ nhất của ổ nvme thứ nhất
    - `tty*` : cổng giao tiếp ( COM ,...)
    - `eth*`: cổng Ethernet

        <img src=https://i.imgur.com/cOyuL4I.png>

## **6) `/proc` - process information**
- Chứa các thông tin về System process .
- Đây là hệ thống tập tin giả có chứa thông tin về các tiến trình đang chạy hoặc thông tin về tài nguyên hệ thống .
## **7) `/var` - variable files**
- Là thư mục lưu lại tập tin ghi các số liệu biến đổi .
- Nội dung các tập tin được dự kiến sẽ tăng lên tại thư mục này .
- Bao gồm :
    - Hệ thống tập tin ghi **log** : `/var/log`
    - Các gói và các file dữ liệu : `/var/lib`
    - Email : `/var/mail`
    - File đợi in : `/var/spool`
    - Lock file : `/var/lock`
    - Data cho trang web : `/var/www`
    - Các file tạm thời khi cần reboot : `/var/tmp`
## **8) `/tmp` - temporary file**
- Thư mục chứa các tập tin tạm thời được tạo bởi hệ thống và user .
- Các tập tin trong thư mục này bị xóa khi hệ thống reboot lại .
## **9) `/usr` - user programs**
- Chứa các ứng dụng , thư viện , tài liệu và mã nguồn cho các chương trình thứ cấp .
- `/usr/bin` chứa các tập tin của ứng dụng chính đã được cài đặt cho user . Nếu không tìm thấy user binary tại `/bin` , có thể tìm thấy tại thư mục `/usr/bin` .<br>**VD :** `at` , `awk` , `cc` , `less` , `scp` , ...
- `/usr/lib` chứa thư viện cho `/usr/bin` và `/usr/sbin` .
- `/usr/local` chứa các chương trình mà user cài đặt từ source . <br>**VD :** Khi cài đặt **apache2** từ source , **apache 2** nằm ở `/usr/local/apache2` .
## **10) `/home` - home directory**
- Thư mục chứa các thư mục home của các user được tạo .
## **11) `/boot` - boot loader files**
- Chứa các tập tin cấu hình cho quá trình khởi động hệ thống .
- Các file `kernel initrd` , `vmlinux` , `grub` đều nằm trong đây .<br>**VD :** `initrd.img-2.5.32.24-generic` , `vmlinux-2.6.32-24-generic`
## **12) `/lib` - system libraries**
- Chứa các file thư viện hỗ trợ các thư mục nằm dưới `/bin` và `/sbin` .
- Tên file có thể là `ld*` hoặc `lib*.so*`<br>**VD :**  `ld-2.11.1.so` , `libncurses.so.5.7`
## **13) `/lib64` - system libraries x64**
- Tương tự như `lib` nhưng dành cho các chương trình 64bit .
## **14) `/opt` - optional**
- Chứa các ứng dụng thêm vào từ nhà cung cấp độc lập khác .
- Các ứng dụng này có thể được cài ở `/opt` hoặc 1 thư mục con của `/opt` .
## **15) `/media` - mount outside devices**
- Thư mục này có vai trò như đích đến của quá trình ***mount point*** . Khi gắn 1 thiết bị lưu trữ bên ngoài , để sử dụng cần ***mount*** thiết bị này vào 1 thư mục trong `/media` , từ đó , các thư mục , tập tin sẽ được chuyển vào đây ( lúc này `/media` có thể coi như ảnh chiếu của các thiết bị ) .
## **16) `/mnt` - mount inside device**
- Đây là thư mục tạm để mount các file hệ thống . <br>**VD :** `# mount /dev/sda2 /mnt`
## **17) `/srv` - system services's data**

## **18) `/run` -**

## **19) `/sys` - system files**
- Lưu các tập tin của hệ thống .
> ## **Đường dẫn tuyệt đối và đường dẫn tương đối**
- ***Đường dẫn tuyệt đối*** là đường dẫn chỉ ra vị trí chính xác của file và thư mục . Đường dẫn tuyệt đối sẽ được khai báo bắt đầu bởi ký tự `/` rồi đến thư mục con ...<br>   **VD :** `#cd /etc/sysconfig`
- ***Đường dẫn tương đối*** là đường dẫn mà vị trí của file và thư mục sẽ được tham chiếu bởi vị trí của thư mục hiện hành . Đường dẫn tương đối không được khai báo bắt đầu bởi thư mục gốc `/` <br>**VD :** `# cd network-scripts`
