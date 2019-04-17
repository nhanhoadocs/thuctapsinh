Để đặt IP cho 1 card mạng có 2 cách để thực hiện

Cách 1 vào sửa file: /etc/sysconfig/network-scripts/tên-thiết bị

Cách 2: Sử dụng lệnh

Để kiểm tra trạng thái của các card

```
nmcli d
```

Đặt IP

```
nmcli c modify eth0 ipv4.addresses 10.0.0.5/24
```

Đặt gateway

```
nmcli c modify eth0 ipv4.gateway 10.0.0.1
```

Cấu hình DNS

```
nmcli c modify eth0 ipv4.dns ip
```

Đặt động hoặc tĩnh

```
nmcli c modify eth0 ipv4.method manual    # Đăt tĩnh nếu động sử dụng auto
```

Khởi động lại card

```
nmcli c down eth0

nmcli c up eth0
```