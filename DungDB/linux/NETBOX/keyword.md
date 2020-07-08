# Các từ khóa liên quan

- DCIM — DataCenter Infrastructure Management: Quản lý cơ sở hạ tầng trung tâm dữ liệu

- IPAM — IP Address Management: Quản lý địa chỉ IP

- ASN: (Autonomous System Number) là số thường được dùng trong các thủ tục định tuyến động trên mạng Internet. Bắt đầu từ ngày 01/01/2007, các tổ chức quản lý địa chỉ trên thế giới đã quyết định đưa vào sử dụng thế hệ số hiệu mạng mới với cấu trúc 32 bit. ASN Việt Nam: 10595

Xem tại: https://www.whatismyip.com/asn/

- VRF - Virtual Routing Forwarding

https://vnpro.vn/thu-vien/kien-truc-tong-quan-mpls-vpn-virtual-routing-forwarding-vrf-2105.html

Nhân hòa dùng loại tủ rack với thông tin bên dưới, 

![Imgur](https://i.imgur.com/IPMw711.png)

Wall-mounted cabinet, 23 inches, 42U ở FPT hoặc 48U ở CMC

- Part number: Số lô của các thiết bị (có thể trùng)
- Serial number: Số serial của thiết bị (duy nhất)
- Asset tag: Mã quản lý thiết bị công ty. Công ty ty quy định (duy nhất)

**Tìm thiết bị**: Có thể tìm được bằng serial number và Asset Tag

**Tìm inventory**: Chỉ tìm được bằng serial number 

Tìm hiểu các khái niệm role IP:

![Imgur](https://i.imgur.com/iSzVTEL.png)

- Anycast: ? là một phương pháp sử dụng các địa chỉ mạng và định tuyến để gửi dữ liệu từ một nguồn duy nhất đến một trong những nút của một nhóm các thiết bị, dựa trên căn bản là gần nhất, ít tốn kém nhất, khỏe mạnh nhất, tuyến ít bị nghẽn nhất, hay các phương pháp đo lường khoảng cách khác. Kỹ thuật này xảy ra trong tầng network của mô hình OSI.

- Secondary: ? Mạng thứ 2 của thiết bị

- VIP: Virtual IP, IP ảo dùng chung cho nhiều server. Có tính dự phòng
- VRRP (Virtual Router Redundancy Protocol): Cho phép sử dụng một địa chỉ gateway cho một nhóm các router. Có tính dự phòng
- HSRP: Tương tụ VRRP nhưng đây là giao thức chỉ dùng riêng cho router của hãng Cisco
- GLBP (Gateway Load Balancing Protocol): là một giao thức dự phòng gateway của Cisco. Tương tự như HSRP và VRRP, giao thức này cho phép nhiều router cùng tham gia vào một group, xây dựng nên một router ảo để làm default – gateway cho các host trong LAN. Tuy nhiên, điểm khác biệt là GLBP không chỉ thực hiện dự phòng mà còn cho phép các router cân bằng tải lưu lượng đi từ trong LAN ra ngoài.
- CARP (Common Address Redundancy Protocol):  là một giao thức mạng máy tính cho phép nhiều máy chủ trên cùng một mạng cục bộ chia sẻ một tập hợp các địa chỉ IP. Mục đích chính của nó là cung cấp dự phòng dự phòng, đặc biệt là khi được sử dụng với tường lửa và bộ định tuyến. Trong một số cấu hình, CARP cũng có thể cung cấp chức năng cân bằng tải. CARP cung cấp chức năng tương tự như VRRP và với HSRP của Cisco Systems. Nó được triển khai trong một số hệ điều hành dựa trên BSD và đã được chuyển sang Linux (ucarp)

Các khái niệm cần quan tâm:

- Regions: Khái niệm liên quan đến địa lý. Là một vùng địa lý. Có thể là châu lục, quốc gia, thành phố, quận... Trong một Region có thể có các Region con

- Sites: Nhỏ hơn Region. Ở đây chia theo DC

![Imgur](https://i.imgur.com/miSct9U.png)

- Tenant Groups: Nhóm khách hàng sử dụng dịch vụ. (chính phủ, doanh nghiệp,...)
- Tenants: Các khách hàng (công ty A, doanh nghiệp B,...)

- Rack Elevations: Rack đang dùng, đang cung cấp dịch vụ
- Rack Reservations: Rack chưa sử dụng, sẵn sàng được sử dụng

- Rack Roles: Vai trò của Rack (Phục vụ khách bên ngoài, phục vụ nội bộ,...)
- Rack Groups: Nhóm tủ Rack (chia theo DC). Trong group có thể có group cha, group con

![Imgur](https://i.imgur.com/dkKeroN.png)

- Racks: Các rack cụ thể (tên gì, đặt ở đâu,dể làm gì,...)

![Imgur](https://i.imgur.com/8OywN7z.png)

- Manufacturers: Nhà cung cấp thiết bị. Các hãng Dell, HP,...

![Imgur](https://i.imgur.com/yUAzGg4.png)

- Device Types: Loại thiết bị. Thiết bị dòng gì, tên cụ thể của dòng

![Imgur](https://i.imgur.com/y1nlJBk.png)

- Virtual Chassis: Một khung ảo (virtual chassis) đại diện cho tập hợp các thiết bị dùng chung một bề mặt điều khiển (plane). Ví dụ như một stack các switch được quản lý như một thiết bị duy nhất. Mỗi thiết bị trong khung ảo được gán một vị trí và một mức độ ưu tiên (optional). Có một thiết bị sẽ được gán làm master, được giao tên, mật khẩu, dịch vụ và thuộc tính liên quan đến sự quản lý. Cần phân biệt khung ảo (virtual chassis) và thiết bị dựa trên khung (chassis-based device)

https://netbox.readthedocs.io/en/stable/models/dcim/virtualchassis/

- Platforms: Xác định phần mềm chạy trên thiết bị hoặc máy ảo. Điều này có thể hữu ích khi cần phân biệt giữa các bộ tính năng khác nhau. Chưa rõ lắm. Thử khai báo hệ điều hành, chỉ khai được cho máy ảo. 

- Device Roles: Vai trò của thiết bị

![Imgur](https://i.imgur.com/xmeNq2F.png)

- Devices: Các thiết bị cụ thể (Switch, server, router,...)

![Imgur](https://i.imgur.com/1zCSRDI.png)

- Inventory Items: Các thành phần bên trong thiết bị. Ví dụ như trong một server thì có RAM, chip, Card mạng,...

- Cables: Quản lý các dây mạng (loại gì, đầu này cắm vào máy mào, đầu kia cắm vào máy nào, trạng thái dây mạng hiện tại)
- Interface Connections: Các kết nối giữa các interface 

![Imgur](https://i.imgur.com/Fy2DicN.png)

- Console Connections: Các kết nối consonsole

- Power Connections: Các kết nối nguồn

Thêm theo thứ tự tenants (có thể có, có thể không), sites, Racks, IPAM, Power, devices

Mô hình điện:

![Imgur](https://i.imgur.com/JkQrHqO.png)

![Imgur](https://i.imgur.com/Rprx0hr.png)

- PDU - Power Distribution Unit: là ổ cắm điện. Mỗi rack có 2 PDU đặt dọc, mặt sau tủ rack
- Port outlet: ổ cắm của PDU (C13)
- Power port: port nguồn của server hoặc thiết bị khác (C14)

![Imgur](https://i.imgur.com/AUo8VtC.png)

Power Panel - Power feed - PDU - Power outlet - Power port - Server

Power panel dùng để quản lý nguồn điện, cung cấp điện cho toàn bộ hệ thống. Nối đến power feed. Từ power feed nối đến PDU. PDU có các outlet. Kết nối Power port của server đến outlet để láy điện sử dụng.

Trang tính công suất tiêu thụ của thiết bị: https://outervision.com/power-supply-calculator

Các switch port mode:
- access: Còn được gọi là untagged mode. Interface thuộc mode này chỉ có thể thuộc 1 VLAN
- tagged: Interface có thể thuộc nhiều VLAN
- trunk: Interface hoạt động với mode trunk

Địa chỉ MAC của port switch sẽ giống như sau: `001d:7172:6aca`

Nhưng khi khai báo vào netbox thì sẽ có dạng như sau: `00:1D:71:72:6A:CA`