## Tìm hiểu về Rsyslog  

### 1.  Rsyslog là gì?  
- `Rsyslog` – “The rocket-fast system for log processing” được bắt đầu phát triển từ năm 2004 bởi Rainer Gerhards.   
- `Rsyslog` là một phần mềm mã nguồn mở sử dụng trên Linux dùng để chuyển tiếp các log message đến một địa chỉ trên mạng (log receiver, log server) Nó thực hiện giao thức syslog cơ bản, đặc biệt là sử dụng TCP cho việc truyền tải log từ client tới server. Hiện nay rsyslog là phần mềm được cài đặt sẵn trên hầu hết hệ thống Unix và các bản phân phối của Linux như : Fedora, openSUSE, Debian, Ubuntu, Red Hat Enterprise Linux, FreeBSD…  
- Nếu bạn đang sử dụng một bản phân phối Linux hiện đại (như máy Ubuntu, CentOS hoặc RHEL), máy chủ syslog mặc định được sử dụng là rsyslog.  
- Rsyslog là một sự phát triển của syslog, cung cấp các khả năng như các mô đun có thể cấu hình, được liên kết với nhiều mục tiêu khác nhau (ví dụ chuyển tiếp nhật ký Apache đến một máy chủ từ xa).  
- Rsyslog cũng cung cấp tính năng lọc riêng cũng như tạo khuôn mẫu để định dạng dữ liệu sang định dạng tùy chỉnh.  

### 2. Các triển khai Rsyslog trong Linux  

Rsyslog có thiết kế kiểu mô-đun. Điều này cho phép chức năng được tải động từ các mô-đun, cũng có thể được viết bởi bất kỳ bên thứ ba nào. Bản thân Rsyslog cung cấp tất cả các chức năng không cốt lõi như các mô-đun. Do đó, ngày càng có nhiều mô-đun. Có 6 modules cơ bản:
- Output Modules  
- Input Modules  
- Parser Modules  
- Message Modification Modules  
- String Generator Modules  
- Library Modules  

