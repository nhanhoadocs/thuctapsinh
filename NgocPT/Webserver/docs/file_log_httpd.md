# Nhật ký truy cập Apache & Hướng dẫn nhật ký lỗi Apache

Apache ghi lại thông tin về tất cả khách truy cập vào trang web của bạn, cũng như mọi sự cố mà máy chủ gặp phải. Để làm điều này, Apache sử dụng hai loại tệp nhật ký: nhật ký truy cập(Access log) và nhật ký lỗi(Error log).  

File log của apache server nằm ở thư mục /var/log/apache2 (đối với ubuntu) và ở /var/log/httpd (đối với centOs)

# Mục lục

1.[Access log](#a)  
2.[Error log](#b)

<a name="a">

## 1. Access log </a>

Apache sử dụng các tệp nhật ký truy cập để ghi lại thông tin về mọi khách truy cập vào trang web của bạn. Bạn có thể xem tập tin nào khách truy cập xem, cách máy chủ web phản hồi yêu cầu và các thông tin khác như trình duyệt web mà khách truy cập sử dụng.

File log được lưu trữ tại /var/log/httpd/access_log trên CentOS (hoặc /var/log/apache2/access.log trên Ubuntu)

![](../images/c1.png)

Một cấu hình điển hình cho nhật ký truy cập có thể trông như sau.
```
LogFormat "%h %l %u %t \"%r\" %>s %b" common
CustomLog logs/access_log common
```
Định dạng chuẩn này có thể được sản xuất bởi nhiều máy chủ web khác nhau và được đọc bởi nhiều chương trình phân tích nhật ký. Các mục nhật ký tệp được tạo trong CLF sẽ trông giống như thế này:
```
192.168.184.1 - - [03/Jul/2019:11:02:28 +0700] "POST /wp-admin/install.php?step=1 HTTP/1.1" 200 5969 "http://192.168.184.130/wp-admin/install.php" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36"
```
Mỗi phần của mục nhật ký này được mô tả dưới đây:  

192.168.184.1(%h)  
- Đây là địa chỉ IP của máy khách (máy chủ từ xa) đã thực hiện yêu cầu đến máy chủ.  

-(%l)  

- "Dấu gạch nối" trong đầu ra chỉ ra rằng phần thông tin được yêu cầu không có sẵn.

frank( %u)

- Đây là userid của người yêu cầu tài liệu được xác định bằng xác thực HTTP.Nếu tài liệu không được bảo vệ bằng mật khẩu, mục này sẽ là " -" giống như trước đó.

[03/Jul/2019:11:02:28 +0700] (%t)  
Thời gian mà máy chủ xử lý xong yêu cầu. Định dạng là:

- [day/month/year:hour:minute:second zone]

"POST /wp-admin/install.php?step=1 HTTP/1.1" (%r)

- Dòng yêu cầu từ khách hàng được đưa ra trong dấu ngoặc kép. 
- Đầu tiên, phương pháp được sử dụng bởi khách hàng là POST.Thứ hai, máy khách yêu cầu tài nguyên /wp-admin/install.php?step=1 .Thứ ba, máy khách sử dụng giao thức HTTP/1.1.

200( %>s)

- Đây là mã trạng thái mà máy chủ gửi lại cho máy khách.

5969( %b)

- Kích thước của đối tượng được trả về máy khách.

### Định dạng nhật ký kết hợp
Các trường bổ sung là:  
 "http://192.168.184.130/wp-admin/install.php"( \"%{Referer}i\")  
 Tiêu đề yêu cầu HTTP "Người giới thiệu"  

"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36"  
Tiêu đề yêu cầu HTTP Tác nhân người dùng. Đây là thông tin nhận dạng mà trình duyệt máy khách báo cáo về chính nó.

### Log khi restart HTTPD

Ta thực hiện lệnh restart HTTPD:
```
systemctl restart httpd
```
Truy cập vào file /var/log/httpd/access_log/

![](../images/screen_2.png)

<b name="b">

## 2. Error log </b>
- Chứa thông tin về lỗi mà máy chủ web gặp phải khi xử lý các yêu cầu, chẳng hạn như khi tệp bị thiếu.
- Là nơi đầu tiên để xem xét khi xảy ra sự cố khi khởi động máy chủ hoặc với hoạt động của máy chủ vì nó thường chứa thông tin chi tiết về những gì xảy ra và cách khắc phục
- Nơi lưu trữ file log là /var/log/httpd/error_log (đối với centOs) và /var/log/apache2/error.log (đối với ubuntu)
- Định dạng của nhật ký lỗi là dạng tương đối tự do và mô tả. Nhưng có một số thông tin nhất định có trong hầu hết các mục nhật ký lỗi. Ví dụ, đây là một thông điệp điển hình.
```
[Wed Jul 03 09:16:58.344664 2019] [mpm_prefork:notice] [pid 7412] AH00163: Apache/2.4.6 (CentOS) configured -- resuming normal operations
```
Trường thứ nhất: Trường thời gian - lưu thời gian nhận được message từ apache server   
Trường thứ 2: liệt kê mức độ nghiêm trọng của lỗi được báo cáo  
Trường thứ 3: Địa chỉ IP của client tạo ra lỗi

### Log khi câú hình sai httpd
Ví dụ :  
Ta vào file cấu hình httpd:
```
cd /var/www/html/
vi wp-config.php
```

![](../images/screen_3.png) 
Lưu và đóng file.  

Ta truy cập vào file log /var/log/httpd/error_log/
```
cd /var/log/httpd/
vi error_log
```
![](../images/screen1.png)





