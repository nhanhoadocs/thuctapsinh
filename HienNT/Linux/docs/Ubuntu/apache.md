# Tìm hiểu về Apache trên Ubuntu 18.04   

## 1. Tệp, thư mục và mô-đun Apache 

- `/var/www/html` - thư mục gốc được mặc định tạo ra khi cài đặt Apache chứa nội dung các website(source). Bất kỳ file HTML nào bạn đặt vào thư mục này đều có ý nghĩa cho Apache để phân phối qua mạng. Định dạng các file thường là `.html`, `.php`,...Bạn cũng có thể sửa thư mục thành `/var/www/your_domain` theo cấu hình của bạn  

- `/var/log/apache2/error.log` - tệp nhật ký lỗi ghi lại các lỗi mà bạn gặp phải khi sử dụng Apache  

- `/var/log/apache2/access.log` - tệp nhật ký truy cập ghi lại các lần truy cập từ máy client của Apache  

- `/etc/apache2/` - thư mục cấu hình chính của Apache. Tất cả các tệp cấu hình Apache đều nằm ở đây.  

  - `/etc/apache2/apache2.conf` - Đây là tệp cấu hình chính của Apache và kiểm soát mọi thứ mà Apache làm trên hệ thống của bạn. Thay đổi ở đây ảnh hưởng đến tất cả các trang web được lưu trữ trên máy này.  

  - `/etc/apache2/ports.conf` - Tập tin cấu hình cổng. Bạn có thể tùy chỉnh các cổng cho Apache bằng tệp này. Theo mặc định, Cổng 80(http) được cấu hình cho lưu lượng truy cập.  

  - `/etc/apache2/sites-available` - Lưu trữ cho các tập tin máy chủ ảo. Một máy chủ ảo là một bản ghi của một trong những trang web được lưu trữ trên máy chủ. Apache sẽ không sử dụng các tệp cấu hình được tìm thấy trong thư mục này trừ khi chúng được liên kết với thư mục `sites-enabled`

  - `/etc/apache2/sites-enabled` - Thư mục kích hoạt máy chủ ảo trên mỗi trang web được lưu trữ. Thông thường, chúng được tạo bằng cách liên kết đến các tệp cấu hình được tìm thấy trong thư mục `sites-available` bằng công cụ `a2ensite`. Apache đọc các tệp cấu hình và các liên kết được tìm thấy trong thư mục này khi nó khởi động hoặc tải lại để biên dịch một cấu hình hoàn chỉnh.

  - `/etc/apache2/conf-available/`, `/etc/apache2/conf-enabled/` - Các thư mục này có cùng mối quan hệ với các thư mục `sites-available` và `sites-enabled`, nhưng được sử dụng để lưu trữ các đoạn cấu hình không thuộc về máy chủ ảo. Các tập tin trong thư mục `conf-available` có thể được kích hoạt bằng lệnh `a2enconf` và vô hiệu hóa bằng lệnh `a2disconf`  

  - `/etc/apache2/mods-available/`, `/etc/apache2/mods-enabled/` - Các thư mục này chứa các mô-đun có sẵn và được kích hoạt tương ứng. Các tệp kết thúc bằng `.load` để tải các mô-đun cụ thể, các tệp kết thúc `.conf` chứa cấu hình cho các mô-đun đó. Các mô-đun có thể được kích hoạt và vô hiệu hóa bằng cách sử dụng lệnh `a2enmod` và `a2dismod`.

- Mô-đun
 
  - Nếu bạn định làm việc với các mô-đun phần mềm - các ứng dụng mở rộng hoặc nâng cao chức năng của Apache - bạn có thể kích hoạt chúng bằng cách sử dụng:

    ```sh
      sudo a2enmod name_of_module
    ```

  - Để tắt mô-đun:
 
    ```sh
      sudo a2dismod name_of_module
    ```

 






## TÀI LIỆU THAM KHẢO  
- [how-to-install-apache-web-server-on-ubuntu-18-04](https://phoenixnap.com/kb/how-to-install-apache-web-server-on-ubuntu-18-04)  
- [Important Apache Files and Directories](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04)
- https://help.ubuntu.com/lts/serverguide/httpd.html
- http://httpd.apache.org/docs/2.4/