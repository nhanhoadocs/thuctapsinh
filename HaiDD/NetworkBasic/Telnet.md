# TELNET

## Mục lục

### [I. Telnet](#1)
### [II. Cấu hình Telnet trên Rouer Cisco](#2)


-----------------------------------------------------------

# I. Telnet  <a name = "1"></a>
## 1. Telnet là gì?

Telnet là một giao thức dòng lệnh được sử dụng để quản lý các thiết bị khác nhau như máy chủ, PC, router, switch, camera, tường lửa từ xa. Telnet là một giao thức cung cấp kết nối từ xa đơn giản. Telnet chịu trách nhiệm gửi các lệnh hoặc dữ liệu đến kết nối mạng từ xa. Điều này làm cho giao thức này rất phổ biến trong các hệ thống IT. Telnet thường xuất hiện sau SSH để quản lý hệ thống từ xa bằng dòng lệnh.

## 2. Lịch sử của Telnet

Giao thức Telnet được tạo ra bằng các mạng máy tính. Mạng máy tính làm cho các máy tính sẵn sàng để quản lý và sử dụng từ xa. Telnet được tạo ra như một giao thức quản lý giao diện dòng lệnh từ xa. Telnet được sử dụng lần đầu tiên vào năm 1969 và được thiết kế như một giao thức TCP/IP đơn giản.

## 3. Cấu trúc

Telnet có cấu ​​trúc Client và Server phổ biến. Phía máy chủ (Server) sẽ cung cấp dịch vụ Telnet để kết nối từ các ứng dụng Telnet của máy khách (Client). Phía máy chủ Telnet thường lắng nghe cổng ***TCP 23*** để chấp nhận kết nối Telnet. Nhưng cổng này có thể được thay đổi vì lý do bảo mật hoặc nguyên nhân khác. Vì vậy, máy khách Telnet cần xác định rõ cổng Telnet.

## 4. Tính năng của Telnet

Telnet là một giao thức đơn giản nên có rất ít tính năng. Giao thức Telnet cung cấp các tính năng sau để quản lý hệ thống từ xa.

Đơn giản
Hiển thị thông tin kết nối
Nhanh
Không bảo mật


## 5. Thiết bị

Như đã nói trước đây, Telnet là một giao thức rất phổ biến, có nghĩa là nó được sử dụng bởi nhiều loại thiết bị khác nhau trong phạm vi rộng. Dưới đây là danh sách các thiết bị sử dụng Telnet để quản lý từ xa.

- Linux
- Router
- Switch
- Tường lửa
- Router
- Camera
- IoT
- Windows
- Raspberry Pi
- Cisco IOS

## 6. Cài đặt cho Linux

Như đã nêu trước đây, cấu trúc của Telnet bao gồm máy chủ và máy khách. Máy chủ và máy khách Telnet có thể được cài đặt vào tất cả các bản phân phối Linux như Ubuntu, Debian, Fedora, CentOS, RedHat, Mint, v.v...

`
$ sudo apt install telnet
`

## 7. Cài đặt cho Windows

Máy chủ và máy khách Telnet có thể được cài đặt vào máy chủ Windows hoặc máy khách theo những cách khác nhau. Máy khách và máy chủ Telnet được cài đặt sẵn trên Windows. Giải pháp thay thế là cài đặt các ứng dụng của bên thứ 3 như MoboTerm, v.v...

## 8. Mức độ bảo mật của Telnet

Vấn đề bảo mật của Telnet chính là thách thức lớn nhất của giao thức này. Giao thức Telnet không được mã hóa nên dễ trở thành mục tiêu cho các cuộc tấn công man-in-the-middle. Lưu lượng Telnet có thể bị lộ bất cứ lúc nào. Telnet cũng chỉ cung cấp xác thực dựa trên mật khẩu. Như đã nêu trước đây, mật khẩu được truyền qua mạng có thể bị những kẻ tấn công đánh cắp. Xác thực dựa trên mật khẩu kém an toàn hơn so với xác thực dựa trên chứng chỉ hoặc key.

## 9. Mã hóa Telnet bằng Telnet/s

Theo mặc định, giao thức Telnet không mã hóa lưu lượng của nó. Nếu muốn mã hóa lưu lượng, bạn có thể sử dụng Telnet/s. Trên thực tế, một số tunnel TLS/SSL sẽ được tạo và lưu lượng telnet được truyền qua đường hầm TLS/SSL này. Do đó, Telnet/s không được sử dụng rộng rãi.

## 10. Giải pháp thay thế Telnet

Có những lựa chọn thay thế khác nhau dành cho Telnet. SSH là giải pháp thay thế phổ biến và tốt hơn cho giao thức Telnet.

- SSH cung cấp bảo mật tốt hơn bằng cách mã hóa lưu lượng và cung cấp xác thực an toàn hơn. SSH cũng có rất nhiều tính năng bổ sung như chuyển tiếp desktop X, chuyển tiếp cổng (port forwarding), v.v...
- RDP không phải là một giao thức từ xa sử dụng dòng lệnh, mà dựa trên GUI. RDP cần nhiều băng thông mạng hơn nhưng cung cấp trải nghiệm desktop hoàn chỉnh.

- VNC là một lựa chọn thay thế mã nguồn mở tương tự như giao thức RDP. VNC cung cấp desktop từ xa nhưng chậm hơn RDP trong hầu hết các trường hợp.
- SNMP được thiết kế để quản lý từ xa đối với các lệnh không tương tác. Nhưng SNMP chủ yếu được sử dụng để giám sát các hệ thống từ xa và không hoàn toàn thay thế cho giao thức Telnet.


## 11. Giải trí cùng Telnet

Có một số dịch vụ Telnet trên Internet cung cấp các đoạn phim dựa trên ASCII hoặc asciinema. Dịch vụ này chạy một đoạn phim ngắn qua giao thức Telnet. Bạn có thể truy cập bộ phim này từ *towel.blinkenlights.nl* như sau:

`
$ telnet towel.blinkenlights.nl
`

--------------------------------------------------

# II. Cấu hình Telnet trên Rouer Cisco<a name = "2"></a>

Ta sẽ thử cấu hình Telnet đơn giản như sau:

<img src = "https://i.imgur.com/BAE7koq.png">

Sau khi Cấu hình Telnet trên Router thì từ PC sẽ truy cập được Router để có thể cài đặt Router.
## 1. Cấu hình Router:
- Đặt *password* để enable Router. Ở đây ta sẽ đặt là *123*

```
R#conf t
R(config)#enable password 123
```

## 2. Các bước cấu hình telnet trên Router
Để cấu hình được telnet cho Router cần :
cấu hình IP của PC và Router thông với nhau
Password telnet trên cổng vty
Password enable
- *Bước 1 : Đặt IP cho Router trên cổng f0/0 :*
Code:
```
    R(config)#interface fastEthernet 0/0
    R(config-if)#ip address 192.168.1.254 255.255.255.0

    R(config-if)#no shutdown
```
- *Bước 2 : Để có thể telnet được bắt buộc phải đặt password telnet và enable password*. Ta sẽ đặt mật khẩu là  *`telnet`*

Code:
```
R(config)#line vty 0 4    //0 4:Cho phép 5 người telnet đến Router
R(config-line)#password telnet
R(config-line)#login
```
​
## 3. Kết quả :
- Trên PC ta dùng cmd để *telnet* vào Router

    `*PC:\>telnet 192.168.1.254​*`
- Nó sẽ yêu cầu nhập *password* telnet. Ta sẽ nhập password là *telnet*
```
C:\>telnet 192.168.1.254
Trying 192.168.1.254 ...Open
User Access Verification
Password: 
```
- Sau khi nhập xong để vào mode enable thì các bạn nhập password enable đã đặt trên Router.
```
Router>enable 
Password: 
```
Sau khi nhập mật khẩu enable Router ta sẽ vào được Router để có thể cấu hình mà không cần làm trực tiếp trên Router.
```
Router#
```
