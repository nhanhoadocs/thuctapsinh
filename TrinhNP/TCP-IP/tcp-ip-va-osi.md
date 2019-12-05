
# TÌM HIỂU VỀ TCP-IP 
### TỔNG QUAN VỀ TCP-IP
- TCP/IP hoặc **Transmission Control Protocol/Internet Protocol** (Giao thức điều khiển truyền vận/giao thức mạng) là một bộ các giao thức trao đổi thông tin được sử dụng để kết nối các thiết bị mạng trên Internet. TCP/IP có thể được sử dụng như là một giao thức trao đổi thông tin trong một mạng riêng (intranet hoặc extranet).
- Toàn bộ bộ giao thức Internet - một tập hợp các quy tắc và thủ tục - thường được gọi là TCP/IP, mặc dù trong bộ cũng có các giao thức khác. này còn đư
- TCP/IP chỉ định cách dữ liệu được trao đổi qua Internet bằng cách cung cấp thông tin trao đổi đầu cuối nhằm mục đích xác định cách thức nó được chia thành các gói, được gắn địa chỉ, vận chuyển, định tuyến và nhận ở điểm đến. TCP/IP không yêu cầu quản lý nhiều và nó được thiết kế để khiến mạng đáng tin cậy hơn với khả năng phục hồi tự động. 
- Có hai giao thức mạng chính trong bộ giao thức mạng phục vụ các chức năng cụ thể. TCP xác định cách các ứng dụng tạo kênh giao tiếp trong mạng. Ngoài ra, nó cũng quản lý cách các tin được phân thành các gói nhỏ trước khi được chuyển qua Internet và được tập hợp lại theo đúng thứ tự tại địa chỉ đến.
- IP xác định cách gán địa chỉ và định tuyến từng gói để đảm bảo nó đến đúng nơi. Mỗi gateway trên mạng kiểm tra địa chỉ IP này để xác định nơi chuyển tiếp tin nhắn.

### CÁCH THỨC HOẠT ĐỘNG CỦA TCP-IP
- TCP/IP sử dụng mô hình giao tiếp máy khách/máy chủ, trong đó người dùng hoặc thiết bị (máy khách) được một máy tính khác (máy chủ) cung cấp một dịch vụ (giống như gửi một trang web) trong mạng.
- Nói chung, bộ giao thức TCP/IP được phân loại là không có trạng thái, có nghĩa là mỗi yêu cầu của máy khách được xem là mới bởi vì nó không liên quan đến yêu cầu trước. Việc không có trạng thái này giúp giải phóng đường mạng, do đó chúng có thể được sử dụng liên tục.
- Tuy nhiên, tầng vận chuyển lại có trạng thái. Nó truyền một tin nhắn duy nhất và kết nối của nó vẫn giữ nguyên cho đến khi nhận được tất cả các gói trong tin nhắn và tập trung tại điểm đến.

### SO SÁNH MÔ HÌNH TCP-IP VÀ OSI 

![sosanh](https://st.quantrimang.com/photos/image/2018/08/30/giao-thuc-tcp-ip-1.jpg)

### CÁC TẦNG CỦA TCP-IP 
TCP/IP được chia thành bốn tầng, mỗi tầng bao gồm các giao thức cụ thể.
- **Tầng ứng dụng** cung cấp các ứng dụng với trao đổi dữ liệu được chuẩn hóa. Các giao thức của nó bao gồm Giao thức truyền tải siêu văn bản (HTTP), Giao thức truyền tập tin (File Transfer Protocol - FTP), Giao thức POP3, Giao thức truyền tải thư tín đơn giản (Simple Mail Transfer Protocol - SMTP) và Giao thức quản lý mạng đơn giản (Simple Network Management Protocol - SNMP).
- **Tầng giao vận** chịu trách nhiệm duy trì liên lạc đầu cuối trên toàn mạng. TCP xử lý thông tin liên lạc giữa các máy chủ và cung cấp điều khiển luồng, ghép kênh và độ tin cậy. Các giao thức giao vận gồm giao thức TCP và giao thức UDP (User Datagram Protocol), đôi khi được sử dụng thay thế cho TCP với mục đích đặc biệt.
- **Tầng mạng,** còn được gọi là tầng Internet, có nhiệm vụ xử lý các gói và kết nối các mạng độc lập để vận chuyển các gói dữ liệu qua các ranh giới mạng. Các giao thức tầng mạng gồm IP và ICMP (Internet Control Message Protocol), được sử dụng để báo cáo lỗi. 
- **Tầng vật lý** bao gồm các giao thức chỉ hoạt động trên một liên kết - thành phần mạng kết nối các nút hoặc các máy chủ trong mạng. Các giao thức trong lớp này bao gồm Ethernet cho mạng cục bộ (LAN) và Giao thức phân giải địa chỉ (Address Resolution Protocol - ARP).
