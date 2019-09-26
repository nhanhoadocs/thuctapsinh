# So sánh giao thức UDP và TCP

  ![](https://imgur.com/0GpEg01.png)

### UDP (User Datagram Protocol) 

 UDP là một trong những giao thức cốt lõi của giao thức TCP/IP. Dùng UDP, chương trình trên mạng máy tính có thể gởi những dữ liệu ngắn được gọi là datagram tới máy khác. UDP không cung cấp sự tin cậy và thứ tự truyền nhận mà TCP làm; các gói dữ liệu có thể đến không đúng thứ tự hoặc bị mất mà không có thông báo.Tuy nhiên UDP nhanh và hiệu quả hơn đối với các mục tiêu như kích thước nhỏ và yêu cầu khắt khe về thời gian. Do bản chất không trạng thái của nó nên nó hữu dụng đối với việc trả lời các truy vấn nhỏ với số lượng lớn người yêu cầu.

### TCP (Transmission Control Protocol - Giao thức điều khiển vận chuyển) 

TCP là một trong các giao thức cốt lõi của bộ giao thức TCP/IP. Sử dụng TCP, các ứng dụng trên các máy chủ được nối mạng có thể tạo các “kết nối” với nhau, mà qua đó chúng có thể trao đổi dữ liệu hoặc các gói tin. Giao thức này đảm bảo chuyển giao dữ liệu tới nơi nhận một cách đáng tin cậy và đúng thứ tự. TCP còn phân biệt giữa dữ liệu của nhiều ứng dụng (chẳng hạn, dịch vụ Web và dịch vụ thư điện tử) đồng thời chạy trên cùng một máy chủ.

### So sánh giao thức UDP và TCP

 Giống nhau: đều là các giao thức mạng TCP/IP, đều có chức năng kết nối các máy lại với nhau, và có thể gửi dữ liệu cho nhau.

 Khác nhau:

  - **Giao thức TCP**: 

    + Header có kích thức 20 byte do TCP hỗ trợ nhiều tính năng hữu ích hơn 

    + TCP dùng cho mạng WAN

    + Không cho phép mất gói tin và đảm bảo việc truyền dữ liệu thông qua [quy trình bắt tay ba bước](https://sites.google.com/site/fullcrackcoder/quy-trinh-bat-tay-3-buoc-three-way---handshake-trong-tang-transport) 

    + Tốc độ truyền nhỏ hơn UDP 

  - **Giao thức UDP**:
   
    + Header có kích thước 8 byte do xử lí từ host ít hơn 

    + Dùng cho mạng LAN

    + Cho phép mất mát dữ liệu và không đảm bảo viêc truyền dữ liệu 

    + Tốc độ truyền cao, [VoIP](https://vi.wikipedia.org/wiki/VoIP)  truyền tốt qua UDP 

**Ngoài ra**
 
  + UDP có độ trễ nhỏ, do không có giai đoạn thiết lập đường truyền.

  + UDP đơn giản: phía gửi và phía nhận không phải ghi nhớ trạng thái gửi/nhận.

  + Gói tin nhỏ

  + Không có cơ chế kiểm soát tắc nghẽn, do đó bên gửi có thể gửi dữ liệu với tốc độ tối đa
