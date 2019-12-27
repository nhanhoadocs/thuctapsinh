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
**Kết nối TCP:**

<img src = "..\images\FTP1.png">

Giống như hầu hết các giao thức TCP/IP, FTP dựa trên mô hình Client - Server. Tuy nhiên, khác với các ứng dụng khác chạy trên nền TCP/IP, FTP cần tới 2 kết nối TCP:

- **Control connection (sử dụng port 21):** Đây là kết nối TCP logic chính được tạo ra khi phiên làm việc được thiết lập. Nó được thực hiện giữa các quá trình điều khiển. Nó được duy trì trong suốt phiên làm việc và chỉ cho các thông tin điều khiển đi qua như lệnh hay response(phản hồi)
- **Data connection (sử dụng port 20):** Kết nối này sử dụng các quy tắc rất phức tạp vì các loại dữ liệu có thể khác nhau. Nó được thực hiện giữa các quá trình truyền dữ liệu. Kết nối này mở khi có lệnh chuyển tệp và đóng khi tệp truyền xong.

**Mô hình:**

*Sơ đồ minh họa*

<img src = "..\images\Screenshot_2.png">

Do chức năng điều khiển và dữ liệu được truyền tải bằng cách sử dụng các kênh riêng biệt nên mô hình FTP chia mỗi thiết bị thành 2 phần giao thức logic chịu trách nhiệm cho mỗi kết nối ở trên:
- **Protocol interpreter (PI)**: Là thành phần quản lý kênh điều khiển, phát và nhận lệnh và trả lời.
- **Data transfer process (DTP)**: chịu trách nhiệm gửi và nhận dữ liệu giữa client và server.
- **User Interface**: giao diện cho người dùng tương tác. Chỉ có trên Client.

**Phía Server:**
- **Server Protocol Interpreter (Server-PI)** : Chịu trách nhiệm quản lí Control Connection trên Server. Nó lắng nghe yêu cầu kết nối hướng từ user trên cổng 21. Khi kết nối được thiết lập, nó nhận lệnh từ User-PI, gửi phản hồi và quản lí tiến trình truyền dữ liệu trên Server.
- **Server Data Transfer Process (Server-DTP)** : chịu trách nhiệm nhận và gửi file từ User-DTP. Server-DTP vừa làm nhiệm vụ thiết lập Data Connection và lắng nghe Data Connection của User thông qua cổng 20. Nó tương tác với Server File System trên hệ thống cục bộ để đọc và chép file.

**Phía Client:**
- **User Interface**: Đây là chương trình được chạy trên máy tính, nó cung cấp giao diện xử lí cho người dùng. Nó cho phép người dùng sử dụng những lệnh đơn giản để điều khiển các session FTP, từ đó có thể theo dõi được các thông tin và kết quả xảy ra trong quá trình.
- **User Protocol Interpreter (User-PI)**: Chịu trách nhiệm quản lí Control Connection phía Client. Nó khởi tạo phiên kết nối FTP bằng việc phát hiện ra Request tới Server-PI. Sau khi kết nối được thiết lập, nó xử lí các lệnh nhận được trên User Interface, gửi chúng tới Server-PI rồi đợi nhận Response trở lại. Nó cũng quản lí các tiến trình trên Client.
- **User Data Transfer Process (User-DTP)**: Có nhiệm vụ gửi hoặc nhận dữ liệu từ Server-DTP. User-DTP có thể thiết lập hoặc lắng nghe DataConnection từ Server thông qua cổng 20. Nó tương tác với Client File System trên Client để lưu trữ file.

### 2. Nguyên lí hoạt động của FTP
Cần có 2 kết nối TCP trong phiên làm việc của FTP: TCP Data connection trên cổng 20, TCP Control connection trên cổng 21. Control connection luôn được mở ở mọi thời điểm khi dữ liệu hoặc lệnh được gửi. Data connection chỉ được mở khi có trao đổi dữ liệu thực. Trình tự chung của FTP hoạt động như sau:

1. FTP Client mở Control connection đến FTP server (trên port 21) và chỉ định 1 cổng trên Client để Server gửi lại phản hồi. Đường kết nối này dùng để truyền lệnh và không phải là dữ liệu. Control connection sẽ mở trong suốt thời gian của phiên làm việc (telnet giữa 2 hệ thống)
2. Client chuyển tiếp thông tin như username, password tới Server để thực hiện xác thực (authentication). Server sẽ trả lời bằng mã chấp nhận hay từ chối của các request.
3. Client gửi thêm các lệnh với tên tệp, kiểu dữ liệu, ... để vận chuyển, thêm luồng dữ liệu(tức là chuyển tập tin từ máy khách đến máy chử hoặc ngược lại). Server sẽ responds với mã (code) chấp nhận hoặc từ chối.
4. Khi dữ liệu đã sẵn sàng, 2 bên sẽ mở kết nối TCP trên cổng 20.
5. Dữ liệu có thể được vận chuyển giữa Client và Server trên cổng 20. Dữ liệu vận chuyển được mã hóa theo 1 số định dạng bao gồm NVT-ASCII hoặc nhị phân(binary)
6. Khi quá trình vận chuyển dữ liệu được hoàn thành, phiên làm việc của FTP sẽ đóng lại Data Connection trên cổng 20. Nhưng vẫn giữ Control Connection trên công 21.
7. Control connection có thể được sử dụng để thiết lập truyền dữ liệu khác hoặc đóng liên kết.

Các lệnh FTP trên Control port được gửi dưới dạng Text Header và được định dạng theo tiêu chuẩn RFC 822. Mỗi lệnh bao gồm 1 chuỗi 4 kí tự dạng ASCII được đặt trong `<CR><LF>`. Một số lệnh yêu cầu thêm tham số. Các lệnh được chia thành các dịch vụ, vận chuyển và kiểm soát truy cập.

### 3. Một số lệnh FTP hữu ích
|Command|Đối số(Argument)|Mô tả (Description)|
|---|---|---|
|`USER`|username|Username cấp bởi ISP|
|`PASS`|password|Password (cấp bởi ISP|
|`ACCT`|account info|User account|
|`CWD`|pathname|Thay đổi thư mục làm việc|
|`CDUP`|none|Thay đổi thư mục cha|
|`SMNT`|pathname|Kết cấu|
|`REIN`|none|Chấm dứt và khởi động lại|
|`QUIT`|none|Đăng xuất khỏi FTP|
|`RETR`|pathname|Lấy tập tin từ máy chủ|
|`STOR`|pathname|Lưu trữ dữ liệu đến máy chủ|
|`RNFR`|pathname|Rename 'from'|
|`RNTO`|pathname|Rename 'to'|
|`DELE`|pathname|Xóa file|
|`RMD`|pathname|Xóa thư mục|
|`MKD`|pathname|Tạo thư mục|
|`LIST`|pathname|Liệt kê tập tin hoặc văn bản|
|`STAT`|pathname|Status|
|`HELP`|subject|In ra màn hình trợ giúp|
|`PORT`|host-port|Chỉ định cổng để vận chuyển(không mặc định)|
|`TYPE`|type code|Kiểu vận chuyển(ASCII, image, ...)|
|`MODE`|mode code|Chế độ truyền(stream, block, ...)|

### 4. Code reply
Telnet thủ công có thể được sử dụng để truyền tay các lệnh. Khi đó, kết nối sẽ không quá khác so với session nhắc lệnh (command prompt session) của DOS.

Định dạng các Code reply:  `Xyz`

|Reply|Mô tả|
|---|---|
|`1yz`|Đã khởi tạo hành động. Chờ 1 reply trước khi gửi 1 lệnh khác|
|`2yz`|Hành động hoàn thành. Có thể gửi lệnh mới|
|`3yz`|Lệnh được chấp nhận. Nhưng bị giữ do thiếu thông tin|
|`4yz`|Lệnh không được chấp nhận hoặc không hoàn thành. Tình trạng lỗi tồn tại tạm thời. Lệnh có thể được ban hanh lại|
|`5yz`|Lệnh không được chấp nhận hoặc đã hoàn thành. Không ban hành lại lệnh, ban hành lại lệnh sẽ dẫn đến cùng một lỗi|

Trong đó, `y` cung cấp thêm thông tin về câu trả lời (reply). `z` cũng cung cấp thêm thông tin nhưng ý nghĩa chính xác có thể khác nhau giữa các cài đặt.

|Value|Description|
|---|---|
|`X0z`|Lỗi cú pháp hoặc lệnh bất hợp pháp|
|`X1z`|Trả lời Request thông tin|
|`X2z`|Trả lời đề cập đến Connection management|
|`X3z`|Trả lời lệnh xác thực|
|`X5z`|Trả lời trạng thái máy chủ|

### Chú ý:
Điều quan trọng cần lưu ý trong FTP, các Request không nhất thiết phải được thực hiện theo cùng 1 trình tự khi đã gửi, các giao dịch (transactions) và trả lời (reply) có thể được xen kẽ.