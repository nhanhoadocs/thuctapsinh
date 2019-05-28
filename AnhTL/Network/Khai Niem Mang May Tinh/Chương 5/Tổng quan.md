# Datalink Layer
- Truyền gói dữ liệu trên môi trường vật lý.
- Định dạng khuôn dạng trao đổi dữ liệu giữa các node.
- Giao thức tầng liên kết dữ liệu: Ethernet, FDDI, PPP, ATM, Frame Relay, HDCL.

## 1. Các dịch vụ của datalink layer
### - Đóng frame và truy cập đường truyền ( framing, link access )    
- Phần lớn các giao thức tầng liên kết dữ liệu đặt gói dữ liệu tầng mạng vào trong gói dữ liệu tầng liên kết (frame) trước khi truyền lên đường truyền.
  - frame gồm các tiêu đề đầu và cuối (header và trailer).
- Đường truyền kiểu point-to-point, 1 phía gửi và 1 phía nhận.
- Header của frame thường chứa trường địa chỉ MAC của node (node là máy tính và router).

#### - Truyền tin cậy.
- Đảm bảo truyền dữ liệu 1 cách chính xác và không bị lỗi gói tin.
  - Khác với giao thức TCP của tầng giao vận là nó được sửa lỗi ngay trên đường truyền, chứ không phải truyền lại dữ liệu từ đích tới nguồn
- Tầng liên kết dữ liệu không cần cung cấp dịch vụ truyền tin cậy cho các đường truyền ít lỗi.
  - Vì vậy phần lớn các giao thức tầng liên kết dữ liệu phổ biến không cung cấp dịch vụ truyền tin cậy

#### - Kiểm soát lưu lượng.
- Sẽ lưu trữ tạm thời các frame tại các node trên mỗi phía của đường truyền.
- Kiểm soát lưu lượng, chống bị tràn bộ đệm khiến frame bị mất
- Cơ chế kiểm soát lưu lượng để ngăn chặn phía phát gửi quá khả năng nhận của phía thu dữ liệu.

#### - Phát hiện lỗi.
- VD: node nhận có thể nhận được bit 0 trong khi node gửi là gửi bit 1.
- Nguyên nhân bị lỗi có thể do tín hiệu bị suy hao hay nhiễu điện từ.
- Khi phát hiện ra lỗi, node nhận sẽ bỏ qua hoặc yêu cầu gửi lại.

#### - Sửa lỗi.
- Sửa lỗi cũng tương tự phát hiện ra lỗi
- Node nhận còn có khả năng xác định chính xác vị trí lỗi xuất hiện trong frame và sẽ tiến hành sửa lỗi.

#### - Bán song công và song công (Half duplex và Full duplex)
- Half duplex: Các node không thể gửi và nhận đồng thời.
- Full duplex: Các node có thể gửi và nhận dữ liệu cùng lúc.    

## 2. Datalink Sublayers.

![img](https://camo.githubusercontent.com/94d217bd4513051d1d2c816b02fcc01a9b456e49/68747470733a2f2f692e696d6775722e636f6d2f536a70563433622e6a7067)

- Gồm có 2 tầng con là:
  - Tầng phía trên: LLC (Logical Link Control)
    - Giao tiếp với lớp Network.
    - Đóng gói một phần frame.
    - Làm cho hai giao thức lớp mạng khác nhau có thể giao tiếp với nhau.
  - Tầng dưới: MAC (Media Access Control)
    - Cung cấp địa chỉ vật lý (MAC Address).
        - Biểu diễn bằng hệ số thập lục phân.
        - Chiều dài 48 bit.
        - Gán cố định cho mỗi interface.
        - Phân cấp theo tổ chức.
        - Khi dữ liệu được gửi vào mọi trường thì toàn bộ các host sẽ nhận được.
        - Căn cứ vào địa chỉ MAC, để gửi chính xác dữ liệu đến nơi cần đến.
    - Phân chia ranh giới của các dữ liệu.
    - Phân loại dữ liệu giao thức lớp datalink
     
## 3. Giao thức đa truy cập và mạng cục bộ.
- Có 2 kiểu kết nối mạng:
  - Truyền điểm nối điểm (point-to-point): Trên đường truyền có duy nhất một bên gửi và một bên nhận.
  - Truyền quảng bá (broadcast): cho phép nhiều nút gửi và nhiều nút nhận cùng kết nối tới đến kênh truyền dùng chung duy nhất.    

### 3.1 Giao thức phân chia kênh truyền (channel partitioning)
- Ghép kênh là một kỹ thuật thông qua đó một số tín hiệu được truyền đồng thời qua một liên kết dữ liệu duy nhất. Hệ thống đa kênh bao gồm n số thiết bị chia sẻ dung lượng của một liên kết, đó là cách liên kết (đường dẫn) có thể có nhiều kênh.
- Có 2 kỹ thuật phân chia băng thông kênh truyền cho các note tham gia truyền:
  - **Phân kênh theo thời gian (TDM - Time Division Multiplexing)**
  - VD: Trên kênh truyền có N node và tốc độ truyền của kênh là R bps. TDM chia thời gian thành các khoảng (time frame) (độc lập với đơn vị dữ liệu frame ở tầng data-link) và chia mỗi khoảng thời gian thành N khe thời gian (time slot). Mỗi khe thời gian được cấp phát cho mỗi node. Khi dữ liệu cần gửi, node truyền các bit dữ liệu của mình trong khe thời gian đã được cấp phát
    - Ưu điểm: Là loại trừ xung đột và đảm bảo công bằng.
        - Mỗi node có được tốc độ truyền riêng R/N bps trong mỗi khoảng time.
    - Nhược điểm:
        - Tốc độ truyền trung bình của mỗi node bị giới hạn R/N bps
        - Node chỉ được truyền trong khoảng thời gian của mình ngay cả khi nó là node duy nhất có nhu cầu gửi.
        - VD: Trong 1 bữa nhậu, chúng ta đều muốn nghe một người nào đó nói thì người đó chỉ được nói trong khoảng thời được cấp phát cho mình ( nói nhiều chứng tỏ say ).
        - Chứng tỏ TDM không phải là một giao thức đa truy cập tốt cho bữa nhậu kiểu này.
  - **Theo tần số (FDM - Frequency-division multiplexing)**
  - Nếu TDM chia kênh truyền theo thời gian thì FDM chia kênh truyền R bps ra các tần số khác nhau (Mỗi tần số có băng thông R/N) và mỗi node được cấp phát một dải tần số. Vì thế, FDM tạo ra N kênh truyền nhỏ R/Nbps từ kênh truyền lớn R bps.
    - Ưu điểm: Loại bỏ xung đột và phân chia công bằng dải tần giữa N node
    - Nhược điểm: tốc độ gửi của node bị giới hạn ngay cả khi chỉ có duy nhất một node có nhu cầu gửi dữ liệu.
  - **Chia Mã (CDMA - Code division Multiple Access)**
  - Nếu TDM và FDM cấp phát khoảng time và tần số cho các node thì CDMA cấp phát cho mỗi node một mã khác nhau. Sau đó node gửi sử dụng mã duy nhất này để mã hóa dữ liệu gửi đi
  - CDMD cho phép gửi nhiều node đồng thời và các node tương ứng nhận đúng gửi liệu được gửi cho mình ( miễn là nó biết được mã của node gửi).
  
### 3.2 Giao thức chia cập ngẫu nhiên (random accsess)
- Kiểu giao thức truy cập thứ hai là truy cập ngẫu nhiên. Trong giao thức này, node truyền luôn luôn truyền dữ liệu với tốc độ cao nhất của kênh truyền. Khi có xung đội xảy ra, các node liên quan đến xung đột sẽ truyền lại frame cho đến khi frame đến đích an toàn. Nhưng khi biết có xung đột, node không cần thiết truyền lại frame ngay lập tức, mà đợi một thời gian ngẫu nhiên nào đó trước khi truyền lại. Mỗi node liên quan đến xung đột chọn thời gian đợi ngẫu nhiên một cách độc lập, vì thế sau mỗi xung đột xác suất hai node cùng truyền lại cùng một lúc ( xảy ra xung đột ) sẽ giảm.

### 3.4 Mạng cục bộ LAN
- Những giao thức đa truy cập được sử dụng trên kênh truyền nhiều loại kênh truyền quảng bá khác nhau. 
- Mạng Lan là mạng máy tính giới hạn trong khu vực địa lý, ví dụ trong tòa nhà, hoặc khuôn viên trường đại học.
- Mạng LAN là kênh truyền duy nhất giữa tất cả máy tính và router, do đó nó cần tới giao thức tầng liên kết dữ liệu và giao thức đa truy nhập.
- Tốc độ truyền của mạng LAN cao, trước năm 1980 là 10Mbps, nay là 100Mbps và dự kiến tương lai sẽ là 1Gbps.


## 4. Giao thức ARP

[Giao Thức ARP ](https://github.com/letuananh19/thuctapsinh/blob/master/AnhTL/Khai%20Niem%20Mang%20May%20Tinh/Ch%C6%B0%C6%A1ng%205/Giao%20th%E1%BB%A9c%20ARP.md)
## 5. Khái niệm cơ bản của Ethernet.
- Ethernet xuất hiện dưới nhiều dạng hình thức. Mạng cục bộ Ethernet có thể có topo dạng **bus** hay **star**
- Mạng cục bộ Ethernet có thể sử dụng cáp đồng trục hay cáp quang. 
- Ethernet có thể truyền dữ liệu với các tốc độ khác nhau: 10Mbps, 100Mbps hay 1Gbps

### 5.1 cấu trúc frame Ethernet.
- Công nghệ Ethernet khác nhau nhưng đều có chung cấu trúc frame.
- Ethernet cáp đồng trục hay cáp quang, chạy với tốc độ nào thì đều có cấu trúc frame như nhau.
  - VD: 2 máy tính gửi dữ liệu cho nhau. Máy gửi A có địa chỉ MAC là: AA-AA-AA-AA-AA-AA và máy nhận B có địa chỉ MAC là: BB-BB-BB-BB-BB-BB.
  
  ![img](https://computernetworkingsimplified.files.wordpress.com/2013/11/l2framestructure1.jpg?w=840)

  - Thì lúc này toàn bộ dữ liệu và địa chỉ MAC của máy gửi sẽ ở trong frame Ehternet và gửi frame này xuống tầng physical. Máy B khi nhận được frame của tầng vậy lý nó sẽ lấy gói dữ liệu IP và chuyển lên tầng mạng trên. Ở đây ta có 6 trường trong frame Ethernet.

##### 5.1.1 Trường dữ liệu (Từ 46 đến 1500 byte)
- Trường này chứa gói dữ liệu IP, MTU (Maximum Tranfer Unit) của Ethernet là 1500 byte. Điều này có nghĩa là nếu gói dữ liệu là IP vượt quá 1500 byte thì máy tính phải chia nhỏ gói dữ liệu ra sao cho phù hợp.
  - Kích thước tối thiểu của trường này là 46 bytes. Có nghĩa là nếu gói dữ liệu nhỏ hơn 46 byte, trường dữ liệu phải được chèn thêm 1 số dữ liệu giả sao cho đủ 46 byte. Khi bên gửi chèn thêm dữ liệu vào thì tầng mạng ở phía bên nhận cả gói dữ liệu lẫn dữ liệu được chèn, Khi đó nó phải sử dùng trường độ dài (Length) trong gói dữ liệu IP để loại bỏ phần được chèn vào.

##### 5.1.2 Địa chỉ đích (6 byte)
- Trường này chưa địa chỉ vật lý của máy nhận (ví dụ như: BB-BB-BB-BB-BB-BB)
- Khi máy B nhận được bất kỳ frame nào nó chỉ kiểm tra địa chỉ đích của frame. Nếu đúng là địa chỉ MAC của nó hoặc địa chỉ broadcast thì nó mới chuyển gói tin datagram lên tầng tiếp theo.

##### 5.1.3 Địa chỉ nguồn (6 byte)
- Trường này chứa địa chỉ MAC của máy gửi frame.

##### 5.1.4 Trường kiểu (2 byte)
- Trường này cho phép Ethernet hỗ trợ nhiều giao thức tầng mạng khác nhau.

##### 5.1.5 Mã kiểm tra dư thừa (cyclic Redundancy Check -CRC) (4 byte)
- Mục đích của Trường CRC là cho phép máy phát hiện có lỗi nào trong frame nhận được hay không.

##### 5.1.6 Lời mở đầu (Preamble) (8 byte)
- Frame Ethernet bắt đầu với trường preamble 8 byte, trong đó 7 byte đầu tiên có giá trị 10101010; byte thứ 8 có giá trị 10101011.
- Bảy byte đầu tiên làm nhiệm vụ " đánh thức máy nhận và đồng bộ hóa cả 2 bên".
  - Tại sao cần đồng bộ hóa: Máy A truyền frame với tốc độ 10Mbps, 100Mbps hay 1Gbps còn phụ thuộc vào kiểu Ethernet. Tuy nhiên A chưa chắc đã truyền frame với tốc độ xác định mà với tốc độ nào đó. Máy nhận có thể chốt đồng hồ của Máy gửi bằng cách chốt tất cả các bit trong bảy byte đầu tiên. Hai bit cuối cùng trong byte thứ 8 (hai bit 1 liên tiếp nhau) báo cho máy nhận rằng dữ liệu chuẩn bị đến. Khi máy nhận thấy hai bit 1 liên tiế nhau, nó biết rằng 6 byte tiếp theo là địa chỉ đích

## 6. Point-to-Point (PPP)
[point-to-point](https://github.com/letuananh19/thuctapsinh/blob/master/AnhTL/Khai%20Niem%20Mang%20May%20Tinh/Ch%C6%B0%C6%A1ng%205/point-to-point.md)

## 7. Virtual Private Network (VPN)
[Virtual Private Network (VPN)](https://github.com/letuananh19/thuctapsinh/blob/master/AnhTL/Khai%20Niem%20Mang%20May%20Tinh/Ch%C6%B0%C6%A1ng%205/VPN.md)

# END