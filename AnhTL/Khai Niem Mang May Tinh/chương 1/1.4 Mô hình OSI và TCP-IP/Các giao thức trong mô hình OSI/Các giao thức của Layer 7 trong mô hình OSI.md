# Các Giao thức của tầng Application
#### Mục lục
[1. HTTP (HyperText Transfer Protocol)](#HTTP)

[2. FTP (File Transfer Protocol)](#FTP)

[3. Telnet (TerminaL Network)] (telnet)

[4. SMTP (Simple Mail Transfer Protocol)](SMTP)

[5. POP3 (Post Office Protocol 3)](POP3)

### <a name="HTTP"> 1. HTTP (HyperText Transfer Protocol) </a>

#### Khái Niệm.
- HTTP (HyperText Transfer Protocol - Giao thức truyền tải siêu văn bản) là một trong các giao thức chuẩn về mạng Internet, được dùng để liên hệ thông tin giữa Máy cung cấp dịch vụ (Web server) và Máy sử dụng dịch vụ (Web client), là giao thức Client/Server dùng cho World Wide Web – WWW

- HTTP là một giao thức ứng dụng của bộ giao thức TCP/IP (các giao thức nền tảng cho Internet). Giao thức này sử dụng cổng 80 (port 80) là chủ yếu.

- Hay bạn có thể hiểu khi bạn gõ vào 1 địa chỉ vào trình duyệt Web, lúc này trình duyệt Web sẽ gửi 1 yêu cầu qua giao thức Http đến Web server. Web server và sẽ nhận yêu cầu này và trả lại kết quả cho trình duyệt Web.

### <a name="FTP"> 2. FTP (File Transfer Protocol) </a>

#### Khái Niệm.
- FTP (viết tắt của File Transfer Protocol dịch ra là "Giao thức truyền tập tin") thường được dùng để trao đổi tập tin qua mạng lưới truyền thông dùng giao thức TCP/IP (chẳng hạn như Internet - mạng ngoại bộ - hoặc Intranet - mạng nội bộ).

- Hoạt động của FTP cần có hai máy tính, một máy chủ và một máy khách). Máy chủ FTP, dùng chạy phần mềm cung cấp dịch vụ FTP, gọi là trình chủ, lắng nghe yêu cầu về dịch vụ của các máy tính khác trên mạng lưới. Máy khách chạy phần mềm FTP dành cho người sử dụng dịch vụ, gọi là trình khách, thì khởi đầu một liên kết với máy chủ.

#### Khái Quát.
- FTP chạy trên hai cổng, 20 và 21, và chỉ chạy riêng trên nền của TCP. Trình chủ FTP lắng nghe các yêu cầu dịch vụ từ những kết nối vào máy của các trình khách FTP, trên cổng 21.
- Đường kết nối trên cổng 21 này tạo nên một dòng truyền điều khiển, cho phép các dòng lệnh được chuyển qua trình chủ FTP. 
- Để truyền tải tập tin qua lại giữa hai máy, chúng ta cần phải có một kết nối khác. Tùy thuộc vào chế độ truyền tải được sử dụng, trình khách (ở chế độ chủ động - active mode) hoặc trình chủ (ở chế độ bị động - passive mode) đều có thể lắng nghe yêu cầu kết nối đến từ đầu kia của mình.
- Trong trường hợp kết nối ở chế độ chủ động, (trình chủ kết nối với trình khách để truyền tải dữ liệu), trình chủ trước tiên phải đóng kết nối vào cổng 20, trước khi liên lạc và kết nối với trình khách.
- Trong chế độ bị động, hạn chế này được khắc phục, và việc đóng kết nối trước là một việc không cần phải làm.

#### Mục đích của giao thức FTP.
  - Khuyến khích việc dùng chung tập tin (như chương trình ứng dụng hoặc dữ liệu).
  - Khuyến khích việc sử dụng máy tính ở xa một cách gián tiếp / âm thầm (implicit).
  - Che đậy sự khác biệt về hệ thống lưu trữ tập tin giữa các máy chủ, để cho người dùng không cần phải quan tâm đến những sự khác biệt riêng tư của chúng.
  - Truyền tải dữ liệu một cách đáng tin cậy và có tính hiệu quả cao.


### <a name="Telnet"> 3. Telnet (TerminaL Network) </a>
#### Khái Niệm

- Telnet là một giao thức máy tính cung cấp khả năng giao tiếp tương tác hai chiều cho các máy tính trên internet và mạng cục bộ LAN. Telnet được biết đến là giao thức đầu tiên được sử dụng khi internet ra mắt lần đầu vào năm 1969. Telnet cung cấp một giao diện dòng lệnh đáp ứng hầu hết các tiêu chuẩn cơ bản. Dần dần, việc sử dụng Telnet không còn được khuyến khích bởi có sự xuất hiện của SSH, cũng như để đề phòng các nguy cơ về bảo mật nghiêm trọng do telnet thường được sử dụng trên môi trường mạng mở. Ngoài ra, telnet cũng thiếu các chính sách xác thực và khả năng mã hóa dữ liệu.

- Giao thức Telnet không an toàn được phát triển thành một giao thức mạng mới có tên gọi là Secure Socket Shell (SSH), và hiện nay SSH là giao thức chủ yếu các quản trị viên mạng hiện đại sử dụng để quản lý các máy tính Linux và Unix từ xa. SSH cung cấp khả năng xác thực và bảo mật các dữ liệu mã hóa mạnh giữa các máy tính trên một mạng có độ tin cậy không cao.

- Ví dụ về lệnh telnet

  - Một lệnh request Telnet được viết như sau (tên máy tính là giả định):

   telnet the.libraryat.xyz.edu

  - Sau khi gửi request, bạn sẽ nhận được lời nhắc đăng nhập bằng user id và mật khẩu. Nếu đăng nhập được chấp thuận, bạn sẽ có thể sử dụng máy tính giống như bất kỳ người dùng nào đã sử dụng máy tính này mỗi ngày.

#### Giao thức telnet nà không bao gồm đồ họa.

- Telnet là một giao thức máy tính dựa trên text. Không giống với các giao diện màn hình Firefox hoặc Google Chrome, màn hình của Telnet gần như không có gì để "xem". Sử dụng telnet hoàn toàn chỉ đơn giản là gõ trên bàn phím. Telnet không có các yếu tố đồ họa mà chúng ta vẫn thường thấy trên các trang web hiện đại ngày nay. Các lệnh Telnet có thể khá khó hiểu, với các lệnh mẫu bao gồm z và prompt% fg. Hầu hết người dùng hiện đại sẽ cảm thấy giao diện màn hình Telnet hiển thị thô sơ và chậm chạp.

![Imgur](http://www.keil.com/pack/doc/mw6/Network/html/telnet_cli.png)

- Tới nay, telnet gần như không còn được sử dụng để kết nối máy tính nữa vì thiếu bảo mật. Tuy nhiên, giao thức này vẫn hoạt động và có thể được sử dụng trong Windows 10, Windows 8, Windows 7, Windows Vista, và bạn có thể sẽ phải bật Telnet lên trước khi muốn sử dụng.

### <a name = "SMTP"> 4. SMTP (Simple Mail Transfer Protocol) </a>
#### SMTP là gì ?

- SMTP (viết tắt của Simple Mail Transfer Protocol) là giao thức truyền tải thư tín đơn giản. Nó là hệ thống chuyển tải các thư điện tử qua mạng Internet, máy chủ này sẽ hỗ trợ các phần mềm chuyên gửi mail như Google, Yahoo có thể gửi nhiều thư tín cùng một lúc tới các máy chủ khác nhau.

#### Hoạt động của SMTP.
- Sau khi kết nối giữa người gửi (trình khách) và người nhận (trình chủ) đã được thiết lập.
- Để kiểm tra SMTP của một máy chủ bất kỳ các webmaster thường sử dụng lệnh telnet ví dụ như sau:

        $ telnet smtp.gmail.com port

- Trong đó Port có nhiều dạng port: 465, 25… Khi bạn gửi thư cho một người, bạn sử dụng một ứng dụng thư nó được chọn bởi một máy chủ thư đi (gọi là máy chủ SMTP ) và bắt đầu một cuộc trò chuyện được gửi đến bạn bè của bạn.

- SMTP ports:

  - Port 25 – port không mã hóa
  - Port 465 – SSL/TLS port, cũng có thể được gọi là SMTPS.

### <a name="POP3"> 5. POP3 (Post Office Protocol 3) </a>

#### POP3 là gì ?
- POP3 là viết tắt của Post Office Protocol 3 là phiên bản thứ 3 của phương thức nhận email, nó hoạt động giống như bưu điện khi có email gửi đến server mail nó sẽ thực hiện nhận email từ server và sau đó thực hiện xóa bản sao trên máy chủ.

#### giao thức POP3 trong email.

##### Chức năng máy chủ email

- POP3 ngày nay được phát triển ngày một tốt hơn với khả năng cấu hình download mail từ máy chủ nhiều lần sau khoảng thời gian quy định mới xóa tuy nhiên phương thức này chỉ dành cho những người quản trị có kinh nghiệm còn với phần lớn người hiện nay thì nó vẫn chưa khả quan.

- Mặc dù máy chủ thư điện tử có các giao thức có thể thay thế như IMAP nhưng người ta vẫn ưu thích sử dụng phương thức POP3 trong nhận mail hơn vì khả năng phát sinh lỗi của nó rất thấp, bên cạnh đấy có nhiều phiên bản nâng cấp của POP nhưng phiên bản POP3 vẫn là phiên bản được sử dụng nhiều nhất hiện nay với sự hoạt động ổn định.

##### Làm việc cùng ứng dụng.

![img](https://tinomail.com/wp-content/uploads/2018/06/Outlook.png)

- Bởi vì tính đơn giản trong việc truy xuất và lưu trữ email POP3 được sử dụng trong rất nhiều ứng dụng miễn là bạn cấu hình giao thức nhận mail đúng thì POP3 sẽ hoạt động vì vậy có nhiều ứng dụng cấu hình POP3 thành giao thức mặc định trong đó có thể kể đến như Outlook, Eudora,…. Mỗi máy chủ thư điện tử POP3 sẽ có địa chỉ khác nhau thường được cung cấp bởi các đơn vị lưu trữ web, địa chỉ này được nhận diện trong các trương trình nhằm đảm bảo email đến đúng địa chỉ, hầu hết các ứng dụng hiện nay đều sử dụng cổng 110 để kết nối POP3.

## Lời Kết
- Trên đây mình đã giới thiệu tổng quan về các giao thức của layer 7 trong mô hình OSI. Hi vọng bài viết sẽ giúp bạn hiểu được rõ hơn về các giao thức trong layer 7.