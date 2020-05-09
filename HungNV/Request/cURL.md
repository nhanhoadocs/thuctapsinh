# cURL (client URL)

Là 1 tiện ích dòng lệnh để truyền dữ liệu đến 1 máy chủ được thiết kế để hoạt động mà không có sự tương tác của người dùng. Ta có thể sử dụng curl để tải xuống hoặc tải lên dữ liệu bằng 1 trong các giao thức hỗ trợ bao gồm HTTP, HTTPS, SCP, SFTP và FTP. 


### Lấy thông tin header của Response 

```
curl -I https://wordpress.hungnv99.com
```
```
HTTP/1.1 401 Unauthorized
Server: nginx/1.16.1
Date: Tue, 05 May 2020 08:20:47 GMT
Content-Type: text/html
Content-Length: 179
Connection: keep-alive
WWW-Authenticate: Basic realm="Basic Auth"
```

### Lấy thông tin đầy đủ của trang web 

Thông tin đầy đủ của `request` và `response`

```
curl -v https://wordpress.hungnv99.com
```

### Chỉ lấy thông tin body của response

```
https://wordpress.hungnv99.com
```

### Truyền dữ liệu lên 1 trang web 

Ví dụ để truyền dữ liệu đăng nhập vào 1 trang web

```
curl -d "param1=value1&param2=value2" -X POST https://wordpress.hungnv99.com/wp-login.php
```

Truy cập vào trang web có sử dụng authen 

```
curl -u user:password https://wordpress.hungnv99.com
```

### Tải về 1 file  

- Tải về và lưu tên file theo chỉ định 

Ví dụ: tải về và lưu file dưới tên `wp.txt`

```
curl -o wp.txt https://wordpress.hungnv99.com
```

- Tải về file và lưu tên file theo url

```
curl -O https://wordpress.hungnv99.com/wpr.txt
```
```
[thuctap@CentOS ~]$ ls
debugdump.txt  wP.txt  wplampcentos7.sh  wpr.txt
```

- Nếu tải xuống 1 file với lệnh sau : 

```
curl -O http://releases.ubuntu.com/18.04/ubuntu-18.04-live-server-amd64.iso
```
và bị mất kết nối trong khi đang tải, khi kết nối lại có thể tiếp tục tải về file đó như sau: 

```
curl -C - -O http://releases.ubuntu.com/18.04/ubuntu-18.04-live-server-amd64.iso
```


### Thay đổi Agent 

Ví dụ: Mô phỏng firefox 60 như sau: 

```
curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://wordpress.hungnv99.com
```

File log đã có như sau: 

```
admin [05/May/2020:15:55:33 +0700] "GET / HTTP/1.0" 200 26315 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0"
```


