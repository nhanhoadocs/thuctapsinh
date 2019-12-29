## Tìm hiểu về giao thức TLS   
### 1. TLS là gì?  
`TLS` là viết tắt của từ **Transport Layer Security**. Nó là một giao thức bảo mật tầng giao vận. Giao thức này được phát triển dựa trên tiêu chuẩn SSL v3.0 (Secure Socket Layer).  
### 2. Cấu trúc của giao thức SSL
Do giao thức TLS được phát triển dựa trên giao thức SSL nên chúng ta cùng tìm hiểu một chút về cấu trúc của giao thức SSL trước. Quan sát cấu trúc của giao thức SSL được minh họa trong hình dưới:  

<img src="https://i.imgur.com/s7dYQ8f.png">  

- Giao thức SSL được đặt giữa tầng vận chuyển (Transport Layer) và tầng ứng dụng (Application Layer).  
- Giao thức SSL cung cấp giao thức bảo mật truyền thông có 3 đặc điểm nổi bật:  
    - Các bên giao tiếp (nghĩa là client và server) có thể xác thực nhau bằng cách sử dụng mật mã khóa chung.  
    - Sự bí mật của lưu lượng dữ liệu được bảo vệ vì nối kết được mã hóa trong suốt sau khi một sự thiết lập quan hệ ban đầu và sự thương lượng khóa session đã xảy ra.  
    - Tính xác thực và tính toàn vẹn của lưu lượng dữ liệu cũng được bảo vệ vì các thông báo được xác thực và được kiểm tra tính toàn vẹn một cách trong suốt bằng cách sử dụng MAC.  

### 3. Chức năng và hoạt động của giao thức TLS  
Mục tiêu chính của giao thức TLS là cung cấp sự riêng tư và toàn vẹn dữ liệu giữa hai ứng dụng trong môi trường mạng.  
- Cũng như giao thức SSL thì giao thức TLS cũng theo mô hình client-server.  
- Trong mô hình TCP/IP thì giao thức TLS gồm có hai lớp là Record Layer và Handshake Layer.  
    - Record layer là lớp thấp nhất bao gồm TLS record protocol (trên tầng giao vận như giao thức điều khiển truyền tải TCP, giao thức truyền vận không tin cậy UDP).  
    - Đặc tính kết nối riêng tư: mã hoá đối xứng được sử dụng để mã hoá dữ liệu (mã hoá AES...) Các khoá để mã hoá đối xứng được sinh ra cho mỗi lần kết nối và được thoả thuận bí mật của giao thức khác (ví dụ TLS). Chính vì vậy giao thức TLS cũng có thể được sử dụng mà không cần mã hoá.  
    - Đặc tính kết nối đáng tin cậy: Một thông điệp vận chuyển thông báo sẽ bao gồm kiểm tra tính toàn vẹn (sử dụng hàm Băm ví dụ SHA-1).  
- Ngoài ra giao thức TLS còn được sử dụng để phân mảnh, nén, đóng gói, mã hoá dữ liệu, cho phép máy chủ xác nhận nhau và thoả thuận thuật toán mã hoá.  
- Giao thức bao gồm  
    - TLSPlaintext  
    - TLSCompressed  
    - TLSCiphertext  
    
Mỗi cấu trúc dữ liệu bao gồm 4 trường thông tin  
    - Type  
    - Version  
    - Length  
    - Fragment

- Handshake Layer: nằm trên lớp bản ghi

Định danh của điểm kết nối có thể được xác thực bằng cách sử dụng mã hóa bất đối xứng hoặc khóa công khai (RSA).  
Quá trình thỏa thuận khóa bí mật chia sẻ được an toàn
Quá trình thỏa thuận đáng tin cậy.  

### 4. Ứng dụng của giao thức TLS  
- Đóng gói các giao thức ví dụ như HTTP, FTP, SMTP, NNTP và XMPP  
- Cho phép trao đổi riêng tư trên mạng
- Cho phép các ứng dụng client-server giao tiếp với nhau an toàn

