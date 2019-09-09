# Tổng quan về các thức hoạt động của web server
 
## 1. Cách hoạt động của web server

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Security/images/web_server_1.png)

Web server là gì? Đây là một máy chủ (server) nhận yêu cầu từ các máy tính của người dùng (client) sau đó xử lý và trả lại thông tin cho các máy client để hiển thị duới dạng các file .htm hoặc .html.

Khi ta truy cập vào một trang web và thực hiện bất kỳ thao tác gì trên trang web đó. Lúc này ta có thể hiểu một thao của ta là một request được gửi đến web server. Khi nhân được requests server sẽ thực hiện các công việc để lấy ra kết quả trả về cho phía client. Server sẽ xử lý ở bên dưới và kết quả trả về cho client thường là một file có định dạng .html để hiển thị trên trình duyệt web của phía client.

## 1. Giao thức HTTP

HTTP (HyperText Transfer Protocol) đây là giao thức truyền tải siêu văn bản giữa web server và trình duyệt web trên máy client. HTTP hoạt động ở tầng ứng dụng trong mô hình OSI. Để client và web server có thể giao tiếp được với nhau thì 2 bên phải thông qua giao thức này.

HTTP là một giao thức stateless:

Cả server và client sẽ không nhớ các kết nối trước đó. Mỗi lần truy vấn nó lạ phải thiết lập lại đường truyền. HTTP cũng cung cấp các quy tắc rõ ràng giữa server và client.
 * Client tạo request tới các server. Server chỉ có thể response lại các request của client.
 * Khi yêu cầu một file thông qua HTTP client phải cung cấp URL của file.
 * Web server phải response lại mọi requests từ phía client, có thể là một thông điệp báo lỗi.

**Một số method**

* `GET`: Được dùng để lấy dữ liệu từ server
* `POST`: Được dùng để đẩy dữ liệu lên server
* `HEAD`: Hoạt động tương tự như `GET` nhưng nó không lấy phần body của response mà chỉ lấy header của response.
* `PUT`: Thực hiện ghi đè hoặc tạo mới một resource
* `DELETE`: Dùng để delete một resource
* `CONNECT`: Được sử dụng để bảo proxy thiết lập một kết nối tới một host khác với nội dung trao đổi đơn giản, không cần phải cố gắng phân tích hay cache nó. Nó thường được dùng để thực hiện kết nối SSL thông qua proxy.
* `OPTIONS`: được sử dụng để mô tả các option truyền thông cho target resource.
* `PATCH`: được sử dụng để thay đổi một phần của resource

So sánh một chút về `GET` và `POST`. Thông thường thì `GET` được dùng để lấy dữ liệu trong khi `POST` được dùng để đẩy dữ liệu lên server. Nhưng ta cũng có thể dùng `GET` để đẩy dữ liệu và dùng `POST` để lấy dữ liệu. Nhưng khi dùng `GET` để đẩy dữ liệu thì đối với `GET` sẽ không có phần body để chứa dữ liệu cần đẩy. Do vậy tất cả các thông tin phải đưa lên URL. Như vậy thì sẽ không hay.

**Status code**

* 1XX: (Informatinal) Yêu cầu được chấp nhận hoặc quá trình đang tiếp tục
* 2XX: (Success) Requests đã được phía server tiếp nhận, hiểu và xử lý thành công
* 3XX: (Redirection) Mã này cho biết client cần có thêm action để hoàn thành requests
* 4XX: (Client Error) Requests chứa cú pháp không chính xác hoặc không thể thực hiện
* 5XX: (Server Error) Server thất bại với việc thực hiện một requests

**Một số status code hay gặp**

* 100 Continue: Chỉ một phần của requests được nhận (có thể là header và client cần gửi tiếp phần body), nhưng request này không bị loại bỏ, Client nên tiếp tục gửi request.
* 101 Switching Protocols: Chient hỏi server để thay đổi protocol và server chấp nhận điều đó.
* 200 Ok: Request đã được chấp nhận và xử lý thành công
* 201 Created: Request được chấp nhận để xử lý nhưng việc xử lý chưa hoàn thành
* 204 No Content: Server đã xử lý thành công request nhưng không trả về bất cứ content nào.
* 300 Multiple Choices: Một danh sách các link. Người dùng có thể chọn một link và tới vị trí đó.
* 301 Moved Permanently: Requests hiện tại và các request sau được yêu cầu move tới một URI mới.
* 302 Found: Trang đã được chuyển tạm thời đếm một URL mới có sẵn. Bạn được server điều hướng đến đó.
* 303 See Other: Response trả về của request có thể tìm thấy một URL khác bằng các sử dụng method `GET`
* 304 Not Modified: Nếu header yêu cầu bao gồm tham số "if modified since" mã trạng thái này được trả về trong trường hợp file không thay đổi kể từ ngày đó.
* 305 Use Proxy: Người nhận muốn nhận response sẽ phải yêu câu thông qua proxy.
* 400 Bad Request: Server không thể xử lý hoặc sẽ không xử lý các request lỗi của phía client
* 401 Unauthorized: Client bị từ chối truy cập do xac thực không thành công
* 403 Forbidden: Request là hợp lệ nhưng server từ chối nó do người dùng ko có quyền để truy cập nó.
* 404 Not Found: các tài nguyên client yêu cầu không được tìm thấy.
* 408 Request Timeout: Request tốn thời gian dài hơn thời gian server được chẩn bị để đợi.
* 417 Expectation Failed: Máy chủ không thể đáp ứng các yêu cầu của trường Expect trong header.
* 500 Internal Server Error: Thông báo server gặp phải sự cố từ bên trong nó.
* 501 Not Implemented: Server không công nhận các Request method hoặc không có khả năng xử lý nó.
* 502 Bad Gateway: Server đã hoạt động như một gateway hoặc proxy và nhận được một Response không hợp lệ từ máy chủ nguồn.
* 503 Service Unavailable: Server hiện tại không có sẵn (Quá tải hoặc được down để bảo trì). Nói chung đây chỉ là trạng thái tạm thời.
* 504 Gateway Timeout: Server đã hoạt động như một gateway hoặc proxy và không nhận được một Response từ máy chủ nguồn.
* 505 HTTP Version Not Supported: Server không hỗ trợ phiên bản “giao thức HTTP”.

**HTTP header**

Ta có thể thấy định dạng của URL

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Security/images/web_server_2.png)

Request header

```
Accept:	text/html,application/xhtml+xm…plication/xml;q=0.9,*/*;q=0.8
Accept-Encoding: gzip, deflate, br
Accept-Language	: en-US,en;q=0.5
Connection	: keep-alive
Host : dantri.com.vn
Upgrade-Insecure-Requests:1
User-Agent:Mozilla/5.0 (X11; Ubuntu; Linu…) Gecko/20100101 Firefox/68.0
```

Response header

```
HTTP/2.0 200 OK
date: Tue, 27 Aug 2019 17:14:51 GMT
content-type: text/html
vary: Accept-Encoding
last-modified: Thu, 27 Jun 2019 02:54:40 GMT
access-control-allow-origin: *
access-control-allow-methods: GET, HEAD, OPTIONS
server: VCCloud CDN / 153
x-xss-protection: 1; mode=block
x-cache: HIT from VCCloud CDN
cache-control: private, max-age=0
content-encoding: gzip
X-Firefox-Spdy: h2
```

## Cookie và session

**Cookie**

Cookie là một file có chứa thông tin được lưu trữ trên trình duyệt của client. Cookie thường được tạo ra khi người dùng truy cập một website, cookie sẽ ghi nhớ các thông tin như tên đăng nhập, mật khẩu và các thông tin khác do người dùng quy định. Thông tin này được lưu trên máy tính phía client để nhận biết người dùng khi truy câp vào một website. Nó cũng lưu thông tin của các trang web mà bạn truy cập, thời gian truy cập và có thể là các thao tác trên đó. Cookie sẽ tự động xóa sau một khoảng thời gian xác định do người dùng đặt.

Việc lưu cookie này cũng liên quan đến vấn đề bảo mật. Kẻ tấn công có thể lợi dụng điều này để đánh cắp các tài khoản của bạn.

**Session**

Khác với cookie thì session được lưu trên máy server. Nó chứa dữ liệu người dùng sử dụng web. Ví dụ khi bạn đăng nhập vào một website với tài khoản đăng ký trước đó. Nếu bạn login thành công server sẽ tih ra một file (hay chính là sesion của trình duyệt của bạn) chứa dữ liệu cần lưu trữ của người dùng. 