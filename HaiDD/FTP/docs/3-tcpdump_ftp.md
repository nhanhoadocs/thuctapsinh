# TCPDUMP bắt các gói tin FTP

Chúng ta sẽ thực hiện bắt gói tin trên FTP Server khi *login*, *upload*, *download*.

Các bạn có thể thực hiện ở các trường hợp khác như tạo thư mục, xóa file, xóa thư mục, ... hoàn toàn tương tự.

### 1. Login vào FTP server
Trên FTP server
```
# tcpdump -i ens33 -vv -n port ftp -w ftp_login.pcap
```

Trên Client ta thực hiện đăng nhập.

<img src = "..\images\Screenshot_18.png">

Ta bắt được 15 gói tin. Ta sẽ mở file `ftp_login.pcap` bằng WireShark để xem các gói tin của FTP

<img src = "..\images\Screenshot_19.png">

Ta có thể thấy, Client sử dụng port ngẫu nhiên là 57927, gửi yêu cầu kết nối đến cổng 21 của FTP Server.

Sau khi xác nhận các yêu cầu, FTP Server đã trả về kết quả với code reply là 220 cùng phiên bản ftp Server là `vsFTPd 3.0.2`:

<img src ="..\images\Screenshot_20.png">

Xác nhận Option, client yêu cầu option UTF8, FTP Server đồng ý và trả về code reply 200 với thông điệp `Always in UTF8 mode`.

<img src = "..\images\Screenshot_21.png">

Client nhập username là `user1`, server gửi code reply 331 yêu cầu nhập password, client nhập password gửi đi, server xác nhận trả về code 230 Login successful.

<img src = "..\images\Screenshot_22.png">

### 2. Upload file lên FTP Server
FTP Server:
```
# tcpdump -i ens33 -vv -n port ftp -w ftp_upload.pcap
```
Trên Client ta sẽ thực hiện việc upload file:

<img src = "..\images\Screenshot_23.png">

Ta được các gói tin như sau:

<img src = "..\images\Screenshot_24.png">

Để ý 1 số gói tin sau:
- Gói tin 8: Client yêu cầu `STOR upload.ftp`. có nghĩa là Client muốn lưu trữ file `upload.ftp` lên ftp server.

<img src ="..\images\Screenshot_25.png">

- Gói tin 9 và 10: FTP server xác nhận trạng thái file (code : 150) và mở Data connection cho phép File tải lên server. Sau khi tải file lên hoàn thành, FTP server đóng Data connection (code 226), và gửi thông báo cho client là đã hoàn tất việc upload.

<img src = "..\images\Screenshot_26.png">

<img src = "..\images\Screenshot_27.png">

### 3. Download file từ FTP Server
FTP Server:
```
# tcpdump -i ens33 -vv -n port ftp -w ftp_download.pcap
```

Trên Client sẽ thực hiện việc download file `u1` từ FTP server về.

<img src = "..\images\Screenshot_28.png">

Ta mở file `ftp_download.pcap`:

<img src="..\images\Screenshot_29.png">

Phân tích các gói tin:
- Gói 1: Client yêu cầu kiểu vận chuyển(TYPE) file với giá trị I.

<img src="..\images\Screenshot_30.png">

- Gói 9: Client yêu cầu được tải file(RETR) `u1` từ FTP Server

<img src="..\images\Screenshot_31.png">

- Gói 10, 11: Server kiểm tra trạng thái file, và cho phép client download file, đồng thời mở Data connection để truyền file (code 150). Sau khi quá trình tải file hoàn thành Server đóng Data connection (code 226), đồng thời thông báo cho client biết quá trình tải file đã hoàn tất.

<img src ="..\images\Screenshot_32.png">

<img src ="..\images\Screenshot_33.png">
