# STREAMS
# Các stream là gì?????
Các Graylog stream là một cơ chế để định tuyến các message thành các danh mục trong thời gian thực trong khi chúng được xử lý

Ta xác định các Rule để hướng dẫn Graylog xem là message nào được định tuyến đến các stream nào.

Giả sử ta có 3 message được bắn đến Graylog

    message: INSERT failed (out of disk space)
    level: 3 (error)
    source: database-host-1

    message: Added user 'foo'.
    level: 6 (informational)
    source: database-host-2

    message: smtp ERR: remote closed the connection
    level: 3 (error)
    source: application-x

1 trong rất nhiều thứ ta có thể làm với Streams là tạo 1 stream gọi là "Database errors" nhằm bắt tất cả các error message xuất phát từ 1 trong các database host của ta

Tạo 1 stream mới với các Rule sau, chọn các option để khớp tất cả các rule:

    - Trường "level" phải lớn hơn 4
    - Trường "source" phải khớp với biểu thức chính quy "^database-host-\d+"

=> Việc làm này sẽ định tuyến tất cả các new message với **level** cao hơn WARNING và **source** khớp với biểu thức của database host đi vào stream đó.

1 message sẽ được định tuyến đến tất cả các stream có tất cả ( hoặc bất kỳ) các rules phù hợp. Điều này nghĩa là 1 message có thể là 1 phần của nhiều stream chứ không chỉ một

Stream đang xuất hiện trong stream list, click vào tiêu đề, nó sẽ show ra cho bạn tất cả các database error.

**NOTE**: Streams có thể dùng để cảnh bảo khi trường hợp có điều kiện xảy ra. **Streams** kết hợp **Alerts**

# What’s the difference to saved searches (lưu lại rồi search)?
Sự khác biệt lớn nhất là các stream được xử lý trong thời gian thực. Điều này cho phép cảnh báo và chuyển tiếp theo thời gian thực tới các hệ thống khác.

Một điểm khác biệt nữa là các tìm kiếm theo các stream rule phức tạp khá nhanh để thực hiện vì 1 message được tagged các Stream ID  khi được xử lý. Một tìm kiếm cho Graylog bên trong luôn trông như thế này, cho dù bạn đã cấu hình bao nhiêu stream rule:

    treams:[STREAM_ID]

