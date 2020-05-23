# Static Route - Lab StaticRoute 2 Router

## Mục lục

### [I. Static Routing](#1)
### [II. Lab Static Route 2 router](#2)

---


## **I. Static Routing** <a name = "1"></a>
### 1. Static Routing là gì?
**Static Routing** là phương thức định tuyến mà người quản trị sẽ nhập tất cả thông tin về đường đi cho router. Vậy khi cấu trúc hệ thống mạng có bất kỳ sự thay đổi nào thì người quản trị sẽ thay đổi bằng cách xóa hay thêm các thông tin về đường đi cho router, nói cách khác đường đi này là cố định.

Nguyên lý hoạt động của **Static Routing** ta có thể hiểu như thế này.

- Đầu tiên người quản trị sẽ cấu hình các đường cố định cho *router*

- Sau đó, *router* sẽ cài đặt đường đi này vào bảng định tuyến.

- Và gói dữ liệu được định tuyến theo đường cố định.


### 2. Đường đi cố định có 3 cách:

- Cổng ra
- IP Cổng kế cận
- *Default Route*: xét về câu lệnh cấu hình cũng tương tự như 2 dạng trên chỉ có khác một điều là không cần biết địa chỉ đích và *Subnet Mask*.
    -  Ưu điểm:

        - Cấu hình dễ dàng và nhanh chóng

        - Hỗ trợ ở tất cả các thiết bị định tuyến và *router*

        - Thường được sử dụng ở các hệ thống mạng doanh nghiệp nhỏ, ít có sự thay đổi về cấu trúc, người quản trị toàn quyền kiểm soát điều khiển bảng định tuyến và có thể giảm bớt băng thông trong hệ thống.
    - Nhược điểm:

        - Độ phức tạp của cấu hình sẽ tăng khi kích thước hệ thống mạng tăng

        - Không thích hợp với những hệ thống mạng lớn vì không thể thích ứng được với sự thay đổi của hệ thống mạng

        - Khả năng cập nhật đường đi bị hạn chế đôi lúc là không thể, bởi vậy mà nguy cơ tràn băng thông là rất cao.


### 3. Cách cấu hình cơ bản

**Static Routes** thường được sử dụng khi cần định tuyến từ một *Netwwork* đến một **Stub Network*, (*stub Network* là một mạng con chỉ có một tuyến đường duy nhất để đi ra bên ngoài).

Static routes cũng được dùng để xác định một phương án cuối cùng để gửi một gói tin không rõ địa chỉ đích.

Cú pháp lệnh **Static route**: 

` R(config)# ip route [network] [mask] [Address|interface]`

- *network*: địa chỉ mạng đích đến
- *mask*: subnet mask
- *address|interface*: địa chỉ của Router kế tiếp trong interface đang sử dụng

------------

# **II. Lab Static Route 2 router** <a name = "2"></a>
<img src = "https://i.imgur.com/a1gbNQS.png">

Yêu cầu:
- Sử dụng **Static Routing** để kết nối 2 Router
- PC1 ping được tới Router 2 và PC2
- PC2 ping được tới Router 1 và PC1

1. Đặt địa chỉ IP và tên các PC cũng như các cổng của Router như hình.
2. Ping kiểm tra từ PC1 tới 2 cổng *f0/0, f0/1* của Router1. Đặt đúng địa chỉ IP thì sẽ ping thành công. Tương tự ta làm với PC2 tới Router2.
3. Ta thử ping từ PC 1 đến tới cổng *f0/0* của Router2:

<img src = "https://i.imgur.com/aTJ4vqf.png">

Vì chưa tạo đường đi từ Router 1 đến Router 2 nên ta không thể từ PC1 ping tới *Router 2*.

Kết quả tương tự khi ta ping từ PC2 tới cổng *f0/0* của *Router 1*.

4. Tạo **Static Route** giữa *Router 1* và *Router 2*:

Tại *Router 1*:
`R1(config)#ip route 192.168.3.0 255.255.255.0 192.168.1.254`

Tại *Router 2*:
`R2(config)#ip route 192.168.2.0 255.255.255.0 192.168.1.1`

Bây giờ ta sẽ thực hiện lại bước 3. Bây giờ ta sẽ có kết quả khác. Từ PC1 đã có thể ping tới Router 2 và PC 2 và ngược lại.

*Từ PC1 đến Router 2 và PC 2:*

<img src = "https://i.imgur.com/fX9iLzS.png">

*Từ PC2 đến Router 1 và PC 1:*

<img src = "https://i.imgur.com/jAeDcBl.png">


# **Tổng kết**
Vậy trên đây là những khái niệm cơ bản cũng như hướng dẫn cách tạo **StaticRouting** giữa 2 Router trên sự tìm hiểu của mình.

Cảm ơn các bạn đã đọc. Rất mong ý kiến và sự góp ý từ các bạn để bài viết được hoàn chỉnh hơn.

