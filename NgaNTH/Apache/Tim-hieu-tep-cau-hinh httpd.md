### Tìm hiểu file cấu hình của Apache web server trong CentOS 7  
Khi làm việc với bất kỳ gói phần mềm nào thì chắc chắn bạn có hơn một lần thao tác với tệp cấu hình của nó. Là một admin quản trị Web trên Linux bạn sẽ rất vui khi nắm rõ được nội dung file cấu hình Web server. Bài viết này chia sẻ đến các bạn file cấu hình`httpd.conf` trong thư mục `/etc/httpd/conf` khi bạn cài đặt Web server trên máy chủ CentOS 7.  
  
`httpd.conf`là tệp chứa các chỉ thị cấu hình cung cấp các hướng dẫn cho máy chủ Apache HTTP server hoạt động. Sau đây ta cùng tìm hiểu nội dung cơ bản của file cấu hình.   
- `Server Root`: phần trên cùng của cây thư mục mà theo đó các tệp cấu hình, lỗi (error) và nhật ký (log) của máy chủ được lưu trữ. Mặc định đường dẫn của Server Root là `/etc/httpd`  
```
ServerRoot "/etc/httpd"
```  
- `Listen`: Cho phép bạn liên kết Apache với các địa chỉ IP và (hoặc) port cụ thể thay vì mặc định. 
```
#Listen 12.34.56.78:80
Listen 80
```  
Mặc định giao thức http sẽ làm việc trên cổng 80 nên defaul Listen là 80. Khi bạn muốn Apache kết nối với máy chủ có địa chỉ IP là 192.168.100.10 trên port 8000 thì bạn chỉ cần thêm dòng `Listen 192.168.100.10:8000`.  
- `User/Group`: tên (hoặc số) của user/group để thực thi httpd. Thông thường nên tạo một người dùng và nhóm chuyên dụng để chạy httpd như hầu hết các dịch vụ hệ thống. Giá trị mặc định của user và group trong file cấu hình là `apache`  
```
User apache
Group apache
```  
- `ServerAdmin`: mỗi web sẽ có 1 admin quản trị, đây là nơi khai báo địa chỉ email của người quản trị website.  
- `ServerName`: tên miền hoặc địa chỉ IP mà bạn muốn khai báo.  
- `Directory`: Để tăng tính bảo mật hệ thống, từ chối quyền truy cập vào toàn bộ hệ thống tệp của máy chủ, bạn cần cho phép truy cập rõ ràng vào các thư mục chứa nội dung web trong các khối <Directory> như bên dưới.  
```
<Directory />
    AllowOverride none
    Require all denied
</Directory>
```  
Trong đó:  
    +  `AllowOverride` chỉ định chỉ thị nào được khai báo trong tệp .htaccess có thể ghi đè chỉ thị cấu hình.  
    +  `Require all denied`: từ chối tất cả các máy khác truy cập vào thư mục đang được cấu hình. Ngược lại nếu giá trị `Require all granted` thì có nghĩa là cho phép.  

- `DocumentRoot`: Chỉ thị đường dẫn đến thư mục chứa các tài liệu là source code của trang web (thường là các tệp html).  
- `Options FollowSymLinks`: Option này cho phép bạn truy cập theo symbolic link (giống như shortcut trong windows)  
- `DirectoryIndex index.html` Khi các bạn truy cập vào thư mục ( không chỉ rõ cụ thể là file nào) thì file `index.html` sẽ được gọi.  
- `ErrorLog`: chỉ định đường dẫn của file log khi có lỗi(không bắt buộc).  
```
ErrorLog "logs/error_log"
```
- `LogLevel`: Kiểm soát số lượng tin nhắn được ghi vào `error_log`. Các giá trị có thể bao gồm: gỡ lỗi (debug), thông tin (info), thông báo (notice), cảnh báo (warn), lỗi (error), crit,alert, emerg...  
```
LogLevel warn
```
- `CustomLog`: lưu lại thông tin mà người dùng truy cập vào tên miền.  
```
CustomLog "logs/access_log" combined
```  
- `ServerAlias`: các tên miền khác cũng có thể phù hợp với máy chủ ảo này.  
- `<Files></Files>`: Khai báo các định dạng file nào được/không được quyền truy cập. Mặc định apache sẽ từ chối tất cả các máy client truy cập vào 2 tệp `.htaccess` và `htpasswd`.  
```
<Files ".ht*">
    Require all denied
</Files> 
```  
- `EnableMMAP` và `EnableSendfile`: Trên các hệ thống hỗ trợ nó, ánh xạ bộ nhớ (memory-mapping) hoặc sendfile có thể được sử dụng để phân phối các tệp. Điều này thường cải thiện hiệu suất của máy chủ, nhưng phải được tắt khi phục vụ từ các hệ thống tệp được gắn mạng hoặc nếu hỗ trợ cho các function này bị phá vỡ trên hệ thống của bạn. Mặc định: EnableMMAP bật hoặc EnableSendfile tắt.  
```
#EnableMMAP off
EnableSendfile on
``` 
- `IncludeOptional`: Tùy chọn mở rộng. Mặc định apache có một thư mục `conf.d` trong `/etc/httpd` để bạn có thể tạo file cấu hình các virtual host mà không cần thực hiện trên file cấu hình chính `httpd.conf`. Bạn nên đặt tên file trùng với tên virtual host để dễ quản lý (ví dụ `hongnga.com.conf`). Điều này rất hữu ích khi bạn cấu hình sai 1 tệp thì sẽ không ảnh hưởng đến các website còn lại. Apache hỗ trợ đọc tất cả các tệp `.conf` bằng chỉ thị:
```
IncludeOptional conf.d/*.conf  
```  
Như vậy chúng ta đã tìm hiểu cơ bản nội dung file cấu hình của Apache Web server. Khi chỉnh sửa file các bạn cần chú ý tuân thủ đúng cú pháp cấu hình tránh tình trạng lỗi code dẫn đến hệ thống không thực thi được. Trong trường hợp xảy ra lỗi, bạn có thể gõ lệnh sau để kiểm tra và khắc phục:  
```
systemctl status httpd.service  
```  
Chúc các bạn thành công!  
