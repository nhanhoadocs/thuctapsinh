# Cấu trúc thư mục Linux
##  / -  Root - Thư mục gốc 
- Nút gốc (root) đây là nơi bắt đầu của tất cả các file và thư mục. Chỉ có root user mới có quyền ghi trong thư mục này. Chú ý rằng /root là thư mục home của root user chứ không phải là /.
## /bin - Các tập tin thực thi của người dùng
- Thư mục này chứa các chương trình thực thi. Các chương trình chung của Linux được sử dụng bởi tất cả người dùng được lưu ở đây. Ví dụ như: ps, ls, ping...
## /sbin - Chương trình hệ thống
- Cũng chứa các tập tin thực thi như /bin. Các lệnh được lưu trong thư mục này cơ bản được dùng cho quản trị viên và dùng bảo trì hệ thống.
## /etc – Các tập tin cấu hình
-  Chứa các tập tin cấu hình cần thiết cho tất cả các chương trình.
-  Chứa các đoạn mã khởi động và tắt các chương trình đơn lẻ.
## /dev – Các tập tin thiết bị
- Nó chứa các tập tin thiết bị đầu cuối như là USB hoặc bất kỳ thiết bị nào gắn vào hệ thống.
## /proc - Thông tin về các tiến trình
- Thông tin về các tiến trình đang chạy sẽ được lưu trong /proc và cũng là nơi lưu thông tin về về các tài nguyên đang sử dụng của hệ thống.
## /var – Các tập tin biến đổi
- Thông tin về các biến của hệ thống được lưu trong thư mục này. Như thông tin về log file: /var/log, các gói và cơ sở dữ liệu /var/lib...
## /tmp - Các file tạm
- Thư mục này chứa các file tạm thời được tạo bởi hệ thống và các người dùng. Các file lưu trong thư mục này sẽ bị xóa khi hệ thống khởi động lại.
## /usr - Chương trình của người dùng
- Chứa các thư viện, file thực thi, tài liệu hướng dẫn và mã nguồn cho chương trình chạy ở level 2 của hệ thống. Trong đó

- /usr/bin chứa các file thực thi của người dùng như: at, awk, cc, less... Nếu bạn không tìm thấy chúng trong /bin hãy tìm trong /usr/bin
- /usr/sbin chứa các file thực thi của hệ thống dưới quyền của admin như: atd, cron, sshd... Nếu bạn không tìm thấy chúng trong /sbin thì hãy tìm trong thư mục này.
- /usr/lib chứa các thư viện cho các chương trình trong /usr/bin và /usr/sbin
- /usr/local chứa các chương tình của người dùng được cài từ mã nguồn. Ví dụ như bạn cài apache từ mã nguồn, nó sẽ được lưu dưới /usr/local/apache2

## /home – Thư mục người dùng
-  Chứa các tập tin của người dùng trong hệ thống.
## /boot – Các tập tin của chương trình khởi động máy
- Tất cả các file yêu cầu khi khởi động như initrd, vmlinux. grub được lưu tại đây.
## /lib – Các tập tin thư viện của hệ thống
- Chứa cá thư viện hỗ trợ cho các file thực thi trong /bin và /sbin.
## /opt – Các ứng dụng tùy chọn hoặc thêm
- Tên thư mục này nghĩa là optional (tùy chọn), nó chứa các ứng dụng thêm vào từ các nhà cung cấp độc lập khác. Các ứng dụng này có thể được cài ở /opt hoặc một thư mục con của /opt
## /mnt – Thư mục mount
- Đây là thư mục tạm để mount các file hệ thống.
## /media – Các thiết bị tháo lắp
- Thư mục chứa các mount tạm thời cho các thiết bị tháo lắp.  
##  /srv – Dữ liệu dịch vụ
-  Srv là viết tắt của service

-  Chứa cấc dữ liệu liên quan tới các dịch vụ trên máy chủ.