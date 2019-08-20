# Root password Recovery
- **B1 :** Khởi động Server . Ở trình khởi động **GRUB** , gõ `E` và tìm tới dòng có chữ "`ro`" :

    <img src=https://i.imgur.com/QG240jL.png>

- **B2 :** Thay thế "`ro`" => "`rw init=/sysroot/bin/sh`" :

    <img src=https://i.imgur.com/E66kVPa.png>

- **B3 :** Sau đó gõ `Ctrl` + `X` để vào **Single User Mode** :

    <img src=https://i.imgur.com/X0ZmGhx.png>

- **B4 :** Truy cập hệ thống bằng lệnh
    ```
    # chroot /sysroot
    ```

    <img src=https://i.imgur.com/gCK4j1q.png>
    
- **B5 :** Tạo mật khẩu mới cho user `root` :
    ```
    # passwd
    ```

    <img src=https://i.imgur.com/9feVFAD.png>

- **B6 :** Update thông tin vào **SELinux** và thoát khỏi chế độ `chroot` :
    ```
    # touch /.autorelabel
    # exit
    ```
- **B7 :** Thoát và khởi động lại Server . Sau đó đăng nhập user `root` với mật khẩu vừa tạo .