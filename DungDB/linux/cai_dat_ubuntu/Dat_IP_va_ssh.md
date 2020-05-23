# Cấu hình IP tĩnh trên Ubuntu và sử dụng SSH trên Ubuntu

Sau khi vừa cài đặt HĐH Ubuntu. Việc đầu tiên cần làm là đặt mật khẩu cho user root. Đăng nhập bằng tài khoản và mật khẩu đã tạo và chạy lệnh

    # sudo su
Nhập mật khẩu tài khoản đang dùng

    # passwd root

Nhập password cho user root

Tạo snapshot

Tiếp theo update hệ thống bằng lệnh

    # apt-get -y update

## Cấu hình IP tĩnh trên Ubuntu 16.04

Dùng vi, vim hoặc nano để chỉnh sửa file `/etc/network/interfaces`

Nội dung trong file

```
auto lo
iface lo inet loopback

auto ens33
iface ens33 inet dhcp
```

Với lo là interface loopback

Ta cần chỉnh sửa interface ens33. Thay đổi nội dung thành

```
auto lo
iface lo inet loopback

auto enss33
iface ens33 inet static
address 192.168.10.101
netmask 255.255.255.0
gateway 192.168.10.2
network 192.168.10.0
broadcast 192.168.10.255
dns-nameservers 8.8.8.8

```
Lưu lại và thoát.

Khởi động lại card mạng

    #/etc/init.d/networking restart

Ping đến google.com để kiểm tra

![Imgur](https://i.imgur.com/ZRzgx6z.png)

**Chú ý**: Ta có thể gán địa chỉ IP tĩnh – 192.168.10.2/24 – cho máy Ubuntu một cách tức thời, bằng cách thực hiện 2 lệnh sau tại của sổ Terminal:

    # ifconfig eth0 192.168.43.2 netmask 255.255.255.0
    # route add default gw 192.168.43.2  ens33

Địa chỉ IP được gán theo kiểu này chỉ có tác dụng tại phiên làm việc hiện tại. Tức là, sau khi reboot máy, địa chỉ này sẽ thay đổi (phụ thuộc vào khai báo trong tập tin interfaces).

## Cấu hình IP tĩnh trên Ubuntu 16.04

Ở Ubuntu 18.04, ifupdown (bao gồm các tiện ích  ifup và ifdown quen thuộc) đã được thay thế bởi Netplan. Netplan là một giao diện đơn giản để cấu hình mạng Linux, nơi tập tin YAML trong /etc/netplan/*.yaml  được sử dụng để tạo thông tin cấu hình cho NetworkManager hoặc— trong trường hợp cài đặt Ubuntu Server mới — systemd-networkd.

Lệnh ip link set là một thay thế cho ifup và ifdown.

Để biết thêm thông tin về cấu hình Netplan, hãy xem tài liệu chính thức. Chi tiết về cách sử dụng và cấu hình systemd-networkd có sẵn trong các trang systemd-networkd.service và systemd.network.

Lệnh networkct có thể xuất bản tóm tắt các thiết bị mạng của bạn:

    # networkctl
![Imgur](https://i.imgur.com/6BHcioc.png)

Thêm option status và nó sẽ in trạng thái của từng địa chỉ IP trên hệ thống:

![Imgur](https://i.imgur.com/IvSll80.png)

Kiểm tra tên card mạng bằng câu lệnh ifconfig. Card mạng dưới đây có tên là “ens33”

Cấu hình static IP bằng cách chỉnh sửa file sau:

Vào thư mục `/etc/netplan/` sẽ thấy một file `.yaml`

![Imgur](https://i.imgur.com/coW8mnk.png)

Sửa nội dung file này thành 

![Imgur](https://i.imgur.com/hjzdM1a.png)

Sau đó lưu file và chạy lệnh sau để lưu cấu hình mới

    # netplan apply

Kiểm tra lại IP bằng các lệnh

    #ifconfig
    #ip addr show

**Lưu ý:**

Nếu cảm thấy không quen dùng `netplan`. Ta hoàn toàn có thể cài đặt `ifupdown` và cấu hình IP như cách thông thường.

    # apt-get install -y ifupdown

## Cấu hình SSH trên Ubuntu

Cài đặt Open-SSH

    # sudo apt-get install openssh-server -y

Cấu hình. Mở file `/etc/ssh/sshd_config`

Sau khi mở file sshd_config bạn tìm đến dòng `#Port 22`. Bỏ dấu `#` và cấu hình cổng mình muốn. Ở đây tôi đổi thành 2234.

Tìm đến dòng `#PasswordAuthenticatiton yes` xóa dấu `#`.

Sửa dòng #PermitRootLogin thành `#PermitRootLogin yes`.

Lưu lại và thoát.

Khởi động lại dịch vụ SSH

    # service sshd restart

Dùng MobaXterm hoặc putty để SSH vào máy ảo

![Imgur](https://i.imgur.com/WQEE01n.png)