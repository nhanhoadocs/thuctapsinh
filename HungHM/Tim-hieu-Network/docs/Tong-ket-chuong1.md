# Tổng kết chương I

## Mục lục
[I.  Mạng truyền thông và công nghệ](#mangtruyenthongvacongnghe)
 - [1.1.2 Mạng máy tính ](#mangmaytinh)
 - [1.1.3 Phân loại mạng máy tính](#phanloaimangmaytinh)

 [II. Mô hình OSI](#Mohinhsoi)
 - [1.2.1 Mô hình OSI ](#Mohinhosi)

[III. Bộ giao thức TCP/IP](#Mohinhsoi)

 ===========================

<a name="Modau"></a>

## 1.1 Mạng truyền thông và công nghệ
- Giới thiệu chung
   - Truyền thông mạng máy tính 

     `Truyền thông mạng máy tính ` là quá trình truyền dữ liệu thiết bị này sang thết bị khác 
   - Khai niệm Mạng(NetWork)

 ###   chỉ khái niệm kết nối các thiết bị lại với nhau nhằm chia sẻ thông tinkhái niệm liên qua đến nhiều vấn đề báo gồm:
        - Giao thức truyền thông
        - Topo
        - Dịa chỉ
        - Định Tuyến 
        - Tính tin cậy
        - Khả năng liên tác 
- Mạng máy tính
    - Bao gồm nhiều thành phần các thành phấn được liên kết với nhau bằng phương thức nào dó và cùng sử dụng chung một ngôn ngữ 
       - thiết bị đầu cuối 
       - Môi trường truyền(media)
       - Giao thức(protôc)
- => Mạng máy tính là tập hợp những máy tính và thiết bị phụ trọ sử dụng chung mộ nhóm giao thức đẻ chia sẻ tài nguyên thông qua các phương thức chuyền thông 

 - Phương tiện và giao thức truyền thông mạng
 - Môi trường truyền thông(Media)

    môi trường vật lý sử dụng để kết nối các thành phần của mạng -> môi trương truyền thông.Môi trường truền thông gồm 2 loại:
    - Cap (cap xoán dôi,cap đong trục,cap quoang)
    - Không giây(sóng radio,vệ tinh)
- Phân loại mạng máy tính 
 Việc phân loại chúng thường dựa trên các đặc điểm chung ,mạng máy tính thường phân loại theo vùng địa lý 
 - Phân loại theo diên hoạt động
    - mạng cục bộ(LAN)
    - mạng diện rộng(WAN)
    - Mạng đô thị(MAN)
    - mạng toàn cầu(GAN)
    - Mạng cá nhân(PAN)
    - Mạng lưu trữ(SAN)
- Mạng cục bộ (LAN)
<img src="https://imgur.com/eNjn7ep.jpg">

Liên kết cái tài nguyên máy tính trong một vùng địa lý có kích thước hạn chế trong đó có thể là một văn vòng,vài văn phong trong 1 tòa nhà hoặc vài tòa nhà trong một khu nhà ,Người ta sác định pham vi của LAN bằng cách định bán kính trong vái chục met đén vài km,xác định bán kinh của mạng LAN < 10KM
 
- Mạng diện rông(WAN)

<img src="https://imgur.com/YYzkd2O.jpg">

   Liên kết các tài nguyện mạng trong một vùng địa lý rộng (bán kính >100km) như Thị Xã,Tỉnh,TP có thể coi WAN gồm niều mạng LAN khác nhau
- Mạng cá nhân(PAN)

<img src="https://imgur.com/o0OavKo.jpg">


chỉ mạng máy tính nhỏ,sử dụng trong gia đình 
-  Mạng toàn cấu(GAN)

<img src="https://imgur.com/kCdh1Mq.jpg">

là mạng của các mạng WAN trải rộng trên pham vi toàn cầu

[II. Mô hình OSI](#Mohinhsoi)

[1.2.1 Mô hình SOI]()
- Mô hình OSI Được phân tầng với mục đích thiết kế các hệ thống mạng cho phép tất cả các kiẻu máy tính khác nhau kết nối được với nhau.Mô hình OSI gồm 7 tầng riêng biệt nhưng có liên quan tới nhau:
  - Tầng vật lý (physical)
  - Tầng liên kết dữ liệu (Data link)
  - Tầng mạng (Network)
  - Tầng giao vận (Tranpost)
  - Tầng phiên (session)
  - Tầng trình diễn (presention)
  - Tầng ứng dụng (applycation)
  Trên cùng một máy tính 2 tầng kề nhau trao đổi dữ liệu với nhau qua các giao diện (interface)

1. Tầng vật lý (physical layer)
   Thực hiên những chức năng cần thiết để chuyển luồng bit dữ liệu đi qua môi trường vật lý 
    - Biểu diễn bit
    - Tốc độ dữ liệu
    - Đồng bộ hóa các bit
    - Cấu hình đường truyền 
    - Topo
    - Chế độ chuyền dẫn 
2. Tầng liên kết dữ liệu (Data link)
    Nhiệm vụ truyền thông giữa 2 nút nối trực tiếp với nhau.Nó biến tầng vật lý không tin cậy thành đường truyền tin cậy co tầng mạng bên trên.Tầng liên kết chịu trách nghiệm:
    - Framing- Đóng gói dữ liệu
    - Địa chỉ vật lý
    - Kiểm soát lưu lượng
    - Kiểm soát lỗi
3. Tầng mạng (Network)
   Tầng mạng chịu trách nghiệm chuyển gói dữ liệu từ nơi gửi đến nơi nhận , gói dữ liệu cso thể đi qua nhiều mạng.Tầng mạng có nghiệm vụ:
   - Định địa chỉ logic 
   - Định tuyến 
4. Tầng giao vận (Tranport)
   Chịu trách nghiệm chuyển toàn biị thồng điệp đến nôi nhận,tầng mạng chuyển gói dữ liệu diêng biệt từ nới gủi đến nơi nhận mà không quan tâm đến các quan hệ của các gói dữ liệu,tầng mạng xử lý gói giữ liệu một cách độc lập mà không quan tâm đến gói có cùng một thông điệp hay không.Nói một cách khác để đảm báo thông điệp đến nơi nhận mộ cách toàn vẹn tầng giao vận tạo ra kết nối logic giữa 2 cổng đầu cuối .Có 3 giai đoạn kêt nối:
    - Thiét lập kết nối
    - Truyền dữ liệu
    - Giaỉ phóng kết nối 
   Tầng giao vận chị trách nghiệm:
   - địa chỉ cổng (port number)
   - Phân mảnh và tái hợp nhất 
   - Kiểm soát kết nối
   - kiểm soát lưu lượng
   - kiểm soát lỗi 
5. Tầng phiên (sesion)
    Các dịch vụ của 3 tầng đầu ,chưa đue đẻ 2 tiến trình 2 thiết bị có thể chuyền thông .Tầng phiên đóng vai trò "Kiểm soát viên" hội thoại cảu mạng với nhiệm vụ thiết lập duy trì đòng bị hóa tín hiệu hai bên.Tầng mạng chịu trách nhiệm :
    - Kiểm soát hộp thoại
    - Đồng bộ hóa 
6. Tần trình diễn.
    Thực hiện biểu diễn cú pháp và ngữ nghxi thông tin đực trao đổi giữa hai hệ thống.Tầng trình diễn có nghiệm vụ:
    - phiên dịch
    - mã hóa
7. Tầng ứng dụng
    Tầng ứng dụng cho phép người dùng truy cập vào mạng bănngf cách giao diện người sử dụng hỗ chựo dịch vụ gửi thư điện tử trưy cập và chuyển file từ xa .quản lý CSDL dùng chung và một só dịch vụ khác về thông tin.Tâng ứng dụng cung cáo dịch vụ:
    - Thiết bị đầu cưới của mạng
    - quản lý truy ccập và chuyển file
    - các dịch vụ khác 

[III. Bộ giao thức TCP/IP](#Mohinhsoi)

1.
   là một bộ các giao thức trao đổi thông tin được sử dụng để kết nối các thiết bị mạng trên Internet. TCP/IP có thể được sử dụng như là một giao thức trao đổi thông tin trong một mạng riêng (intranet hoặc extranet).Bộ giao thức TCP/IP gồm 4 tầng :
   - Tầng Vật lý (physical)
   - Tầng mạng (Network)
   - Tầng giao vận (Tranport)
   - Tầng ứng dụng (Applycation)
- Tầng ứng dụng:
    Tầng ứng dụng cung cấp các ứng dụng với trao đổi dữ liệu được chuẩn hóa. Các giao thức của nó bao gồm Giao thức truyền tải siêu văn bản (HTTP), Giao thức truyền tập tin (File Transfer Protocol - FTP), Giao thức POP3, Giao thức truyền tải thư tín đơn giản (Simple Mail Transfer Protocol - SMTP) và Giao thức quản lý mạng đơn giản (Simple Network Management Protocol - SNMP)
- Tầng giao vận:
    Tầng giao vận chịu trách nhiệm duy trì liên lạc đầu cuối trên toàn mạng. TCP xử lý thông tin liên lạc giữa các máy chủ và cung cấp điều khiển luồng, ghép kênh và độ tin cậy. Các giao thức giao vận gồm giao thức TCP và giao thức UDP (User Datagram Protocol), đôi khi được sử dụng thay thế cho TCP với mục đích đặc biệt.
- Tầng mạng:
    Tầng mạng, còn được gọi là tầng Internet, có nhiệm vụ xử lý các gói và kết nối các mạng độc lập để vận chuyển các gói dữ liệu qua các ranh giới mạng. Các giao thức tầng mạng gồm IP và ICMP (Internet Control Message Protocol), được sử dụng để báo cáo lỗi.
- Tầng vật lý:
    Tầng vật lý bao gồm các giao thức chỉ hoạt động trên một liên kết - thành phần mạng kết nối các nút hoặc các máy chủ trong mạng. Các giao thức trong lớp này bao gồm Ethernet cho mạng cục bộ (LAN) và Giao thức phân giải địa chỉ (Address Resolution Protocol - ARP).
    





