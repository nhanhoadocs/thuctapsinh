## Khái niệm

Socket dùng để gửi dữ liệu trong một nút mạng của internet. Dùng tạo liên kết giúp 2 máy có thể giao tiếp được với nhau; gửi và nhận dữ liệu. Nó sử dụng mô hình client-server

Các chế độ socket chủ yếu sử dụng:

- Stream Socket
- Datagram Socket

### Stream Socket

Sử dụng dựa trên giao thức TCP

- Không cho phép mất gói tin
- Đảm bảo việc truyền dữ liệu
- Tốc độ truyền thấp hơn UDP

Phân tích quá trình sử dụng stream socket

- Bước 1: Server tạo ra socket()

    - bind() gán port cho socket()
    - listen() lắng nghe yêu cầu của client
- Bước 2: Client tạo socket(); và connnect() yêu cầu kết nối tới server

- Bước 3: Server accept() chấp nhận kết nối và thông báo về cho client

- Bước 4: Client sử dụng write() gửi yêu cầu tới server

- Bước 5: Server xử lý yêu cầu bằng read() và gửi lại kết quả cho client

![Imgur](https://i.imgur.com/ROjEXfb.png)

### Datagram Socket

Sử dụng dựa trên giao thức UDP

- Cho phép mất dữ liệu
- Không đảm bảo.
- Tốc độ truyền cao, VolP truyền tốt qua UDP

Phân tích quá trình sử dụng datagram socket

- Bước 1: Server tạo ra socket() và bind() gán port cho socket()
- Bước 2: Client tạo ra socket() và tự động gán port cho nó để có thể sử dụng các dịch vụ
- Bước 3: Client và server trao đổi thông tin với nhau

![Imgur](https://i.imgur.com/M0f2RMf.png)