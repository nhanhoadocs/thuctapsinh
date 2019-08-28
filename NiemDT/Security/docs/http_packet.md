# Phân tích gói tin http

Sử dụng tcpdump để bắt gói tin và dùng wireshark để phân tích gói tin http

![](../images/http_packet/http_3.png)

## Http request

![](../images/http_packet/http_1.png)

*GET / HTTP/1.1\r\n* xác định method được sử dụng ở đây là `GET` và version của của http là 1.1

*Host: dantri.vn\r\n* Địa chỉ của web server

*User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0\r\n* Thông tin của client (OS là ubuntu và trình duyệt web là firefox) để dựa vào đó web server có thể format định dạng phù hợp.

*Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n*  client nói với web server những định dạng mà nó accept.

*Accept-Language: en-US,en;q=0.5\r\n* Ngôn ngữ accept

*Accept-Encoding: gzip, deflate\r\n* kiểu encode được accept

*DNT: 1\r\n* Do Not Track không cho theo dõi người dùng

*Connection: keep-alive\r\n* Loại kết nối mong muốn (thường là keep-alive hoặc close)

*Upgrade-Insecure-Requests: 1\r\n*  cho phép tự động chuyển hướng từ http sang https

## Http response

![](../images/http_packet/http_2.png)

*HTTP/1.1 302 Moved Temporarily\r\n* version http là 1.1, status_code 302: bạn đã được server điều hướng đến một URL mới

*Server: nginx\r\n* web server đang chạy là nginx

*Date: Wed, 28 Aug 2019 07:16:05 GMT\r\n* Thời gian trên server

*Content-Type: text/html\r\n* nội dung được biểu thị dưới dạng

*Content-Length: 154\r\n* Độ dài của nội dung(ở đây tính bằng bytes)

*Location: https://dantri.com.vn/\r\n* Địa chỉ của web server
