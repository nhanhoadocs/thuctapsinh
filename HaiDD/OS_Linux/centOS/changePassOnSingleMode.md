# Reset password bằng Single mode trên Console 

Đối với các VM được Migrate từ hệ thống cũ có thể không sử dụng được nova set-password chúng ta thực hiện theo cách reset pass bằng cách login vào Single Mode, Safe Mode

# 1. Truy cập vào console của VM Linux
Trên giao diện người dùng sau khi đăng nhập vào Portal Cloud 365:

1. Chọn phần **Cloud Server**
2. Chọn mục **Server**
3. Chọn biểu tượng **Remote** trên VM cài Linux cần reset pass

<img src="https://i.imgur.com/IOjj7Bp.png">

**Kết quả:** Sẽ có một cửa sổ màn hình console của VM hiện ra như hình dưới đây

<img src="..\images\Screenshot_33.png">


# 2. Reset password
## 2.1. Reset password CentOS6
**Bước 1:** Sau khi truy cập vào Console, tiến hành restart VM. bằng cách chọn chuột vào nút **Send CtrlAltDel**

<img src="..\images\Screenshot_34.png">

**Bước 2:** Bấm phím bất kỳ để vào **grub boot menu**

<img src="..\images\Screenshot_35.png">

**Bước 3:** Trên **grub boot menu**, chọn **kernel** máy đang chạy → bấm phím **E** để edit

<img src="..\images\Screenshot_37.png">

**Bước 4:** Chọn dòng  **kernel /boot/vmlinuz…** → bấm phím **E** để edit 

<img src="..\images\Screenshot_38.png">

**Bước 5:** Bấm phím End di chuyển xuống cuối dòng → chỉnh sửa các tham số `console=tty0 console=ttyS0,115200n8` thành `rhbg quiet s`

<img src="..\images\Screenshot_39.png">

<img src="..\images\Screenshot_40.png">

**Bước 6:** Bấm phím **Enter** để lưu cấu hình tạm thời và quay về màn hình Grub

**Bước 7:** Bấm phím **B** để boot vào hệ thống khi đang ở dòng **kernel /boot/vmlinuz …**

<img src="..\images\Screenshot_41.png">

**Bước 8:** Đổi mật khẩu và reboot
```
# Đổi mật khẩu
passwd root

# Reboot
reboot
```

<img src="..\images\Screenshot_42.png">

**Bước 9:** Đăng nhập bằng password mới và kiểm tra

<img src="..\images\Screenshot_43.png">

## 2.2. Reset passsword CentOS7
**Bước 1:** Sau khi truy cập vào Console, tiến hành restart VM. bằng cách chọn chuột vào nút **Send CtrlAltDel**

<img src="..\images\Screenshot_44.png">

**Bước 2:** Trên **grub boot menu** chọn kernel đang chạy → bấm phím **E** để edit 

<img src="..\images\Screenshot_45.png">

**Bước 3:** Di chuyển đển dòng `linux 16 …. `

<img src="..\images\Screenshot_47.png">

**Bước 4:** Chỉnh sửa các tham số `ro` thành `rw`  và `console=tty0 console=ttyS0,115200n8` thành `rd.break enforcing=0` → Bấm **Ctrl + X** để vào **Single mode**

<img src="..\images\Screenshot_46.png">

<img src="..\images\Screenshot_48.png">

**Bước 5:** Thực hiện thay đổi password
```
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
```
<img src="..\images\Screenshot_49.png">

**Bước 6:** Đăng nhập bằng password mới để kiểm tra

<img src="..\images\Screenshot_50.png">