# Cài chứng chỉ SSL miễn phí từ Let’s Encrypt cho các website

<img src="../images/Chung-chi-SSL.png">  

## Mục lục

## Giới thiệu
- SSL là chữ viết tắt của Secure Sockets Layer (Lớp socket bảo mật). Một loại bảo mật giúp mã hóa liên lạc giữa website và trình duyệt. Công nghệ này đang lỗi thời và được thay thế hoàn toàn bởi TLS.

- TLS là chữ viết tắt của Transport Layer Security, nó cũng giúp bảo mật thông tin truyền giống như SSL. Nhưng vì SSL không còn được phát triển nữa, nên TLS mới là thuật ngữ đúng nên dùng.

- Let’s Encrypt là một tổ chức xác thực SSL giống như Comodo, GeoTrust, Symantec nhưng cái khác là họ là tổ chức phi lợi nhuận được thành lập với sự bảo trợ của những tổ chức lớn trên thế giới Cisco, Akamai, Mozilla, Facebook,…với mục đích là cung cấp chứng chỉ SSL miễn phí cho mọi người giúp mọi website đều được mã hóa, tạo nên một môi trường internet an toàn hơn.

- HTTPS là phần mở rộng bảo mật của HTTP. Website được cài đặt chứng chỉ SSL/TLS có thể dùng giao thức HTTPS để thiết lập kênh kết nối an toàn tới server. Tóm lại, các điều cơ bản bạn cần nắm rõ về SSL là:

    - Mục tiêu của SSL/TLS là bảo mật các thông tin nhạy cảm trong quá trình truyền trên internet như, thông tin cá nhân, thông tin thanh toán, thông tin đăng nhập.
    - Nó là giải pháp thay thế cho phương pháp truyền thông tin văn bản dạng plain text, văn bản loại này khi truyền trên internet sẽ không được mã hóa, nên việc áp dụng mã hóa vào sẽ khiến cho các bên thứ 3 không xâm nhập được bào thông tin của bạn, không đánh cắp hay chỉnh sửa được các thông tin đó.
    - Hầu hết mọi người đều quen thuộc với các chứng chỉ SSL/TLS, đang được dùng bởi các website lớn và các webmaster nghiêm túc trong việc bảo vệ các giao dịch người dùng.
    Bạn có thể biết được website có đang dùng chứng chỉ bảo mật - SSL/TLS hay không đơn giản bằng cách nhìn vào icon trong URL ngay trong thanh địa chỉ.

- Các hoạt động xảy ra khi máy tính kết nối đến 1 website đã được chứng thực

  <img src="../images/ssl_2.jpg">  

- Trình duyệt làm thế nào để kiểm tra một SSL là có thực hay không?

  Khi Website gửi cho trình duyệt một chứng chỉ SSL, trình duyệt sẽ gửi chứng chỉ này đến một máy chủ lưu trữ các chứng chỉ số đã được phê duyệt. Về mặt kỹ thuật, SSL sử dụng mã hóa công khai. Kỹ thuật này giúp cho Website và trình duyệt tự thỏa thuận (bước 4 ở hình trên) một bộ khóa sẽ dùng trong suốt quá trình trao đổi thông tin sau đó. Bộ khóa sẽ thay đổi theo mỗi trong lần giao dịch kế tiếp, một người khác sẽ không thể giải mã ngay cả khi có được dữ liệu của máy chủ lưu trữ chứng chỉ số nói trên.

- Có 2 cách tạo SSL:

  - Nhờ một tổ chức CA(Certification Authority) cấp, là tổ chức có độ tin cậy cao, được quyền cấp và chứng nhận SSL. Sẽ mất phí.
  - Self-signed SSL: là tự server cấp, tự kí, tự xác thực (ko an toàn và tin tưởng bằng nhờ bên thứ 3). Cách này sẽ free do người dùng sẽ tự cấu hình.  
  
Bài viết này sẽ hướng dẫn bạn nhận chứng chỉ SSL miễn phí từ Let's Encrypt và cài đặt SSL trên môi trường Apache và CentOS 8.

Xem thêm thông tin tại website chính thức của Let's Encrypt: *https://letsencrypt.org/*

***Chú ý:*** Chứng chỉ SSL được tạo theo cách này chỉ có tác dụng trong 90 ngày. Sau 90 ngày bạn sẽ cần update lại chứng chỉ. 

## Mô hình chuẩn bị


## Các bước thực hiện

### [1] Tạo một chứng chỉ SSL

- TLS/SSL hoạt động dựa vào sự kết hợp giữa một `public certificate` và một `private key`. `SSL key` được giữ bí mật ở trên server. Nó được sử dụng để mã hóa nội dung gửi tới clients.
Còn `SSL certificate` được chia sẻ rộng rãi với bất cứ ai yêu cầu nội dung. Nó được sử dụng để giải mã nội dung được ký bởi SSL key.

- Tạo một self-signed key và một cặp chứng chỉ với câu lệnh OpenSSL bằng cách thực hiện các bước:

  - Cài đặt gói `mod_ssl`

    ```sh
      dnf install -y mod_ssl
    ```

    Khi gói `mod_ssl` được cài đặt, nó sẽ tạo 1 [self-signed](https://linuxize.com/post/creating-a-self-signed-ssl-certificate/) và các certificate file cho localhost. Nếu các file không tự động được tạo, bạn có thể tạo lại bằng cách sử dụng câu lệnh `openssl`  

    ```sh
      openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes \
        -out /etc/pki/tls/certs/localhost.crt \
        -keyout /etc/pki/tls/private/localhost.key
    ```

    Trong đó:
  
    `openssl` là một command để tạo vào quản lý chứng chỉ OpenSSL , keys và các file khác.  
    `req` là một subcommand chỉ định rõ chúng ta mún sử dụng X.509 CSR (certificate signing request) : chứng chỉ yêu cầu ký.   
     `X.509` là một chuẩn public key của SSL và TLS.    
    `nodes` chỉ rõ OpenSSL bỏ qua việc bảo mặt chứng chỉ của chúng ta bằng một chuỗi mật khẩu (passphrase). Nếu để mật khẩu này thì nginx của chúng ta luôn phải nhập mật khẩu này mỗi khi khởi động nên rất là bất tiện.  
    `days 365` là tham số xác định thời hạn sử dụng chứng chỉ là 365 ngày (1 năm).  
    `newkey rsa:4096` là tham số chỉ định chúng ta muốn sinh ra một chứng chỉ mới và một key mới tại cùng câu lệnh với key RSA có độ dài 2048 bít.  
    `keyout` chỉ định nơi chứng ta lưu trữ private key được sinh ra lúc tạo  
    `out` chỉ định nơi chứng chỉ được lưu trữ sau khi tạo

  OUTPUT

  ```nginx
    Country Name (2 letter code) [XX]:VN
    State or Province Name (full name) []:Ha Noi
    Locality Name (eg, city) [Default City]:Ha Noi
    Organization Name (eg, company) [Default Company Ltd]:Test company
    Organizational Unit Name (eg, section) []:Test company
    Common Name (eg, your name or your server's hostname) []:server_IP_address
    Email Address []:havy.nt12@gmail.com
  ```

### [2] Cài đặt Certbot 

Certbot là một công cụ dòng lệnh miễn phí giúp đơn giản hóa quy trình lấy và gia hạn chứng chỉ SSL từ Let's Encrypt và tự động kích hoạt HTTPS trên máy chủ của bạn.

- Cài đặt các gói cần thiết

  ```sh
    dnf module -y install python36 
    dnf -y install gcc mod_ssl python3-virtualenv redhat-rpm-config augeas-libs libffi-devel openssl-devel 
  ```

- Tải về certbot script
  ```sh
    wget -P /usr/local/bin https://dl.eff.org/certbot-auto
  ```

- Sau khi tải xuống hoàn tất, cấp quyền cho file `certbot-auto`

  ```sh
    chmod 700 /usr/local/bin/certbot-auto
  ```

### [2] Cấu hình cách Certbot nhận và cài đặt chứng chỉ của bạn  

***Yêu cầu:*** Trên máy có sẵn 1 Web Server đang hoạt động như là Apache hoặc Nginx, trong bài lab này sử dụng Nginx.  

- Thêm đoạn cấu hình sau vào block server của file cấu hình cho website(ở đây là /etc/nginx/conf.d/www.thuyhiend.net) để cho phép truy cập vào thư mục ẩn (.well-known) phục vụ cho việc xác thực:
  ```nginx
  ...
    location ~ /.well-known {
        allow all;
   }
  ...
  ```

- Khởi động lại Nginx và kiểm tra lại hoạt động của website
  ```sh
    systemctl restart nginx
  ```

- Tạo SSL certificate (thay thuyhiend.net bằng tên miền của bạn và /usr/share/nginx/html/wordpress là đường dẫn đến thư mục gốc của website):

  ```sh
    certbot-auto certonly --webroot -w /usr/share/nginx/html/wordpress -d www.thuyhiend.net
  ```





### [3] Thiết lập gia hạn tự động  
- Sử dụng lệnh:
  ```sh
    echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew" | sudo tee -a /etc/crontab > /dev/null
  ```




















## TÀI LIỆU THAM KHẢO
- https://viblo.asia/p/https-va-ssl-OeVKBg4AZkW
- https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-setup-lets-encrypt-ssl-certificate-with-apache-on-rhel-8-centos-7-rhel-7.html
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-debian-10#step-1-%E2%80%94-creating-the-ssl-certificate
- https://viblo.asia/p/https-va-ssl-OeVKBg4AZkW