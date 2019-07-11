# 1. Tổng quan về giao thức DHCP 
a) Khái niệm về giao thức DHCP 
-   DHCP(Dynamic Host Configuration Protocol) : Là một giao thức cấp phát địa chỉ IP ; subnet mask; default gateway; dịch vụ DNS ( giao thức cấu thình host động)
- Nó thường được cấp phát bởi DHPC server tích hợp trên router 
- DHCP giao tiếp bằng UDP có port 67 và 68
- DHCP server sử dụng port 67 để nghe và sử dụng port 68 để reply 
b) Đặc điểm DHCP 
- Làm việc theo mô hình Client/Server 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot.png)
- Giao thức DHCP sử dụng port 68 và port 67 
- Ưu điểm khi sử dụng DHCP
    - Tập trung quản trị thông tin cấu hình I
    - Cấu hình động các máy
    - Cấu hình IP cho các máy một cách liền mạch.
    - Sự linh hoạt
    - Khả năng mở rộng.
    - Đơn giản hóa vài trò quản trị của việc cauas hình địa chỉ IP của client.
c) Kiến trúc DHCP 
- Có 3 thành phần bên trong kiến trúc DHCP bao gồm DHCP client, DHCP server, và DHCP relay agents
    - DHCP client: Là thiết bị dùng để kết nối vào mạng.
    - DHCP server: Là thiết bị cấp phát địa chỉ
    - DHCP relay agents: Là thiết bị trung gian chuyển tiếp giữa 2 thiết bị trên
- Một địa chỉ IP được cấp sẽ sử dụng được tối đa 24h. Sau Khi sử dụng địa chỉ IP 24h thì nó sẽ tự động đổi địa chỉ IP mới cho host 
d) Quá trình cấp IP của giao thức DHCP 
- Bước 1: Client tạo bản tin DHCPDISCOVER
Ban đầu, Client chưa có địa chỉ IP và nó có thể biết hoặc không biết vị trú của DHCP server trong mạng. Để tìm DHCP server, nó tạo bản tin DHCP DISCOVER: Địa chỉ MAC; có thể yêu cầu một địa chỉ IP xác định.
- Bước 2: Client gửi bản tin DHCP DISCOVER dưới dạng broadcast
- Bước 3: Server nhận và xử lý bản tin DHCP DISCOVER. Nó sẽ kiểm tra IP nào đã được sử dụng. Và chọn ra IP để cấp cho client 
- Bước 4: Server tạo bản tin DHCP OFFER. Gói tin này sẽ lưu trữ thông tin về IP và các thông số cấu hình khác mà client yêu cầu để có thể sử dụng để truy cập internet
- Bước 5: Tất cả các server sẽ gửi bản OFFER dưới dạng broadcast.
- Bước 6: Client nhận gói OFFER và nó sẽ chọn ra bản OFFER đầu tiên mà nó nhận được. Nếu không nhận được OFFER nào trong một khoảng thời gian nào đó thì nó sẽ gửi lại DISCOVER một lần nữa 
- Bước 7: Client tạo ra gói REQUEST. Và gửi dưới dạng broadcast tới tất cả các server. Server nào được nhận OFFER sẽ mang ý nghĩa là nó đồng ý nhận IP. Server nào không được nhận OFFER thì thông báo là không nhận OFFER đó
- Bước 8: Server nhận bản tin REQEST. Các server không được nhận OFFER sẽ bỏ qua gói tin này. Gói tin nào được nhận OFFER sẽ nhận và xử lý nó. Nó sẽ kiểm tra sem IP này còn sử dụng được hay không. Nếu còn sử dụng được thì nó sẽ ghi lại thông tin và gửi lại gói tin PACK cho client. Còn nếu không thì nó sẽ gửi lại PNAK để quay lại bước 1.
# 2.DHCP trong KVM
- Như phần trên thì ta cũng đã tìm hiểủ về DHCP là dịch vụ cấp phát địa chỉ IP động. Vậy trong KVM sự khác nhau giữa kiểu mạng là mô hình của nó. Và để chưng minh được sự khác nhau đó thì ta chứng minh rằng nơi cấp DHCP cho VM để thấy rõ được sự khác biệt giữa 2 kiểu mạng Bridge và NAT. 
## a) DHCP trong kiểu mạng NAT
### Để có thể tìm hiểu được giao thức DHCP trong kiểu mạng NAT ta cần chuẩn bị 
- Một VM sử dụng NAT default có MAC (52:54:00:cb:73:32) IP (192.168.122.134)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_9.png)
- Nó có sử dụng card vnet0 của pc 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_10.png)
- Sau đó ta sử dụng lệnh tcpdump để bắt gói tin kèm theo dhclient  
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_2.png)
- Sau khi sử dụng dclient thì ta sẽ ghi nó vào file dhcp.pcap. Sau rồi ta chia sẻ file dhcp.pcap sang PC bằng lệnh `scp` để có thể nhìn thấy được các bản tin của DHCP 
- Theo đúng như lý thuyết ta có 4 gói tin là : Discover; Offer; Request và ACK
- Để có thể chứng minh được rằng ai là thằng ACK. gói tin mà sẽ được chuyển từ server đến client để thông báo cho client biết rằng nó có thể sử dụng được IP thì khi đó trên gói tin sẽ ghi đầy đủ địa chỉ của client và server 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot12.png)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_14.png)
- Như ta thấy thì ở đây có địa chỉ MAC của server và client là  `Src 52:54:00:d1:c5:a8 và Dst 52:54:00:cb:73:32` trong đó Src( địa chỉ nguồn) Dst( địa chỉ đích)
- Thì cũng thấy `Src 52:54:00:d1:c5:a8` chính là địa chỉ của server và là địa chỉ của `NAT default` tạo ra là `virbr0` để cấp IP cho client 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_15.png)
- Vậy thì nơi cấp IP cho client ở NAT chính là `VM router` do NAT tạo ra 
## b) DHCP trong kiểu mạng bridge 
- Để có thể tìm hiểu được cái nào cấp DHCP VM trong kiểu mạng Bridge thì ta phải chuẩn bị được một VM có một số điều kiện sau: 
    - Có cài KVM 
    - Có file centos7.iso
    - có 2 card mạng  
    - Tạo bridge rồi add và ens9
- Ta cũng chạy lệnh tcpdump để bắt gói tin như kiểu mạng NAT rồi cũng chia sẻ gói tin bằng scp ra ngoài pc rồi dùng wireshack để đọc gói tin 
- card mạng NAT có địa chỉ MAC : 52:54:00:9a:d0:6d
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_6.png)
- và card ens9(bridge) có địa chỉ MAC : 52:54:00:6a:62:2d
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_5.png) 
- Ta tạo ra một VM ở trong host KVM này và có địa chỉ MAC: 52:54:00:9a:a2:7d 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_3.png)
- Sau khi bắt gói tin bằng `tcpdump` thành công thì ta sử dụng scp để có thể chia sẻ gói tin bằng `scp` ra PC rồi dùng wireshack để đọc bản ACK 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_11.png)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_16.png)
- Như ta thấy thì `Src 52:54:00:01:5d:4d` và `Dst là 52:54:00:9a:a2:7d` trong đó Dst chính là client và là VM ta yêu cầu cấp IP còn src thì là MAC mà kiểu mạng NAT tạo ra cho Host KVM chứ không. nó là người cấp DHCP cho VM chứ không phải card do bridge tạo ra. 
### Kết luận: Ta thấy được sự khác biệt của NAT và bridge là. Khi sử dụng kiểu mạng NAT thì nơi cấp DHCP cho VM chính là NAT cấp cho VM. Còn khi sử dụng kiểu mạng bridge thì bridge không thể cấp DHCP cho VM mà router nơi ta cắm mạng vào PC mới có thể cấp DHCP
# 3. Phân tích bản tin trong DHCP  
## a) DHCP DISCOVERY
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_17.png)
- Trong đó: 
- 1: là địa chỉ đầu và địa chỉ cuối của gói tin ghi bằng MAC 
- 2: là địa chỉ đầu và cuối nhưng được ghi bằng IPv4
- 3: là port mà gói tin đó sử dụng 
- 4: địa chỉ IP của client 
- 5: MAC của client 
- 6: IP client yêu cầu được cấp phát
## b) DHCP OFFER 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_18.png)
- Option 54: chỉ đính danh DHCP server 
- Option 51: thời gian cho thuê địa chỉ IP
- Option 1: địa chỉ subnet Mask
- Option 28 : địa chỉ broadcast
- Option 3 : địa chỉ default gateway
- Option 6 : địa chỉ DNS
## c) DHCP Request
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_19.png)
- Option 53: Kiểu tin nhắn 
- Option 55: Danh sách tham số yêu cầu 
- Option 50: Địa chỉ IP yêu cầu 
## d) DHCP ACK
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/dhcp_lab/screenshot_20.png)
- Nhiệm vụ của gói tin này là để xác nhận lại thông tin đã cấp cho client