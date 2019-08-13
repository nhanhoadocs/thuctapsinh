# Tìm hiểu về VLAN 
## giới thiệu về vlan
- VLAN - virtual local area network: được gọi là mạng LAN ảo.
- VLAN là một kỹ thuật tạo lập các mạng LAN  ảo trong cùng một mạng cục bộ giảm thiểu miện quảng bá (broadcast domain) và quản lý mạng rộng lớn.
- Các VLAN tương đương như các mạng con (stubnet)
- Chuẩn áp dụng cho VLAN là IEEE 802.1Q.
## Phân loại VLAN.
- Có 3 loai VLAN gồm:
    - VLAN dựa theo cổng:  mỗi cổng được gắn với một VLAN xác định.
    - VLAN dựa trên địa chỉ vật lý (MAC): mỗi địa chỉ MAC được gắn với VLAN nhất định, cách này phức tạp và khó khăn cho việc quản lý.
    - VLAN dựa trên giao thức ( protocol based VLAN): sử dụng địa chỉ IP thay cho địa chỉ MAC. cách này không thông dụng.
## Phương thức để tạo lập VLAN.
- VLAN tĩnh (static VLAN): 
    - Là việc gán cổng switch vào một VLAN 
- VLAN động (dynamic VLAN):
    - Thông qua việc sử dụng phần mềm.
    - VMSP - VLAN managerment policy server: đăng ký các cổng  của switch vào các VLAN một cách tự động dựa trên địa chỉ MAC cả thiết bị.
    - Khi sử dụng nó sẽ truy vấn cơ sở dữ liệu trên VMPS của các VLAN thành viên 
## End-to-end VLAN
- Cho phép các thiết bị  trong một nhóm sử dụng chung tài nguyên như máy chủ lưu trữ, . . 
- End-toend VLAN duy trì 80% thông lượng trên VLAN hiện thời
- Ưu điểm của VLAN:
    - Người dung dc nhóm vào các VLAN độc lập  về vị trí nhưng lại phụ thuộc nahu về nhóm chức năng và công việc.
    - Có 80% băng thông được sử dụng.
    - VLAN dùng cho người không thay đổi.
    - Mỗi VLAN có bảo mật riêng cho từng thành viên.
## Local VLAN
- Sử dụng cho nhiều hệ thống mạng cần có sự di chuyển đến nơi tập trung nhiều tài nguyên.

# Gioi thiệu về giao thức mạch nối VLAN (VTP)
## Mô tả VTP
- VTP là: VLAN trunking protocol.
- Duy trì  cấu hình VLAN nhất quán giữa toàn bộ switch trong mạng 
- VTP sử dụng gói trunk lớp 2 quản lý các bổ sung, xóa bỏ và thay đổi tên của VLAN trên tất cả các switch trong một miền VTP.
- Các switch chia sẻ sẻ trong một miền VTP thông qua trao đổi VTP update để phan phối bản cập nhật và đồng bộ hóa thông tin VLAN.
## Một số thuộc tính của VTP.
- Là giao thức độc quyền của cisco.
- Chỉ quảng cáo VLAN 1 đến 1005
- Tin cập nhật chỉ được trao đổi qua các liên kết trung kế.
- Một số swicth hoạt động trong một chế độ VTP được cấu hình để xác định cách cập nhập gủi và nhân thông tin VLAN.
## cổng truy cập trên switch.
- Cổng truy cập- access:   
    - Cổng truy cập chỉ thuộc một VLAN. tất cả các máy tính kết nối với cổng này đểu thuộc VLAN đó
    - Frame được gửi trên cổng truy cập sẽ tuân theo chuẩn định dạng khung ethernet(802.3).
- Cổng trung kế -trunk link:
    - Là một kết nối vật lý là logic để hỗ trợ các VLAN trên các switch  liên kết với nhau.
    - Cho phép các frame của nhiều VLAN có thể truyền trên đó
    - Cổng trung kế được dùng để kết nối giữa các switch hoăc giữa switch và router.
    - Chỉ cần một đường vật lý cho cả hai VLAN giữa hai switch.
## VLAN 1
- Là kiể mặc định cho tất cả thiết bị hỗ trợ chuyển mạch VLAN.
## Default VLAN.
- Là kiểu mặc định ban đầu với tất cả các cổng giao tiếp trên thiết bị chuyển mạch
- Các VLAN khác như User VLAN, Native VLAN, và Management VLAN đểu là thành phần con của Default VLAN.
## User VLAN.
- VLAN chứa tất cả tài khoản người dùng thành từng nhóm dựa theo các thuộc tính và đặc thù công việc.
## Native VLAN.
- Dùng để cấu hình trunking một số thiết bị không tương thích với nhau.

# Chế độ làm việc của vtp.
- Chế độ server
- Chế độ client
- Chế độ transparent
## Chế độ server
- Các server VTP tạo ra các VLAN thay đổi miền của nó
    - Tạo, chỉnh sửa, xóa VLAN
    - Đồng bộ hóa thông tin VLAN
    - Chuyển tiếp thông tin quảng bá
##  Chế độ client
- Là chế độ gnhe thụ động không tạo chỉnh sửa và xóa VLAN.
- Chuyển tiếp ra liên kết trunk đến các switch lân cận miền.
- Chuyển tiếp thông tin quảng bá
- Không đồng bộ hóa VLAN
## Chế độ transparent
- Có thể tạo và xóa VLAN cục bộ tuy nhiên thay đổi không được truyền đến swich nào
- Chỉnh sửa xóa VLAN
- Không đồng bộ thông tin VLAN
- Lưu cấu hình vào NVRAM  