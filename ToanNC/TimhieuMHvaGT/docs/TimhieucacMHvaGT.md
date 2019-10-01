# **Các Mô Hình Mạng và Các Giao Thức**
## **Mục Lục**
- **1.Mô hình OSI**
- **2.Mô hình TCP/IP**
- **3.So sánh OSI và TCP/IP**
- **4.So sánh giao thức UDP và TCP**
- **5.HTTP,FTP,DHCP,DNS,Telnet**
### **1.Mô hình OSI**
- **Mô Hình OSI**:là một thiết kế dựa vào nguyên lý tầng cấp, lý giải một cách trừu tượng kỹ thuật kết nối truyền thông giữa các máy vi tính và thiết kế giao thức mạng giữa chúng. Mô hình này được phát triển thành một phần trong kế hoạch Kết nối các hệ thống mở (Open Systems Interconnection) do ISO và IUT-T khởi xướng. Nó còn được gọi là Mô hình bảy tầng của OSI.
- **Mô Hình OSI** phân chia chức năng của một giao thức thành mỗi chuỗi các tầng cấp . mỗi tầng cấp có đặc điểm nó chỉ sử dụng chức năng tầng dưới nó và cho phép tâng trên dùng chức năng của chính mình
![ảnh minh hoạ](https://imgur.com/laMSAkn.png)
  - Cụ thể các tầng trong mô hình OSI(7 tầng) điểm từ trên xuống:
![ảnh minh hoạ](https://imgur.com/5N6CIBH.png)
- [link tham khảo về OSI](https://vi.wikipedia.org/wiki/M%C3%B4_h%C3%ACnh_OSI)
### **2.Mô hình TCP/IP**
- **Bô giao thức TCP/IP**:là một bộ các giao thức truyền thông cài đặt chồng giao thức mà Internet và hầu hết các mạng máy tính thương mại đang chạy trên đó. Bộ giao thức này được đặt tên theo hai giao thức chính của nó là TCP (Giao thức Điều khiển Giao vận) và IP (Giao thức Liên mạng). Chúng cũng là hai giao thức đầu tiên được định nghĩa.
- **Bộ giao thức TCP/IP** có thể được coi là một tập hợp các tầng, mỗi tầng giải quyết một tập các vấn đề có liên quan đến việc truyền dữ liệu, và cung cấp cho các giao thức tầng cấp trên một dịch vụ được định nghĩa rõ ràng dựa trên việc sử dụng các dịch vụ của các tầng thấp hơn. Về mặt lôgic, các tầng trên gần với người dùng hơn và làm việc với dữ liệu trừu tượng hơn, chúng dựa vào các giao thức tầng cấp dưới để biến đổi dữ liệu thành các dạng mà cuối cùng có thể được truyền đi một cách vật lý.
![ảnh minh hoạ](https://imgur.com/q6WbpoT.png)
  - Cụ thể các tầng trong mô hình TCP/IP(4 tầng):
    - Tầng Ứng dụng:là nơi các chương trình mạng thường dùng làm việc nhất nhằm liên lạc giữa các nút trong một mạng.
    - Tầng giao vận:là kết hợp các khả năng truyền thông điệp trực tiếp (end-to-end) không phụ thuộc vào mạng bên dưới, kèm theo kiểm soát lỗi (error control), phân mảnh (fragmentation) và điều khiển lưu lượng.
    - Tầng mạng:giải quyết các vấn đề dẫn các gói tin qua một mạng đơn.
    - Tầng vật lý:phương pháp được sử dụng để chuyển các gói tin từ tầng mạng tới các máy chủ (host) khác nhau - không hẳn là một phần của bộ giao thức TCP/IP, vì giao thức IP có thể chạy trên nhiều tầng liên kết khác nhau. Các quá trình truyền các gói tin trên một liên kết cho trước và nhận các gói tin từ một liên kết cho trước có thể được điều khiển cả trong phần mềm điều vận thiết bị (device driver) dành cho cạc mạng, cũng như trong phần sụn (firmware) hay các chipset chuyên dụng. Những thứ đó sẽ thực hiện các chức năng liên kết dữ liệu chẳng hạn như bổ sung một tín đầu (packet header) để chuẩn bị cho việc truyền gói tin đó, rồi thực sự truyền frame dữ liệu qua một môi trường vật lý.
![ảnh minh hoạ](https://imgur.com/UfjOXvz.png)
- [link tham khảo TCP/IP 1](https://vi.wikipedia.org/w/index.php?title=TCP/IP&rdfrom=TCP%2Fip)
- [link tham khảo TCP/IP 2](http://tuvancongnghe.net/kien-thuc-mang-may-tinh-co-ban-phan-1-tong-quan-ve-mang-may-tinh/)
### **3.So sánh OSI và TCP/IP**
- Khi nói đến độ tin cậy chung, TCP/IP được coi là một lựa chọn đáng tin cậy hơn so với mô hình OSI. Trong hầu hết các trường hợp, mô hình OSI được gọi là công cụ tham khảo, là mô hình cũ. OSI cũng được biết đến với giao thức và ranh giới chặt chẽ. TCP/IP cho phép “nới lỏng” các quy tắc, cung cấp các nguyên tắc chung được đáp ứng.
- Về phương pháp tiếp cận mà cả hai thực hiện, TCP/IP thực hiện cách tiếp cận theo chiều ngang còn mô hình OSI thực hiện cách tiếp cận theo chiều dọc.
- Một điểm quan trọng cần lưu ý rằng TCP/IP kết hợp tầng phiên và tầng trình diễn trong tầng ứng dụng. Dường như OSI có một cách tiếp cận khác nhau, có các tầng khác nhau và mỗi tầng chỉ thực hiện một chức năng riêng.
- Trong TCP/IP, các giao thức được thiết kế đầu tiên và sau đó mô hình được phát triển. Trong OSI, việc phát triển mô hình xảy ra trước và sau đó là phát triển giao thức
- Khi nói đến truyền thông, TCP/IP chỉ hỗ trợ truyền thông không kết nối phát ra từ tầng mạng. Ngược lại dường như OSI làm điều này khá tốt, hỗ trợ cả kết nối không dây và kết nối theo định tuyến trong tầng mạng.
- TCP/IP phụ thuộc vào giao thức, OSI là giao thức độc lập.
- [link tham khảo](https://thuthuat.taimienphi.vn/su-khac-nhau-giua-osi-va-tcp-ip-model-23749n.aspx)
![ảnh minh hoạ](https://imgur.com/k2wgvE2.png)
### **4.So sánh giao thức UDP và TCP**
- **UDP (User Datagram Protocol)**: là giao thức theo phương thức không liên kết được sử dụng thay thế cho TCP ở trên IP theo yêu cầu của từng ứng dụng. Khác với TCP, UDP không có các chức năng thiết lập và kết thúc liên kết. Tương tự như IP, nó cũng không cung cấp cơ chế báo nhận (acknowledgment), không sắp xếp tuần tự các gói tin (datagram) đến và có thể dẫn đến tình trạng mất hoặc trùng dữ liệu mà không có cơ chế thông báo lỗi cho người gửi. Qua đó ta thấy UDP cung cấp các dịch vụ vận chuyển không tin cậy như trong TCP.
![ảnh minh hoạ](https://imgur.com/f0W26MO.png)
- UDP cũng cung cấp cơ chế gán và quản lý các số hiệu cổng (port number) để định danh duy nhất cho các ứng dụng chạy trên một trạm của mạng. Do ít chức năng phức tạp nên UDP thường có xu thế hoạt động nhanh hơn so với TCP. Nó thường được dùng cho các ứng không đòi hỏi độ tin cậy cao trong giao vận.
  - Ví dụ, giả sử bạn đang xem hình ảnh video trực tiếp. Live Stream phát sóng thường sử dụng UDP thay vì TCP. Các máy chủ chỉ cần gửi một dòng của các gói tin UDP để máy tính xem. Nếu bạn bị mất kết nối trong vài giây, video sẽ đóng băng cho một thời điểm và sau đó chuyển đến các bit hiện tại của truyền hình, bỏ qua các bit bạn đã bị bỏ qua. Video hoặc âm thanh có thể bị bóp méo một lúc và video tiếp tục chơi mà không có dữ liệu bị mất.
- Các thuật ngữ trong UDP
  -**Packet**: trong truyền số liệu một packet là các số nhị phân , biểu diễn dữ liệu cà các tín hiệu điều khiển
  -**Datagram**: là một gói tin đọc lập, tự chứa và mang đầy dữ liệu định tuyến 
  -**MTU(Maximum Transmission Unit): mô tả số byte có thể truyền trong một gói tin
  -**Port**: các cổng để ánh xạ tiến trình cụ thể đang chạy trên máy tính
  -**Time to Live**:cho phép chúng ta thiết lập một giới hạn trên các router mà một datagram có thể đi qua
- Các cổng của giao thức UDP
![ảnh minh hoa](https://imgur.com/5ibC4mf.png)
- [link tham khảo](http://www.mystown.com/2016/10/udp-la-gi-su-khac-nhau-giua-giao-thuc.html)
- **TCP (Transmission Control Protocol)**:là một trong các giao thức cốt lõi của bộ giao thức TCP/IP. Sử dụng TCP, các ứng dụng trên các máy chủ được nối mạng có thể tạo các "kết nối" với nhau, mà qua đó chúng có thể trao đổi dữ liệu hoặc các gói tin. Giao thức này đảm bảo chuyển giao dữ liệu tới nơi nhận một cách đáng tin cậy và đúng thứ tự. TCP còn phân biệt giữa dữ liệu của nhiều ứng dụng (chẳng hạn, dịch vụ Web và dịch vụ thư điện tử) đồng thời chạy trên cùng một máy chủ.
- Cấu trúc gói tin TCP
![ảnh minh hoạ](https://imgur.com/iivM0xF.png)
  - Source port :Số hiệu của cổng tại máy tính gửi.
  - Destination port:Số hiệu của cổng tại máy tính nhận.
  - Sequence number:Trường này có 2 nhiệm vụ. Nếu cờ SYN bật thì nó là số thứ tự gói ban đầu và byte đầu tiên được gửi có số thứ tự này cộng thêm 1. Nếu không có cờ SYN thì đây là số thứ tự của byte đầu tiên.     
  - Acknowledgement number:Nếu cờ ACK bật thì giá trị của trường chính là số thứ tự gói tin tiếp theo mà bên nhận cần.
  - Data offset:Trường có độ dài 4 bít quy định độ dài của phần header (tính theo đơn vị từ 32 bít). Phần header có độ dài tối thiểu là 5 từ (160 bit) và tối đa là 15 từ (480 bít)
  - Reserved: Dành cho tương lai và có giá trị là 0.
  - Flags (hay Control bits):Bao gồm 6 cờ:
     - URG:Cờ cho trường Urgent pointer
     - ACK:Cờ cho trường Acknowledgement
     - PSH:Hàm Push
     - RST:Thiết lập lại đường truyền
     - SYN:Đồng bộ lại số thứ tự
     - FIN:Không gửi thêm số liệu
  - Window:Số byte có thể nhận bắt đầu từ giá trị của trường báo nhận (ACK)
  - Checksum: 16 bít kiểm tra cho cả phần header và dữ liệu
  - Urgent pointer:Nếu cờ URG bật thì giá trị trường này chính là số từ 16 bít mà số thứ tự gói tin (sequence number) cần dịch trái.
  - Options:Đây là trường tùy chọn. Nếu có thì độ dài là bội số của 32 bít.
- So sánh giữa **UDP** và **TCP/IP**
  - Giống nhau:đều là các giao thức mạng TCP/IP, đều có chức năng kết nối các máy lại với nhau, và có thể gửi dữ liệu cho nhau
  - Khác nhau:các header của TCP và UDP khác nhau ở kích thước (20 và 8 byte) nguyên nhân chủ yếu là do TCP phải hộ trợ nhiều chức năng hữu ích hơn(như khả năng khôi phục lỗi). UDP dùng ít byte hơn cho phần header và yêu cầu xử lý từ host ít hơn
![ảnh minh hoạ](https://imgur.com/v37F0Lg.png)
### **5.HTTP,FTP,DHCP,DNS,Telnet**
- **HTTP(HyperText Transfer Protocol)**: là giao thức truyền tải siêu văn bản được sử dụng trong www dùng để truyền tải dữ liệu giữa Web server đến các trình duyệt Web và ngược lại. Giao thức này sử dụng cổng 80 (port 80) là chủ yếu.
![ảnh minh hoạ](https://imgur.com/7dRylQ2.png)
  - [link tham khảo thêm](https://www.digistar.vn/http-la-gi-tim-hieu-ve-giao-thuc-http-va-https/)
- **FTP(File Transfer Protocol)**: thường được dùng để trao đổi tập tin qua mạng lưới truyền thông dùng giao thức TCP/IP (chẳng hạn như Internet - mạng ngoại bộ - hoặc Intranet - mạng nội bộ). Hoạt động của FTP cần có hai máy tính, một máy chủ và một máy khách). Máy chủ FTP, dùng chạy phần mềm cung cấp dịch vụ FTP, gọi là trình chủ, lắng nghe yêu cầu về dịch vụ của các máy tính khác trên mạng lưới. Máy khách chạy phần mềm FTP dành cho người sử dụng dịch vụ, gọi là trình khách, thì khởi đầu một liên kết với máy chủ. Một khi hai máy đã liên kết với nhau, máy khách có thể xử lý một số thao tác về tập tin, như tải tập tin lên máy chủ, tải tập tin từ máy chủ xuống máy của mình, đổi tên của tập tin, hoặc xóa tập tin ở máy chủ v.v

![ảnh minh hoạ](https://imgur.com/IsE3bc4.png)
  - [link tham khảo thêm](https://vi.wikipedia.org/wiki/FTP)
- **DHCP(Dynamic Host Configuration Protocol)**:có nhiệm vụ giúp quản lý nhanh, tự động và tập trung việc phân phối địa chỉ IP bên trong một mạng. Ngoài ra DHCP còn giúp đưa thông tin đến các thiết bị hợp lý hơn cũng như việc cấu hình subnet mask hay cổng mặc định.
![ảnh minh hoạ](https://imgur.com/8cP3ElQ.png)
  - [link tham khảo thêm](https://www.totolink.vn/article/111-dhcp-la-gi-tim-hieu-ve-dhcp.html)
- **DNS(Domain Name System)**:là Hệ thống phân giải tên được phát minh vào năm 1984 cho Internet, chỉ một hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền. Hệ thống tên miền (DNS) là một hệ thống đặt tên theo thứ tự cho máy vi tính, dịch vụ, hoặc bất kỳ nguồn lực tham gia vào Internet. Nó liên kết nhiều thông tin đa dạng với tên miền được gán cho những người tham gia. Quan trọng nhất là, nó chuyển tên miền có ý nghĩa cho con người vào số định danh (nhị phân), liên kết với các trang thiết bị mạng cho các mục đích định vị và địa chỉ hóa các thiết bị khắp thế giới.

![ảnh minh hoạ](https://imgur.com/5s7m8Ap.png)
  - [link tham khảo thêm](https://manage.hostvn.net/knowledgebase/68/DNS-la-gi-.html)
- **Telnet(ErminaL NETwork)**:là một giao thức mạng (network protocol) được dùng trên các kết nối với Internet hoặc các kết nối tại mạng máy tính cục bộ LAN

![ảnh minh hoạ](https://imgur.com/qIgqTzV.png)
  - [link tham khảo thêm](https://vi.wikipedia.org/wiki/Telnet)