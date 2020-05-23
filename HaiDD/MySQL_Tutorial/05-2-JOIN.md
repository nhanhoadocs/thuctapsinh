# S5.2. JOIN

Một cơ sở dữ liệu quan hệ bao gồm nhiều bảng liên quan liên kết với nhau bằng các cột chung được gọi là khóa ngoài (`foreign key`). Vì vậy, dữ liệu từ 1 bảng không đầy đủ theo góc độ kinh doanh.

Để có thể có được dữ liệu đầy đủ ta cần `JOIN` các bảng lại với nhau để có được dữ liệu cần thiết.

Ví dụ: Ta có 2 bảng dữ liệu `orders` và `orderdetails` liên kết với nhau bằng cột `orderNumber`.
<img src ="https://i.imgur.com/egkouFP.png">

Để có thông tin đơn hàng hoàn chỉnh, ta cần truy vấn dữ liệu từ cả 2 bảng `orders` và `orderdetails`.
Chính vì vậy nên chúng ta cần `JOIN`.

MySQL hỗ trợ các kiểu JOIN sau:
- Inner join
- Left join
- Right join
- Cross join