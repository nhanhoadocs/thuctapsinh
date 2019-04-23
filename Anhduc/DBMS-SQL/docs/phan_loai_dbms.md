Trong RDBMS thì có hai loại chính được sử dụng 
# 1.Hệ quản trị CSDL quan hệ có cấu trúc(SQL)
SQL chính là viết tắt của Structured Query language. Một cơ sở dữ liệu quan hệ xác định các mối quan hệ dưới dạng các bảng. Cơ sở quan hệ dữ liệu có cấu trúc :  MySQL, Oracle, MS SQL Server, Sybase,....
# 2. Hệ quản trị CSDL  quan hệ phi cấu trúc(NOSQL)
NoSQL là một DMS phi quan hệ, không yêu cầu một lược đồ cố định, tránh các phép nối, và dễ dàng mở rộng. Cơ sở dữ liệu NoSQL được sử dụng cho các kho dữ liệu phân tán với nhu cầu lưu trữ dữ liệu khổng lồ

# So sánh SQL và NOSQL 
| Nội dung    |      SQL           |         NOSQL          |
| ----- |-----|------|
| Lịch sử| Được phát triển năm 1970 | Được phát triển vào những năm 2000 để giải quyết các hạn chế của cơ sở dữ liệu SQL|
|Định nghĩa  | Cơ sở dữ liệu quan hệ có cấu trúc | cơ sở dữ liệu quan hệ phi cấu trúc |
|Kiểu lưu dữ liệu | Cơ sở dữ liệu dưa trên dạng bảng | dữ liệu có thể dựa trên tài liệu, cặp khóa-giá trị, cơ sở dữ liệu biểu đồ|
|Lược đồ|   Được xác định trước |   Không được xác định trước|
|Khả năng mở rộng| Theo chiều dọc | Theo chiều ngang |
|Phù hợp| Môi trường truy vấn phức tạp| Môi trường truy vấn đơn giản |
| Khả năng mở rộng | Máy chủ duy nhất dung lượng phải lớn lên có thể làm trên nhiều máy chủ nhưng cần phải cài đặt nhiều thứ | Có thể phát triển trên nhiều máy chủ| 
| Thao tác dữ liệu| Sử dụng câu lệnh | Thông qua các API |
| Mô hình phát triển | Kết hợp giữa mã nguồn mở và mã nguồn đóng | Mã nguồn mở |
| lược đồ | Cấu trúc dữ liệu được định sẵn | Các bản ghi có thể thêm thông tin mới một các dễ dàng |
| Tính nhất quán | Tính nhất quán rõ ràng | không có |

MYSQL , MSSQL, MARIADB  thuộc loại hệ quản trị cơ sở dữ liệu nào? 

Cả 3 cái trên đều thuộc một dạng quan hệ có cấu trúc.
# 3. Tìm hiểu về MYSQL
## 3.1 Tổng quan 
