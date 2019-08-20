# Network Configurations
## **1) Các file cấu hình Network**
### **1.1) `/etc/hosts`**
- Dùng để phân giải những hostname không thể phân giải được .
- Có thể dùng thay DNS trong hệ thống mạng LAN
    - `127.0.0.1` <=> `localhost.localdomain`
    - `::1` <=> `localhost.localdomain`<br><br>
<img src=https://i.imgur.com/4Mg2DpV.png>

### **1.2) `/etc/resolv.conf`**
- Dùng để cấu hình DNS<br><br>
    <img src=https://i.imgur.com/bXQ9tZQ.png width=80%>

### **1.3) `/etc/sysconfig/network-scripts/ifcfg-[tên_card_mạng]`**
- Chứa thông tin cấu hình của từng card mạng
    - `ens33` : ethernet ( có sẵn )
    - `sl*` : serial line IP
    - `wl*` : wlan ( wifi )
    - `ww*` : wwan ( wireless WAN - 3G/4G )
    - `virbr0` : bridge ( có sẵn )
    - `lo*` : loopback ( có sẵn )<br><br>

    <img src=https://i.imgur.com/y4eMSIq.png>

## **2) Các lệnh Network cơ bản**
### **2.1) Xem địa chỉ IP**
```
# ifconfig       ( Ethernet + Loopback )
# iwconfig       ( Wifi )
# ifconfig -a    ( đầy đủ thông tin )
# ip a s         ( đầy đủ thông tin )
```
<img src=https://i.imgur.com/Bkm0Crs.png>

### **2.2) Tắt / Bật card mạng**
```
# ifup [tên_card_mạng]       : bật card mạng
# ifdown [tên_card_mạng]     : tắt card mạng
```
### **2.3) Khởi động lại `network.service`**
```
    # service network restart
<=> # /etc/init.d/network restart
<=> # systemctl restart network.service
```
### **2.4) Xem thông tin gateway**
```
# route
# ip route
```
<br>
    <img src=https://i.imgur.com/WOSYkSb.png>

## **3) Cấu hình IP**
### **3.1) Cấu hình bằng lệnh ( tạm thời )**
```
# ifconfig [tên_card_mạng] [IP] netmask [subnet_mask] up
```
> ***Chú ý*** : IP sẽ mất mỗi khi tắt mở card mạng hay restart `network.service` . Đây còn gọi là cách đặt IP tạm thời , thường dùng để test .
### **3.2) Cấu hình bằng file**
- Thay đổi nội dung trong file cấu hình của card mạng :
```
# vi etc/sysconfig/network-scripts/ifcfg-[tên_card_mạng]
```
<img src=https://i.imgur.com/Rbr32T6.png>

- Ý nghĩa các thông số trong file :
    - `DEVICE` : tên của card mạng
    - `ONBOOT` :
        - `yes` : Khởi động khi restart `network.service`
        - `no` : không khởi động khi restart `network.service`
    - `BOOTPROTO` : 
        - `static` : dùng IP tĩnh
        - `dhcp` : nhận IP từ DHCP Server
    - `IPADDR` : địa chỉ IP của card mạng ( khi cấu hình IP tĩnh )
    - `NETMASK` : địa chỉ subnetmask ( khi cấu hình IP tĩnh )
    - `GATEWAY` : địa chỉ gateway ( khi cấu hình IP tĩnh )
    - `DNS[1|2]` : địa chỉ DNS Server ( khi cấu hình IP tĩnh )
    - `USERCTL` :
        - `yes` : cho phép user thường cấu hình sửa đổi
        - `no` : không cho phép user thường cấu hình sửa đổi
- **VD :** Thiết lập IP tĩnh cho Server với IP `10.10.10.10/24` , gateway `10.10.10.254` , DNS là `8.8.8.8` , `8.8.8.4`
```
DEVICE=ens33
ONBOOT=yes
BOOTPROTO=static
IPADDR=10.10.10.10
NETMASK=255.255.255.0
GATEWAY=10.10.10.254
DNS1=8.8.8.8
DNS2=8.8.4.4
USERCTL=no
```
- **VD :** Thiết lập IP động
```
DEVICE=ens33
ONBOOT=yes
BOOTPROTO=dhcp
USERCTL=no
```
### **3.3) Cấu hình bằng giao diện GUI**
- Trong Terminal gõ lệnh `# nmtui`
- Cửa sổ **NetworkManager TUI** hiện ra , chọn ***Edit a connection*** => ***OK***<br><br>
    <img src=https://i.imgur.com/DmkBT3j.png>

- Chọn Card mạng cần đặt IP ( ens33 ) :

    <img src=https://i.imgur.com/17eijW6.png>

- Chọn ***IPV4 CONFIGURATION*** => ***Manual*** => ***&lt;Show&gt;***

    <img src=https://i.imgur.com/RSVrpJd.png>

- Đặt các thông số IP => ***OK***

    <img src=https://i.imgur.com/rbU1tFV.png>

## **4) Cấu hình bằng `nmcli`**
- Đây là công cụ giúp điều khiển trình quản lý mạng trong Linux bằng dòng lệnh .
- Xem các trạng thái kết nối cơ bản :
    ```
    # nmcli [options] [command] [arguments]
    ```
    - **Options :**
        - `-a` : hiển thị đầy đủ thông tin về phần cứng card mạng gồm MAC , MTU , IP ,...
        - `-v` : hiển thị version của `nmcli`
    - **Commands + Arguments :**
        - `general` :
            - `status` :
            - `hostname` : hiển thị hostname
        - `network` :
            - `on` : enable card mạng
            - `off` : disable card mạng
            - `connectivity` : xem trạng thái kết nối :
                - *full* : đã kết nối mạng và được truy cập Internet
                - *limited* : đã kết nối mạng nhưng không được phép truy cập Internet
                - *none* : chưa được kết nối mạng
        - `radio` :
            - `all` : hiển thị trạng thái tất cả các kết nối không dây
            - `wifi` : hiển thị trạng thái wifi
                - `off` : disable card wifi
                - `on` : enable card wifi
        - `monitor` : quản lý status mạng theo runtime
        - `connection` ( `con` ): 
            - `show --active` : hiển thị các kết nối đang active
        - `device ( dev )` : 
            - `status` : hiển thị trạng thái các interface
            - `show if_name` : hiển thị thông tin chi tiết của interface
            - `wifi list` : liệt kê các sóng wifi bắt được
                - `--auto` : 
                - `--rescan` :
            - `wifi connect` : kết nối tới mạng wifi đã biết
                - `SSID password "password"`
            - 
## **5) Thay đổi card mạng về dạng `eth*`**
- **B1 :** Kiểm tra thông tin interface hiện tại :
    ```
    # ifconfig
    ```
- **B2 :** Chỉnh sửa file `/etc/sysconfig/grub`
    ```
    # vi /etc/sysconfig/grub
    ```
    Thêm vào dòng `GRUB_CMDLINE_LINUX="crashkernel=auto rhgb quiet`
    nội dung : `net.ifnames=0 biosdevname=0`<br>

    <img src=https://i.imgur.com/GiwtpPb.png>
- **B3 :** Biên dịch lại file `grub` để apply cấu hình mới :
    ```
    # grub2-mkconfig -o /boot/grub2/grub.conf
    ```
- **B4 :** Đổi tên file cấu hình card mạng :
    ```
    # cd /etc/sysconfig/network-scripts/
    # mv ifcfg-ens33 ifcfg-eth0
    # vi ifcfg-eth0
    DEVICE=eth0
    NAME=eth0
    ```
- **B5 :** Reboot và kiểm tra kết quả :
    ```
    # reboot
    # ifconfig
    ```
    <img src=https://i.imgur.com/XeNBbdr.png>

    => Các card mạng tiếp theo được thêm vào sẽ tự động là `eth1` , `eth2` ,...