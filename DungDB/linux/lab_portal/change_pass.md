# Linux - Reset pasword bằng Single mode trên Console

Đối với các VM được Migrate từ hệ thống cũ có thể không sử dụng được nova set-password chúng ta thực hiện theo cách reset pass bằng cách login vào Single Mode, Safe Mode.

## 1. Truy cập vào console của Vm Linux 

Truy cập vào trang https://portal.cloud365.vn/. Đăng nhập vào bằng tài khoản của bạn. Click vào **Cloud Server**, click vào **Server** để hiển thị danh sách serve của bạn. Click vào biểu tượng hình máy tính ở cột thao tác tại server cần đổi mật khẩu.

![Imgur](https://i.imgur.com/Sh4bFmJ.png)

## 2.1  Reset password Ubuntu 12

Bước 1: Sau khi truy cập vào Console, tiến hành restart VM bằng cách click vào ô **Send CtrlAltDel** tại góc phải phía trên.

![Imgur](https://i.imgur.com/ae8FgQi.png)

Bước 2: Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím **Shift** vài lần.

Bước 3: Trên grub boot menu chọn kernel đang chạy và bấm **e** để edit 

![Imgur](https://i.imgur.com/L5N1pkT.png)

Bước 4: Di chuyển đến dòng `linux /boot/vmlinuz..`

![Imgur](https://i.imgur.com/UkgX4xB.png)

Bước 5: Sửa các tham số `ro console=ttyS0` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/sm78E5f.png)

Bước 6: Nhấn tổ hợp phím `Ctrl + x` hoặc nhấn phím `F10` để vào Single Mode. Sau đó thực hiện các lệnh sau:

Đổi mật khẩu

    passwd root

Đồng bộ dữ liệu

    sync

Khởi động lại hệ thống

    reboot -f

![Imgur](https://i.imgur.com/fqdKNX2.png)

Bước 7: Đăng nhập bằng password mới và kiểm tra 

    ssh root@<IP> 

## 2.2  Reset password Ubuntu 14

Bước 1: Sau khi truy cập vào Console, tiến hành restart VM bằng cách click vào ô **Send CtrlAltDel** tại góc phải phía trên.

![Imgur](https://i.imgur.com/58fz64Q.png)

Bước 2: Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím **Shift** vài lần.

Bước 3: Trên grub boot menu chọn kernel đang chạy và bấm **e** để edit 

![Imgur](https://i.imgur.com/mNwstTg.png)

Bước 4: Di chuyển đến dòng `linux    /boot/vmlinuz..`

![Imgur](https://i.imgur.com/vRZt5SN.png)

Bước 5: Sửa các tham số `ro console=tty0 console=ttyS0...` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/52rBMeg.png)

Bước 6: Nhấn tổ hợp phím Ctrl + x hoặc nhấn phím F10 để vào Single Mode. Sau đó thực hiện các lệnh sau:

Đổi mật khẩu

    passwd root

Đồng bộ dữ liệu

    sync

Khởi động lại hệ thống

    reboot -f

![Imgur](https://i.imgur.com/beuXJ8k.png)

Bước 7: Đăng nhập bằng password mới và kiểm tra 

    ssh root@<IP> 

## 2.3  Reset password Ubuntu 16

Bước 1: Sau khi truy cập vào Console, tiến hành restart VM bằng cách click vào ô **Send CtrlAltDel** tại góc phải phía trên.

![Imgur](https://i.imgur.com/mGkAKHF.png)

Bước 2: Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím **Shift** vài lần.

Bước 3: Trên grub boot menu chọn kernel đang chạy và bấm **e** để edit 

![Imgur](https://i.imgur.com/6XbXXAT.png)

Bước 4: Di chuyển đến dòng `linux    /boot/vmlinuz..`

![Imgur](https://i.imgur.com/PMYPJGe.png)

Bước 5: Sửa các tham số `ro net.ifname=0 biosdevname=0 ...` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/kfc9aIo.png)

Bước 6: Nhấn tổ hợp phím Ctrl + x hoặc nhấn phím F10 để vào Single Mode. 

![Imgur](https://i.imgur.com/ApIedlv.png)

Sau đó thực hiện các lệnh sau:

Đổi mật khẩu

    passwd root

Đồng bộ dữ liệu

    sync

Khởi động lại hệ thống

    reboot -f

![Imgur](https://i.imgur.com/mhyxd78.png)

Bước 7: Đăng nhập bằng password mới và kiểm tra 

    ssh root@<IP> 

## 2.4  Reset password Ubuntu 18

Bước 1: Sau khi truy cập vào Console, tiến hành restart VM bằng cách click vào ô **Send CtrlAltDel** tại góc phải phía trên.

![Imgur](https://i.imgur.com/U26zL8f.png)

Bước 2: Vào Grub boot menu. Thường thì hệ thống sẽ tự động hiển thị Grub boot menu. Nếu không thấy, hãy thử khởi động lại VM và nhấn phím **Shift** vài lần.

Bước 3: Trên grub boot menu chọn kernel đang chạy và bấm **e** để edit 

![Imgur](https://i.imgur.com/8CRPPPx.png)

Bước 4: Di chuyển đến dòng `linux    /boot/vmlinuz..`

![Imgur](https://i.imgur.com/qpBsdDx.png)

Bước 5: Sửa các tham số `ro net.ifname=0 biosdevname=0 ...` thành `rw init=/bin/bash`

![Imgur](https://i.imgur.com/aKUIM18.png)

Bước 6: Nhấn tổ hợp phím Ctrl + x hoặc nhấn phím F10 để vào Single Mode. 

![Imgur](https://i.imgur.com/5eRfAJD.png)

Sau đó thực hiện các lệnh sau:

Đổi mật khẩu

    passwd root

Đồng bộ dữ liệu

    sync

Khởi động lại hệ thống

    reboot -f

![Imgur](https://i.imgur.com/k5gv40C.png)

Bước 7: Đăng nhập bằng password mới và kiểm tra 

    ssh root@<IP> 

