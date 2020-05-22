### Tìm hiểu về iSCSI 
Mục lục  
1. [iSCSI là gì?](#1)
2. [Các thành phần của iSCSI](#2)  
3. [Cách thức hoạt động của iSCSI](#3)  


<a name= "1"></a>
**1. iSCSI là gì**

`iSCSI` - internet Small Computer System Interface được xem là một giao thức hoạt động ở tầng Transport nhằm mục đích vận chuyển các SCSI thông qua mạng IP bằng giao thức TCP/IP.  Từ đó iSCSI cho phép truy cập các khối dữ liệu trên hệ thống lưu trữ SAN (Storage Area Network) qua các lệnh SCSI và truyền tải dữ liệu qua hệ thống mạng network (LAN/WAN).  
`iSCSI` hoạt động trên mô hình Client-Server. Ta có thể tưởng tượng thay vì ta đem 1 disk cắm trực tiếp vào 1 máy để chạy và khi cần di chuyển thì ta tháo ra và mang đến máy khác cắm vào. Làm như thế rất bất tiện. Với iSCSI thì ta không cần mất công như vậy mà vẫn có thể đáp ứng được điều đó. Ta vẫn có thể làm việc với disk trên server như các disk đó đang thực sự đang nằm trên máy của mình.  

<a name="2"></a>
**2. Các thành phần của iSCSI**  

iSCSI bao gồm 2 thành phần chính là `iSCSI Initiator` và `iSCSI Target`.  

<img src="https://i.imgur.com/X9RSMIc.png">

- `iSCSI Initiator` (iSCSI Initiator Node) là thiết bị client trong kiến trúc hệ thống lưu trữ qua mạng. `iSCSI Initiator` sẽ kết nối máy chủ iSCSI Target và truyền tải các lệnh SCSI thông qua đường truyền mạng TCP/IP. `iSCSI Initiator` có thể được khởi chạy từ chương trình phần mềm trên OS hoặc phần cứng thiết bị hỗ trợ iSCSI. 

Các iSCSI initiator dựa trên phần mềm là một trong số các lựa chọn ít chí phí nhất và thường được kèm sẵn trong hệ điều hành.

Host-based Adapter (HBA) là một thiết bị phần cứng. HBA đắt hơn phần mềm, nhưng hiệu suất của nó cao hơn với nhiều chức năng hơn. Một phần cứng thay thế cho thiết bị HBA đầy đủ là card iSOE với công cụ giảm tải cho iSCSI. Thiết bị này giảm tải các hoạt động của initiator khỏi bộ xử lý chính của máy chủ, giúp giải phóng các chu kỳ CPU trên các máy chủ lưu trữ.

- `iSCSI Target`: Server iSCSI Target thường sẽ là một máy chủ lưu trữ (storage) có thể là hệ thống NAS (Network Attached Storage - thiết bị lưu trữ gắn vào mạng). Từ máy chủ `iSCSI Target` sẽ tiếp nhận các request gửi từ `iSCSI Initiator` gửi đến và gửi trả dữ liệu trở về. Trên iSCSI Target sẽ quản lý các ổ đĩa iSCSI với các tên gọi LUN (Logical Unit Number) được dùng để chia sẻ ổ đĩa lưu trữ iSCSI với phía iSCSI client.  

*Kết luận*: Máy chủ nào chia sẻ vùng lưu trữ (storage) thì được gọi là iSCSI Target. Còn các máy tính yêu cầu sử dụng vùng lưu trữ (storage) thì được gọi là các iSCSI Initiator. 

<a name="3"></a>
**3. Cách thức hoạt động của iSCSI** 

<img src="https://i.imgur.com/4MqkVwo.png">  

- Máy tính client sẽ khởi tạo request yêu cầu truy xuất dữ liệu trong hệ thống lưu trữ (storage) của máy chủ iSCSI Target.  
- Lúc này hệ thống iSCSI Initiator sẽ tạo ra một số lệnh SCSI tương ứng với yêu cầu của client.  
- Các lệnh SCSI và thông tin liên quan sẽ được đóng gói trong gói tin iSCSI PDU (Protocol Data Unit).  
Thông tin PDU được sử dụng cho kết nối giữa Initiator và Target nhằm xác định node, kết nối, thiết lập session, truyền tải lệnh SCSI và truyền tải dữ liệu.  
- Sau đó PDU được đóng gói trong mô hình TCP/IP và truyền tải qua network đến máy chủ iSCSI Target.

<img src="https://i.imgur.com/fiD2MyE.png">  
- Máy chủ iSCSI Target nhận được gói tin và tiến hành mở gói tin ra kiểm tra phần iSCSI PDU nhằm trích xuất các thông tin lệnh SCSI cùng các thông tin liên quan.  
- Sau đó lệnh SCSI sẽ được đưa vào SCSI Controller để được thực thi và xử lý theo yêu cầu. Đến cuối cùng iSCSI Target sẽ gửi trả thông tin iSCSI reponse. Từ đó cho phép block data được truyền tải giữa Target và Initiator.  

<img src="https://i.imgur.com/CqMWGb9.png">

**4. Lợi ích của iSCSI đối với hệ thống lưu trữ SAN**  
  
