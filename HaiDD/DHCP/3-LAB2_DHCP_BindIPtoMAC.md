# DHCP cấp phát IP theo địa chỉ MAC(Bind IP to MAC)

## 1. Xác định địa chỉ MAC của Client
### Trên Client CentOS-7:
    - Ta sẽ đọc file cấu hình interface của card mạng đó, ở đây là `ens37`. Địa chỉ MAC là mục `HWADDR`:
    ```
    [root@localhost ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens37
    ```
    <img src = "https://i.imgur.com/hMgaBIG.png">
    - Hoặc có thể đọc file address của interface ens37:
    ```
    [root@localhost ~]# cat /sys/class/net/ens37/address
    ```
    <img src = "https://i.imgur.com/49LXgCd.png">
Ta được địa chỉ MAC của interface `ens37` là:
```
00:0c:29:a2:90:c8
```

### Trên Window:
    - Mở cmd gõ lệnh: ipconfig /all
    <img src = "https://i.imgur.com/VGpFluX.png">
    - Hoặc có thể xem tại đây:
    <img src = "https://i.imgur.com/IcmYpFs.png">
Ta được địa chỉ MAC của interface Ethernet1:

**Lưu ý:** Đổi các dấu `-` thành dấu `:` để tránh lỗi DHCP Server
```
00:0C:29:25:F6:E0
```

## 2. Cấp IP theo MAC address
- **Trên DHCP Server**: ta chỉnh sửa file cấu hình DHCP trên DHCP Server:
```
[root@localhost ~]# vi /etc/dhcp/dhcpd.conf
```

Sau đó. Ta thêm funtion có dạng như sau
```
host CenOS7 {
  hardware ethernet 00:0c:29:a2:90:c8;
  fixed-address 192.168.24.249;
}

host Win10 {
  hardware ethernet 00:0C:29:25:F6:E0;
  fixed-address 192.168.24.247;
}
```
Trong đó:
- hardware ethernet: địa chỉ MAC của Client
- fixed-address: địa chỉ cấp phát cho Client đó.

Sau đó ta reset lại dịch vụ `dhcp`:
```
[root@localhost ~]# systemctl restart dhcpd
```

- **Trên DHCP Client CentOS-7**: Ta xin cấp lại IP từ DHCP server:
```
[root@localhost ~]# dhclient -r
[root@localhost ~]# dhclient -v
```
Sau đó kiểm tra lại địa chỉ IP:

<img src = "https://i.imgur.com/zd6HT2V.png">
Ta thấy địa chỉ interface `ens37` là: `192.168.24.249` là địa chỉ ta đã đặt ở trên DHCP Server cho địa chỉ MAC của card `ens37`.

- **Trên DHCP Client Win10**: Ta xin cấp lại IP từ DHCP Server. 
Mở cửa sổ `cmd` dùng các lệnh:
```
> ipconfig /release
> ipconfig /renew
> ipconfig
```
<img src = "https://i.imgur.com/xN03Ojr.png">