## Tổng quan Syslog  
Mục lục  
[1. Mục đích của Syslog](#1)  
[2. Các yếu tố của giao thức Syslog](#2)  
    [2.1 Kiến trúc Syslog](#3)  
    [2.2 Định dạng tin nhắn Syslog](#4)

Syslog là một giao thức client/server dùng để xử lý các file log Linux. Các file log có thể được lưu tại chính máy Linux đó, hoặc có thể di chuyển và lưu tại 1 máy khác. 

Một số đặc điểm của Syslog cần lưu ý : 
- Syslog có thể gửi qua UDP hoặc TCP.  
- Các dữ liệu log được gửi dạng cleartext.  
- Syslog mặc định dùng cổng 514.  

**Syslog được dùng như thế nào?**
Syslog là một giao thức và được sử dụng bởi dịch vụ Rsyslog. Dịch vụ Rsyslog mới là người đưa ra các quyết định như sử dụng port nào để vận chuyển log, sau bao nhiêu lâu thì log sẽ được xoay vòng…  
Chúng ta cần làm rõ các khái niệm xoay quanh Syslog :  
- Syslog : Giao thức dùng để xử lý file log trong Linux.  
- Rsyslog : Dịch vụ sử dụng Syslog

<a name="1"></a>

### 1. Mục đích của Syslog  

`Syslog` được sử dụng như một tiêu chuẩn, chuyển tiếp và thu thập log được sử dụng trên một phiên bản Linux.  
Syslog xác định mức độ nghiêm trọng (**severity levels**) cũng như mức độ cơ sở (**facility levels**) giúp người dùng hiểu rõ hơn về nhật ký được sinh ra trên máy tính của họ. Log (nhật ký) có thể được phân tích và hiển thị trên các máy chủ được gọi là máy chủ Syslog.  
<a name="2"></a>

### 2. Các yếu tố của giao thức Syslog 

- `Defining an architecture` (xác định kiến ​​trúc) : Syslog là một giao thức, nó là một phần của kiến ​​trúc mạng hoàn chỉnh, với nhiều máy khách và máy chủ.  
- `Message format` (định dạng tin nhắn) : syslog xác định cách định dạng tin nhắn. Điều này rõ ràng cần phải được chuẩn hóa vì các bản ghi thường được phân tích cú pháp và lưu trữ vào các công cụ lưu trữ khác nhau. Do đó, chúng ta cần xác định những gì một máy khách syslog có thể tạo ra và những gì một máy chủ nhật ký hệ thống có thể nhận được.  
- `Specifying reliability` (chỉ định độ tin cậy) : syslog cần xác định cách xử lý các tin nhắn không thể gửi được. Là một phần của TCP/IP, syslog rõ ràng sẽ bị thay đổi trên giao thức mạng cơ bản (TCP hoặc UDP) để lựa chọn.  
- `Dealing with authentication or message authenticity` (xử lý xác thực hoặc xác thực thư): syslog cần một cách đáng tin cậy để đảm bảo rằng máy khách và máy chủ đang nói chuyện một cách an toàn và tin nhắn nhận được không bị thay đổi.  

<a name="3"></a>

**2.1 Kiến trúc Syslog**  

<img src="https://i.imgur.com/d9QEqqD.png">  

> Một máy Linux độc lập hoạt động như một máy chủ syslog của riêng mình. Nó tạo ra dữ liệu nhật ký, nó được thu thập bởi rsyslog và được lưu trữ ngay vào hệ thống tệp.  

- syslog client/device : là máy client sinh log.  
- relay : nơi chuyển tiếp, forward log đến server.  
- syslog server/collector : nơi tiếp nhận, lưu trữ log được gửi đến từ client

<img src="https://i.imgur.com/ZcgQNST.png">  

<img src="https://i.imgur.com/evtJeia.png">

<img src="https://i.imgur.com/5qhZYta.png"> 

<img src="https://i.imgur.com/AcNxJ6L.png">
<a name="4"></a>

**2.2 Định dạng tin nhắn Syslog**

*Syslog facility levels* (cấp độ cơ sở) 
- Một mức độ cơ sở được sử dụng để xác định chương trình hoặc một phần của hệ thống tạo ra các bản ghi.  
- Theo mặc định, một số phần trong hệ thống của bạn được cung cấp các mức facility như kernel sử dụng kern facility hoặc hệ thống mail của bạn bằng cách sử dụng mail facility.  
- Nếu một bên thứ ba muốn phát hành log, có thể đó sẽ là một tập hợp các cấp độ facility được bảo lưu từ 16 đến 23 được gọi là “local use” facility levels.  
- Ngoài ra, họ có thể sử dụng tiện ích của người dùng cấp độ người dùng (“user-level” facility), nghĩa là họ sẽ đưa ra các log liên quan đến người dùng đã ban hành các lệnh.  

Các nguồn tạo ra log:  

<img src="https://i.imgur.com/MODl0RR.png">  

*Syslog serverity levels* (Mức độ cảnh báo)  
- Mức độ cảnh báo của Syslog được sử dụng để thông báo mức độ nghiêm trọng của log event và chúng bao gồm từ gỡ lỗi (debug), thông báo thông tin (informational messages) đến mức khẩn cấp (emergency levels).  
- Tương tự như cấp độ cơ sở Syslog, mức độ cảnh báo được chia thành các loại số từ 0 đến 7, 0 là cấp độ khẩn cấp quan trọng nhất

<img src="https://i.imgur.com/NxeXsao.png">  

Tin nhắn trong Syslog có định dạng chung như sau (độ dài gói tin không được vượt quá 1024 bytes):  

<img src="https://i.imgur.com/x58ALKj.png">  

- *PRI*  

Phần PRI (hay Priority) là một số được đặt trong ngoặc nhọn, thể hiện cơ sở sinh ra log hoặc mức độ nghiêm trọng, là một số gồm 8 bit:  
    - 3 bit đầu tiên thể hiện cho tính nghiêm trọng của thông báo.  
    - 5 bit còn lại đại diện cho sơ sở sinh ra thông báo.  
Giá trị PRI được tính bằng công thức:  
> PRI = Cấp độ cơ sở x 8 + Mức độ nghiêm trọng  

Ví dụ:  
thông báo từ kernel (Facility = 0) với mức độ nghiêm trọng (Severity =0) thì giá trị Priority = 0x8 +0 = 0.   
Trường hợp khác, với "local use 4" (Facility =20) mức độ nghiêm trọng (Severity =5) thì số Priority là 20 x 8 + 5 = 165.  

Vậy biết một số Priority thì làm thế nào để biết nguồn sinh log và mức độ nghiêm trọng của nó. Ta xét 1 ví dụ sau:
 
Priority = 191 Lấy 191:8 = 23.875 -> Facility = 23 ("local 7") -> Severity = 191 - (23 * 8 ) = 7 (debug)  

- *HEADER*  

Phần HEADER thì gồm các phần chính sau:  
    - Time stamp - Thời gian mà thông báo được tạo ra. Thời gian này được lấy từ thời gian hệ thống ( Chú ý nếu như thời gian của server và thời gian của client khác nhau thì thông báo ghi trên log được gửi lên server là thời gian của máy client)  
    - Hostname hoặc IP
- *MSG*  

Phần Message hay MSG chứa một số thông tin về quá trình tạo ra thông điệp đó. Gồm 2 phần chính:  
    - Tag field  
    - Content field  

Tag field là tên chương trình tạo ra thông báo.  
Content field chứa các chi tiết của thông báo

