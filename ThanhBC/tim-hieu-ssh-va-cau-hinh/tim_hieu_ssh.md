# **Tìm hiểu SSH và cách thức hoạt động**
## SSH là gì?
- SSH - Secure Shell: là một giao thức điều kiển từ xa cho phép người dung kiểm soát và chính sửa server từ xa qua internet.
- SSH xử dụng mã hóa trong suôt quá trình truyền dữ liệu đảm báo tính bảo mật.
## SSH hoạt động?
- SSH hoạt động thông qua 3 bước:
    - Định danh host: xác định định danh của hệ thống tham gia phiên làm việc SSH.
    - Mã hóa: thiết lập kênh làm việc mã hóa.
    - Chứng thực: xác thực người sử dụng có quyền đăng nhập hệ thống.
# Các kỹ thuật mã hóa khác nhau được sử dụng trong SSH.
- có 3 cách mã hóa qua SSH.
    - Symmetrical encryption.
    - Asymmetrical encryption.
    - Hashing.
## Symmetrical encryption
- Mã hóa đối xứng:
- Là một dạng mã hóa sử dụng khóa bí mật (secret key) ở cả hai chiều mã hóa và giải mã bởi cả host và client.
- Kiểu mã hóa này thì cả hai bên đề sử dụng một khóa chung để mã hóa và giải mã.
- Khi bên thứ ba biết được khóa sẽ có thể giải mã được bạn mã hóa gửi đi.
## Asymmetric encryption
- Mã hóa bất đối xứng.
- Xử dụng  hai khóa khác nhau để mã hóa và giải mã,tạo nên một cặp khóa là public-private key pair.
- Hai khóa là public key và private key.
    - Public key- khóa công khai: nó sẽ công khai ra bên ngoài
    - private key- khóa bí mật: luôn phải giữ bí mật. 
## Hashing
- Hàm băm.
- Hashing một chiều là một dạng mã hóa xử dụng trong secure shell connections.
- Hashing một chiều nó không được sinh ra để giải mã chúng tạo ra một giá trị duy nhất với độ dài nhất định cho mỗi lần nhập liệu mà không có hướng nào để khai thác.
- Có thể tạo ra một mã hóa hash từ 1 lần input nhưng không thể tạo ra lần input từ hash. nếu client giữ đúng input đó và client có thể tạo ra một input giống như vậy và so sánh nó vơi giá trị đầu bên kia thì xác đinh cả hai bên.
# Phiên mã hóa.
- Cách thuật toán hoạt động cơ bản:
    - Cả client và server đồng ý dựa trên một số nguyên lớn và không có tính chất chung được gọi là **seed value**.
    - Cả hai bên đồng ý một cách mã hóa  tạo ra từ seed value bằng thuật toán nhất định : ví dụ xử dụng AES ( advanced encryption standard)
    - Cả hai tạo độc lập một số khác để làm private key.
    - Key private mới được tạo, sử dụng chung thuật toán mã hóa ở trên để tạo ra key public được phân phối đến máy còn lại.
    - Hai bên sử dụng private key của nó, public key của máy còn lại và số nguyên ban đầu để tạo key chung cuối cùng. key này độc lập với hai máy nhưng sẽ tạo ra một key mã hóa giống nhau trên cả hai
    - Giờ ta đã có khóa chia sẻ. key chung được sử dụng để mã hóa và giải mã tin nhắn.
# Chứng thực người dùng.
- Người dùng có một cách sử dụng username và password và thông tin đăng nhập chuyển qua một đường hầm bảo mật symmetric.
- Cách an toàn nhất là sử dụng SSH key pairs.