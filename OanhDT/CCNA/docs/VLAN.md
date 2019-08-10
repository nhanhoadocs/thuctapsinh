# VLAN (VIRTUAL LOCAL AREA NETWORK)
## MỤC LỤC 
- [I.Định nghĩa](#1)
- [II. Mục tiêu ](#2)
- [III. Phân loại](#3)
- [IV. Hoạt động ntn ](#4)

<a name= "1"></a>

### I. Định nghĩa
- VLAN là một mạng LAN ảo,cho phép cấu hình các mạng LAN độc lập một cách logic trên cùng một switch.
- Việc cấu hình VLAN sẽ được thực hiện khi mạng máy tính của người dùng quá lớn và lưu lượng truy cập quá nhiều.
    - Trên 200 máy 
    - Bên trong mạng LAN lưu lượng quảng bá của người dùng đã đạt mức quá lớn.
    - Người dùng có nhu cầu gia tăng bảo mật các dữ liệu trong quá trình làm việc nhóm.
    - Hệ thống máy tính kết nối chậm vì có quá nhiều bảng tin quảng bá.
![Ví dụ VLAN](https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/V%C3%AD%20d%E1%BB%A5%20v%E1%BB%81%20VLAN.jpg)



<a name="2"></a>

### II. Mục tiêu 
- **An ninh mạng** : khi gửi một thông tin thì người trong cùng một hệ thống có thể bắt các gói tin lại và tiến hành phân tích gói tin dẫn đến việc các thông tin bí mật có thể bị lộ ra ngoài.CÒn ở trong VLAN chỉ truyền thông tin với nhau trong một miền quảng bá (broadcast domain)
- **Phân phối broadcast** : khi một thông tin được truyền đi trong hệ thống thì tất cả các máy đều nhận được thông tin và phải xử lý mặc dù đó không phải là máy nhận -> tiêu tốn CPU và thời gian.Công nghệ VLAN sẽ tạo ra các nhóm làm việc riêng chia các broadcast domain riêng cho từng hệ thống để không ảnh hưởng deén VLAN khác.
- **Tận dụng băng thông** : khi một người dùng tham gia vào một phân đoạn mạng thì họ sẽ chia băng thông của phân đoạn đó. Nếu như với số lượng người dùng ít thì việc này có vẻ không ảnh hưởng nhiều nhưng nếu số lượng người dùng tăng lên thì dẫn đến việc hệ thống hoạt động chậm hoạc có thể tắc nghẽn. VLAN giúp tăng băng thông cho người sử dụng trong một mạng chia sẻ. Bằng cách tạo thêm nhiều broadcast domain, mỗi VLAN sẽ hoạt động với băng thông vốn có của hệ thông nhưng số người dùng ít hơn, do đó băng thông chia cho mỗi người dùng sẽ tăng lên đáng kể.
- **Độ trễ của Router** : khi truyền tin đi phải thông qua nhiều đoạn mạng cũng như router nên việc đưa hai máy trong cùng một hệ thống về VLAN thì độ trễ giảm đi đáng kể.
- **Danh sách các truy cập khác** : sử dụng công nghệ VLAN, khi đó những nhân viên cùng một VLAN và thông tin trao đổi giữa họ sẽ chỉ trong VLAN mà người quản trị cấu hình mà không đi qua phân đoạn mạng của nhân viên thuộc phân đoạn mạng C.

<a name="3"></a>

### III. Phân loại 
- Static VLAN : được tạo ra bằng cách gắn các cổng switch vào một VLAN 

![Static VLAN](https://basantshrestha.files.wordpress.com/2013/02/8.png)

- Dynamic VLAN : tạo ra bằng cách sử dụng những phần mềm điển hình như Ciscowork 2000.

![Dynamic VLAN](https://rscciew.files.wordpress.com/2015/01/dvaacs1.png)

<a name = "4"></a>

### IV. Hoạt động của VLAN 
- Chia VLAN trên Switch : 
    - Bước 1: Từ một VLAN default tạo một VLAN mới đặt tag cho VLAN vừa tạo 
    - Bước 2: Gán các port vào VLAN mới được tạo 
    - Bước 3: Kiểm tra thông tin xem các port vừa gán đã thuộc VLAN mới hay chưa 
    - Bước 4: Đặt địa chỉ IP 
- Trunk : là một kết nối từ switch này sang switch khác hộ trợ VLAN trên các switch liên kết với nhau.Một đường được cấu hình Trunk sẽ gộp nhiều liên kết ảo trên một liên kết vật lý để chuyển tín hiệu từ các VLAN trên các switch với nhau dựa trên một đường cáp vật lý.
    - Chuẩn IEEE.
    - Chuẩn Cisco.

![Trunk](https://4.bp.blogspot.com/-73-1FnkWrFU/WJiETQiWylI/AAAAAAAAAis/14AKNzWrjYgtCU16dBbh4Y86dZgdjjbWwCLcB/s1600/Capture.PNG)

- Inter-VLAN : định tuyến liên mạng giữa các VLAN 
    - Dùng Router kết nối với Switch, mỗi Interface của Router tương ứng cho một VLAN gắn Router kết nối và cấu hình địa chỉ IP bình thường để làm Default Gateway cho VLAN
    - Dùng Router kết nối với Switch và chia Sub-Interface tương ứng với các VLAN (Router on a Stick).
    - Dùng Switch Layer 3 để thay thế.

![Inter-VLAN](https://s8182.pcdn.co/wp-content/uploads/2014/07/070214_1824_InterVLANRo9.jpg)



