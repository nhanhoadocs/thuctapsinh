# HTTP Method
Tập hợp các method để chỉ ra hành động mong muốn được thực hiện cho 1 tài nguyên nhất định. Mỗi method thực hiện 1 ngưc nghĩa khác nhau, nhưng 1 số tính năng phổ biến được chia sẻ bởi 1 nhóm trong số đó. 

GET: Các method GET sử dụng để truy xuất thông tin máy chủ qua URI đã cho. Chỉ nên sử dụng để lấy dữ liệu 

POST: Yêu cầu được sử dụng để gửi dữ liệu đi 

HEAD: Method này có `request` và `response` giống hệt GET nhưng không có phần dữ liệu của `response`

PUT: Thay thế biểu diễn hiện tại bằng nội dung được tải lên 

DELETE: Xóa tất cả cá biểu diễn hiện tại của resource 

CONNECT: Tạo 1 kết nối tới 1 host khác, thường sử dụng để thực hiện kết nối SSL thông qua proxy 

TRACE: Sử dụng để thay đổi 1 phần của resource 