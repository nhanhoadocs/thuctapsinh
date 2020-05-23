# Cấu hình IP tĩnh trên Ubuntu Server 20.04 (bản develop) với netplan

Dự kiến ngày 23 tháng 4 sắp tới, phiên bản chính thức Ubuntu 20.04 sẽ được phát hành. Hiện tại, để cài bản Ubuntu 20.04 phiên bản develop bạn có thể xem hướng dẫn tại [đây](https://news.cloud365.vn/ubuntu-huong-dan-cai-dat-ubuntu-20-04-server-focal-fossa-ban-develop/).

Tôi đã cài một máy ảo chạy Ubuntu 20.04 trên Vmware và gắn cho máy ảo một card NAT với dải mạng 192.168.10.0/24.
## Giới thiệu netplan

Từ phiên bản Ubuntu 17.10 trở đi, Canonical (Công ty quản lý và phát triển Ubuntu) đã giới thiệu công cụ mới có tên **Netplan** để quản lý cấu hình Network. 

Cách cấu hình network cũ là cấu hình trong file: `/etc/network/interfaces`

Các file cấu hình network mới của Ubuntu: `/etc/netplan/*.yaml`

Ví dụ:

- /etc/netplan/50-cloud-init.yaml
- /etc/netplan/01-netcfg.yaml

## Cấu hình IP tĩnh trên Ubuntu 20.04

Đầu tiên, xem tên card mạng bằng một trong các lệnh sau
```
    $ networkctl status
    $ ifconfig
    $ ip addr show
```
![Imgur](https://i.imgur.com/O0nvpQI.png)
![Imgur](https://i.imgur.com/ny9ULtb.png)
![Imgur](https://i.imgur.com/2Jap9H7.png)
Trên máy ảo, tôi . Có thể thấy tên card mạng ở đây là `ens33` (Interface lo là interface loopback). DHCP của vmware đã cấp cho máy ảo địa chỉ IP động là 192.168.10.178.

Để cấu hình IP tĩnh cho máy ảo. Ta có thể dùng vi, vim, nnano để chỉnh sửa file `/etc/netplan/50-loud-init.yaml`.

Nội dung file như sau:

![Imgur](https://i.imgur.com/d36TfYG.png)

Nghĩa là card mạng ens33 được cấu hình dhcp

Ta sửa file lại như sau:

![Imgur](https://i.imgur.com/0zdib4K.png)

Trong đó:

- ens33 là Network Interface
- 192.168.10.11 là địa chỉ IP tĩnh
- 192.168.10.2 là Default Gateway
- 8.8.8.8, 8.8.4.4 là địa chỉ DNS Server

Lưu lại và thoát.

Thực hiện khởi động lại dịch vụ mạng với một trong các lệnh:
```
$ sudo netplan apply
$ sudo systemctl restart NetworkManager.service
$ sudo service network-manager restart
```

Kết quả:

![Imgur](https://i.imgur.com/IepY3jW.png)

Máy đã nhận địa chỉ IP tĩnh mà ta cấu hình bên trên.

Để cấu hình IP động ta chỉ cần sửa file `/etc/netplan/50-loud-init.yaml` lại như ban đầu là xong.

Bài viết còn nhiều thiếu xót. Mong nhận được sự đóng góp ý kiến của mọi người.