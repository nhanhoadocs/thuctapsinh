## Tìm hiểu về graylog  

### 1. Giới thiệu chung về graylog  

- Là một phần mềm mã nguồn mở quản lý log tập trung.  
- Ra đời 2010 bởi Lennart Koopman với tên `Graylog2`.  
- 2/2014 phát hành Graylog2 V0.20.0 Final.  
- Các phiên bản 2.x.x  trở đi đã được đổi tên thành `Graylog`.  
- Phiên bản mới nhất đến nay (11/2019) là `Graylog 3.1`.  

### 2. Đặc điểm của graylog  

- Cơ chế nhận log rất linh hoạt (nhận log từ nhiều nguồn khác nhau).  
- Sử dụng Elasticsearch => Tìm kiếm nhanh chóng, chính xác và linh hoạt.  
- Phân tích dữ liệu thành dạng thống kê, biểu đồ.  
- Cảnh báo qua Email, Slack.  
- Mở rộng với REST API 
    - Web interface  
    - Stream Alerts  
    - Greylog Collector  
    - LDAP  
    - Output  

Tổng kết: **Mục đích chung của Graylog** là thu thập log tập trung, hỗ trợ nhiều giao thức, thư viện, phân tích dữ liệu giúp sys admin quản lý hệ thống hiệu quả.  

### Các thành phần cơ bản của graylog  

<img src="https://i.imgur.com/KIAYi3l.png">  

- **Graylog server**: nhận và xử lý các bản tin và truyền thông với các thành phần khác (cần CPU)  
- **Elasticsearch**: Dùng để lưu trữ các log, các messages (cần RAM và I/O)  
- **MongoDB**: Dùng để lưu trữ các megadata, thường chứa file cấu hình, dữ liệu lớn.  
- **Web-interface**: Cung cấp giao diện người dùng. 

Trước đây người ta tách graylog-server và graylog-web interface làm riêng nhưng thời gian gần đây đã được gộp chung.

### 4. Mô hình triển khai graylog  

graylog có 2 mô hình triển khai là `all-in-one` và `Bigger Production`  

**4.1 Mô hình all-in-one (trên 1 máy server)**

Là mô hình mà graylog, MongoDB, Elasticsearch nằm trên cùng một máy. Khi 1 trong những thành phần trên bị down thì hệ thống sẽ die.  

<img src="https://i.imgur.com/nvAzq2E.png">  

**4.2 Mô hình triển khai mở rộng (Bigger Production)**  

Thông thường sẽ dựng nhiều server (3 elasticsearch, 3 MongoDB). Để đảm bảo tính sẵn sàng cao một node giữ vai trò làm master, các node còn lại là slave. Khi master down thì slave có thể lên thay. Như vậy hệ thống sẽ làm việc luôn ổn định và hiệu quả.  

<img src="https://i.imgur.com/bPFMMPJ.png">  

### 5. Ứng dụng thực tế của graylog trong Cloud computing  

- **SSH**: Thống kê user, ip đăng nhập, số lần đăng nhập SSH thành công, thất bại, tổng số lần đăng nhập.  
- **OpenVPN**: Thống kê user, ip đăng nhập , ip được cấp VPN trên hệ thống Lab và hệ thống thực.  
- **OpenStack**: Thống kê user, số lần đăng nhập dashboard thành công và thật bại, số máy ảo được tạo, xóa, hỏng.

### 6. Tìm hiểu chung về Elasticsearch, MongoDB, Web-interface  

6.1 Elasticsearch  
- là một search engine.  
- được kế thừa từ Lucene Apache  
- thực chất hoạt động như 1 web server, có khả năng tìm kiếm nhanh chóng (near realtime) thông qua giao thức RESTful  
- có khả năng phân tích và thống kê dữ liệu  
- chạy trên server riêng và đồng thời giao tiếp thông qua RESTful do vậy nên nó không phụ thuộc vào client viết bằng gì hay hệ thống hiện tại của bạn viết bằng gì. Nên việc tích hợp nó vào hệ thống bạn là dễ dàng, bạn chỉ cần gửi request http lên là nó trả về kết quả.  
- là 1 hệ thống phân tán và có khả năng mở rộng tuyệt vời (horizontal scalability). Lắp thêm node cho nó là nó tự động auto mở rộng cho bạn.  
- là 1 open source được phát triển bằng Java.  

*Tương tác graylog server với elasticsearch*  

<img src="https://i.imgur.com/a21lVZH.png">  

 `Graylog-server` được coi như là một `Node` trong `Elasticsearch Cluster` tương tác `Node` qua `API` cụ thể là `Discovery-zen-ping`.  
 Graylog-server sẽ phải khai báo như là một Node để kết nối với Elasticsearch Cluster.  
`Node` là một server Elasticsearch, trung tâm hoạt động của Elasticsearch, lưu trữ toàn bộ dữ liệu để có thể thực hiện công việc lưu trữ và tìm kiếm.

`Cluster` là tập hợp node chia sẻ cùng thuộc tính Cluster.name. Mỗi Cluster có một node chính (master) được lựa chọn tự động. Một server có thể có 1 hoặc nhiều node.Các nốt kết nối với nhau qua giao thức unicast.

`Type` là document, thành phần trong index,có thể có 1 hoặc nhiều type.

`Document` là đơn vị cơ bản của thông tin mà có thể đánh chỉ số, ở đinh dạng JSON(JavaScript Object Notation) ,phải có type nhất định.  

6.2 MongoDB  

MongoDB là một cơ sở dữ liệu mã nguồn mở và là cơ sở dữ liệu NoSQL. Các đối tượng dữ liệu được lưu trữ dưới dạng các tài liệu riêng biệt bên trong một collection – thay vì lưu trữ dữ liệu vào các cột và hàng của cơ sở dữ liệu quan hệ truyền thống.

Ngôn ngữ MongoDB là triển khai một kho lưu trữ dữ liệu cung cấp hiệu suất cao, tính sẵn sàng cao và tự động mở rộng.  

Ngoài ra, MongoDB là một cơ sở dữ liệu đa nền tảng, hoạt động trên các khái niệm Collection và Document, nó cung cấp hiệu suất cao, tính khả dụng cao và khả năng mở rộng dễ dàng.  

*Tương tác Mongodb với Graylog-server*

<img src="https://i.imgur.com/9pzvVrd.png">  

MongoDB dùng để lưu các file cấu hình, các metadata, dữ liệu lớn. 
