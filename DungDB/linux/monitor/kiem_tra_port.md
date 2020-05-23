# Kiểm tra port trên server linux

## Cách 1:

Kiểm tra tập tin `/etc/services`

    # cat /etc/services | grep xxx (xxx = số cổng kết nối (port))

 Nếu sau khi gõ lệnh mà không có gì xảy ra nghĩa là không có cổng kết nối (port) nào được cấu hình phù hợp với số cổng kết nối (port) mà bạn định kiểm tra.

## Cách 2:

Sử dụng lệnh netstat hiển thị số kết nối mạng, bảng định tuyến, thống kê các giao tiếp..vv.
```
# netstat -nan | grep 22
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 7110/sshd
```
Nếu trên màn hình hiển thị LISTEN, nghĩ là cổng kết nối (port) cần kiểm tra đang mở.

https://nguyenhuuhoang.com/huong-dan-doc-hieu-lenh-netstat-tren-linux/

## Cách 3:

Dùng lệnh lsof – liệt kê các tập tin đang mở.

```
# lsof -i -n -P|grep 631
cupsd 17934 lp 0u IPv4 56540196 TCP *:631 (LISTEN)
cupsd 17934 lp 2u IPv4 56540197 UDP *:631
```
## Cách 4:

Dùng lệnh nmap – Công cụ kiểm tra mạng và rà soát bảo mật.

Để biết port nào đang mở:

    nmap -p 1-65535 localhost

Đối với host không phải local

    nmap -p 1-1024 X.X.X.X

1-65535 là range. Range càng rộng thì càng tốn thời gian.

Đến scan các port phổ biến

    nmap --top-ports 20 X.X.X.X
    
Với 20 là số lượng port phổ biến bạn muốn scan.

## Cách 5:

Dùng lệnh telnet – giao tiếp người dùng với giao thức TELNET.

Cú pháp:

    # telnet IP PORT
```
# telnet 192.168.1.2 22
Trying 192.168.1.2…
Connected to 192.168.1.2.
Escape character is ‘^]’.
SSH-1.99-OpenSSH_4.2
```
Nếu màn hình hiển thị như trên nghĩa là cổng kết nối (port) dịch vụ SSH là 22 đang mở.
```
# telnet 192.168.1.2 122
Trying 192.168.1.2…
telnet: connect to address 192.168.1.2: Connection refused
```
Nếu màn hình hiển thị như trên nghĩa là cổng kết nối (port) 122 đang đóng.

