# Cấu hình SSL/TLS trên Apache
## **1) Khái niệm**
- **SSL - Secure Sockets Layer** là một chuẩn công nghệ bảo mật cho việc tạo ra link kết nối được mã hóa giữa Web Server và Client ( hay đơn giản là website và trình duyệt ) hoặc 1 Mail Server và 1 Mail Client ( VD : **Outlook** ) .
- **SSL** cho phép các thông tin nhạy cảm như thẻ tín dụng , thông tin cá nhân , thông tin đăng nhập ,...được truyền 1 cách bảo mật . Bình thường , dữ liệu được truyền giữa trình duyệt và Web Server ở dạng ***plain-text*** , dẫn đến thông tin người dùng có thể bị xâm phạm bởi hacker . Nếu hacker có thể capture được các gói tin được truyền giữa trình duyệt và Web Server , họ có thể đọc được nội dung của chúng và sử dụng cho mục đích xấu .
- Tất cả trình duyệt đều có khả năng tương tác với Web Server sử dụng giao thức **SSL** . Tuy nhiên , trình duyệt và Server cần **chứng chỉ SSL - SSL Certificate** để thiết lập phiên kết nối bảo mật .
- **SSL** bảo mật cho dữ liệu của hàng triệu người hàng ngày trên Internet , đặc biệt trong suốt những giao dịch online hay truyền các thông tin cần bảo mật .
- **TLS - Transport Layer Security** cũng giúp bảo mật thông tin truyền giống như **SSL** . Nhưng vì **SSL** không còn được phát triển nữa , nên **TLS** mới là thuật ngữ đúng nên dùng .
- **HTTPS** là phần mở rộng bảo mật của **HTTP** . Website được cài đặt chứng chỉ **SSL/TLS** có thể dùng giao thức **HTTPS** để thiết lập kênh kết nối an toàn tới server . **HTTPS** sử dụng port `443/tcp` .
- Có thể biết được website có đang dùng chứng chỉ bảo mật **SSL/TLS** hay không đơn giản bằng cách nhìn vào icon trong URL ngay trong thanh địa chỉ . Icon này được gọi là **EV indicator - Extended Validation SSL Certificates** :

    <img src=https://i.imgur.com/WbYzQRb.png>
    <img src=https://i.imgur.com/YQ8Yzv2.png>

## **2) Hoạt động của SSL/TLS**
- **Chứng chỉ SSL** có 1 cặp key-pair : 1 **public key** và 1 **private key** . Chúng hoạt động cùng nhau để tạo ra kết nối mã hóa .
- **Chứng chỉ SSL** cũng bao gồm 1 phần gọi là "**subject**" , dùng để nhận biết chủ sở hữu của webste/certificate .
- Để có được **chứng chỉ SSL** , cần phải tạo 1 **CSR - Certificate Signing Request** trên Server . Quá trình này sẽ tạo ra **private key** và **public key** trên Server . File **CSR** được gửi đến **nhà phát hành chứng chỉ SSL** ( hay còn gọi là **Certificate Authority - CA** ) chứa trong đó **public key** . Bên **CA** sẽ sử dụng file **CSR** để tạo ra 1 cấu trúc dữ liệu match với **private key** . Tuy nhiên , bên **CA** sẽ không thể thấy được **private key**
- Một khi nhận được **chứng chỉ SSL** , bạn sẽ cài đặt nó trên Server . Bạn cũng phải cài đặt đồng thời 1 chứng chỉ trung gian mà thiết lập sự tin tưởng của **chứng chỉ SSL** bằng cách nhập nó vào **root certificate** của **CA** . Hướng dẫn cài đặt và test **chứng chỉ** sẽ khác nhau tùy vào server .
- Phần quan trọng nhất của 1 **chứng chỉ SSL** là nó có chữ ký số của **trustedCA** ( vd : `DigiCert Inc` ) . Bất kỳ ai cũng có thể tạo ra **chứng chỉ** , nhưng trình duyệt chỉ tin tưởng **trust certificates** đến từ 1 tổ chức hoặc danh sách **trusted CA** của họ . Trình duyệt thường đã có sẵn danh sách **trusted CAs** , được gọi là **Trusted Root CA store** .
- Để được thêm vào **Trusted Root CA store** và trở thành **Certificate Authority** , 1 công ty phải tuân theo và được kiểm định về các chuẩn bảo mật và xác thực được thiết lập bởi trình duyệt .
- Khi 1 chứng chỉ **SSL** được phát hành bởi **CA** tới 1 tổ chức và **domain/website** của công ty đã kiểm nghiệm 1 bên thứ 3 ( **trusted third party**  đã xác thực cho tổ chức . Khi trình duyệt trust **CA** , trình duyệt sẽ trust rằng công ty đã được định danh . Trình duyệt sẽ cho user biết "*website is secure*" và user có thể lướt web an toàn
- Các bước tạo chứng chỉ :

    <img src=https://i.imgur.com/EsMFmWD.png>

    - 1 . Trình duyệt kết nối tới Web Server ( website ) . Trình duyệt sẽ yêu cầu server tự định danh chính nó .
    - 2 . Server gửi 1 bản copy **chứng chỉ SSL** của nó , trong đó bao gồm **public key** .
    - 3 . Trình duyệt sẽ kiểm 
## **3) Cấu hình HTTPS - SSL - TLS**
- **B1 :** Cài đặt module `mod_ssl` và các gói `openssl` :
    ```
    # yum install -y mod_ssl openssl
    ```
    => Lệnh sẽ thực hiện tạo ra file cấu hình chính : `/etc/httpd/conf.d/ssl.conf`
- **B2 :** Tạo thư mục chứa `server key` và `certificate` :
    ```
    # mkdir /etc/httpd/ssl
    ```
- **B3 :** Tạo ***SSL key*** và ***certificate*** :
    ```
    # openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt
    ```
    - Trong đó :
        - `openssl` : là công cụ cơ bản để quản lý ***OpenSSL certificates*** , ***keys*** , và các file khác .
        - `req -x509` : tùy chọn sử dụng chuẩn `x509` . `x509` là chuẩn kiến trúc ***public key*** mà **SSL** và **TLS** sử dụng cho việc quản lý ***key*** và ***certificates*** .
        - `-nodes` : tùy chọn bỏ qua bảo mật bằng cách nhập ***passphrase*** ( nếu không có tùy chọn này sẽ phải nhập lại 1 đoạn ***passphrase*** mỗi lần khởi động lại Server )
        - `-days 365` : tùy chọn thời gian hết hạn cho ***key*** và ***certificate***
        - `-newkey rsa:2048` : tùy chọn tạo ***key*** và ***certificate*** cùng 1 lúc . `rsa:2048` cho biết ***key*** dài `2048 bit`
        - `keyout` : khai báo nơi lưu ***private key***
        - `out` : khai báo nơi lưu ***certificate***
    - Sau khi thực hiện lệnh , 1 bảng prompt hiện ra yêu cầu nhập thông tin của Website :

        <img src=https://i.imgur.com/0ocRj3z.png>

        > `Common Name` là dòng quan trọng nhất , nếu có domain name thì ghi domain name , nếu không thì thay thế bằng IP Public
- **B4 :** Thêm virtual host cho website HTTPS :
    ```
    # vi /etc/httpd/conf.d/ssl.conf
    ```
    - Tại dòng `59` , bỏ dấu `#` ở đầu dòng :

        <img src=https://i.imgur.com/DYE1lsh.png>
    
    - Tại dòng `100` , khai báo nơi lưu ***certificate*** :

        <img src=https://i.imgur.com/Oh0AZRo.png>

    - Tại dòng `107` , khai báo nơi lưu ***private key*** :

        <img src=https://i.imgur.com/1qmyukh.png>

- **B5 :** Cho phép dịch vụ **HTTPS** trên **firewalld** :
    ```
    # firewall-cmd --zone=public --permanent --add-service=https
    # firewall-cmd --reload
    ```
- **B6 :** Khởi động lại dịch vụ `httpd` :
    ```
    # systemctl restart httpd
    ```
- **B7 :** Truy cập trang web từ Client :
    ```
    https://<ip_web_server>
    ```
    - Do trình duyệt không trust ***certificate*** vừa tạo nên sẽ xuất hiện cảnh báo . Chọn ***Advanced*** : 

        <img src=https://i.imgur.com/2Kpfnbi.png>

    - Chọn ***Accept the Risk and Continue*** :

        <img src=https://i.imgur.com/DaGyfbe.png>

    - Truy cập trang web thành công :

        <img src=https://i.imgur.com/SLIvwSW.png>

## **4) Cấu hình tự động chuyển hướng từ HTTP -> HTTPS**
