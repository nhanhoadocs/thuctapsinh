# VLAN( Virtual Local Area Netword )
## 1. Khái niệm
VLAN là mạng LAN ảo ,VLAN là một kỹ thuật cho phép tạo lập các mạng LAN độc lập một cách logic trên cùng một Switch hay cùng một kiến trúc hạ tầng vật lý.  

*ví dụ về VLAN* 
![ví dụ VLAN](https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/V%C3%AD%20d%E1%BB%A5%20v%E1%BB%81%20VLAN.jpg)
Mở rộng hơn, mạng VLAN sẽ được ứng dụng trong những trường hợp dưới đây:
- Hệ thống máy tính trong mạng LAN đạt hơn 200 máy.
- Bên trong mạng LAN lưu lượng quảng bá của người dùng đã đạt mức quá lớn.
- Người dùng có nhu cầu gia tăng bảo mật các dữ liệu trong quá trình làm việc nhóm.
- Hệ thống máy tính kết nối chậm vì có quá nhiều bảng tin quảng bá.
- Nhóm làm việc sử dụng chung các ứng dụng cần phải thuộc cùng một miền quảng bá.
- Người dùng có nhu cầu chuyển đổi Switch đơn thành nhiều Switch ảo.
## 2. Phân loại VLAN
### 2.1. VLAN 1 
Đây là kiểu mạng mặc định của tất tất cả các thiết bị chuyển mạch hỗ trợ VLAN và nó hoạt động ở Lớp 2 đê quản lí 
### 2.2. Default VLAN
Là kiểu VLAN mặc định ban đầu với tất cả các cổng giao tiếp trên thiết bị chuyển mạch.
### 2.3. User VLAN ( Data VLAN )
Là VLAN trong đó chứa các tài khoản người dùng thành từng nhóm dựa theo các thuộc tính về đặc thù công việc của từng nhóm làm việc hay theo thuộc tính về vị trí vật lý của các nhóm làm việc này.
### 2.4. Native VLAN 
Là VLAN dùng để cấu hình Trunking do một số thiết bị không tương thích với nhau,lúc này ta phải sử dụng Native VLAN để chúng có thể giao tiếp với nhau,tất cả các khung dữ liệu (frame) của các VLAN khi giao tiếp qua kết nối Trunking đều sẽ được gắn tag của giao thức 802.1Q hoặc ISL, ngoại trừ các frame của VLAN 1. Native VLAN là VLAN mà frame của nó sẽ không được tag trước khi gửi qua đường trunk. Ngầm định Native VLAN của Switch là VLAN 1.
### 2.5. Management VLAN 
Để có thể giám sát từ xa các thiết bị chuyển mạch trong hệ thống mạng của mình.  
### 2.6. Voice VLAN 
Voice VLAN là VLAN dành cho lưu lượng thoại. Nó cho phép các cổng Switch mang lưu lượng thoại IP từ một điện thoại IP.   
