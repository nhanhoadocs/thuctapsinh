# Giới thiệu tổng quan về bộ giao thức TCP/IP

## Tổng quan
-  TCP/IP là bộ giao thức cho phép kết nối các hệ thống mạng không đồng nhất với nhau. Ngày nay TCP/IP được sử dụng rộng rãi trong mạng cục bộ cũng như mạng toàn cầu. TCP/IP được xem như giản lược của mô hình tham chiếu OSI với 4 tầng như sau:

 [1. Tầng Truy cập mạng (Network Access)](#na)

 [2. Tầng Mạng (Internet Layer)](#il)

 [3. Tầng Giao Vận (Transport Layer)](#tl) 

 [4. Tầng Ứng Dụng (Application Layer)](#al)
 
 ![img](https://thietbimangcisco.vn/userfiles/TCP-IP-Model.png)

## Chức năng của các tầng.
- <a name = "na" >Tầng 1: </a> Tầng truy cập (Network Access Layer) tầng này có thể coi là một tầng riêng biệt hoặc cũng có thể tách nó thành 2 tầng vật lý và tầng liên két dữ liệu như trong mô hình OSI. Nó được sử dụng để truyền gói tin từ tầng mạng đến các Host trong mạng.Các thiết bị vật lý như : Switch, cáp mạng, card mạng HBA-Host Bus Adapter là các thành phần truy cập.

- <a name = " il">Tầng 2: </a> Tầng mạng (Internet Layer) trên mô hình TCP/IP có vai trò chính là giải quyết vấn đề dẫn đến các gói tin đi qua các mạng để đến đúng đích.

- <a name = "tl">Tầng 3: </a> Tầng vận chuyển (Transport Layer) đảm nhiệm việc phân nhỏ các gói tin có kích thước lớn khi gửi và tập hợp lại khi nhận, tính toàn vẹn cho dữ liệu (không lỗi, không mất, đúng thứ tự) là yếu tố được đảm bảo.Nếu để ý thì bạn sẽ thất chức năng của tầng vận chuyển ở giao thức TCP/IP cũng giống với tầng vận chuyển của mô hình OSI.

- <a name = "al">Tầng 4: </a> Tầng ứng dụng (Application Layer) là nơi các chương trình mạng như Web Browser,Mail User Agent làm việc để liên lạc giữa các node mạng.Do mô hình TCP/IP không có tầng nào nằm giữa các tầng ứng dụng và tầng vận chuyển, nên tầng Application của TCP/IP bao gồm các giao thức hoạt động như tầng trình diễn và giao dịch trong OSI.

## Phương thức hoạt động của bộ giao thức của TCP/IP.
 ![img](https://vnpro.vn/wp-content/uploads/2015/11/Qu%C3%A1-tr%C3%ACnh-%C4%91%C3%B3ng-m%E1%BB%9F-g%C3%B3i-d%E1%BB%AF-li%E1%BB%87u-trong-TCP-IP.jpg)
Quá trình đóng mở gói trong TCP/IP

- Cũng tương tự như trong mô hình OSI, khi truyền dữ liệu , quá trình tiến hành từ tầng trên xuống tầng dưới, qua mỗi tầng dữ liệu được thêm vào thông tin điều khiển gọi là Header. Khi nhận dữ liệu thì quá trình xảy ra ngược lại. dữ liệu được truyền từ tấng dưới lên và qua mỗi tầng thì phần header tương ứng sẽ được lấy đi và khi đến tầng trên cùng thì dữ liệu không còn phần header nữa.
 ![img](https://vnpro.vn/wp-content/uploads/2015/11/C%E1%BA%A5u-tr%C3%BAc-d%E1%BB%AF-li%E1%BB%87u-trong-TCP-IP.jpg)
Cấu trúc dữ liệu trong TCP/IP

- Hình trên cho ta thấy lược đồ dữ liệu qua các tầng.. Trong hình ta thấy tại các tầng khác nhau dữ liệu được mang những thuật ngữ khác nhau:
  - Trong tầng ứng dụng: dữ liệu là các luồng được gọi là stream. 
  - Trong tầng giao vận: đơn vị dữ liệu mà TCP gửi xuống gọi là TCP segment.
  - Trong tầng mạng, dữ liệu mà IP gửi xuống tầng dưới gọi là IP Datagram 
  - Trong tầng liên kết, dữ liệu được truyền đi gọi là frame.


