# Tài liệu sử dụng Curl command 
- Curl command là một công cụ để  truyền dữ liệu đến một server, Lệnh này được thiết kế để hoạt động mà không cần tương tác của người dùng 

1. Cài đặt
```
sudo apt install curl 
```
2. Kiểm tra version 
```
curl --version
```
ví dụ 
```
anhduc@anhduc:~$ curl --version
curl 7.58.0 (x86_64-pc-linux-gnu) libcurl/7.58.0 OpenSSL/1.1.1 zlib/1.2.11 libidn2/2.0.4 libpsl/0.19.1 (+libidn2/2.0.4) nghttp2/1.30.0 librtmp/2.3
Release-Date: 2018-01-24
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets HTTPS-proxy PSL 
```
3. Download file 
```
curl -O http://yourdomain.com/yourfile.tar.gz # Save as yourfile.tar.gz
```
4. Tiếp tục tải những dịch vụ bị gián đoạn 
```
curl -C - -O http://yourdomain.com/yourfile.tar.gz
```
5. Tải xuống nhiêu tệp 
```
curl -O http://yoursite.com/info.html -O http://mysite.com/about.html
```
6. Truy vấn HTTP header
```
curl -I www.tecmint.com
```
7. Thực hiện một yêu cầu POST
```
curl --data "firstName=John&lastName=Doe" https://yourdomain.com/info.php
```
8. Lưu trữ cookies
```
curl --cookie-jar cnncookies.txt https://www.cnn.com/index.html -O
```
9. Gửi cookies 
```
curl --cookie cnncookies.txt https://www.cnn.com
```
10. Giới hạn download 
```
curl --limit-rate 100K http://yourdomain.com/yourfile.tar.gz -O
```