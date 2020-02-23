### Tìm hiểu phương thức GET và POST của giao thức HTTP.  
Mục lục  


###  1. HTTP là gì?  
`Http` (HyperText Transfer Protocol) là giao thức truyền tải siêu văn bản được sử dụng trong www dùng để truyền tải dữ liệu giữa Web server đến các trình duyệt Web và ngược lại. Giao thức này sử dụng cổng 80 (port 80) là chủ yếu.  
Hay bạn có thể hiểu khi bạn gõ 1 địa chỉ vào trình duyệt Web, lúc này trình duyệt Web sẽ gửi 1 yêu cầu qua giao thức Http đến Web server. Web server sẽ nhận yêu cầu này và trả lại kết quả cho trình duyệt Web.  
Http làm việc dựa trên giao thức yêu cầu – phản hồi giữa máy client và server.  
Ví dụ: Một máy khách (trình duyệt) gửi yêu cầu HTTP tới server; sau đó server hồi đáp lại yêu cầu của máy khách. Việc hồi đáp này bao gồm thông tin trạng thái về yêu cầu và có thể còn bao gồm cả nội dung đã yêu cầu.  

### 2. GET và POST  
Có hai phương thức thường được sử dụng để yêu cầu và hồi đáp giữa máy client và server là: `GET` và `POST`.  
**2.1 GET**  
Phương thức GET có những đặc trưng sau:  
- Câu truy vấn của GET sẽ được đính kèm ngay vào url của HTTP Request.  
- GET Request có thể được cached (lưu trữ), bookmark (đánh dấu) và lưu trong lịch sử của trình duyệt.
- GET Request bị giới hạn về chiều dài, vì chiều dài của URL có giới hạn.
- GET Request không nên dùng với dữ liệu quan trọng, chỉ dùng để nhận dữ liệu.  

<img src="https://i.imgur.com/QhriGCf.png">  


**2.2 POST**  
Đặc trưng của POST:  
- Câu truy vấn của POST sẽ được gửi trong phần message body của HTTP Request.  
- POST không thể cached, bookmark hay lưu trong lịch sử của trình duyệt.  
- POST không bị giới hạn về độ dài.  
