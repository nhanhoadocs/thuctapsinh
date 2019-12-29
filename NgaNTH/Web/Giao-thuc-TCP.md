## Tìm hiểu giao thức TCP  
### 1. TCP là gì?  
`TCP` (*Transmission Control Protocol*) - Giao thức điều khiển truyền vận thuộc bộ giao thức cốt lõi của TCP/IP. TCP hoạt động ở lớp 4 (lớp Transport) trong mô hình OSI. Thông qua TCP, các máy chủ có nối mạng có thể liên lạc được với nhau, nhờ đó có thể trao đổi dữ liệu hoặc các gói tin cho nhau.   
Giao thức TCP đảm bảo việc truyền dữ liệu đáng tin cậy và đúng thứ tự thông qua nhiều cơ chế. Hơn nữa TCP có chức năng phân biệt dữ liệu của nhiều ứng dụng (như của dịch vụ Web và dịch vụ Email) đồng thời chạy trên cùng một máy chủ.  
- TCP là giao thức hướng kết nối (connection-oriented), có nghĩa là buộc phải thiết lập kết nối trước sau đó mới đến tiến trình truyền dữ liệu.  
- Cung cấp cơ chế đánh số thứ tự gói tin (sequencing): sử dụng để ráp các gói tin chính xác ở điểm nhận, loại bỏ gói tin trùng lặp.  
- TCP có khả năng truyền và nhận dữ liệu cùng một lúc — song công (full-duplex).  
- Cơ chế báo nhận (Acknowledgement): tức là khi A gửi gói tin cho B, nếu B nhận được thì sẽ gửi thông báo cho A, trường hợp A không nhận được thông báo thì sẽ gửi lại gói tin tới khi nào B báo nhận thì thôi.  
- Tính năng phục hồi dữ liệu bị mất trên đường truyền.  

