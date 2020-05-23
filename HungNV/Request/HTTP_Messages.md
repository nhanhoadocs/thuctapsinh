# HTTP Messages 

Chỉ ra cách dữ liệu được trao đổi giữa client và server. Có 2 loại message : `requests` được gửi bởi client để kích hoạt 1 hành động trên server và `response` được gửi từ server về client 

Về cơ bản các `requests` và `response` có cấu trúc tương tự bao gồm : 

Start-line, HTTP headers, empty line, body 

`Start-line`: là Mô tả yêu cầu được thực hiện và trạng thái của nó 

`HTTP header`: tùy chọn chỉ định yêu cầu hoặc mô tả phần thân có trong thông báo 

`empty line` : Một dòng trống, cho biết tất cả thông tin meta cho yêu cầu đã được gửi 

`body` : Chứa dữ liệu được liên kết với request(HTML) hoặc tài liệu liên kết với response.

## HTTP Requests 

![Imgur](https://i.imgur.com/HZnDQdp.png)

### Start line

Dòng bắt đầu chứa 3 yếu tố: 

1. Method HTTP 

2. Các `request target`, thường là 1 URL hoặc đường dẫn tuyệt đối của giao thức 

3. Các phiên bản giao thức HTTP

### Headers
Header của  `request` tuân theo cấu trúc cơ bản của tiêu đề HTTP: Chuỗi không phân biệt chữ hoa và theo sau đó là dấu ':'

- General header : Áp dụng cho toàn bộ thông điệp 
- Request headders: `User_Agent` cho biết loại trình duyệt được sử dụng
- entity headers: 

### Body


## HTTP response 

![Imgur](https://i.imgur.com/c8TdCpB.png)

### Status line 

Dòng bắt đầu chứa các thông tin như: 

- Các phiên bản của giao thức
- Một mã trạng thái cho biết trạng thái của request 
- Văn bản trạng thái, mô tả ngắn gọn bằng văn bản của mã trạng thái để giúp hiểu hơn về thông điệp 

### Header 

- General header: Chứa thông tin về trạng thái kết nối
- Response header: Cung cấp thêm thông tin về máy chủ không phù hợp với dòng trạng thái 
- Entity header: Thông thường sẽ k có tiêu đề này được truyền đi nếu không có nội dung body được truyền đi. 

### Body 

