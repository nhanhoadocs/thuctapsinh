# Tìm hiểu về Rsyslog 
1. Khái niệm 
- Là một công cự xử lý sự kiến và ghi nhật ký lớn
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
- Có thể định nghĩa cú pháp lưu trữ các loại file log 
2. Provides TCP/UDP syslog reception
- Là nơi định nghĩa cách truyền thông tin theo 2 giao thức TCP và UDP 

3. RULES 
- là nơi chứa các quy tắc và xem loại file log nào đặc biệt cần được lưu khác với cú pháp hay không 
- Có thể thay được các mức độ cảnh báo của severity. Các mức độ đã được viết ở bài [syslog](https://github.com/duckmak14/thuctapsinh/blob/master/DucNA/LOG/docs/syslog.md)

4. Các loại câu lệnh 

Có 3 loại câu lệnh được chấp nhận trong `rsyslog` :
- sysklogd: Đây là loại định dạng cơ bản cũ. Lưu ý một số cấu trúc không còn được hỗ trỡ nữa 
- legacy rsyslog : Đây là những statement được bắt đầu bằng dấu `$` được hỗ trợ đầy đủ từ phiên bản `pre-v6` trở lên
- RainerScript : Đây là định dạng kiểu mới và sử dụng tốt nhất.
- Dấu `#` ở đầu là ký hiệu cho đoạn comment trong dòng đó 
- Cú pháp xác nhận `server-log`
```
#*.* @@remote-host:514
```
trong đó 
- `*.*` : Đẩy tất cả các loại log và các cấp độ cảnh báo
- `@@` : Là xác định xem loại giao thức dùng là `TCP` hay `UDP`
- `remote-host:514` : là cú pháp xác định `server-log` nhận log 

# Link tham khảo 
https://www.rsyslog.com/doc/v8-stable/configuration/basic_structure.html#configuration-file

https://www.thegeekdiary.com/understanding-the-etc-rsyslog-conf-file-for-configuring-system-logging/