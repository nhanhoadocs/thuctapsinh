 # Tìm hiểu về giao thức TCP và UDP và Sự khác nhau giữa 2 giao thức.
Tầng Transport của TCP/IP: Cung cấp 2 giao thức cơ bản là TCP, UDP được sử dụng
trong hầu hết trong các ứng dụng phổ biến hiện nay.
#### Mục lục
[1. UDP (User Datagram Protocol)](#UDP)

[2. TCP (Transmission Control Protocol)](#TCP)
### <a name="UDP"> 1. UDP (User Datagram Protocol) </a>
#### Khái Niệm
- UDP Là loại giao thức connectionless (nghĩa là có gói tin nào là đẩy ngay vào đường
truyền mà không cần thiết lập các kết nối trước).
- Không đảm bảo tính tin cậy khi truyền dữ liệu và không có cơ chế phục hồi dữ liệu (
nó không quan tâm gói tin có đến đích hay không, không biết gói tin có bị mất mát
trên đường đi hay không).
- UDP được sử dụng khi tốc độ là mong muốn và sửa lỗi là không cần thiết. 
  - Ví dụ, UDP thường được sử dụng cho chương trình phát sóng trực tiếp và trò chơi trực tuyến.
  - Ví dụ, ta đang xem hình ảnh video trực tiếp. Live Stream phát sóng thường sử dụng UDP thay vì TCP. Các máy chủ chỉ cần gửi một dòng của các gói tin UDP để máy tính xem. Nếu ta bị mất kết nối trong vài giây, video sẽ đóng băng cho một thời điểm và sau đó chuyển đến các bit hiện tại của truyền hình, bỏ qua các bit ta đã bị bỏ qua. Video hoặc âm thanh có thể bị bóp méo một lúc và video tiếp tục chơimà không có dữ liệu bị mất.
- UDP không đòi hỏi thực thể bên gửi và nhận phải liên kết trước khi trao đổi dữ liệu. Vì thế UDP được xem là dịch vụ không hướng nối hay không liên kết trước (connectionless).

#### Ưu điểm 
- Nhanh ( do không kiểm soát tốc độ gửi, chấp nhận mất mát dữ liệu nhưng đòi lại phải có một tốc độ truyền tốt thiểu)
- Hiệu quả hơn đối với các mục tiêu như kích thước nhỏ và yêu cầu khắt khe về thời gian. 
- Ngày nay UDP thường được các ứng dụng đa phương tiện như điện thoại Internet (VOIP), hội thảo từ xa, các ứng dụng thời gian thực sử dụng. Các ưng dụng như thế có thể chấp nhận mất mát, lỗi 1 phần dữ liệu, Vì thế truyền dữ liệu tin cậy TCP không phải là tiêu chí quan trọng nhất để dánh giá sự thành công của 1 ứng dụng. Hơn nữa các ứng dụng thời gian thực không thích ứng được với cơ chế kiểm soát tắc nghẽn của TCP. Do đó chúng thường lựa chọn UDP ở tầng giao vận. 
- Hỗ trợ hình trạng (Topology). UDP hỗ trợ các liên kết 1-1, 1-n, ngược lại TCP chỉ hỗ trợ liên kết 1-1.
- Kích thước header. UDP chỉ có 8 byte header cho mỗi đoạn, ngược lại TCP cần các header 20 byte, vì vậy sử dụng băng thông ít hơn.
#### Nhược điểm

- **UDP Thiếu các tín hiệu bắt tay.** Trước khi gửi một đoạn, UDP không gửi các tín hiệu bắt tay giữa bên gửi và bên nhận. Vì thế phía gửi không có cách nào để biết datagram đã đến đích hay chưa. Do vậy, UDP không đảm bảo việc dữ liệu đã đến đích hay chưa.

- **Sử dụng các phiên.** Để TCP là hướng liên kết, các phiên được duy trì giữa các host.

- TCP sử dụng các chỉ số phiên (session ID) để duy trì các liên kết giữa hai host. UDP không hỗ trợ bất kỳ phiên nào do bản chất phi liên kết của nó.

- **Độ tin cậy.** UDP không đảm bảo rằng chỉ có một bản sao dữ liệu tới đích. Để gửi dữ liệu tới các hệ thống cuối, UDP phân chia dữ liệu thành các đoạn nhỏ. UDP không đảm bảo rằng các đoạn này sẽ đến đích đúng thứ tự như chúng đã được tạo ra ở nguồn. Ngược lại, TCP sử dụng các số thứ tự cùng với số hiệu cổng và các gói tin xác thực thường xuyên, điều này đảm bảo rằng các gói tin đến đích đúng thứ tự mà nó đã được tạo ra.

- **Kiểm soát luồng.** UDP không có kiểm soát luồng; kết quả là, một ứng dụng UDP được thiết kế tồi có thể làm giảm băng thông của mạng.

#### Ứng dụng sử dụng UDP
- DNS (Domain Name System) - Port 53.
- streaming media.
- Voice over IP.
- Game trực tuyến.

#### Bạn có thể tham khảo đường dẫn dưới đây để có cái nhìn tổng quan hơn về UDP.

[Giao thức UDP](https://coggle.it/diagram/V9Excp31HL0Yw5Wh/t/giao-th%E1%BB%A9c-udp)

### <a name="TCP"> 2. TCP (Transmission Control Protocol) </a>
#### Khái Niệm
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
- Đối với một số ứng dụng thì TCP không thích hợp. Vấn đề lớn nhất là phía nhận không thể tiếp nhận các gói tin đến sau một gói bị lỗi trước khi chính gói bị lỗi được truyền lại. Điều này khiến TCP không thích hợp cho các ứng dụng thời gian thực (real-time) chẳng hạn như đa phương tiện trực tuyến, trò chơi trực tuyến và thoại trên nền IP (VoIP) bởi vì các ứng dụng này cần các gói tin kịp thời hơn là nhận đủ các gói tin theo đúng thứ tự.

#### Quá trình bắt tay 3 bước
- Ngước lại với UDP là TCP phái thiết lập quá trình bắt tay 3 bước trước khi gửi data.

  - B1: Client gửi tới máy chủ yêu cầu kết nối.
  - B2: server nhận được yêu cầu và gửi trả lại gói tin SYN/ACK để xác nhận kết nối
  - B3: Client gửi dữ liệu hồi âm.

#### Cấu trúc gói tin
- TCP header: Chứa thông tin về dữ liệu tương ứng.
- 16 bit cho cổng nguồn và đích.

#### Đặc điểm
- Chạy bên dưới tầng ứng dụng và bên trên tầng network.
- Truyền dữ liệu theo dòng tin cậy.
- Được dùng bởi hầu hết các ứng dụng mạng.

#### Địa chỉ cổng
- 1 số nguyên 16 bit được gán nhãn.
- Định danh ứng dụng.
- Chuyển dữ liệu chính xác đến ứng dụng.

#### Ưu điểm
- Truyền dữ liệu đúng trật tự, chính xác.
- không mất dữ liệu, độ tin cậy cao.

#### Nhược điểm
- Độ trễ lớn.
- Không đáp ứng được nhu cầu về thời gian thực.

#### Ứng dụng sử dụng TCP
- SMTP - Port 125.
- FTP - Port 21.
- HTTP - port 80.

#### Bạn có thể tham khảo đường dẫn dưới đây để có cái nhìn tổng quan hơn về TCP.

[Giao Thức TCP](https://coggle.it/diagram/V9A6pZ31HL0Ywa6G/t/giao-th%E1%BB%A9c-tcp)

# Tổng kết sự khác nhau giữa 2 giao thức UDP và TCP 
- Bảng dưới đây tổng kết những sự khác nhau giữa hai giao thức TCP và UDP:

![img](https://4.bp.blogspot.com/-nSJDYb5M6E4/V_3wOIoVxxI/AAAAAAAARuU/gv5XnvqOc1gvSmomFzqkD9JHqpCVY4hiwCLcB/s1600/udp3.png)
