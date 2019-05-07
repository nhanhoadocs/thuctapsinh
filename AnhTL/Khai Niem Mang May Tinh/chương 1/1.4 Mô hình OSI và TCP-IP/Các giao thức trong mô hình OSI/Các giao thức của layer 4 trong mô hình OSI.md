 # Tìm hiểu về giao thức TCP và UDP
Tầng Transport của TCP/IP: Cung cấp 2 giao thức cơ bản là TCP, UDP được sử dụng
trong hầu hết trong các ứng dụng)
#### Mục lục
[1. TCP (Transmission Control Protocol)](#TCP)
[2. UDP (User Datagram Protocol)](#UDP)

### <a name="TCP"> 1. TCP (Transmission Control Protocol) </a>
- Là giao thức hướng kết nối (connection-oriented) nghĩa là khi muốn truyền dữ liệu
thì phải thiết lập kết nối trước.
- Hỗ trợ cơ chế full-duplex ( truyền và nhận dữ liệu cùng một lúc)
- Cung cấp cơ chế đánh số gói tin (sequencing): để ráp các gói tin cho đúng ở điểm
nhận
- Cung cấp cơ chế báo nhận (Acknowledgement) :Khi A gửi dữ liệu cho B, B nhận
được thì gửi gói tin cho A xác nhận là đã nhận. Nếu không nhận được tin xác nhận
thì A sẽ gửi cho đến khi B báo nhận thì thôi.
- Phục hồi dữ liệu bị mất trên đường truyền ( A gửi B mà không thấy xác nhận sẽ gửi
lại) .
- TCP Header: Do là giao thức tin cậy nên header của TCP rất phức tạp

### <a name="UDP"> 2. UDP (User Datagram Protocol) </a>
- Là loại giao thức connectionless (nghĩa là có gói tin nào là đẩy ngay vào đường
truyền mà không cần thiết lập các kết nối trước).
- Không đảm bảo tính tin cậy khi truyền dữ liệu và không có cơ chế phục hồi dữ liệu (
nó không quan tâm gói tin có đến đích hay không, không biết gói tin có bị mất mát
trên đường đi hay không).
- UDP được sử dụng khi tốc độ là mong muốn và sửa lỗi là không cần thiết. Ví dụ, UDP
thường được sử dụng cho chương trình phát sóng trực tiếp và trò chơi trực tuyến.
Ví dụ, ta đang xem hình ảnh video trực tiếp. Live Stream phát sóng thường
sử dụng UDP thay vì TCP. Các máy chủ chỉ cần gửi một dòng của các gói tin UDP để
máy tính xem. Nếu ta bị mất kết nối trong vài giây, video sẽ đóng băng cho một
thời điểm và sau đó chuyển đến các bit hiện tại của truyền hình, bỏ qua các bit ta
đã bị bỏ qua. Video hoặc âm thanh có thể bị bóp méo một lúc và video tiếp tục chơi
mà không có dữ liệu bị mất.