# Tầng ứng dụng (applycation)

#### 4 ứng dụng phổ biến:
Web,Truyền file, thư điện tử và dịch vụ tên miền(DNS)

#### Phần 1: HTTP ( hyper text tranfer protocol )
HTTP xác định cách thức trình duyệt yêu cầu trang web từ web server cũng như cách thức server gửi trang web được yêu cầu tới trình duyệt.
- Giao thức HTTP viết bằng mã ASCII để bất kì máy tính nào cũng có thể đọc được.
##### Dịch vụ và các giao thức giao vận:
- TCP: truyền dữ liệu chính xác và đúng thứ tự, kiểm soát tắc nghẽn (cơ chế giảm dung lượng gửi đi của mỗi tiến trình khi mạng bị tắc nghẽn)
- Sử dụng để gửi file, chuyển file từ web server sang web client
- Client nhận thông tin từ Server
- Phía nhận thiết lập kết nối TCP trước 
 
* Mã trạng thái:
  - 200OK: yêu cầu được đáp ứng và dữ liệu được yêu cầu nằm trong thông điệp. 
  - 301 Moved permanetly: cho biết đối tượng đã được chuyển và địa chỉ URL mới của đối tượng được đặt trong trường LOCATION của thông điệp trả lời 
  - 400 Bad Request: Server không hiểu được yêu cầu từ Client
  - 404 Not Found: Đối tượng không còn được lưu trên server
  - 305 HTTP version not support: Server không còn được hỗ trợ giao thức của client
* WEB CACHE ( bộ nhớ đệm website)
Là 1 phần lưu trữ tạm thời các nội dung tĩnh được truy cập thường xuyên

##### WEB động
* Định nghĩa: Là website có hệ thống quản lý nội dung và người dùng có thể chỉnh sửa nội dung được VD: Vnexpress.net, 24h.com,...
+ Web động sử dụng khi:
Làm web có tin tức, blong cá nhân
Web có tầm cỡ lớn
Làm website thương mại
làm web giới thiệu sản phẩm
+ Ưu điểm
Dễ dàng nâng cấp và bảo trì
Có thể xây dựng được Web lớn
Sử dụng tương tác với người dùng cao
dễ dàng quản lý nội dung
+ Nhược điểm
Chi phí xây dựng cao
chi phí thêm nhân sự chuyên nghành


##### WEB tĩnh
- Định nghĩa: Là website không có hệ thống quản lý nội dung 
- Web tĩnh nên sử dụng khi:
- Khi ít cập nhật nội dung (Web site nhỏ)
- Ưu điểm: tốc độ truy cập nhanh, chi phí thấp
- Nhược điểm, thiếu tính linh hoạt, khó quản lý nội dung, khó nâng cấp bảo trì

#### Phần 2: FTP (File Tranfer Protocol)
Là giao thức truyền file giữa các máy tính: 1 máy chủ, 1 máy khách. Máy khách yêu cầu các tệp và máy chủ sẽ cung cấp chúng

- Thư tín điện tử ( E-mail) trên internet.

* STMP ( Simple Mail Trafer Protocol ) là giao thức gửi thư điện tử của tầng ứng dụng
  - Mail server đóng vai trò client khi gửi thư và đóng vai trò server khi nhận thư.
  - Sử dụng để gửi file
  - Gửi giữu các mail server với nha
  - Clien đẩy thông tin lên server 
  - Phía gửi thiết lập kết nối TCP trước
* POP3( Post office protocol version3 )
  - POP3 là giao thức 1 chiều , có nghĩa là email được kéo từ mail server từ xa xuống email client
  - Ta có thể chọn xóa hoặc không xóa bản lưu trên server

* IMAP ( Internet message access protocol )
  - Là kênh liên lạc 2 chiều
  - Thay đổi trên mail client sẽ được chuyển lên server
  - Kéo mail header về nhưng nội dung vẫn còn trên server
  - IMAP được sử dụng phổ biến hơn POP3
 
#### Phần 3: DNS ( Domain name system )
Là cách các tên miền internet được định vị và dịch thành địa chỉ ip( internet protocol )
* Các dịch vụ của DNS
  - Đặt bí danh(host aliasing): vd: WWW.nhanhoa.com thành [nhanhoa.com](https://nhanhoa.com/)
  1 ứng dụng có thể yêu cầu DNS xác định tên đầy đủ cũng như địa chỉ IP của 1 bí danh
  - Đặt bí danh cho mail server ( Mail server aliasing ): DNS cho phép mail servser và web server của các  công ty có tên ( bí danh ) giống nhau
  - Phân tán tải ( load distribution ): DNS phân tán tải cho các server. Những website có hiều người truy nhập được đặt trên nhiều server giống hệt nhau, mỗi server là 1 thiết bị đầu cuối khác nhau, có địa chỉ ip khác nhau.
* Cơ chế hoạt động
  - Quá trình phân giải tên miền  
VD: khi nhập google.com.vn máy tính sẽ sử dụng DNS server để truy xuất địa chỉ IP của máy chủ Google, sau khi có địa chỉ IP, máy tính thiết lập kết nối với máy chủ, sau đó sẽ thấy giao diện của trang chủ Google. 
* Các loại DNS Server
  - Local name server
  - Root name server
  - Authoriative name server 
 * Cơ chế hoạt động: Nếu máy tính tạo 1 thông điệp truy vấn DNS thì đầu tiên nó được gửi tới local name server, khi local name server không thể trả lời nó sẽ được gửi tới root name server, root name server  sẽ gửi thông điệp tới Authoriative name server, kết quả được gửi lần lượt với chu trình ngược lại.
   













