# File hệ thống

Hệ thống tập tin của Linux và Unix được tổ chức theo 1 hệ thống phân bậc tương tự cấu trúc của 1 cây phân cấp. Bậc cao nhất là thư mục gốc, ký hiệu là "`/`" (root directory)

- `/` – *Root:*
    - Mở từng tập tin và thư mục từ thư mục Root.
    - Chỉ có Root user mới có quyền viết dưới thư mục này.
    - Lưu ý rằng `/root` là thư mục gốc của Root user.
- `/bin` – *User Binaries*
    - Chứa các tập tin thực thi nhị phân (binary executables).
    - Tất cả user trên hệ thống nằm tại thư mục này đều có thể sử dụng lệnh.
- `/sbin` – *System Binaries*
    - Cũng giống như `/bin`, `/sbin` cũng chứa tập tin thực thi nhị phân (binary executables).
- `/etc` – *Configuration Files*
    - Chứa cấu hình các tập tin cấu hình của hệ thống, các tập tin lệnh để khởi động các dịch vụ của hệ thống……
    - Ngoài ra `/etc` còn chứa shell scripts startup và shutdown, sử dụng để chạy/ngừng các chương trình cá nhân.
- `/dev` – *Files device*
    - Chứa các tập tin để nhận biết cho các thiết bị của hệ thống (device files).
    - Bao gồm thiết bị đầu cuối, USB hoặc các thiết bị được gắn trên hệ thống.
- `/proc` – *Process Information*
    - Chưa các thông tin về System Process.
    - Đây là một hệ thống tập tin ảo có thông tin về tài nguyên hệ thống. Chẳng hạn như `/proc/uptime`.
- `/var` – *Variable Files*
    - Var là viết tắt của variable file, lưu lại tập tin ghi các số liệu biến đổi (variable files).
    - Nội dung các tập tin được dự kiến sẽ tăng lên tại thư mục này.
    - Bao gồm: hệ thống tập tin log (`/var/log`), các gói và các file dữ liệu (`/var/lib`), email (`/var/mail`), print queues (`/var/spool`); lock files (`/var/lock`); các file tạm thời cần khi reboot (`/var/tmp`).
- `/tmp` – *Temporary Files (các tập tin tạm thời)*
    - Thư mục chứa các tập tin tạm thời được tạo bởi hệ thống và user.
    - Các tập tin tạo thư mục này được xóa khi hệ thống được khởi động lại (reboot).
- `/usr` – *User Programs*
    - Chứa các ứng dụng, thư viện, tài liệu và mã nguồn các chương trình thứ cấp.
    - Chẳng hạn khi bạn cài đặt apache từ nguồn, apache nằm dưới `/usr/local/apache2`.
- `/home` – *thư mục Home*
    - Thư mục chính lưu trữ các tập tin cá nhân của tất cả user.
- `/boot` – *Boot Loader Files*
    - Chứa các tập tin cấu hình cho quá trình khởi động hệ thống.
    - Ví dụ như file grub nằm trong `/boot`.
- `/lib` – *System Libraries*
    - Chứa các file thư viện hỗ trợ các thư mục nằm dưới - `/bin` và `/sbin`.
    - Tên file thư viện có thể là ld* hoặc lib*.so.*.
- `/opt` – *Optional add-on Applications*
    - Opt là viết tắt của Optional (tùy chọn).
    - Chứa các ứng dụng add-on từ các nhà cung cấp.
    - Ứng dụng add-on được cài đặt dưới thư mục `/opt/` hoặc thư mục `/opt/sub`.
- `/mnt` – *Mount Directory*
    - Gắn kết các thư mục hệ thống tạm thời (thư mục Temporary) nơi Sysadmins có thể gắn kết các file hệ thống.
- `/media` – *Removable Media Devices*
    - Gắn kết các thư mục Temporary (thư mục tạm thời) được hệ thống tạo ra khi một thiết bị lưu động (removable media) được cắm vào như đĩa CDs, máy ảnh kỹ thuật số...
    - Ví dụ: `/media/cdrom for CD-ROM`;` /media/floppy for floppy drives`; `/media/cdrecorder` for CD writer.

- `/srv` – *Service Data*
    - `Svr` viết tắt của service.
    - Chứa các service của máy chủ cụ thể liên quan đến dữ liệu.

## Hệ thống tập tin:
Hệ thống tập tin Linux gốc: 'ext3', 'ext4', 'btrfs', 'xfs'.
Trước khi sử dụng 1 hệ thống tập tin, bạn phải gắn nó vào cây hệ thống tại 1 `mountpoint`.
Nên gắn vào thư mục trống.
- `mount`: sử dụng để moutn vào cây tập tin
```
Ví dụ: 
'moutn /dev/sd5a /mnt'
-> đính kèm hệ thống tập tin có trong phân vùng đĩa được liên kết với dev/sd5a trên thiết bị vào cây tập tin tại /mnt
```
- `unmount`: tách các hệ thống tập tin từ điểm mount
```
unmount /mnt
```
---