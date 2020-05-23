# Giao thức HTTP

## 1. Tổng quan về HTTP
### HTTP là gì? 
HTTP (Hypertext Transfer Protocol) là giao thức truyền tải siêu văn bản, là 1 trong các giao thức chuẩn của mạng Internet.

HTTP truyền tải thông tin cho dữ liệu giữa Web Server và Web Client trong mô hình Client/Server dùng cho World Wide Web(WWW). Nơi các tài liệu siêu văn bản(hypertext) bao gồm các siêu liên kết (hyperlinks) đến tài nguyên mà người dùng có thể dễ dàng truy cập.

HTTP là giao thức thuộc tầng ứng dụng, trên cơ sở TCP/IP. Cổng mặc định mà HTTP sử dụng là 80.

### Lịch sử và phiên bản
Phát triển HTTP được Tim Berners-lee bắt đầu tại CERN năm 1989. Từ sự phối hợp của Internet Engineering Task Force (IETF) và World Wide Web Consortium(WWWC) và sau đó là IETF

HTTP/1.1 lần đầu tiên được ghi nhận bởi RFC 2068 năm 1997. Đến năm 2014 được thay thế bằng RFC 7230

HTTP/2 là một phiên bản được ra mắt năm 2015. Sử dụng lớp bảo mật TLS để tăng mức độ bảo mật

HTTP/3 Là sự kế thừa từ sản phẩm HTTP/2 và thay đổi bằng cách sử dụng UDP thay cho TCP như trước.

|HTTP/1.0|HTTP/1.1|HTTP/2|
|-|-|-|
|Khi truyền tải thông tin dữ liệu qua qua kết nối TCP thì mỗi một kết nối chỉ truyền tải một tài nguyên độc lập gây nên việc tốn thời gian để truyền tải thông tin dữ liệu một trang web|Khi truyền tải thông tin thì có thể truyền tải nhiều thông tin dữ liệu qua cùng một kết nối điều đó làm giảm thiểu việc phải tạo ra nhiều kết nối TCP nhưng khi truyền tải dữ liệu cần phải đúng thứ tự vì khi này không thể nhận biết được thứ tự các yêu cầu. Nên các response sẽ phải tuân thủ quy tắc xử lý lần lượt|Đã khắc phục bằng cách đánh dấu các response khác nhau và thứ tự của chúng nên việc xử lý theo thứ tự đã được giải quyết. Và HTTP/2 cũng đã nén dữ liệu xuống không còn gửi dưới dạng text như HTTP/1 khiến nó nhẹ hơn|
|Dữ liệu truyền đi dưới dạng text|Dữ liệu truyền đi dưới dạng text|Dữ liệu truyền đi dưới dạng nhị phân|

## 2. Các đặc trưng cơ bản của HTTP
- **HTTP là giao thức connectionless** (kết nối không liên tục) : ví dụ như HTTP Client khởi tạo 1 request, Client sẽ ngắt kết nối từ Server và đợi cho 1 phản hồi, Server xử lí request và thiết lập lại sự kết nối với Client để gửi phản hồi trở lại.
- **HTTP là một phương tiện độc lập** : Bất cứ loại dữ liệu nào cũng có thể được gửi bởi HTTP, miễn là Server và Client  biết cách kiểm soát nội dung dữ liệu. Nó được yêu cầu cho Client cũng như Server để xác định kiểu nội dung bởi sử dụng kiểu MIME (Multipurpose Internet Mail Extensions - Giao thức mở rộng thư điện tử Internet đa mục đích) thích hợp.
- **HTTP là stateless (không trạng thái)** : Request hiện tại không biết những gì đã hoàn thành trong request trước đó.

## 3. Cấu trúc cơ bản
<img src = "..\images\Screenshot_1.png">

HTTP hoạt động dựa trên mô hình Client – Server. Trong mô hình này, các máy tính của người dùng sẽ đóng vai trò làm máy khách (Client). Sau một thao tác nào đó của người dùng, các máy khách sẽ gửi yêu cầu đến máy chủ (Server) và chờ đợi câu trả lời từ những máy chủ này.

**Client**
Client gửi một yêu cầu tới Server theo mẫu của một phương thức yêu cầu, URI(Uniform Resource Identifier - định dạng tài nguyên thống nhất), và phiên bản giao thức, được theo bởi một thông báo MIME chứa các bộ chỉnh sửa yêu cầu, thông tin Client, và nội dung đối tượng có thể qua một kết nối TCP/IP.

**Server**
Server phản hồi với một dòng trạng thái, bao gồm phiên bản giao thức của thông báo và một mã code trạng thái thành công hoặc lỗi, theo sau bởi một thông báo MIME chứa thông tin Server, thông tin thực thể đa phương tiện và nội dung đối tượng.

## 4. URL(Uniform Resource Locator)
1 URL được sử dụng để xác định duy nhất một tài nguyên trên web.

Cấu trúc URL
```
protocol://hostname:port/path-and-file-name
```

Trong đó:
- `protocol` : giao thức tầng ứng dụng được sử dụng bởi client và server. (http, https, ...)
- `hostname` : tên DNS domain
- `port` : cổng TCP để Server lắng nghe REQUEST từ Client
- `path-and-file-name` : tên và vị trí của tài nguyên

## 5. Session
Trong giao thức HTTP, mỗi session bao gồm 3 giai đoạn(bắt tay 3 bước TCP)
- Client thiết lập kết nối TCP tới Server (hoặc 1 kết nối thích hợp khác nếu tầng vận chuyển không sử dụng TCP)
- Client gửi request và đợi phản hồi
- Server nhận được request sẽ phản hồi lại cho Client cung cấp status code và dữ liệu phù hợp.

Session được lưu trên máy Server. Nó chứa dữ liệu người sử dụng web vào 1 file trên server.

## 6. Proxy
<img src ="..\images\Screenshot_11.png">

Giữa client và server có rất nhiều các thực thể, nó gọi là các Proxy. Nó thực hiện các hoạt động khác nhau như:
- `caching`(lưu trữ) : cache có thể là công khai hoặc riêng tư, giống bộ đệm trình duyệt
- `filtering`(lọc) : như quét virus hoặc kiểm soát
- `load balancing` (cân bằng tải) : cho phép nhiều máy chủ phục vụ các yêu cầu khác nhau
- `authentication`(xác thực) : kiểm soát truy cập các tài nguyên khác nhau
- `logging` (đăng nhập) : cho phép lưu trữ thông tin đăng nhập

## 7. HTTP Message
Là cách để trao đổi dữ liệu giữa client và server.

HTTP messeges gồm 3 phần là :Start line , Header, Body

HTTP Message có 2 loại:
- REQUESTS
- RESPONSES

## 8. REQUEST (Yêu cầu)
Ví dụ về HTTP Request:

<img src = "..\images\Screenshot_2.png">

### **Request bao gồm các yếu tố sau:**
#### - HTTP Method: Thao tác mà Client muốn thực hiện
- `GET`: Dùng để truy xuất dữ liệu từ Server
- `POST`: Đẩy dữ liệu lên Server
- `HEAD`: Lấy phần Header của `Response`
- `PUT`: Tạo một tài nguyên mới hoặc thay thế tài nguyên đích
- `DELETE`: Xóa tài nguyên chỉ định
- `TRACE`: Thực hiện 1 vòng lặp kiểm tra message theo đường dẫn tới tài nguyên đích, cung cấp cơ chế debug hữu ích
- `CONNECT`: Được sử dụng để bảo proxy thiết lập một kết nối tới một host khác với nội dung trao đổi đơn giản, không cần phải cố gắng phân tích hay cache nó. Nó thường được dùng để thực hiện kết nối SSL thông qua proxy.
- `OPTION`: Dùng để mô tả các tùy chọn để giao tiếp với tài nguyên đích. Client có thể chỉ định URL cho phương thức OPTION hoặc dấu hoa thị (*) để chỉ toàn bộ máy chủ
- `PATCH`: Dùng để sửa đổi một phần cho một tài nguyên.

#### - Path: Đường dẫn của tài nguyên
#### - Version of the protocol: Phiên bản của giao thức HTTP
#### - Header: Tiêu đề của Request
#### - Body: Sẽ tồn tại đối với 1 số phương thức như POST, có chứa tài nguyên được gửi đi.


## 9. RESPONSE (Phản hồi)
Ví dụ về HTTP Response:

<img src = "..\images\Screenshot_3.png">

### **Response gồm các yếu tố sau**
#### - Version of the protocol: Phiên bản giao thức HTTP mà nó tuân theo.
#### - Status code: Mô tả trạng thái của Request

- `1XX` (100-101): (Informatinal-Thông tin) Yêu cầu được chấp nhận hoặc quá trình đang tiếp tục
- `2XX` (200-206): (Success-Thành công) Requests đã được phía server tiếp nhận, hiểu và xử lý thành công
- `3XX` (300-307): (Redirection-Chuyển hướng) Mã này cho biết client cần có thêm action để hoàn thành requests
- `4XX` (400-417): (Client Error-Lỗi trên Client) Requests chứa cú pháp không chính xác hoặc không thể thực hiện
- `5XX` (500-505): (Server Error-Lỗi trên Server) Server thất bại với việc thực hiện một requests
#### - Status message: Mô tả của Status Code
#### - Header: Tiêu đề của Response
#### - Body : Chứa tài nguyên
