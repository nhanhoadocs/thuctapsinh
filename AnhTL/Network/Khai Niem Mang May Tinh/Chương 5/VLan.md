# VLAN
---------------------------------------------------------------------------------------------
![img](https://img-en.fs.com/images/ckfinder/ftp_images/tutorial/inter-vlan-routing-2.jpg)
#### Khái niệm
- VLAN (Virtual Local Area Network) hay còn gọi là mạng LAN ảo. Một VLAN được định nghĩa là một nhóm các thiết bị mạng và được thiết lập dựa trên các yếu tố như chức năng, bộ phận, ứng dụng… của công ty. Về mặt kỹ thuật, VLAN là một miền quảng bá được tạo bởi các switch. Bình thường thì router đóng vai trò tạo ra miền quảng bá. Đối với VLAN, switch có thể tạo ra miền quảng bá.

![img](https://st.quantrimang.com/photos/image/012010/26/vlan1.jpg)

- Việc này được thực hiện khi quản trị viên đặt một số cổng switch trong VLAN ngoại trừ VLAN 1 - VLAN mặc định. Tất cả các cổng trong một mạng VLAN đơn đều thuộc một miền quảng bá duy nhất.
- Tất cả các máy tính này đều có thể giao tiếp với nhau vì chúng thuộc cùng một VLAN. Nếu không được cấu hình bổ sung, chúng sẽ không thể giao tiếp với các máy tính khác nằm ngoài VLAN.

#### Phân loại VLan

- Port - based VLAN: là cách cấu hình VLAN đơn giản và phổ biến. Mỗi cổng của Switch được gắn với một VLAN xác định (mặc định là VLAN 1), do vậy bất cứ thiết bị host nào gắn vào cổng đó đều thuộc một VLAN nào đó.
- MAC address based VLAN: Cách cấu hình này ít được sử dụng do có nhiều bất tiện trong việc quản lý. Mỗi địa chỉ MAC được đánh dấu với một VLAN xác định.
- Protocol – based VLAN: Cách cấu hình này gần giống như MAC Address based, nhưng sử dụng một địa chỉ logic hay địa chỉ IP thay thế cho địa chỉ MAC. Cách cấu hình không còn thông dụng nhờ sử dụng giao thức DHCP.

#### Lợi ích của VLAN

- **Tiết kiệm băng thông của hệ thống mạng**:VLAN chia mạng LAN thành nhiều đoạn (segment) nhỏ, mỗi đoạn đó là một vùng quảng bá (broadcast domain). Khi có gói tin quảng bá (broadcast), nó sẽ được truyền duy nhất trong VLAN tương ứng. Do đó việc chia VLAN giúp tiết kiệm băng thông của hệ thống mạng.
- **Tăng khả năng bảo mật**: Do các thiết bị ở các VLAN khác nhau không thể truy nhập vào nhau (trừ khi ta sử dụng router nối giữa các VLAN). Như trong ví dụ trên, các máy tính trong VLAN kế toán (Accounting) chỉ có thể liên lạc được với nhau. Máy ở VLAN kế toán không thể kết nối được với máy tính ở VLAN kỹ sư (Engineering).
- **Dễ dàng thêm hay bớt máy tính vào VLAN**: Việc thêm một máy tính vào VLAN rất đơn giản, chỉ cần cấu hình cổng cho máy đó vào VLAN mong muốn.
- **Giúp mạng có tính linh động cao**: VLAN có thể dễ dàng di chuyển các thiết bị. Giả sử trong ví dụ trên, sau một thời gian sử dụng công ty quyết định để mỗi bộ phận ở một tầng riêng biệt. Với VLAN, ta chỉ cần cấu hình lại các cổng switch rồi đặt chúng vào các VLAN theo yêu cầu. VLAN có thể được cấu hình tĩnh hay động. Trong cấu hình tĩnh, người quản trị mạng phải cấu hình cho từng cổng của mỗi switch. Sau đó, gán cho nó vào một VLAN nào đó. Trong cấu hình động mỗi cổng của switch có thể tự cấu hình VLAN cho mình dựa vào địa chỉ MAC của thiết bị được kết nối vào.
- Tạ không cần cấu hình một mạng LAN ảo trừ khi mạng máy tính của ta quá lớn và có lưu lượng truy cập quá nhiều.
- VLAN được kích hoạt mặc định và tất cả các máy tính đã nằm trong một VLAN. VLAN đó chính là VLAN 1. Bởi thế mà theo mặc định, bạn có thể sử dụng tất cả các cổng trên switch và tất cả các máy tính đều có khả năng giao tiếp với nhau.

#### Khi nào thì cần VLan
- Có quá nhiều máy tính trong mạng LAN
- Lưu lượng quảng bá (broadcast traffic) trong mạng LAN của bạn quá lớn
- Các nhóm làm việc cần gia tăng bảo mật hoặc bị làm chậm vì quá nhiều bản tin quảng bá.
- Các nhóm làm việc cần nằm trên cùng một miền quảng bá vì họ đang dùng chung các ứng dụng. Ví dụ như một công ty sử dụng điện thoại VoIP. Một số người muốn sử dụng điện thoại có thể thuộc một mạng VLAN khác, không cùng với người dùng thường xuyên.
- Hoặc chỉ để chuyển đổi một switch đơn thành nhiều switch ảo.

#### Tại sao không chia subnet?
- Mỗi VLAN nên ở subnet của riêng mình. VLAN có ưu điểm hơn subnet ở chỗ các máy tính tại những vị trí vật lý khác nhau (không quay lại cùng một router) có thể nằm trong cùng một mạng. Hạn chế của việc chia subnet với một router đó là tất cả máy tính trên subnet đó phải được kết nối tới cùng một switch và switch đó phải được kết nối tới một cổng trên router.
- Với VLAN, một máy tính có thể được kết nối tới switch này trong khi máy tính khác có thể kết nối tới switch kia mà tất cả các máy tính vẫn nằm trên VLAN chung (miền quảng bá).

#### Cổng trunk?
- Các máy tính trên VLAN khác nhau có thể giao tiếp với một router hoặc một switch Layer 3. Do mỗi VLAN là subnet của riêng nó, router hoặc switch Layer 3 phải được dùng để định tuyến giữa các subnet.
- Khi một liên kết giữa hai switch hoặc giữa một router và một switch truyền tải lưu lượng của nhiều VLAN thì cổng đó gọi là cổng **trunk.**
- Cổng trunk phải chạy giao thức đường truyền đặc biệt. Giao thức được sử dụng có thể là giao thức độc quyền ISL của Cisco hoặc IEEE chuẩn 802.1q.

- **VLAN Trunking**

a. VLAN trunking trong công nghệ VLAN: là đường truyền giữa 2 Switch được chia làm 2 loại:
  + 1 là đường Access, cho phép các Frame thông thường đi qua
  + 2 là đường Trunking cho phép nhiều miền VLAN đi qua. Đường Trunk cho phép tối thiểu là 100Mbps trở lên.

b. Cách thức hoạt động của đường Trunking
  - Đường Trunking nhận diện frame: Khi frame đi vào đường Trunking sẽ được tạo đánh nhãn (taglink), còn khi ra khỏi thì Untrunking.
 - Khi Farme thuộc VLAN 2 đi vào đường Trunk sẽ được gán nhãn là số 2, khi ra khỏi đường Trunk nó thấy nhãn là số 2 sẽ tách ra và đưa vào VLAN 2. 
- Khi máy các máy trao đổi thông tin thì các Frame này là nguyên bản. Các thông tin VLAN chỉ được gán thêm khi di chuyển qua đường Trunk.
- Switch là Ethernet nên để đưa được thông tin vào trong Frame thì nó nhờ vào một trong 2 giao thức sau: là ISL và dot1Q
- ISL là chạy mặc định trên Switch layer 3 (Inter Switch Link chỉ dành riêng cho thiết bị Cisco).
- dot1Q hộ trợ mặc định trên Switch layer 2 (IEEE 802.1Q).

#### 5. Số hiệu VLAN
- Chạy từ 0 tới 4095:  riêng VLAN 0 và 4095 là không dùng
- 1 tới 1001 là VLAN thông thường.
- 1002 tới 1005: dùng để giao tiếp với mạng kiểu cũ Tokenring.
- 1006 tới 4094: dùng làm giải mở rộng sẽ cấu hình Transperent (học sau).   
- Các VLAN mặc định sau không được sửa xóa: VLAN 1 là default, 1002 tới 1005. Ban đầu tất cả các cổng của Switch cisco mặc định là VLAN 1. 

#### overview
- VLAN là một miền quảng bá tạo bởi các switch.
- Quản trị viên phải tạo VLAN sau đó chỉ định cổng nào vào VLAN nào một cách thủ công.
- VLAN giúp tăng hiệu suất cho mạng LAN cỡ vừa và lớn.
- Tất cả các máy tính đều nằm trong VLAN 1 theo mặc định.
- Cổng trunk là cổng đặc biệt sử dụng giao thức ISL hoặc 802.1q, nhờ thế nó có thể truyền tải lưu lượng của nhiều VLAN.
- Để các máy tính thuộc các VLAN khác nhau giao tiếp với nhau, bạn cần dùng một router hoặc switch Layer 3.

# END