# VTP
---------------
##### 1. Khái Niệm
- Xét trong hệ thống có 30 Switch: tất cả các Switch đều có VLAN 10, 20, 30, 40, 50 và tên của các VLAN như IT, Sale.... Bình thường ta phải đi cấu hình lần lượt 30 Switch nhưng khi dùng VTP thì chỉ cần cấu hình các VLAN trên một Switch Server sau đó đồng nhất với các Switch còn lại là xong.
- VTP là VLAN Trunking Protocol. Là giao thức độc quyền của thiết bị Cisco. Nó cho phép triển khai đồng nhất nhiều VLAN cùng một lúc xuống nhiều Switch khác nhau trong hệ thống mạng lớn.

##### 2. Hoạt động của giao thức VTP
- **a. Điều kiện để VTP hoạt động**
  - Ta có tất cả các Switch được kết nối tới một Switch tổng bằng đường Trunking.
  - Toàn bộ các Switch này được đặt trong một miền là Dnu nó sẽ trao đổi thông tin được với nhau.

- **b. Các bước hoạt động**
  - Bước 1: Khi có thay đổi thông tin trên con Switch tổng như sửa, xóa tên hoặc thông tin VLAN thì chỉ số VTP Revision sẽ tăng lên 1.
       + Số Revision là bộ đếm khi có sự thay đổi trong cơ sở dữ liệu của VLAN. Mỗi lần sửa nó sẽ tăng lên 1.
  - Bước 2: Khi Revision tăng ngay lập tức các gói tin sẽ gửi tới các Switch trong miền thông qua đường Trunk. Cứ 5 phút nó lại gửi một lần.
  - Bước 3: Các Switch còn lại trong miền sẽ so sánh chỉ số Revision. Nếu thấy thông tin đến có chỉ số Revision cao hơn nó sẽ cập nhật dữ liệu.

- **c. Xây dựng Backup cho hệ thống**
  - Để tăng tính dự phòng người ta thường dùng tối hiểu 2 Switch hoạt động ở chế độ Server.
    - Điều kiện bình thường: khi có sự thay đổi trên Switch Server 1 thì Switch Server 2 sẽ học. Nó sẽ đảm bảo duy trì cho thệ thống.
    - Điều kiện thay đổi: khi một Switch Server cắm vào hệ thống mới nếu chỉ số Revision cao hơn Server hiện tại nó sẽ làm sai lệch thông tin VLAN. Bởi vậy trước khi cắm vào phải chuyển nó sang mode Client hoặc Transparen rồi mới chuyển lại mode Server.

- **d. Chống tấn công DoS dùng VTP**
    - Để chống tấn công DoS ta đặt mật khẩu VTP

- **e. VTP Pruning**
    - Chống lãng phí lưu lượng đường truyền (dành cho hệ thống có VTP Server và VTP Transparent)
    - Khi bật tính năng này từ Switch Server các Switch Client sẽ học.
    - Khi Client nhận được VTP Pruning nó sẽ thông báo lại có những VLAN nào trên nó. Khi một gói tin từ một VLAN gửi đi Switch Server sẽ biết và không gửi vào những Switch không có VLAN đó.
- VD: có 3 switch. 1 server và 2 client.
![img](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYLErYk4Kda-ik1_64JMjS3deF9Kug8B0Y1rxQp6wir6hVsl40)

##### 3. Các mode hoạt động:
- **a. Mode Server:**
  - Có quyền tạo VLAN, Sửa VLAN, Xóa VLAN
  - Có quyền gửi thông tin đi cho các Switch khác
  - Có thể học thông tin từ Switch khác sau đó chuyển đi cho switch khác học
  
- **b. Mode Client:**
  - Không thể tạo, sửa, xóa VLAN
  - Nó có thể gửi đi thông tin đi cho người khác học.

- **c. Mode Transparent:**
  - Có thể tạo, sửa, xóa VLAN nhưng chỉ trong nộ bộ của Switch đó thôi.
  - Không đồng bộ cũng không gửi thông tin cấu hình đi cho người khác.
  - Làm trạm trung chuyển các thông tin quảng bá của VTP tới Client.
- Chú ý: Khi nào thì dùng Transparent: Trên SW Server có 5 VLAN: 2 tới 5. Nhưng VLAN 2 là phòng Sale có nhiều nhân viên nên cần có SW mở rộng nhiều cổng. Lúc này trên SW transparent chỉ cần cấu mình mình VLAN 2. SW transparent sẽ không cập nhật thông tin của các VLAN khác.

##### 4. Cấu hình VTP:
- **a. Câu lệnh cấu hình tổng quan:**

        SW(config)#vtp  mode [Server | Client | Transparent ]
        SW(config)#vtp  domain  domain-name
        SW(config)#vtp pasword  abc
        SW(config)#vtp version number
        SW(config)#vtp pruning
        SW(config)#end

- **b. Câu lệnh chi tiết:**
  - Trên Switch Server:
  - Khởi tạo VTP Server:
    
        SW(config)#vtp  mode Server
        SW(config)#vtp  domain  dnu
        SW(config)#vtp pasword  abc
        SW(config)#vtp version 2
        SW(config)#vtp pruning (Packet tracer không hỗ trợ).
        SW(config)#end

  - Bật đường Trunking của cổng kết nối tới các SW Client:
    
        SW(config)#interface f0/24
        SW(config-if)#switchport mode trunk
-----------------
![img](https://vnpro.vn/wp-content/uploads/2015/09/vtp-domain.png)
# END