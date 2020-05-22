### Hướng dẫn đặt địa chỉ IP trên Ubuntu 18.4 LTS server  

Chắc hẳn nhiều người đã không còn xa lạ với thao tác cấu hình địa chỉ IP bằng CLI trong các phiên bản Ubuntu trước đây. Khi bắt đầu thử nghiệm Ubuntu 18.4, điều đầu tiên tôi nhận thấy là cách quản lý giao diện mạng của nó đã hoàn toàn thay đổi.  
Bạn đã nghe nói về `Netplan`? Nếu bạn chưa biết thì `Netplan` là một công cụ cấu hình mạng mới được giới thiệu trong Ubuntu 17.10. Nó thay thế tệp giao diện tĩnh (`/etc/internet/interfaces`) trước đây đã được sử dụng để định cấu hình giao diện mạng. `Netplan` có thể được sử dụng để viết mô tả YAML đơn giản về các giao diện mạng với những thông tin cơ bản và tạo ra cấu hình cần thiết cho một công cụ kết xuất được chọn.  

Trong bài viết này, tôi sẽ hướng dẫn 02 cách để bạn cấp địa chỉ IP cho card mạng trên Ubuntu. Cách thứ nhất là cấu hình trên `netplan` và cách thứ hai, mời bạn theo dõi phần cuối bài viết.  

### **Cấp địa chỉ IP bằng cách cấu hình netplan** 

Trong mô hình lab, tôi đã cài xong máy Ubuntu 18.4 LTS server với mặc định một card mạng `ens33` ở chế độ NAT. Bây giờ tôi sẽ gắn thêm 01 NIC và tiến hành cấp IP cho nó.  
Kiểm tra các thiết bị đang có trong mạng:  
```
root@ubuntusrv:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:9b brd ff:ff:ff:ff:ff:ff
    inet 192.168.152.129/24 brd 192.168.152.255 scope global dynamic ens33
       valid_lft 1631sec preferred_lft 1631sec
    inet6 fe80::20c:29ff:fec9:b49b/64 scope link
       valid_lft forever preferred_lft forever
3: ens38: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:0c:29:c9:b4:a5 brd ff:ff:ff:ff:ff:ff
```

Như vậy NIC `ens38` đã tồn tại tuy nhiên nó chưa được cấp địa chỉ IP. Tiếp theo tôi sẽ cấu hình cho nó bằng cách vào thư mục `/etc/netplan/` và chỉnh sửa file `50-cloud-init.yaml`. Ở đây tôi muốn cấp IP động nên sẽ ghi vào nội dung file như sau:  
```
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        ens33:
            dhcp4: true
        ens38:
            dhcp4: true
    version: 2
```
Trong trường hợp bạn muốn cấp IP tĩnh thì bạn có thể thiết lập các thông số như ví dụ dưới:   
```
        ens38:
            addresses: [192.168.200.10/24]
            nameservers:
              addresses: [8.8.8.8]
            dhcp4: no
```  
Lưu ý: Bạn nên đặt địa chỉ IP tĩnh nằm ngoài range IP DHCP của local subnet.  

Tiếp theo bạn lưu thay đổi file và chạy lệnh `netplan apply` để thiết lập lại cấu hình. 
Ta dùng lệnh `ip a` để kiểm tra kết quả:  
```
root@ubuntusrv:/etc/netplan# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:9b brd ff:ff:ff:ff:ff:ff
    inet 192.168.152.129/24 brd 192.168.152.255 scope global dynamic ens33
       valid_lft 1558sec preferred_lft 1558sec
    inet6 fe80::20c:29ff:fec9:b49b/64 scope link
       valid_lft forever preferred_lft forever
3: ens38: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:a5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.128/24 brd 192.168.200.255 scope global dynamic ens38
       valid_lft 1559sec preferred_lft 1559sec
    inet6 fe80::20c:29ff:fec9:b4a5/64 scope link
       valid_lft forever preferred_lft forever
```  
Như vậy bạn đã cấp IP thành công thông qua cấu hình `netplan` trên máy Ubuntu 18.4.  

### **Cấp địa chỉ IP bằng cách cấu hình trong interfaces**  

Để minh họa cho ví dụ này,trên Ubuntu tôi sẽ tạo thêm một NIC mới (lúc này máy của tôi sẽ sinh ra một interface có tên là `ens39`).  
Nếu bạn không muốn cấu hình trong `netplan` mà muốn thao tác với `/etc/network/interfaces` thì  bạn cũng sẽ cấp được IP như mong muốn thông qua các bước sau đây:
-  Cài đặt `ifupdown`  
```
apt-get install ifupdown
```  
-  Cấu hình trong `/etc/network/interfaces`. Ở đây tôi sẽ đặt IP động cho `ens39`: 
```
# ifupdown has been replaced by netplan(5) on this system.  See
# /etc/netplan for current configuration.
# To re-enable ifupdown on this system, you can run:
#    sudo apt install ifupdown
 auto ens39
 iface ens39 inet dhcp
```
- Lưu file cấu hình và restart lại network.  
```
systemctl restart networking
```  
- Sử dụng lệnh `ifdown ens39` và `ifup ens39` để cập nhật network cho interface mới.

Kiểm tra kết quả bằng lệnh `ip a`:
```
root@ubuntusrv:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:9b brd ff:ff:ff:ff:ff:ff
    inet 192.168.152.129/24 brd 192.168.152.255 scope global dynamic ens33
       valid_lft 1156sec preferred_lft 1156sec
    inet6 fe80::20c:29ff:fec9:b49b/64 scope link
       valid_lft forever preferred_lft forever
3: ens38: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:a5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.128/24 brd 192.168.200.255 scope global dynamic ens38
       valid_lft 1604sec preferred_lft 1604sec
    inet6 fe80::20c:29ff:fec9:b4a5/64 scope link
       valid_lft forever preferred_lft forever
4: ens39: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:c9:b4:af brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.129/24 brd 192.168.200.255 scope global ens39
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fec9:b4af/64 scope link
       valid_lft forever preferred_lft forever
```

Trên đây tôi đã chia sẻ đến các bạn hai cách thiết lập địa chỉ IP trên Ubuntu 18.4 LTS server. Các bạn có thể tùy chọn một trong hai cách để ứng dụng vào mô hình lab của mình. Chúc các bạn thành công.  
