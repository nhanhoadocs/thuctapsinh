# Hướng dẫn xóa Netplan và cài đặt ifupdown thay thế trên Ubuntu server 20.04 bản Develop

Từ trong những bản phát hành mới đây của Ubuntu, **Netplan** là tiện ích mặc định giúp ta cấu hình network, tuy nếu bạn chưa quen với **netplan** hoặc vì một lý do nào đó bạn hoàn toàn có thể xóa bỏ **netplan** và sử dụng ifupdown thay thế, trong bài viết này Cloud365 sẽ hướng dẫn bạn cách xóa bỏ **netplan** và cài đặt **ifupdown** để thay thế.

Từ trong những bản phát hành mới đây của Ubuntu, **Netplan** là tiện ích mặc định giúp ta cấu hình network, **Netplan** cho phép dễ dàng cấu hình mạng trên hệ thống thông qua các tệp `YAML`. **Netplan** xử lý `YAML` và tạo các cấu hình cần thiết cho **NetworkManager** hoặc `systemd-network` của trình kết xuất hệ thống, tuy nếu bạn chưa quen với netplan hoặc vì một lý do nào đó bạn hoàn toàn có thể xóa bỏ netplan và sử dụng `ifupdown` thay thế, để xóa bỏ netplan và sử dụng `ifupdown` bạn làm theo các bước sau đây.

### **Các thao tác dưới đây thực hiện với quyền root.**

## Disable Netplan
Tắt `netplan`:
```
echo 'GRUB_CMDLINE_LINUX = "netcfg/do_not_use_netplan = true"' >>  /etc/default/grub
```

Cập nhật lại grub
```
update-grub
```

## Cài đặt ifupdown thay thế netplan
Cài đặt `ifupdown`
```
apt-get update
apt-get install -y ifupdown
```

## Xóa netplan khỏi hệ thống
Xóa bỏ netplan khỏi hệ thống
```
apt-get --purge remove netplan.io
```

Nếu bạn chưa cài đặt `ifupdown`, khi xóa bỏ netplan hệ thống sẽ tự cài đặt `ifupdown` thay thế cho bạn.

Sau đó ta xóa toàn bộ cấu hình của netplan:
```
rm -rf /usr/share/netplan
rm -rf /etc/netplan
```

## Cấu hình interface
**File cấu hình** : `/etc/network/interfaces`

Kiểm tra IP của máy. Ở đây là interface `ens3`, và đang là IP động.

<img src="..\images\Screenshot_28.png">

Chỉnh sửa file cấu hình bằng vim:
```
vim /etc/network/interfaces
```

Thêm các dòng sau vào file cấu hình
```
auto lo
iface lo inet loopback


auto ens3
iface ens3 inet static
address 10.10.34.165
netmask 255.255.255.0
gateway 10.10.34.1
broadcst 10.10.34.255
dns-nameservers 8.8.8.8 8.8.4.4
dns-search lan
```

**Chú ý**: Cần xác định đúng tên interface và các thông số về IP của bạn.

Reboot hệ thống để IP được nhận
```
reboot
```

## Kiểm tra kết nối mạng
- Kiểm tra lại IP đặt ở trên:

    <img src="..\images\Screenshot_29.png">

- Ping tới server Google:
    ```
    ping 8.8.8.8
    ```

    <img src="..\images\Screenshot_30.png">

### Sửa lỗi không ping được tên miền
Ta ping thử `google.com`:

```
ping google.com
```

Xuất hiện lỗi: `Temporary failure in name resolution`

<img src="..\images\Screenshot_31.png">

**Để xử lí lỗi này, ta làm theo các bước sau:**
- Disable `systemd-resolved` service.
    ```
    systemctl disable systemd-resolved.service
    ```

- Stop service
    ```
    systemctl stop systemd-resolved.service
    ```

- Bỏ link giữa 2 file sau: `/run/systemd/resolve/stub-resolv.conf` và `/etc/resolv.conf` bằng cách xóa file `/etc/resolv.conf`
    ```
    rm /etc/resolv.conf
    ```

- Tạo mới file `/etc/resolv.conf`
    ```
    vim /etc/resolv.conf
    ```

- Mở file và thêm DNS server mà bạn sử dụng:
    ```
    nameserver 8.8.8.8
    ```

**Kiểm tra lại:**
```
ping google.com
```

<img src="..\images\Screenshot_32.png">


## Kết luận
Như vậy Cloud365 đã hướng dẫn bạn cách xóa bỏ `netplan` và sử dụng `ifupdown` thay thế trên **Ubuntu server 20.04** bản develop.

Sau khi Ubuntu phát hành phiên bản **Ubuntu server 20.04** chính thức, Cloud365 sẽ có bài hướng dẫn sau. Rất mong các bạn theo dõi.


Cảm ơn bạn đã theo dõi bài viết. Rất mong sự góp ý từ các bạn.