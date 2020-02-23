# Tìm hiểu các thành phần trong Graylog  

## Stream  
 Graylog Stream (luồng) là một cơ chế để định tuyến các message thành các danh mục trong thời gian thực trong khi chúng được xử lý. 

`Stream `là một tính năng cốt lõi của Graylog và có thể được coi là một hình thức gắn thẻ cho các tin nhắn đến. `Stream ` là một cơ chế được sử dụng để định tuyến tin nhắn thành các danh mục trong thời gian thực. Quy tắc truyền phát hướng dẫn Graylog thông báo nào định tuyến vào luồng nào.

`Stream ` có nhiều công dụng. Đầu tiên, chúng được sử dụng để định tuyến dữ liệu để lưu trữ vào một chỉ mục. Chúng cũng được sử dụng để kiểm soát truy cập dữ liệu, định tuyến tin nhắn để phân tích cú pháp, làm giàu hoặc sửa đổi khác và xác định tin nhắn nào sẽ được lưu trữ.

Các `Stream ` có thể được sử dụng cùng với Cảnh báo để thông báo cho người dùng hoặc trả lời khác khi tin nhắn đáp ứng một tập hợp các điều kiện.   

Ta có thể tạo các Streams riêng để lọc những log riêng biệt. Ví dụ tạo `SSH Stream` để nhận log đăng nhập. Khi có hoạt động đăng nhập nào fail thì ta sẽ theo dõi được dễ dàng hơn. Xem thêm bài viết tạo `SSH Stream` tại [đây](https://github.com/ngahong/Thuc-tap-Nhan-Hoa/blob/master/Linux/Log/Sidecar/SSH-streams.md)

## Search  
`Graylog Search` là giao diện được sử dụng để tìm kiếm nhật ký trực tiếp. Graylog sử dụng cú pháp đơn giản hóa, rất giống với Lucene. Phạm vi thời gian tương đối hoặc tuyệt đối có thể được cấu hình từ menu thả xuống.   
Các tìm kiếm có thể được lưu hoặc hiển thị dưới dạng các tiện ích bảng điều khiển có thể được thêm trực tiếp vào bảng điều khiển từ trong màn hình tìm kiếm.

Người dùng có thể định cấu hình chế độ xem của riêng mình và có thể chọn xem dữ liệu tóm tắt hoặc hoàn chỉnh từ các thông báo sự kiện.  
Ví dụ ta tìm kiếm từ `ssh` trong mục `Search` 

<img src="https://i.imgur.com/O1Grxkj.png">  

Ta có thể:  
- Tùy chỉnh thời gian search ( search các bản tin trong vòng 5, 15, 30 phút, 1h, 2h… 1 ngày, 2 ngày… ).  
- Ô tìm kiếm, nơi ta nhập term muốn tìm kiếm ( trong trường hợp này là ssh ).  
- Phần Message sẽ hiện các bản tin chứa chính xác những term ta tìm kiếm.  

## Dashboards (Bảng điều khiển)  
- `Graylog Dashboards` là nơi để hiển thị biểu đồ, số liệu, bảng thống kê... được tạo trong mục `Search`  
- Giúp người dùng dễ dàng trong việc thống kê, tìm kiếm các thông tin được lọc từ bản tin log.  

<img src="https://i.imgur.com/wdXYyIc.png">

## Alert  
Cảnh báo có 2 thành phần đó là điều kiện cảnh báo và thông báo cảnh báo. Điều kiện cảnh báo được gắn với luồng và có thể dựa trên nội dung của một trường, giá trị tổng hợp của một trường hoặc ngưỡng đếm message.  
Một thông báo cảnh báo kích hoạt khi một điều kiện được đáp ứng, phổ biến là gửi một email hoặc gọi HTTP phân tích hoặc một hệ thống khác.  
Kiểu output truyền thống có thể được tạo bằng plusgins. Cảnh báo có thể được nhập và xuất bằng content packs.  

## Source  

- Sources thống kê số bản tin nhận về theo thời gian dưới dạng biểu đồ, và ip đang đẩy log về Graylog

<img src="https://i.imgur.com/3EZPmCR.png">  

## Extractor  
- Là các trường được thêm vào để lọc lấy 1 số thông tin nhất định từ bản tin như : user, ip, port...  
- Extractor được tạo ra bằng cách sử dụng kỹ thuật `Regular Expression` (Regex)  

<img src="https://i.imgur.com/UYhrx9y.png">  


