# Lệnh `curl`

Lệnh `curl` là một công cụ dòng lệnh để truyền dữ liệu đi hoặc từ một máy chủ, sử dụng cho bất kì giao thức nào được hỗ trợ (HTTP, FTP, IMAP, POP3, SCP, SFTP, SMTP, TFTP, TELNET, LDAP hoặc FILE). `curl` được cung cấp bởi Libcurl.

Lệnh này được ưa chuộng để tự động hóa, vì nó được thiết kế để hoạt động mà không có sự tương tác của người dùng. `curl` có thể vận chuyển nhiều tập tin cùng lúc.

## Cú pháp
```
curl [options] [URL...]
```

## Cài đặt 
Trên CentOS:
```
# yum install curl
```

Trên Debian/Unbuntu:
```
sudo apt-get install curl
```

## Ví dụ và các option
### 1. Hiển thị nội dung của URL trên màn hình
`# curl [url]`
```
[root@localhost ~]# curl google.com

<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
```

Có thể tải nhiều nhiều trang tương tự nhau:
```
curl http://site.{one, two, three}.com
```

Các trang với chuỗi số:
```
curl ftp://ftp.example.com/file[1-20].jpeg
```

### 2. Đồng hồ đo tiến độ (Process Meter)
Nếu bạn muốn theo dõi quá trình tải file như tốc độ truyền, lượng dữ liệu được truyền, thời gian còn lại, ... Ta thêm option `-#`

Ví dụ:
```
curl -# -o hello.zip ftp://speedtest.tele2.net/1MB.zip
```
<img src = "..\images\Screenshot_4.png">

### 3. Lưu file tải về với tên tùy chọn
`curl -o [file_name] [url]`
```
# curl -o hello.zip ftp://speedtest.tele2.net/1MB.zip
```

<img src ="..\images\Screenshot_5.png">

### 4. Tải file với tên giống trên URL
`curl -O [url]`
```
[root@localhost ~]# curl -O ftp://speedtest.tele2.net/1MB.zip
```

<img src = "..\images\Screenshot_6.png">

Tải xuống nhiều tệp:
```
# curl -O [url_1] -O [url_2] ...
```

### 5. Tiếp tục tải xuống các file bị gián đoạn
`curl -C - [url]`
```
curl -C - -O ftp://speedtest.tele2.net/1MB.zip
```

### 6. Tải file có yêu cầu xác thực từ FTP Server
`# curl -u {username}:{password} [FTP_URL]`
Ví dụ: Tải file có xác thực theo cách thông thường sẽ bị lỗi
```
[root@localhost ~]# curl -O ftp://test.rebex.net/readme.txt
```
<img src = "..\images\Screenshot_7.png">

Sử dụng option `-u` và nhập username và password thì quá trình tải xuống không có lỗi.
```
# curl -u demo:password -O ftp://test.rebex.net/readme.txt
```
<img src ="..\images\Screenshot_8.png">

### 7. Truy vấn HTTP Header
`curl -I [URL]`
Ví dụ:

<img src="..\images\Screenshot_9.png">

### 8. Lưu trữ 1 cookie
`# curl -c [tên_file_cookie] [url] -O`

`-c` = `--cookie`

Ví dụ
```
# curl --cookie-jar cnncookies.txt https://www.cnn.com/index.html -O
```

### 9. Gửi cookies
`# curl -c [tên_file_cookie] [url]`

Ví dụ:
```
# curl --cookie cnncookies.txt https://www.cnn.com
```

### 10. Giới hạn download
`curl --limit-rate [value] [URL]`

Tốc độ download sẽ được giữ xung quanh giới hạn ta đặt.

`value` : đơn vị là bytes.

Ví dụ:
```
curl --limit-rate 1000K -O ftp://speedtest.tele2.net/1MB.zip
```

<img src = "..\images\Screenshot_10.png">

### 11. Mô phỏng các Method HTTP
Cú pháp:
```
# curl -X [Method] [URL] -H "<Content_Type_Header>" -d "<data>"
```

**Trong đó**: 
- -X [Method]: Khai báo method sử dụng `GET`, `POST`, `DELETE`, `PUT`
- -H "<Content_Type_Header>": Header với kiểu nội dung của nó
    - -H "Content-Type: application/x-www-form-urlencoded" : Data dạng không mã hóa
    - -H "Content-Type: application/json": Data dạng Json
- [URL] : url trang web
- -d "<data>" : dữ liệu kèm Method. Có thể dùng string hoặc file.
    - Dạng không mã hóa: `-d "param1=value1&param2=value2"` hoặc `-d @data.txt`
    - Dạng Json: `-d '{"key1":"value1", "key2":"value2"}`' hoặc `-d @data.json`

**Ví dụ**: POST với data là username và password lên 1 trang đăng nhập của 1 web:

- POST dạng không mã hóa:
```
# curl -X POST http://localhost:3000/data -d "param1=value1&param2=value2" 
```
hoặc có Header:
```
# curl -X POST http://localhost:3000/data -H "Content-Type: application/x-www-form-urlencoded" -d "param1=value1&param2=value2"  
```
Với file:
```
# curl -X POST http://localhost:3000/data -d "@data.txt" 
```

- POST dạng Json
```
# curl -X POST http://localhost:3000/data -H "Content-Type: application/json" -d '{"key1":"value1", "key2":"value2"}' 
```
Với file:
```
# curl -X POST http://localhost:3000/data -d "@data.json" 
```

File `data.txt`
```
param1=value1&param2=value2
```

File `data.json`
```json
{
  "key1":"value1",
  "key2":"value2"
}
```
