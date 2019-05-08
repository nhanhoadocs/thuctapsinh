# Các Giao thức của tầng Application

#### Mục lục
[1. HTTP (HyperText Transfer Protocol)](#HTTP)

[2. FTP (File Transfer Protocol)](#FTP)

[3. Telnet (TerminaL Network)](#telnet)

[4. SMTP (Simple Mail Transfer Protocol)](#SMTP)

[5. POP3 (Post Office Protocol 3)](#POP3)

[6. IMAP (Internet Message Access Protocol)](#IMAP)
### <a name="HTTP"> 1. HTTP (HyperText Transfer Protocol) </a>

#### Khái niệm
- HTTP (HyperText Transfer Protocol - Giao thức truyền tải siêu văn bản) là một trong các giao thức chuẩn về mạng Internet, được dùng để liên hệ thông tin giữa Máy cung cấp dịch vụ (Web server) và Máy sử dụng dịch vụ (Web client), là giao thức Client/Server dùng cho World Wide Web – WWW

#### Công dụng
- HTTP là giao thức giúp cho việc truyền tải file từ một Web server vào một trình duyệt Web để người dùng có thể xem một trang Web đang hiện diện trên trình duyệt.

#### Port
- HTTP là một giao thức ứng dụng của bộ giao thức TCP/IP (các giao thức nền tảng cho Internet). Giao thức này sử dụng cổng 80 (port 80).

#### Cách thức hoạt động
- Có thể hiểu khi ta gõ vào 1 địa chỉ vào trình duyệt Web, lúc này trình duyệt Web sẽ gửi 1 yêu cầu qua giao thức Http đến Web server. Web server và sẽ nhận yêu cầu này và trả lại kết quả cho trình duyệt Web.

#### version
- Phiên bản đầu tiên của HTTP là HTTP V0.9 (1991). 

- HTTP lúc công bố đến nay đã trải qua nhiều phiên bản 1.x (1.0, 1.1, 1.2,1.3), đến ngày nay là phiên bản 2.x.

- HTTP/2 được công bố vào tháng 7 năm 2015.

### <a name="FTP"> 2. FTP (File Transfer Protocol) </a>

#### Khái Niệm
- FTP (viết tắt của File Transfer Protocol dịch ra là "Giao thức truyền tập tin") thường được dùng để trao đổi tập tin qua mạng lưới truyền thông dùng giao thức TCP/IP (chẳng hạn như Internet - mạng ngoại bộ - hoặc Intranet - mạng nội bộ).

#### Cách thức hoạt động
- Hoạt động của FTP cần có hai máy tính, một máy chủ và một máy khách). Máy chủ FTP, dùng chạy phần mềm cung cấp dịch vụ FTP, gọi là trình chủ, lắng nghe yêu cầu về dịch vụ của các máy tính khác trên mạng lưới. Máy khách chạy phần mềm FTP dành cho người sử dụng dịch vụ, gọi là trình khách, thì khởi đầu một liên kết với máy chủ.

#### Port
- FTP chạy trên hai cổng, 20 và 21, và chỉ chạy riêng trên nền của TCP. Máy chủ FTP lắng nghe các yêu cầu dịch vụ từ những kết nối vào máy của các trình khách FTP, trên cổng 21 và gửi dữ liệu ra từ cổng 20.

#### Công dụng
- Đường kết nối trên cổng 21 này tạo nên một dòng truyền điều khiển, cho phép các dòng lệnh được chuyển qua máy chủ FTP. 

#### Ứng dụng
- FTP client sẽ là giải pháp tốt nhất để truyền tải dữ liệu. Các chương trình FTP client sẽ thực hiện công việc kết nối đến máy chủ FTP thông qua 1 số ứng dụng như:
  - WinSCP
  - FileZilla
  - CyberDuck
  - ...

### <a name="telnet"> 3. Telnet (TerminaL Network) </a>

#### Khái Niệm

- Telnet là một giao thức máy tính cung cấp khả năng giao tiếp tương tác hai chiều cho các máy tính trên internet và mạng cục bộ LAN.  
- Telnet cung cấp một giao diện dòng lệnh đáp ứng hầu hết các tiêu chuẩn cơ bản. Dần dần, việc sử dụng Telnet không còn được khuyến khích bởi có sự xuất hiện của SSH, cũng như để đề phòng các nguy cơ về bảo mật nghiêm trọng do telnet thường được sử dụng trên môi trường mạng mở. Ngoài ra, telnet cũng thiếu các khả năng xác thực và mã hóa dữ liệu.

#### Port
- TELNET là một giao thức khách-chủ (client-server protocol), dựa trên nền TCP, và người dùng thường kết nối vào cổng 23 với một máy chủ, nơi cung cấp chương trình ứng dụng thi hành các dịch vụ.

#### Cách thức hoạt động
- Ví dụ về lệnh telnet

  - Một lệnh request Telnet được viết như sau (tên máy tính là giả định):

        telnet the.libraryat.xyz.edu

  - Sau khi gửi request, bạn sẽ nhận được lời nhắc đăng nhập bằng user id và mật khẩu. Nếu đăng nhập được chấp thuận, ta sẽ có thể sử dụng máy tính giống như bất kỳ người dùng nào đã sử dụng máy tính này mỗi ngày.

#### Giao thức telnet này không bao gồm đồ họa.

- Telnet là một giao thức máy tính dựa trên text. Không giống với các giao diện màn hình Firefox hoặc Google Chrome, màn hình của Telnet gần như không có gì để "xem". Sử dụng telnet hoàn toàn chỉ đơn giản là gõ trên bàn phím.
- Giao thức Telnet này được cài đặt sẵn trong Windows và có thể truy cập bất cứ lúc nào.

![Imgur](http://www.keil.com/pack/doc/mw6/Network/html/telnet_cli.png)

- Tới nay, telnet gần như không còn được sử dụng để kết nối máy tính nữa vì thiếu bảo mật. Tuy nhiên, giao thức này vẫn hoạt động và có thể được sử dụng trong Windows 10, Windows 8, Windows 7, Windows Vista, và ta có thể sẽ phải bật Telnet lên trước khi muốn sử dụng.

### <a name = "SMTP"> 4. SMTP (Simple Mail Transfer Protocol) </a>
#### Khái Niệm

- SMTP (viết tắt của Simple Mail Transfer Protocol) là giao thức truyền tải thư tín đơn giản. 

#### Công dụng
- SMTP là hệ thống truyền tải các thư điện tử qua mạng Internet, máy chủ này sẽ hỗ trợ các phần mềm chuyên gửi mail như Google, Yahoo có thể gửi nhiều thư tín cùng một lúc tới các máy khác nhau.

#### Hoạt động của SMTP
- Sau khi kết nối giữa người gửi và người nhận đã được thiết lập.
- Để kiểm tra SMTP của một máy chủ bất kỳ các webmaster thường sử dụng lệnh telnet ví dụ như sau:

      telnet smtp.gmail.com port

#### Port
- SMTP ports:
  - Port 25 – port không mã hóa
  - Port 465 – SSL/TLS port, có thêm giao thức SSL/TLS để mã hóa, cũng có thể được gọi là SMTPS.

#### Ứng dụng
- 1 số ứng dụng sử dụng giao thức SMTP
  - Sendmail.
  - Exim.
  - Postfix.
  - Qmail.

### <a name="POP3"> 5. POP3 (Post Office Protocol 3) </a>

#### khái Niệm
- POP3 là viết tắt của Post Office Protocol 3 là phiên bản thứ 3 của phương thức nhận email, nó hoạt động giống như bưu điện khi có email gửi đến server mail nó sẽ thực hiện nhận email từ server và sau đó thực hiện xóa bản sao trên máy chủ.

##### Công dụng

- POP3 ngày nay được phát triển ngày một tốt hơn với khả năng cấu hình download mail từ máy chủ nhiều lần sau khoảng thời gian quy định mới xóa.

- Mặc dù máy chủ thư điện tử có các giao thức có thể thay thế như IMAP nhưng người ta vẫn ưu thích sử dụng phương thức POP3 trong nhận mail hơn vì khả năng phát sinh lỗi của nó rất thấp,  và sự họat động ổn định.

#### Port
- hầu hết các ứng dụng hiện nay đều sử dụng cổng 110 để kết nối POP3

##### ứng dụng

![img](https://tinomail.com/wp-content/uploads/2018/06/Outlook.png)

- Bởi vì tính đơn giản trong việc truy xuất và lưu trữ email POP3 được sử dụng trong rất nhiều ứng dụng miễn là ta cấu hình giao thức nhận mail đúng thì POP3 sẽ hoạt động vì vậy có nhiều ứng dụng cấu hình POP3 thành giao thức mặc định trong đó có thể kể đến như Gmail, Outlook, Eudora,…. Mỗi máy chủ thư điện tử POP3 sẽ có địa chỉ khác nhau thường được cung cấp bởi các đơn vị lưu trữ web, địa chỉ này được nhận diện trong các trương trình nhằm đảm bảo email đến đúng địa chỉ.

#### Version
- Trước POP3, đã có 2 phiên bản là POP1 và POP2. Khi POP3 ra đời, đã ngay lập tức thay thế hoàn toàn các phiên bản cũ. Vì vậy, ngày nay, nhắc đến POP thì thường là ám chỉ POP3.

### <a name="IMAP"> 6. IMAP (Internet Message Access Protocol) </a>

#### Khái niệm
- IMAP (Internet Message Access Protocol), POP3 cũng đều được dùng để kéo emails server về emails client, tuy nhiên khác biệt với POP3 là nó chỉ kéo bản sao về, nội dung email vẫn còn trên server.

#### Công dụng
- IMAP được thiết kế với mục tiêu cho phép quản lý hoàn toàn hộp thư email của nhiều khách hàng email, do đó, người dùng thường để lại thư trên máy chủ cho đến khi người dùng xóa chúng một cách rõ ràng.

#### Ứng dụng
- Hầu như tất cả các máy khách và máy chủ email hiện đại đều hỗ trợ IMAP, cùng với POP3 (Post Office Protocol) trước đó là hai giao thức tiêu chuẩn phổ biến nhất để truy xuất email.  Nhiều nhà cung cấp dịch vụ webmail như Gmail, Outlook.com và Yahoo! Mail cũng cung cấp hỗ trợ cho IMAP hoặc POP3.

#### Port IMAP mặc định
- IMAP ports:
  - Port 143 – port không mã hóa
  - Port 993 – SSL/TLS port, cũng có thể được gọi là IMAPS

#### Version
- IMAP đã trải qua một số phiên bản trước VERSION 4 (IMAP4) hiện tại như là:
  - IMAP ban đầu:
  - IMAP2
  - IMAP3
  - IMAP2bis
  - Và hiện tại là IMAP4


