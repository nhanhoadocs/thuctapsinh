# Linux - Reset pasword bằng Single mode trên Console (part 2)

## Reset password Ubuntu 14.04

**Bước 1:** Khởi động lại hệ thống

**Bước 2:** Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím Shift vài lần. Giao diện boot menu tương tự như sau:

![Imgur](https://i.imgur.com/aWTlIwO.png)

**Bước 3:** Trên grub boot menu chọn kernel đang chạy và bấm `e` (viết tắt của edit) để chỉnh sửa

![Imgur](https://i.imgur.com/YkRzWlh.png)

**Bước 4:** Di chuyển đến dòng `linux /boot/vmlinuz..`

![Imgur](https://i.imgur.com/6HNR7Bq.png)

**Bước 5:** Sửa các tham số `ro console=tty0 console=ttyS0,115200n8` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/JVbc5Us.png)

**Bước 6:** Nhấn tổ hợp phím `Ctrl + x` hoặc nhấn phím `F10` để vào **Single Mode**.

Giao diện Single Mode tương tự như sau:

![Imgur](https://i.imgur.com/PVkXquj.png)

Sau đó thực hiện các lệnh sau:

Đổi mật khẩu user root:

    passwd root

Nhập mật khẩu mới và xác nhận lại mật khẩu mới.

Đồng bộ dữ liệu:

    sync

Khởi động lại hệ thống:

    reboot -f

![Imgur](https://i.imgur.com/G6BKaVK.png)

**Bước 7:** Đăng nhập bằng password mới và kiểm tra 

![Imgur](https://i.imgur.com/F79ivkH.png)

## Reset password Ubuntu 16.04

**Bước 1:** Khởi động lại hệ thống

**Bước 2:** Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím Shift vài lần. Giao diện boot menu tương tự như sau:

![Imgur](https://i.imgur.com/X2ZW6yQ.png)

**Bước 3:** Trên grub boot menu chọn kernel đang chạy và bấm `e` (viết tắt của edit) để chỉnh sửa

![Imgur](https://i.imgur.com/46SKNTz.png)

**Bước 4:** Di chuyển đến dòng `linux /boot/vmlinuz..`

![Imgur](https://i.imgur.com/kv3YhNi.png)

**Bước 5:** Sửa các tham số `ro net.ifname=0 biosdevname=0 console=tty0 console=ttyS0,115200n8` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/I4nRxzf.png)

**Bước 6:** Nhấn tổ hợp phím `Ctrl + x` hoặc nhấn phím `F10` để vào **Single Mode**.

Giao diện Single Mode tương tự như sau:

![Imgur](https://i.imgur.com/9VFJ99Y.png)

Sau đó thực hiện các lệnh sau:

Đổi mật khẩu user root:

    passwd root

Nhập mật khẩu mới và xác nhận lại mật khẩu mới.

Đồng bộ dữ liệu:

    sync

Khởi động lại hệ thống:

    reboot -f

![Imgur](https://i.imgur.com/e9dT9ov.png)

**Bước 7:** Đăng nhập bằng password mới và kiểm tra 

![Imgur](https://i.imgur.com/TiTuUJd.png)