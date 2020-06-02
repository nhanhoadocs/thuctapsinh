# Linux - Reset pasword bằng Single mode trên Console (part 2)

Trong trường hợp quên mật khẩu root của các hệ điều hành bên dưới, thực hiện đổi mật khẩu tài khoản root như sau:

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

## Reset password Centos 6.10

**Bước 1:** Khởi động lại hệ thống

**Bước 2:** Bấm phím bất kỳ để vào grub boot menu

![Imgur](https://i.imgur.com/46LlCcq.png)

**Bước 3:** Trên grub boot menu, chọn kernel máy đang chạy → bấm phím `E` để edit

![Imgur](https://i.imgur.com/Okhbb53.png)

**Bước 4:** Chọn dòng kernel `/boot/vmlinuz…` → bấm phím E để edit

![Imgur](https://i.imgur.com/pRRPfxl.png)

**Bước 5:** Bấm phím End di chuyển xuống cuối dòng → chỉnh sửa các tham số `console=tty0 console=ttyS0,115200n8` thành `rhbg quiet s`

![Imgur](https://i.imgur.com/f6wpVq3.png)

![Imgur](https://i.imgur.com/DNrYpUi.png)

**Bước 6:** Bấm phím Enter để lưu cấu hình tạm thời và quay về màn hình Grub

**Bước 7:** Bấm phím B để boot vào hệ thống khi đang ở dòng kernel `/boot/vmlinuz …`

![Imgur](https://i.imgur.com/jd7M5D5.png)

**Bước 8:** Đổi mật khẩu và Khởi động lại

    # Đổi mật khẩu
    passwd root

    # Khởi động lại
    reboot

![Imgur](https://i.imgur.com/avDFJK5.png)

**Bước 9:** Đăng nhập bằng password mới và kiểm tra

![Imgur](https://i.imgur.com/pi3U193.png)

## Reset password Centos 7.7 1908

**Bước 1:** Khởi động lại hệ thống

**Bước 2:** Trên grub boot menu chọn kernel đang chạy → bấm phím `E` để edit

![Imgur](https://i.imgur.com/3LiiPCl.png)

**Bước 3:** Di chuyển đển dòng `linux 16 ….`

![Imgur](https://i.imgur.com/blbZoXf.png)

Bước 4: Chỉnh sửa các tham số `ro` thành `rw` và `console=tty0 console=ttyS0,115200n8` thành `rd.break enforcing=0` → Bấm `Ctrl + X` để vào **Single mode**

![Imgur](https://i.imgur.com/19xNIei.png)

![Imgur](https://i.imgur.com/GecfJor.png)

**Bước 5:** Thực hiện thay đổi password

    # Access system 
    chroot /sysroot	

    # Reset password 
    passwd root

    # Update selinux information 
    touch /.autorelabel

    # Exit chroot
    exit 

    # Reboot system 
    reboot

![Imgur](https://i.imgur.com/ncMDLPH.png)

**Bước 6:** Đăng nhập bằng password mới để kiểm tra

![Imgur](https://i.imgur.com/DTKFsC0.png)

## Reset password Ubuntu 20

**Bước 1:** Khởi động lại hệ thống

**Bước 2:** Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím Shift vài lần. Giao diện boot menu tương tự như sau:

![Imgur](https://i.imgur.com/Ui8jHga.png)

**Bước 3:** Trên grub boot menu chọn kernel đang chạy và bấm `e` (viết tắt của edit) để chỉnh sửa

**Bước 4:** Di chuyển đến dòng `linux /boot/vmlinuz..`. Sửa các tham số `ro ...` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/wffV0nO.png)

![Imgur](https://i.imgur.com/b0XVs5e.png)

**Bước 6:** Nhấn tổ hợp phím `Ctrl + x` hoặc nhấn phím `F10` để vào **Single Mode**.

Sau đó thực hiện các lệnh sau:

Đổi mật khẩu user root:

    passwd root

Nhập mật khẩu mới và xác nhận lại mật khẩu mới.

Đồng bộ dữ liệu:

    sync

Khởi động lại hệ thống:

    reboot -f

![Imgur](https://i.imgur.com/qs4xW2N.png)

**Bước 7:** Đăng nhập bằng password mới và kiểm tra 

![Imgur](https://i.imgur.com/03Ymzzf.png)