# Tổng quan về giao thức HTTP 

1. Khái niệm và lịch sử 

Hypertext Transfer Protocol(HTTP) là giao thức truyền tải văn bản.  HTTP truyền tải thông tin dữ liệu cho World Wide Web(WWW). Dữ liệu của HTTP truyền tải bao gồm các link liên kết dẫn đến các tài nguyên khác có thể bấm để truy cập. 

Phát triển HTTP được Tim Berners-lee bắt đầu tại CERN năm 1989. Từ sự phối hợp của  Internet Engineering Task Force (IETF) và  World Wide Web Consortium(WWWC) và sau đó là  IETF

HTTP/1.1 lần đầu tiên được ghi nhận bởi RFC 2068 năm 1997. Đến năm 2014 được thay thế bằng RFC 7230

HTTP/2 là một phiên bản được ra mắt năm 2015. Sử dụng lớp bảo mật TLS để tăng mức độ bảo mật 

HTTP/3  Là sự kế thừa từ sản phẩm HTTP/2 và thay đổi bằng cách sử dụng UDP thay cho TCP như trước.
 
| HTTP/1.0 | HTTTP/1.1 | HTTP/2 |
|----|-----|-----|
| Khi truyền tải thông tin dữ liệu qua qua kết nối TCP thì mỗi một kết nối chỉ truyền tải một tài nguyên độc lập gây nên việc tốn thời gian để truyền tải thông tin dữ liệu một trang web | Khi truyền tải thông tin thì có thể truyền tải nhiều thông tin dữ liệu qua cùng một kết nối điều đó làm giảm thiểu việc phải tạo ra nhiều kết nối TCP nhưng khi truyền tải dữ liệu cần phải đúng thứ tự vì khi này không thể nhận biết được thứ tự các yêu cầu. Nên các response sẽ phải tuân thủ quy tắc xử lý lần lượt |  Đã khắc phục bằng cách đánh dấu các response khác nhau và thứ tự của chúng nên việc xử lý theo thứ tự đã được giải quyết. Và HTTP/2 cũng đã nén dữ liệu xuống không còn gửi dưới dạng text như HTTP/1 khiến nó nhẹ hơn | 
| dữ liệu truyền đi dưới dạng text |  dữ liệu truyền đi dưới dạng text  |  dữ liệu truyền đi dưới dạng nhị phân |  

# Các khái niệm trong HTTP 
1. Session 
- Trong giao thức HTTP thì một phiên của nó bao gồm 3 giai đoạn 
    - Bắt tay 3 bước TCP
    - Client gửi yêu cầu 
    - Server xử lý yêu cầu và trả lại kết quả
- Session được lưu trên máy server. Nó chứa dữ liệu người dùng sử dụng web vào một file ở trên server 
2. Cookies 
- Là một dạng dữ liệu được lưu ở web của người dùng. Thường được sử dụng để cho biết cho yêu cầu tiếp theo đến cùng một máy chủ. 
- Cookie sẽ tự động xóa sau một khoảng thời gian xác định do người dùng đặt.
- Cookies được sử dụng chủ yếu trong các mục sau 
    - Quản lý Session: Như là đăng nhập; giỏ mua hàng; kỷ lục trò chơi 
    - Theo dõi các hoạt động của người dùng
3. Các method 
- Method được dùng để chỉ hành động mong muốn được thực hiện trên tài nguyên đã xác định 
- GET: Được dùng để lấy dữ liệu từ server
- POST: Được dùng để đẩy dữ liệu lên server
- HEAD: Hoạt động tương tự như GET nhưng nó không lấy phần body của response mà chỉ lấy header của response.
- PUT: Thực hiện ghi đè hoặc tạo mới một resource
- DELETE: Dùng để delete một resource
- TRACE : Lặp lại những yêu cầu đã nhận
- CONNECT: Được sử dụng để bảo proxy thiết lập một kết nối tới một host khác với nội dung trao đổi đơn giản, không cần phải cố gắng phân tích hay cache nó. Nó thường được dùng để thực hiện kết nối SSL thông qua proxy.
- OPTIONS: được sử dụng để mô tả các option truyền thông cho target resource.
- PATCH: được sử dụng để thay đổi một phần của resource 

4. Status code
- 1XX: (Informatinal) Yêu cầu được chấp nhận hoặc quá trình đang tiếp tục
- 2XX: (Success) Requests đã được phía server tiếp nhận, hiểu và xử lý thành công
- 3XX: (Redirection) Mã này cho biết client cần có thêm action để hoàn thành requests
- 4XX: (Client Error) Requests chứa cú pháp không chính xác hoặc không thể thực hiện
- 5XX: (Server Error) Server thất bại với việc thực hiện một requests

5. HTTP messeges 
- Là cách để trao đổi dữ liệu giữa client và server 
- HTTP messeges gồm 3 phần là :Start line ; Header; Body
- Ví dụ HTTP messeges Requests
    - Start line : Yêu cầu HTTP được gửi đi để bắt đầu thì nó bao gồm 3 nội dung là phiên bản HTTP; method và target request 
    - Header : Không phân biệt chữ hoa chữ thường; Theo sau là dấu `:` 
    - Body : Phân nội dung dữ liệu nếu được gửi từ client thì nó sẽ có yêu cầu cập nhật nội dung bảng mẫu 
6. encode và decode 
- encode (mã hóa) : Thường được sử dụng để mã hóa dữ liêu thành ngôn ngữ máy. Mục đích là để giảm dung lượng của dữ liệu(văn bản, hình ảnh, âm thanh) để có thể truyền dữ liệu đi dễ dàng hơn 
- decode được dùng để giải mã những dữ liệu đã được encode thành những dữ liệu mà chúng ta có thể hiểu được 