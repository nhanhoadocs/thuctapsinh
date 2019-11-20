# Tìm hiểu về Rsyslog 
1. Khái niệm 
- Là một phần mềm mã nguồn mở được sử dụng trên linux. Và nó được chạy dựa trên giao thức syslog 
- Rsyslog được thiết kết và sử dụng các modules điều này giúp cho rsyslog có chức năng tự động đẩy log bằng các modules được sử dụng.
2. Các modules cơ bản 
- Output modules: Được để xử lý tin nhắn. Với chúng các định dạng tin nhắn được chuyển đổi nhanh hơn. Chúng được định nghĩa thông qua `action configuration objects`
- Input modules: Được sử dụng để thu nhận tin nhắn từ nhiều nguồn khác nhau Được định nghĩa thông qua `input configuration objects`
- Parser modules: được sử dụng để phân tích nội dung tin nhắn. 
- Message modification modules: Được sử dụng để thay đổi nội dung tin nhắn đang được xử lý 
- String generator modules: Mục đích được sử dụng là dùng để tắng tốc độ xử lý của Rsyslog lên

# Các file cấu hình trong Rsyslog 
file cấu hình trong `ryslog`
```
/etc/rsyslog.conf 
```
**Các ý nghĩa trong file config mặc định**
1. MODULES
- Là nơi định nghĩa các modules được rsyslog sử dụng 
