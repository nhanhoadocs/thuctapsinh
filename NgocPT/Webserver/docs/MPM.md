# MPM (Multi Processing Module)

MPM (Multi Processing Module) là một cơ chế hoạt động của Webserver Apache, cơ chế này quyết định cách thức tiếp nhận và xử lý các kết nối request từ client. Apache hỗ trợ 3 cơ chế MPM gồm: prefork, worker và event. Apache chỉ có thể chạy 1 MPM vào 1 thời điểm.

## MPM prefork
- Đây là MPM mặc định khi bạn cài đặt Apache,Các tiến trình con của Apache được chạy (process), thì trong mỗi tiến trình đó chỉ có một luồng (thread) chạy để lắng nghe các yêu cầu kết nối gửi đến, cũng như xử lý các kết nối đó.Số process được quy định trong file cấu hình apache.conf

- Mỗi yêu cầu được xử lý trên một tiến trình riêng - độc lập,mà Apache trên server cần nhiều tài nguyên hơn các MPM khác.  

Ưu nhược điểm của prefork :
- Ưu điểm: Các process được xử lý hoàn toàn một cách độc lập, cho nên nếu một process chết thì các process còn lại vẫn sống và vẫn hoàn thành công việc của nó.  
- Nhược điểm: Có vẻ nhược điểm lớn nhất chính là việc tạo ra quá nhiều các process sẽ chiếm dung lượng RAM lớn.  
## MPM worker
- MPM worker mỗi process có thể chạy nhiều thread (đa luồng), mỗi luồng đó lắng nghe yêu cầu, xử lý yêu cầu ... Do đó mà MPM worker xử lý cùng lúc được nhiều yêu cầu hơn MPM prefork thi cùng dùng một lượng tài nguyên.  

Cơ chế hoạt động của mpm prefork và mpm worker:

![](../imagess/screen.png) 

Ưu nhược điểm của worker :
- Ưu điểm: Tận dụng được dung lượng bộ nhớ RAM, vì các thread sẽ sử dụng chung bộ nhớ RAM.
- Nhược điểm: Nếu có một thread có vấn đề hoặc bị crash thì các thread khác trong process bị crash theo.Sử dụng chung vùng nhớ nên có thể gây ảnh hưởng lẫn nhau.
 