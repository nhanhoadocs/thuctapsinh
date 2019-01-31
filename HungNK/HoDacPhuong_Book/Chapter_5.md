# Datalink Layer

- Truyền gói dữ liệu trên môi trường vật lý
- Định dạng khuôn dạng trao đổi dữ liệu giữa các node
- Giao thức tầng liên kết dữ liệu: Ethernet, FDDI, PPP, ATM, Frame Relay, HDCL


## Các dịch vụ của Datalink layer
### - Đóng frame và truy cập đường truyền ( framing, link access )
- đóng gói tin vào các frame
- truy nhập đường truyền ( đường truyền dùng chung cần có quy tắc truy nhập )
- địa chỉ vật lý ( physical addr ) được sử dụng
### - Truyền tin cậy ( reliable delivery )
- đảm bảo các gói tin của tầng mạng không bị lỗi
- tùy thuộc chất lượng đường truyền
### - Flow control ( điều khiển lưu lượng )
- đảm bảo lưu lượng truyền hợp lý, nút nhận không bị quá tải
### - Eror detection
- lỗi có thể phát sinh do nhiễu, tín hiệu yếu
- nút nhận phát hiện lỗi, bỏ qua hoặc yêu cầu cho nút gửi gửi lại
### - Error correction
- nút nhận xasc định bit bị lỗi và sửa lỗi
### - Half-duplex and Full-duplex
- half-duplex: các nút không thể truyền nhận đồng thời
- full-duplex: các nút có thể truyền nhận đồng thời

## Datalink Sublayers

<img src= "https://i.imgur.com/SjpV43b.jpg" >


### Logical Link Contro (LLC):
- Giao tiếp với lớp Network
- Đóng gói một phần frame
- Làm cho hai giao thứcc lớp mạng khác nhau có thể giao tiếp với nhau
### Media Access Control (MAC)
- Cung cấp địa chỉ vật lý (MAC Address)
    - Biểu diễn bằng hệ số thập lục phân
    - Chiều dài 48 bit
    - Gán cố định cho mỗi interface
    - Phân cấp theo tổ chức
    - Khi dữ liệu được gửi vào mọi trường thì toàn bộ các host sẽ nhận được
    - Căn cứ vào địa chỉ MAC, máy tính đích sẽ giữ lại gói dữ liệu của nó
- Phân chia ranh giới của các dữ liệu
- Phân loại dữ liệu giao thức lớp datalink


 *Đóng gói Frame:* *tập hợp các thông tin cần thiết*

 <img src= "https://i.imgur.com/crExIvH.png" >

 ### Điều khiển truy xuất môi trường:
    là việc xác định xem máu tính nào được phép truyền dữ liệu trong cùng một môi trường chia sẽ
    - deteministic: truyền có lấy lượt
    - non-deteministic: truyền không lấy lượt

## Giao thức phân chia kênh

### Phân chia theo thời gian ( TDM - Time Division Multiplexing )
- Chia thời gian thành các khoảng ( time frame )
- Chia các khoảng thành các khe ( time slot )
- Mỗi khe được cấp cho một node

### Phân chia kênh theo tầng số

- Phân chia kênh truyền ra các tầng số khác nhau
- Mỗi node được truyền trên một tầng số nhất định

### Phân chia theo mã ( CDMA - Code Division Multiple Access)

- Cấp cho mỗi node một code khác nhau
- Node sử dụng code đó để mã hóa dữ liệu đi
- Node nhận đúng dữ liệu có code tương ứng với mình

### Giao thức lấy lượt

## Kỹ thuật phát hiện lỗi và sửa lỗi
- Kiểm tra tính chẵn lẻ
- Phương pháp tính tổng kiếm tra
- Kiểm tra dư thừa vòng
- Sửa lỗi bằng mã Hamming

-----------------------------------

- Hub
- Bridge
- Switch

## Giao thức ARP
    giao thức giải mã địa chỉ

## Ethernet
## CSMA/CD : Giao thức đa truy cập của Ethernet
## Mạng LAN không dây
## PPP - Giao thức điểm nối điểm
## Mạng riêng ảo - VPN