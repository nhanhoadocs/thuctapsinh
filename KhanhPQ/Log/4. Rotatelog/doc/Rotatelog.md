# Trường hợp
-	Môi trường không đủ lớn để lưu trữ lượng log lớn được đẩy về từ các client ( trong thời gian dài)
-	Không muốn giữ lại log của thời gian quá lâu trước đây( tháng,tuần trước)
	Cơ chế rotate log (xóa/nén/move và tạo file log mới)
	Tiện ích LOGROTATE
# LOGROTATE
## 1) Là gì, để làm gì, cài đặt?
-	là 1 tiện ích trên Linux
-	Giúp quản lí log files ( xoay vòng file,di chuyển,nén,gửi tự động…)
Logrotate được cài đặt mặc định trên hầu hết các bản phân phối Linux
 
 ![img1](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/4.%20Rotatelog/img/1.png)

Nếu chưa có


Trên hệ thống Ubuntu/Debian:

    #sudo apt-get update
    #sudo apt-get install logrotate

Trên hệ thống CentOS/Redhat:

    #sudo yum update
    #sudo yum install logrotate







## 2) Cấu hình
file config mặc định: /etc/logrotate.conf 

folder :	/etc/logrotate.d

![img2](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/4.%20Rotatelog/img/2.png)

![img3](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/4.%20Rotatelog/img/3.png)

    Các file log được rotate hàng tuần
    Dữ liệu logs được lưu lại trong 4 file <=> lưu log cũ trong 4 tuần
    file log mới được tạo sau khi quá trình rotating các file cũ
    Các file log cũ được gán date ở phía sau tên


Cấu trúc của việc cấu hình gồm :
    
     đường dẫn file log + các thiết lập cấu hình nằm trong dấu {}

### 2.1. Lựa chọn Log file được rotate
    /home/*/logs/mysql*.log
    /home/*/logs/access.log /home/*/logs/error.log /home/*/logs/nginx_error.log
ta có thể chỉ định 1 hay nhiều file



### 2.2. Rotate theo thời gian
Có 4 giá trị cấu hình tương ứng với khoảng thời gian log file sẽ được rotate.

    •	Daily: mỗi ngày
    •	Weekly: mỗi đầu tuần
    •	Monthly: mỗi đầu tháng
    •	Yearly: mỗi năm
### 2.3. Rotate theo dung lượng file log
Đơn vị có thể là K,M,G

    size 100k
    size 100M
    size 100G

ưu tiên cao hơn rotate theo thời gian

### 2.4. Xử lý Log file trống
    missingok   :nếu file log vì lý do gì đấy bị mất hoặc không tồn tại *.log thì logrotate sẽ tự động di chuyển tới phần cấu hình log của file log khác mà không cần phải xuất ra thông báo lỗi. Ngược lại sẽ là cấu hình nomissingok

    Notifempty    : không rotate log nếu file log này trống

### 2.5. Rotate theo số lượng Log file
    rotate [number]
quy định số lượng file cũ sẽ giữ lại sau rotate

VD: 

    rotate 7 -> sẽ giữa lại 7 file log cũ. Nếu đủ 7 file sẽ file cũ nhất bị xóa đi để file log(cũ) tiếp theo được tạo

### 2.6. Tự động nén Log file
    Compress : Logrotate sẽ nén tất cả file log lại sau khi rotate; mặc định .gzip
-	Có thể thay đổi tùy theo chương trình nén muốn sử dụng bzip2, xz, zip

        Compresscmd xz	
-	Delaycompress 	: không nén ngay khi rotate -> delay nén file log cũ vào lần rotate kế tiếp -> Phải đi kèm compress

        compress
        delaycompress

nocompress		: không dùng tính năng nén đối với log cũ
### 2.7. Phân quyền cho Log file
    create	    :quy định việc file log mới tạo ra -> cần đảm bảo đúng phân quyền cho file log mới

    Dateext	    : thêm hậu tố thời gian vào hậu tố của trên file log cũ theo cấu trúc yyyymmdd.
    giá trị hậu tố mặc định là 1,2,3…
 
![img4](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/4.%20Rotatelog/img/4.png)

ví dụ: 

        create 660 appuser www-data

        --> log mới sẽ có owner là appuser và group là www-data với quyền 660


### 2.8. Thực thi lệnh trước hoặc sau khi rotate
- Logrotate có thể chạy các lệnh trước hay sau quá trình rotate.
ví dụ khởi động lại dịch vụ sử dụng file log -> không gián đoạn quá trình ghi log
-	Lệnh thực thi nằm giữa 

        prerotate và endscript :thực thi trước khi rotate

        postrotate và endscript : thực thi sau khi rotate

        sharedscripts       :Script postrotate sẽ được chạy sau khi toàn bộ các file logs được rotate. Nếu không có tùy chọn này, postrotate script sẽ được chạy sau mỗi log file được rotate.

    -       Prerotate
            Touch /var/www/html/stop.txt
            Endscript


    -       Postrotate
            /etc/init.d/apache2 reload > /dev/null
            Endscript
## 3) Kiểm tra LogRotate
Thiết lập xong -> save file -> hệ thống tự động chạy theo thiết lập
### 3.1. Debug cấu hình LogRotate
Để kiểm tra cấu hình chuẩn chưa -> dùng tham số -d (debug) với các file cấu hình logrotate riêng biệt

VD:

    logrotate -d /etc/logrotate.d/nginx

    không có lỗi gì -> config chuẩn

### 3.2. Chạy LogRotate thủ công
Trong trường hợp bạn muốn chạy ngay LogRotate, hãy dùng lệnh bên dưới:

    logrotate -vf /path_to_file_config
    -v: hiển thị chi tiết quá trình
    -f : bắt buộc rotate ngay lập tức

