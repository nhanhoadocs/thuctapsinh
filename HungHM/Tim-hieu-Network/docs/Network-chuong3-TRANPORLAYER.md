# CHƯƠNG 3: TRANSPORT LAYER

## Mục lục
[3.1 Nguyên tắc và dịch vụ](#1)
 - [3.1.1 Nguyên tắc ](#a)
 - [3.1.2 Dịch vụ](#aa)

[3.2 UDP( User Datagram Protôcl)](#2)
- [3.2.1 Cách thức hoạt động cảu UDP](#b1)
- [3.2.2 Cấu truc segment](#b2)
- [3.2.3 Nguyên tắc truyền dữ liệu](#b3)
- [3.2.4 Xây dựng dữ liệu tin cậy](#b4)
- [3.2.5 Giao thức truyền dữ liệu liên tục](#b5)
- [3.2.6 Go-back-N)](#b6)
[3.3 TCP-Giao thức giao vân hướng nối](#2)

 ===========================

<a name ="1"></a>
3.1 Nguyên tắc 

Giao thức tầng giao vận cung cấp 1 kênh truyền logic ảo giữa các tiến trình ứng dụng chạy trên máy tính khác nhau .Thực thể giao vận chèn thông điệp mà nó nhận được từ tiếng trình ứng dụng vào các 4-UDP (Protocal Data Unit) là đơn vị dữ liệu của giao thức tầng giao vận ) => chia thông diệp thành nhiều đoạn nhỏ => chuyển gói dữ liệu xuống tầng mạng =>tầng mạng ghép chúng thành thông điệp hoàn chỉnh => tiến trình ứng dụng nhận.

<a name ="a"></a>
3.1.2 Dịch vụ

- Dồn kênh (Multiplex)
 Tại thiết bị gửi ,tầng giao vân nhân giữu liệu từ nhiều tién trình ứng dụng khác nhau .Tạo segment chứa dữ liệu cung với một số thông tin tiêu đề cùng chuyển segment xuông tầng mạng.quá trình này gọi là dồn kênh

- Phân kênh (demdtiplex)
Mỗi segment của tầng gaio vận có trường xác định tiến trình nhập dữ liệu.Tầng gaio vận bên nhận sẽ sử dụng trường này để xác định rõ tiến trình nhận và gửi dữ liệu trong segment tới tiến trình đó, công việc chuyển dao dữ liệu trong segment tới tiến trình ứng dụng gọi là phân kênh

<a name ="2"></a>
3.2 UDP (User Datagram Protocol)

- Là một phần của bộ gaio thức Internet, được sử dụng bởi các trương trình chạy trên máy tính khác nhau trên mạng 
- Được sử dụng để gửi cái các gói tin nhắn được gọi là Datagram ,cho phép truyền nhanh hơn
- Làm việc trực tiếp với tầng mạng ,lấy thong điệp từ tầng ứng dụng sau số chèn thêm cổng nguồn và cổng địch cho dịch vụ dồn kệnh tai segment sau dố chuyển suống tầng mạn
- VD: Khi bạn đang livetream nếu bị mâts kết nối trong vài giây ,video sẽ dừng lại tại một thời điểm nhất định hoặc âm thanh có thể bị bóp méo và khí có kết nói trở lại livetream sẽ tiếp tục chạy mà dông có dữ liệu bị mất
 
 <a name ="b1"></a>
3.2.1 Cách thức hoạt động cảu UDP

Khi ứng dụng sử dụng UDP ,các gói tin chỉ được gửi đến người nhận .Và người gửi không đợi để đảm bảo người nhận có nhận được có nhận được gói tin hay không ,mà nó sẽ tiếp tục gửi các gói tin tiếp theo .Nếu người nhận bỏ lỡ một vài gió tin UDP, gói tin đó sẽ bị mất vì người gửi sẽ khong sửi lại chúng .Điều này có nghĩa thiết bị có thể chuyển giao nhanh hơn.

- Lý do nhiều ứng dụng sử dụng UDP
    - Không có giai đoạn thiết lập kết nối (truyền đi nhanh hơn nhưng không đảm bảo bện nhận có nhận được tất cả các gói tin )
    - không duy trì trang thái kết nối 
    - Tiêu đề dữ liệu nhớ (8 bytes)
    - Khôgn kiểm saots tốc dộ gửi

- Ứng dụng của UDP
UDP được sử dụng khí tốc độ được ưu tiên và sửu lỗi không cần thiết
 VD: Thường được sử dụng để phát sóng trực tiếp và trò chơi trực tuyến .

 <a name ="b2"></a>
 3.2.2 Cấu trúc Segment

<img src="https://imgur.com/9C5beMb.jpg">

- Source port và Dest port: cho phép thiết bị gửi chuyển dữ liệu tới đúng tiến trình chạy trên thiết bị nhận
- Length: Độ dài của gói dữ liệu(byte)
- Checksum :Kiếm tra lỗi trong quá trình truyền ,nhận dữ liệu 
    - UDP Checksum: Phát hiện lỗi nhưng nó không Fix
    - Coa thể gửi qua Segment cho ứng dụng kém theo một thông báo lỗi

<a name ="b3"></a>
3.2.3 Nguyên tắc truyền dữ liệu tin cậy.

<img src="https://imgur.com/LJ7rm33.jpg">

Thực thể gửi sẽ nhận dữ liệu từ phía trên chuyển xuống qua hàm rdt-send() (Relible data transfer
và _sendchỉ rõ ở đây là phí gửi cảu giao thức rdt Bước đầu tiền khi xấy dựng xong một giao thức nào đó chọn cho nó mtj cái tên rễ nhớ ) Phía nhận sử dụng hàm rdt_send() đẻ lấy gói dữ liệu từ đường truyền .để truyền dữu liệu lên tầng trên ,phía nhận sử dụng hàm deliver_data()

<a name ="b4"></a>
3.2.4 Xây dựng dữ liệu tin cậy

- Truyền dữ liệu tin ccậy trên kện truyền tin cậy hoàn toàn (rdt 1.0)
    - Nhân dữ liệu từ tầng trên thông qua sự kiện rdt_rcv(packet)
    - Tất cả dữ liệu được truyền phía gửi cho phép nhận


