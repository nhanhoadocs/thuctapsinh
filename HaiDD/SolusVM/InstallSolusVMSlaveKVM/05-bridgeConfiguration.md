# Cấu hình Bridge cho KVM Slave

**Lưu ý:** Khi thực hiện phần này, các hành động dưới đây có thể gây mất quyền truy cập từ xa tới máy chủ.

1. Kết nối với node KVM slave qua SSH
2. Disable Network Manager(Vì nó có thể gây cản trở bridge)
    ```
    systemctl stop NetworkManager.service
    systemctl disable NetworkManager.service
    systemctl enable network.service
    systemctl start network.service
    ```
3. Xem lại file cấu hình network của card mạng và xác minh nó cũng bị vô hiệu hóa ở đó. `/etc/sysconfig/network-scripts/ifcfg-eth0`
    ```
    NM_CONTROLLED=no
    ```
4. Ví dụ cấu hình cơ bản trước khi cấu hình bridge

    <img src="..\images\Screenshot_2.png">

5. Install `bridge-utils` package:
    ```
    yum install -y bridge-utils
    ```
6. Tạo bản sao file cấu hình giao diện mạng để backup
    ```
    cp /etc/sysconfig/network-scripts/ifcfg-eth0 /root/ifcfg-eth0.backup
    ```
    **Chú ý:** ta nên di chuyển tập tin cấu hình backup ra khỏi thư mục `/network-scripts`. Vì các file cấu hình bắt đầu bằng `ifcfg-*` sẽ được áp dụng., bao gồm cả file `ifcfg-eth0.backup`
7. Tạo bridge file
    ```
    vi /etc/sysconfig/network-scripts/ifcfg-br0
    ```
8. Sao chép cài đặt cấu hình mạng từ tệp `ifcfg-eth0` sang tệp `ifcfg-br0` như sau:

    <img src="..\images\Screenshot_3.png">

9. Edit file `/etc/sysconfig/network-scripts/ifcfg-eth0`

    <img src="..\images\Screenshot_4.png">

10. Restart network service để áp dụng thay đổi
    ```
    service network restart
    ```

11. Kiểm tra interface `eth0` liên kết với bridge `br0`
    ```
    brctl show
    ```
    <img src="..\images\Screenshot_5.png">