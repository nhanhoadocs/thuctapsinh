## Log Apache. Tìm hiểu nhật ký truy cập và nhật ký lỗi  
File log của Apache web server nằm trong thư mục `/var/log/apache2` trên máy Ubuntu và `/var/log/httpd` trên máy CentOS.  
Apache log gồm 2 file chính là log truy cập `access_log` và log lỗi `error_log`.  
Mục lục  
[1. Access log](#1)  
[2. Error log](#2)  

### 1. Access log  
- `Access log` có chức năng ghi lại những lần sử dụng, truy cập, yêu cầu đến apache server. 

<img src="https://i.imgur.com/YgfZZF7.png">  

- File `access_log` được lưu trữ trong `/var/log/httpd/access_log` hoặc `/var/log/apache2/access_log`.  
- Một cấu hình điển hình cho nhật ký truy cập có thể trông như sau  
```
LogFormat "%h %l %u %t \"%r\" %>s %b" Refer User_agent
CustomLog logs/access_log common
```
Định dạng chuẩn này có thể được sản xuất bởi nhiều máy chủ web khác nhau và được đọc bởi nhiều chương trình phân tích nhật ký. Ví dụ điển hình một nhật ký truy cập được tạo trong CLF:  
```
192.168.152.1 - - [14/Nov/2019:13:21:13 +0700] "POST /wp-admin/admin-ajax.php HTTP/1.1" 200 98 "http://192.168.152.134/wp-admin/post.php?post=13&action=edit" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
```
Trong đó:  
- `192.168.152.1` (**%h**): địa chỉ máy client truy cập đến máy chủ.  
- `-` (**%l**): nhận dạng người dùng được xác định bởi identd. "Dấu gạch nối" trong đầu ra chỉ ra rằng phần thông tin được yêu cầu không có sẵn.  
- `-` (**%u**): Đây là userid của người yêu cầu tài liệu được xác định bằng xác thực HTTP. Nếu tài liệu không được bảo vệ bằng mật khẩu, mục này sẽ là " -" giống như trước đó.  
- `[14/Nov/2019:13:21:13 +0700]` (**%t**): Thời gian mà máy chủ xử lý xong yêu cầu. Định dạng là: [day/month/year:hour:minute:second zone]   
- `"POST /wp-admin/admin-ajax.php HTTP/1.1"` (**%r**): Yêu cầu từ người sử dụng (client) 
Đầu tiên, phương thức được sử dụng là `POST`.Thứ hai, máy khách yêu cầu tài nguyên `/wp-admin/admin-ajax.php`. Thứ ba, máy khách sử dụng giao thức `HTTP/1.1`.   
- `200` (**%>s**): mã trạng thái được gửi từ máy chủ đến máy khách. 
- `98` (**%b**): kích cỡ phản hồi đối với client.  
- Refer: tiêu đề Refeer của yêu cầu HTTP (chứa URL của trang mà yêu cầu này được khởi tạo). 
- User_agent: chuỗi xác định trình duyệt.  

Ngoài những trường trên còn có một số trường khác có trong bảng định danh file log:  

<img src="https://i.imgur.com/mCjeeI2.png">  

Ngoài ra bạn còn có thể thay đổi Format của file log này trong file cấu hình của apache server đặt tại thư mục `/etc/httpd/conf/httpd.conf`  

<img src="https://i.imgur.com/eAGCcEX.png">  

Bạn cũng thể thay đổi vị trí lưu file log của mình bằng cách chỉnh sửa file cấu hình ở đường dẫn file log trong `/etc/httpd/conf/httpd.conf`.    

### Error Log  
- Chứa thông tin về lỗi mà máy chủ web gặp phải khi xử lý các yêu cầu, chẳng hạn như khi tệp bị thiếu.  
- Là nơi đầu tiên để xem xét khi xảy ra sự cố khi khởi động máy chủ hoặc với hoạt động của máy chủ vì nó thường chứa thông tin chi tiết về những gì xảy ra và cách khắc phục  
- Nơi lưu trữ file log là `/var/log/httpd/error_log` (đối với CentOS) và `/var/log/apache2/error.log` (đối với ubuntu).  
- Định danh của error log tương đối tự do về mặt hình thức nhưng 1 số thông tin quan trọng có trong hầu hết các mục log như sau:  
    - Trường thứ nhất: Trường thời gian - lưu thời gian nhận được message từ apache server  
    - Trường thứ 2: liệt kê mức độ nghiêm trọng của lỗi được báo cáo  
    - Trường thứ 3: Địa chỉ IP của client tạo ra lỗi.  

<img src="https://i.imgur.com/lXEG56v.png">  

- Bạn cũng có thể thay đổi thư mục lưu trữ error log như đối với access log.