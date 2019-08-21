# GRUB Configuration
## **1) Đặt mật khẩu bảo vệ GRUB**
- **GRUB - Grand Unified Boot Loader** là trình khởi động máy tính nằm trong **Master Boot Record ( MBR )** có trách nhiệm nạp **kernel** và **Initial RAM Disk** ( có chứa một số tệp quan trọng và trình điều khiển thiết bị cần thiết để khởi động hệ thống ) vào bộ nhớ .
- Với tính năng chứng thực mật khẩu **GRUB** sẽ chỉ cho phép quản trị viên dùng các hoạt động tương tác với **GRUB** , những người không có thẩm quyền sẽ không thể vào hệ thống qua chế độ **Single User Mode** để thay đổi mật khẩu `root` hay tinh chỉnh các giá trị của **GRUB** .
### **1.1) GRUB Plain Password**
- **B1 :** Login với user `root` :
- **B2 :** Tạo file backup `grub.cfg` và `10_linux`
    ```
    # cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.orig
    # cp /etc/grub.d/10_linux /etc/grub.d/10_linux.orig
    ```
- **B3 :** Chỉnh sửa file `10_linux`
    ```
    # vi /etc/grub.d/10_linux
    ```
    Thêm vào cuối file nội dung sau :
    ```
    cat << EOF
    set superusers="admin"
    password admin P@ssw0rd
    EOF
    ```
    <img src=https://i.imgur.com/D2Pj4Bu.png>

- **B4 :** Tạo lại file `grub.conf` từ những cấu hình đã chỉnh sửa :
    ```
    # grub2-mkconfig --output=/boot/grub2/grub.cfg
    ```
    <img src=https://i.imgur.com/HDedcjp.png>
    
- **B5 :** Khởi động lại hệ thống và kiểm tra :
    ```
    # reboot
    ```
- **B6 :** Tại màn hình chọn kernel , nhấn `e` để chỉnh sửa **GRUB_MENU** => yêu cầu nhập `user` và `password` vừa tạo :

    <img src=https://i.imgur.com/EltfCNb.png>

### **1.2) GRUB Encrypted Password**
- **B1 :** Login với user `root` :
- **B2 :** Tạo file backup `grub.cfg` và `10_linux`
    ```
    # cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.orig
    # cp /etc/grub.d/10_linux /etc/grub.d/10_linux.orig
    ```
- **B3 :** Tạo password mã hóa :
    ```
    # grub2-mkpasswd-pbkdf2
    ```
    => Copy phần password mã hóa "`grub.pbkdf2.sha512...`"

- **B4 :** Chỉnh sửa file `10_linux` :
    ```
    # vi /etc/grub.d/10_linux
    ```
    Thêm vào cuối file nội dung sau :
    ```
    cat << EOF
    set superusers="admin"
    passwd_pbkdf2 admin
    grub.pbkdf2.sha512....
    ```
- **B5 :** Tạo lại file `grub.conf` từ những cấu hình đã chỉnh sửa :
    ```
    # grub2-mkconfig --output=/boot/grub2/grub.cfg
    ```
- **B6 :** Khởi động lại hệ thống và kiểm tra :
    ```
    # reboot
    ```
## **2) Tùy chỉnh hiển thị màn hình đăng nhập**