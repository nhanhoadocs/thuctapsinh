### Sửa port của virtual host trên CentOS  
1. Giả sử ta đã tạo được virtual host là `hongnga.com` với khai báo ở cổng port `8000`. Khi gõ địa chỉ IP kèm port 8000 trên trình duyệt thì nó sẽ trả về nội dung trang web hiển thị theo mã code html trong file index. Bây giờ ta muốn thay một port khác mà trình duyệt vẫn trả về nội dung web như trước thì ta làm theo cách sau:  
Bước 1:  
Cấu hình trong file `vhost.conf` trong thư mục `/etc/httpd/conf.d/vhost.conf`. Tôi sẽ thêm một cặp thẻ VirtualHost nữa và khai báo ở port 81.  

<img src="https://i.imgur.com/cAyoqWm.png">  

Bước 2:  Ta chỉnh sửa file `httpd.conf` trong thư mục `/etc/httpd/conf/`. Thêm dòng `Listen 81` vào file cấu hình rồi lưu lại.  
<img src="https://i.imgur.com/7yK4LWe.png">

Sau đó restart httpd rồi mở trình duyệt, gõ địa chỉ IP kèm port 8000 và port 81 để xem kết quả.  

<img src="https://i.imgur.com/qxvY3QP.png">  

Tiếp theo là port 81  
<img src="https://i.imgur.com/GOenPJw.png">
