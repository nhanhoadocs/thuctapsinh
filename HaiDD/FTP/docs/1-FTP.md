# FTP - File Transfer Protocol (Giao thức truyền tệp tin)

## I. Tổng quan về FTP
### 1. FTP là gì
**FTP** : viết tắt của **File Transfer Protocol** là giao thức truyền tệp tin khá phổ biến hiện nay. 

### 2. Mục đích sử dụng
- Được sử dụng để trao đổi tập tin qua mạng lưới truyền thông sử dụng TCP/IP (internet, mạng nội bộ, ...) 

- Sử dụng để tải xuống máy tính các file từ máy chủ.

- **Tại sao nên dùng FTP:** Mặc dù việc truyền file từ hệ thống này sang hệ thống khác rất đơn giản và dễ hiểu, nhưng đôi khi xảy ra những vấn đề khác nhau. Ví dụ, 2 hệ thống có thể có các quy ước tập tin khác nhau, 2 hệ thống có các cách khác nhau để thể hiện văn bản và dữ liệu hay 2 hệ thống có cấu trúc thư mục khác nhau, ... Giao thức FTP khắc phục những vấn đề này bằng cách thiết lập 2 kết nối giữa các máy chủ. Một kết nối để sử dụng truyền dữ liệu, 1 kết nối còn lại được sử dụng để điều khiển kết nối.

## II. Mô hình và nguyên lí hoạt động
### 1. Mô hình cơ bản FTP
<img src = "..\images\FTP1.png">
Giống như hầu hết các giao thức TCP/IP, FTP dựa trên mô hình Client - Server. Tuy nhiên, khác với các ứng dụng khác chạy trên nền TCP/IP, FTP cần tới 2 kết nối TCP:

- **Control connection (sử dụng port 21):** Đây là kết nối TCP logic chính được tạo ra khi phiên làm việc được thiết lập. Nó được thực hiện giữa các quá trình điều khiển. Nó được duy trì trong suốt phiên làm việc và chỉ cho các thông tin điều khiển đi qua như lệnh hay response(phản hồi)
- **Data connection (sử dụng port 20):** Kết nối này sử dụng các quy tắc rất phức tạp vì các loại dữ liệu có thể khác nhau. Nó được thực hiện giữa các quá trình truyền dữ liệu. Kết nối này mở khi có lệnh chuyển tệp và đóng khi tệp truyền xong.

Do chức năng điều khiển và dữ liệu được truyền tải bằng cách sử dụng các kênh riêng biệt nên mô hình FTP chia mỗi thiết bị thành 2 phần giao thức logic chịu trách nhiệm cho mỗi kết nối ở trên:
- **Protocol interpreter (PI)**: Là thành phần quản lý kênh điều khiển, phát và nhận lệnh và trả lời.
- **Data transfer process (DTP)**: chịu trách nhiệm gửi và nhận dữ liệu giữa client và server.

Ngoài 2 thành phần trên, trên Client còn có thêm User Interface để người dùng có thể tương tác. Trên phía Server không có thành phần này.

**Mô hình minh họa:**
<img src = "..\images\Screenshot_2.png">

**Phía Server:**
- **Server Protocol Interpreter (Server-PI)** : Chịu trách nhiệm quản lí Control Connection trên Server. Nó lắng nghe yêu cầu kết nối hướng từ user trên cổng 21. Khi kết nối được thiết lập, nó nhận lệnh từ User-PI, gửi phản hồi và quản lí tiến trình truyền dữ liệu trên Server.
- **Server Data Transfer Process (Server-DTP)** : chịu trách nhiệm nhận và gửi file từ User-DTP. Server-DTP vừa làm nhiệm vụ thiết lập Data Connection và lắng nghe Data Connection của User thông qua cổng 20. Nó tương tác với Server File System trên hệ thống cục bộ để đọc và chép file.

**Phía Client:**
- **User Interface**: Đây là chương trình được chạy trên máy tính, nó cung cấp giao diện xử lí cho người dùng. Nó cho phép người dùng sử dụng những lệnh đơn giản để điều khiển các session FTP, từ đó có thể theo dõi được các thông tin và kết quả xảy ra trong quá trình.
- **User Protocol Interpreter (User-PI)**: Chịu trách nhiệm quản lí Control Connection phía Client. Nó khởi tạo phiên kết nối FTP bằng việc phát hiện ra Request tới Server-PI. Sau khi kết nối được thiết lập, nó xử lí các lệnh nhận được trên User Interface, gửi chúng tới Server-PI rồi đợi nhận Response trở lại. Nó cũng quản lí các tiến trình trên Client.
- **User Data Transfer Process (User-DTP)**: Có nhiệm vụ gửi hoặc nhận dữ liệu từ Server-DTP. User-DTP có thể thiết lập hoặc lắng nghe DataConnection từ Server thông qua cổng 20. Nó tương tác với Client File System trên Client để lưu trữ file.