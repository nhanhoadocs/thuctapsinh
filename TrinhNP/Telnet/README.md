# TÌM HIỂU VỀ TELNET
Viết tắt của : teletype network, teminal network, hay telecommunications network
Ra đời vào năm 1969
Telnet là một giao thức quản lý giao diện dòng lệnh từ xa
### Cấu trúc của telnet
Gồm khách hàng (client) và máy chủ (server)
Telnet là một dịch vụ phía máy chủ
Sử dụng port TCP 23
### Đặc điểm
Đơn giản nhưng không dễ dùng
Chậm chạp và thô sơ
Kết nối nhanh
Không an toàn, bảo mật không cao
### Thiết bị sử dụng
là giao thức cũ nên dùng ở nhiều thiết bị để quản lý từ xa như Linux, Switch, Router, Camera,...

### Telnet là tiền đề cho SSH
Vì Telnet không an toàn nên bây giờ đã phát triển thành một giao thức mới là SSH (Secure Socket Shell)

# CẤU HÌNH TELNET ĐƠN GIẢN TRÊN PACKET TRACER 

Mô hình: 

![Imgur](https://i.imgur.com/KHrtnob.png)

Đầu tiên ta cấu hình Router để sử dụng:

![Imgur](https://i.imgur.com/EHd7Vtn.png)

Đặt địa chỉ ip cho f0/0 của Router

![Imgur](https://i.imgur.com/k2Lfxcf.png)

Cấu hình Telnet trên Router: 

![Imgur](https://i.imgur.com/8YK4OjV.png)

mật khẩu là 123.

Sử dụng pc0 để check thử, có thể cấu hình router từ pc0.

![Imgur](https://i.imgur.com/g0lFZol.png)



