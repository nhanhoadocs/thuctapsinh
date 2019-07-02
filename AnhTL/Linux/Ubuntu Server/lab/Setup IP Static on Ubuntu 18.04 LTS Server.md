# Setup IP Static on Ubuntu 18.04 LTS Server.

**B1: Yêu cầu**
- Quyền truy cập đặc quyền vào hệ thống Ubuntu 18.04 sẽ được yêu cầ khi setup ip static.

- Yêu cầu các lệnh linux đã cho được thực thi với quyền **root**- trực tiếp với tư cách là người dùng **root** hoặc bằng cách sử dụng lệnh sudo.

**B2: Cấu hình địa chỉ IP tĩnh bằng Netplan**
- Cấu hình mạng Netplan lần đầu tiên được giới thiệu cho Ubuntu 18.04 LTS Bionic Beaver. Nó có sẵn cho tất cả các bản Ubuntu 18.04 mới. 

**B3: Máy chủ Ubuntu**
- Để định cấu hình địa chỉ IP tĩnh trên máy chủ Ubuntu 18.04, ta cần sửa đổi tệp cấu hình mạng netplan có liên quan trong thư /etc/netplan/
  - Ví dụ: ta có thể tìm thấy ở đó một tệp cấu hình netplan mặc định được gọi 01-netcfg.yaml hoặc 50-cloud-init.yaml

`` sudo vi /etc/netplan/50-cloud-init.yaml ``

Mặc định khi mở file 50-cloud-init.yaml ra, ta sẽ thấy:

```
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: yes
```

Ta sẽ tiến hành đặt ip tĩnh cho máy:
```
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2                                        (đây là version của DHCP)
  ethernets:                                        (đây là chuẩn enthernets)
    enp0s3:                                         (đây là tên giao diện mạng)
     dhcp4: no                                      (đây là ip version 4)
     addresses: [192.168.1.222/24]                  ( địa chỉ ip và subnet mask )
     gateway4: 192.168.1.1                          (default gateway)
     nameservers:                                   (tên máy chủ)
       addresses: [8.8.8.8,8.8.4.4]                 (DNS)
```

Khi đã sẵn sàng áp dụng thay đổi với:

``sudo netplan apply ``

Trong trường hợp ta gặp phải một số vấn đề thực thi:

``sudo netplan --debug apply``

# END