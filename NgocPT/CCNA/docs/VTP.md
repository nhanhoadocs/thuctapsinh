# VTP (VLAN trunking Protocol)
## 1.Khái niệm
- VTP là giao thức độc quyền của Cisco, hoạt động ở lớp 2 của OSI,VTP giúp cho việc cấu hình VLAN luôn đồng nhất khi thêm , xóa , sửa thông tin về VLAN trong một hệ thống mạng.
## 2. Lợi ích của VTP
 VTP cung cấp các lợi ích sau:
- Cấu hình đúng các VLAN qua mạng
- Hệ thống ánh xạ cho phép 1 VLAN được trunk qua các môi trường truyền hỗn hợp. 
- Theo dõi chính xác kiểm tra VLAN
- Báo động về việc thêm vào các VLAN
- Dễ dàng thêm mới VLAN
## 3. Các chế độ hoạt động của VTP
### a.Chế độ máy chủ(server)
- Các VTP chế độ này cho phép tạo, chỉnh sửa, xóa VLAN, gửi hoặc chuyển thông tin quảng bá, đồng bộ hóa thông tin VLAN.
### b.Chế độ máy khách (client)
- Các VTP chế độ này không cho phép tạo, chỉnh sửa hoặc xóa VLAN, chuyển thông tin quảng bá.
### c.Chế độ trong suốt (Transparent)
- Ở chế độ trong suốt , một switch không quảng bá cấu hình VLAN của chính nó, và một switch không đồng bộ cở sở dữ liệu VLAN của nó với thông tin quảng bá nhận được.
- Ở chế độ này cho phép tạo, sửa , xóa nhưng chỉ trong nội bộ, không gửi, không đồng bộ hóa thông tin vlan.
## 3. Cách thức hoạt động của VTP 
- Các gói tin VTP sẽ được gửi ra bằng mullticast frames
- VTP server và VTP client sẽ đồng bộ hóa với cấu hình VLAN có số revision number cao nhất.
- Gói tin VTP được gửi theo định kì 5p 1 lần hoặc có sự thay đổi.


