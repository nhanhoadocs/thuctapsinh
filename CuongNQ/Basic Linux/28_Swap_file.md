# Swap file
- **Swap** là khái niệm bộ nhớ ảo được sử dụng trên Linux . Khi VPS / Server hoạt động , nếu hết RAM hệ thống sẽ tự động dùng 1 phần ổ cứng để làm bộ nhớ cho các ứng dụng hoạt động .
- Với những server không có **swap** , khi hết RAM hệ thống thường tự động *stop service* **MySQL** do đó hay xuất hiện thông báo lỗi "*Establishing a Database Connection*"
- Do sử dụng ổ cứng có tốc độ chậm hơn RAM , nhất là những Server không dùng **SSD** , do đó không nên thường xuyên sử dụng **swap** , sẽ làm giảm hiệu năng hệ thống .
- Với các VPS dùng công nghệ ảo hóa **OpenVZ** , có thể sẽ không tạo được **swap** do hệ thống đã tự động kích hoạt sẵn .
## **Các bước tạo Swap file**
- **B1 :** Kiểm tra phân vùng **swap** :
    ```
    # swapon -s
    ```
- **B2 :** Kiểm tra dung lượng còn trống trên ổ cứng :
    ```
    # df -h
    ```
- **B3 :** Tạo file **Swap** :
    ```
    # dd if=/dev/zero of=/var/swapfile bs=1M count=2048
    ```
    - Trong đó :
        - `bs` là đơn vị tính ( `M` , `G` , `K`)
        - `count` là số lượng `bs` cấp cho **swap file**<br>=> **swap file** có dung lượng = `count*bs`
- **B4 :** Tạo phân vùng **swap** :
    ```
    # mkswap /var/swapfile
    ```
- **B5 :** Kích hoạt **swap** :
    ```
    # swapon /var/swapfile
    ```
- **B6 :** Kiểm tra lại trạng thái **swap** :
    ```
    # swapon -s
    ```
- **B7 :** Lưu cấu hình vào file `/etc/fstab` :
    ```
    # echo /var/swapfile none swap defaults 0 0 >> /etc/fstab
    ```
- **B8 :** Bảo mật file **swap** :
    ```
    # chown root:root /var/swapfile
    # chmod 0600 /var/swapfile
    ```
## **Cấu hình Swappiness**
- **Swappiness** là mức độ ưu tiên sử dụng **swap** , khi lượng RAM còn lại bằng giá trị của **swappiness** ( tính theo `%` ) thì **swap** sẽ được sử dụng .
- **Swappiness** có giá trị từ `0` -> `100` :
    - `= 0` : **swap** chỉ được dùng khi RAM bị sử dụng hết
    - `= 10` : **swap** được sử dụng khi RAM còn `10%`
    - `= 60` : **swap** được sử dụng khi RAM còn `60%`
    - `= 100` : **swap** được sử dụng ưu tiên như là RAM<br>=> Do **swap** chậm hơn RAM => nên đặt **swappiness** về gần `0` ( hoặc chỉnh là `10`)
- Kiểm tra mức độ dùng **swap** của hệ thống bằng lệnh :
    ```
    # cat /proc/sys/vm/swappiness
    ```
- Chỉnh thông số **swappiness** mặc định thành `10` :
    ```
    # sysctl vm.swappiness=10
    ```
- Lưu thông số **swappiness** vào file `/etc/sysctl.conf`
    ```
    # vi /etc/sysctl.conf
    ```
    => Thêm dòng "`vm.swappiness = 10`"<br>
    => Khởi động lại Server và kiểm tra .
>***Lưu ý :***
- Với CentOS 7.2 có thể tune profile sẽ ghi đè `vm.swappiness` mỗi lần reboot , cần kiểm tra lại profile nào đang ghi đè để cấu hình lại thủ công :
    ```
    # grep vm.swappiness /usr/lib/tuned/*/tuned.conf
    ```
- Sau đó mở file `/usr/lib/tuned/virtual-guest/tuned.conf` , tìm `vm.swappiness` và thay đổi `vm.swappiness=30` thành `vm.swappiness=10` .
    ```
    # vi /usr/lib/tuned/virtual-guest/tuned.conf
    ```
    => Khởi động lại Server .
## **Thay đổi dung lượng Swapfile**
- **B1 :** Tắt **swap** :
    ```
    # swappoff /var/swapfile
    ```
- **B2 :** Xóa file **swap** :
    ```
    # rm -f /var/swapfile
    ```
- **B3 :** Tạo mới lại file **swap** với dung lượng mong muốn :
    ```
    # dd if=/dev/zero of=/var/swapfile bs=1M count=4096
    ```
- **B4 :** Tạo phân vùng **swap** mới :
    ```
    # mkswap /var/swapfile
    ```
- **B5 :** Kích hoạt **swap** :
    ```
    # swapon /var/swapfile
    ```
- **B6 :** Bảo mật file **swap** :
    ```
    # chown root:root /var/swapfile
    # chmod 0600 /var/swapfile
    ```
- **B7 :** Kiểm tra lại **swap** :
    ```
    # swapon -s
    ```
> ***Lưu ý :** Khi thay đổi dung lượng , **Swappiness** vẫn được giữ nguyên .*
