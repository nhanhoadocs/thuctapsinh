# Cài đặt Pi-hole trên CentOS 7

## Update hệ thống
```
yum -y update
```

## Disable SELinux
- Chỉnh sửa file cấu hình SeLinux :`/etc/selinux/config`. Để trạng thái `SELINUX=disabled` và lưu lại.

    ```
    # This file controls the state of SELinux on the system.
    # SELINUX= can take one of these three values:
    #     enforcing - SELinux security policy is enforced.
    #     permissive - SELinux prints warnings instead of enforcing.
    #     disabled - No SELinux policy is loaded.
    SELINUX=disabled
    # SELINUXTYPE= can take one of three values:
    #     targeted - Targeted processes are protected,
    #     minimum - Modification of targeted policy. Only selected processes are protected.
    #     mls - Multi Level Security protection.
    SELINUXTYPE=targeted
    ```

- Reboot máy
    ```
    reboot
    ```

- Kiểm tra lại trạng thái SeLinux
    ```
    sestatus

    SELinux status:                 disabled
    ```

## Cài đặt phiên bản mới nhất của Pi-hole và chạy nó với bash
- Tải về và cài đặt
    ```
    curl -sSL https://install.pi-hole.net | bash
    ```

- Cài đặt PHP 7.x

    <img src="..\images\Screenshot_1.png">

- Chọn `OK`

    <img src="..\images\Screenshot_2.png">

    <img src="..\images\Screenshot_3.png">

    <img src="..\images\Screenshot_4.png">

- Chọn nhà cung cấp DNS ngược dòng. Ở đây, ta chọn `Google`. Bạn cũng có thể chọn Custom để chọn nhà cung cấp của riêng bạn. Rồi chọn `OK`

    <img src="..\images\Screenshot_5.png">

- Pi-hole dựa vào danh sách của bên thứ ba để chặn quảng cáo. Ta chọn `OK`

    <img src="..\images\Screenshot_6.png">

- Chọn giao thức. Ta chọn cả `IPv4` và `IPv6` để chặn tốt hơn. Chọn `OK`

    <img src="..\images\Screenshot_7.png">

- Sử dụng Static IP hiện tại của máy. Chọn `Yes`

    <img src="..\images\Screenshot_8.png">

- Chọn `OK`

    <img src="..\images\Screenshot_9.png">

- Chọn cài đặt giao diện quản lí trên web. Chọn `OK`

    <img src="..\images\Screenshot_10.png">

- Chọn `On`. Chọn `OK`

    <img src="..\images\Screenshot_11.png">

- Truy vấn log. Ta chọn `On`. Rồi chọn `OK`

    <img src="..\images\Screenshot_12.png">

- Chọn `OK`

    <img src="..\images\Screenshot_13.png">

- Cho phép Pi-hole qua tường lửa    

    <img src="..\images\Screenshot_14.png">

- Đợi 1 lúc để quá trình cài đặt thực hiện. Sau đó sẽ hiện bảng như dưới đây

    <img src="..\images\Screenshot_15.png">

    Ta copy mật khẩu Admin webpage ra một chỗ. Rồi chọn `OK`

- Kiểm tra trạng thái của Pi-hole
    ```
    systemctl status pihole-FTL
    ```

## Webpage admin
- Truy cập trang admin Pi-hole theo dạng
    ```
    <địa_chỉ_IP>/admin
    ```
- Ta vào trang Admin như hình

    <img src="..\images\Screenshot_16.png">

- Login vào trang quản lí. Ta chọn Login và nhập password mà ta đã copy ra ở bước trên. Ở đây, pass của ta là `fAgfBEUh`

    <img src="..\images\Screenshot_17.png">

