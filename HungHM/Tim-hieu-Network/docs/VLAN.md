# VLAN

## Mục lục

[I.Định Nghĩa](#1)

[II. Phân Loại VLAN](#2)

[III. Lơi Ích Của VLAN](#3)

[IV. Mục Tiêu](#3)

[V.Hoạt Động Của VLAN](#4)

 ===========================

<a name ="1"></a>
I. Định Nghĩa
- VLAN( Virutual Local Area Network) hay được gọi là mạng Lan ảo. Mõi VLAN được định nghĩa là một nhóm logic các thiết bị mạng được thiết lập dựa trên các yếu tố như chức năng, bộ phận ...ứng dụng của công ty.Về mặt kĩ thuật VLAN là một trong mieèn quảng bá được tạo bởi các swich có thể tạo ra miền quảng bá
- Việc cấu hình VLAN sẽ được thực hiện khi máy tính của người dùng quá lớn và lưu lượng truyu cập quá nhiều
<img src="https://imgur.com/OsIKLTN.jpg">

<a name ="2"></a>
II. Phân Loại VLAN

- Port-based VLAN:là cách cấu hình VLAN đơn giửn và phổ biến .Mõi cổng của swich được gắn một VLAN xác định .Do vậy bất cứ thiết bị host nào gắn với cổng đó đều thhuộc 1 VLAN nào đó 
- MAC Address based VLAN:cách cấu hình này ít được xử dụng do nhiều bất tiện tring việc Quản lý ,mỗi địa chỉ MAC được đánh dấu với 1 VLAN xác định
- Protocol based VLAN: Cấu hình này giống như MAC address based,nhưng sử dụng một địa chỉ logic hay địa chỉ IP thay thế cho dịa chỉ MAC.Cách cấu hình không còn thông dụng nhờ sử dụng gioa thức DHCP

<a name ="3"></a>
III. Lơi Ích Của VLAN
- Tiết kiệm băng thông của hệ thống mạng 
- Tăng khả năng bảo mật
- Dễ dàng thêm hay bớt máy tính vào VLAN
- Giúp mạng có tính linh đọng cao 

<a name ="4"></a>
IV. Mục Tiêu
- An ninh mạng:Khi gửi môt thông tin thì người trong cùng một hệ thống có thể bắt các gói tin lại và tiến hành phân tích gói tin dẫn đến việc các thông tin gói tin bí mật có thẻ bị lộ ra ngoài .Còn ở trong VlAN chỉ truyền thông tin với nhau trong miền quảng ba.
- Phân phối (broadcast) khi một thông tin được truyền đi trong hệ thống thì tất cả các máy đều nhận được thông tin và phải xử lý mặc dù đó k pahỉ là máy nhận dẫn đến tiêu tốn CPU và thời gian .Công nghệ VLAN sẽ tạo ra các nhóm làm việc riêng chai các boadcast domain riêng ch từng hệ thống không ảnh hưởng đến VLAN khác 
- Tân dụng băng thông:Khi người dùng tham gia một phân đoạn mạng thì họ sẽ cia băng thông của đoạn mạng đó .Nếu như số lượng người dùng ít thì có vẻ điều này không ảnh hưởng nhiều,nhưng nếu số lượng người dùng tăng lên thì dẫn đến việc hệ thống hoạt động chậm hoặc có thể tắc ngẽn.VLAN giúp tăng băng thông cho người sử dụng trong một mạng chia sẻ.Bằng cách tạo thêm nhiều boabcast domain,mỗi VLAN sẽ hoạt đọng với băng thông vốn có của người dùng nhưng số hệ thống ít hơn do đó băng thông chia cho mỗi người dùng sẽ tăng lên đắng kể
- Độ chễ của Router: khi truyền tin pahỉ thông qua nhiều đoạn mạng cũng như router nên việc đưa hai máy trong cùng một hệ thống về VLAN thì độ chễ sẽ giảm đi đáng kể.

<a name ="5"></a>
V. Hoạt đông của VLAN
- Chia VLAN trên swich
    - B!: Từ VLAN default tạo ra một VLAN mới 
    - B2: Gán các port và VLAN mới tạo được
    - B3: Kiểm tra thông tin xem các port đã thuộc VLAN mới hay chưa 
    - B4:Đặt địa chỉ IP
- Trunk: là một kết nối swich này sang swich kia liên kết với nhau.Một đường được cấu hình Trunk sẽ gộp những liênkết ảo trên một liên kết vật lý  để truyền tín hiệu cho các VLAN trên các Switch với nhau dựa trên đường truyền cap vật lý
    - Chuẩn IEEE
    - Chuẩn Cisco
- Inter-VLAN : định tuyến liên mạng giữa các VLAN 
    - Dùng Router kết nối với Switch, mỗi Interface của Router tương ứng cho một VLAN gắn Router kết nối và cấu hình địa chỉ IP bình thường để làm Default Gateway cho VLAN
    - Dùng Router kết nối với Switch và chia Sub-Interface tương ứng với các VLAN (Router on a Stick).
    - Dùng Switch Layer 3 để thay thế.

![Inter-VLAN](https://s8182.pcdn.co/wp-content/uploads/2014/07/070214_1824_InterVLANRo9.jpg)
