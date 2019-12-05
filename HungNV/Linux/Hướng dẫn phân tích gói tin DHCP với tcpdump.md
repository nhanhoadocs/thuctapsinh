# Hướng dẫn phân tích gói tin DHCP với tcpdump
#### 1.Tổng quan về DHCP và tcpdump    

- DHCP (Dynamic Host Configuration Protocol) : là giao thức cấu hình máy chủ động dùng để cung cấp quản lý trung tâm nhanh chóng, tự động và là trung tâm phân phối địa chỉ ip trong mạng 
- tcpdump : là phần mềm bắt gói tin trong mạng làm việc trên hầu hết các hệ điều hành linux, tcpdump cho phép bắt và lưu lại gói tin bắt được

###### Cách hoạt động của giao thức DHCP

**Cách hoạt động:**

![Imgur](https://i.imgur.com/VohSfcU.png)

Một thiết bị (DHCP client) yêu cầu địa chỉ ip từ bộ định tuyến (DHCP Server) , sau đó server chỉ định 1 địa chỉ IP khả dụng để máy khách liên lạc trên mạng  

cụ thể là: 

**Bước 1:**

Khi 1 thiết bị (DHCP client) được  bật và kết nối với mạng có DHCP server,  DHCP Client sẽ gửi Broadcast một request đến DHCP server được gọi là yêu cầu DHCP Discover

**Bước 2:**  

Sau khi gói Discover đến DHCP server, DHCP server sẽ kiểm tra xem ip nào đã được sử dụng và chọn ra ip để cấp cho Client

**Bước 3:**

DHCP server sẽ cung cấp địa chỉ cho DHCP Client bằng gói DHCP OFFER. 

**Bước 4:**  

Khi client  đã thực hiện địa chỉ IP đã chọn, thiết bị sẽ phản hồi DHCP server bằng gói DHCP REQUEST để chấp nhận.

**Bước 5:**   

Sau đó máy server gửi ACK được sử dụng để xác nhận rằng thiết bị có địa chỉ IP cụ thể đó và để xác định lượng thời gian mà thiết bị có thể sử dụng địa chỉ trước khi nhận địa chỉ mới. 

**Bước 6:** 

Nếu IP mà Client yêu cầu không còn sử dụng được, DHCP server sẽ gửi lại bản tin NACK để thông báo cho Client và DHCP Client bắt sẽ bắt đầu lại quá trình thuê IP.


>  Hoạt động theo giao thức UDP, sử dụng 2 Port 68 cho client và 67 cho server

**Các gói tin phụ của DHCP:**  

- Gói tin DHCP Nak: Nếu một địa chỉ IP đã hết hạn hoặc đã được cấp phát cho một Client khác. DHCP Server sẻ tiến hành gửi gói DHCP Nak cho Client. Như vậy nếu Client muốn sử dụng lại địa chỉ IP thì phải bắt đầu tiến trình thuê lại địa chỉ IP.  

- DHCP Decline Packet: Nếu DHCP Client nhận được bản tin trả về không đủ thông tin hoặc hết hạn. Nó sẽ gửi gói DHCP Decline đến các Server để yêu cầu thiết lập lại tiến trình thuê địa chỉ IP.  

- Các gói tin DHCP Release: Client gửi bản tin này đến Server để ngừng thuê IP. Khi nhận được bản tin này, server sẽ thu hồi lại IP đã cấp cho Client. 

###### Quá trình xin cấp phát lại địa chỉ IP

Khi máy Client khởi động lại và nó đã có sẵn 1 hợp đồng cho thuê, nó không cần phải thực hiện lại quá trình xin thuê địa chỉ ip tray vào đó nó sử dụng quá trình ngắn hơn là tái phân bổ Reallocation.

- Client Gửi brodcast 1 request để tìm server hiện tại đang quản lý thông tin về hợp đồng mà nó đang thuê.

- Server sẽ gửi lại DHCP ACK để xác nhận hợp đồng của client còn hiệu lực.

###### Ưu và nhược điểm của DHCP

**1. Ưu điểm**

- DHCP cho phép cấu hình tự động nên dễ dàng cho các thiết bị máy tính, điện thoại, các thiết bị thông minh khác có thể kết nối mạng nhanh.

- DHCP giúp quản lý mạng mạnh hơn vì các cài đặt mặc định và thiết lập tự động lấy địa chỉ sẽ cho mọi thiết bị kết nối mạng đều có thể nhận được địa chỉ IP.

- Khi máy chủ DHCP cấp ip tự động giúp cho người quản lý quản lý có khoa học hơn và không bị nhầm lẫn.

**2. Nhược điểm**

- Địa chỉ IP thay đổi đối với các thiết bị cố định và cần truy cập liên tục. Ví dụ như không nên sử dụng IP động cho các thiết bị máy in ở các văn phòng.

#### 2. Hướng dẫn phân tích gói tin DHCP 

Trước tiên, ta phải cài tcpdump bằng lệnh: 
```
yum install -y tcpdump
```
Có thể tham khảo các lệnh tcpdump ở link sau : [tcpdump](https://github.com/hungviet99/thuc_tap/blob/master/Linux/tcpdump.md)

Để bắt được gói tin khi DHCP cấp lần đầu tiên, ta phải xác nhận `BOOTPROTO` là `none`. Nếu là giá trị khác, ta tiến hành sửa lại sau đó `reboot` máy. 

![Imgur](https://i.imgur.com/8q65Cd0.png)

Kiểm tra lại địa chỉ ip : 

![Imgur](https://i.imgur.com/CkEpgcz.png)

ta thấy card ens33 chưa được set ip.

Mở 2 terminal, 1 bên thực hiện lệnh chỉnh sửa file của card ens33 và để `BOOTPROTO=dhcp` , 1 bên thực hiện lệnh tcpdump để bắt gói tin khi dhcp cấp ip.

![Imgur](https://i.imgur.com/UXLQeLN.png)

sau đó tiến hành restart network để máy nhận cập nhật cấu hình mới.

![Imgur](https://i.imgur.com/8ae2jgH.png)

ta thấy ở đây, sau khi restart, ta bắt được 4 gói tin chính là 4 bản tin DHCP DISCOVER, DHCP OFFER, DHCP REQUEST, DHCP ACK. 

![Imgur](https://i.imgur.com/6eDWlaw.png)

###### 1: DHCP Client gửi Broadcast một request đến DHCP Server được gọi là bản tin DHCP Discover  

Client hỏi ai là DHCP server 

- IP nguồn (sử dụng cổng 68): Vì lúc này client chưa có IP nên 0.0.0.0 đại diện cho các địa chỉ trong mạng (Client IP Address, Your IP Address)  
- IP đích - broadcast (sử dụng cổng 67): 255.255.255.255   
- 00:0c:29:b8:2 : địa chỉ MAC của card mạng Ens33.

###### 2: DHCP Server cung cấp Unicast 1 địa địa chỉ cho Client gọi là bản tin DHCP OFFER  

DHCP server trả lời gói Offer. Trong gói offer đã có đề nghị luôn IP để cấp cho DHCP Client

- IP nguồn: là IP của DHCP server - 192.168.161.254  
- IP đích -unicast : Ip DHCP server sẽ cấp cho Client - 192.168.1.3  

###### 3: DHCP Server phản hồi máy chủ DHCP bằng bản tin DHCP REQUEST để chấp nhận.  

DHCP client gửi gói tin Request để xác nhận muốn sử dụng IP được cấp.

###### 4: DHCP Server gửi ACK được sử dụng để xác nhận rằng thiết bị (DHCP Client)  có địa chỉ IP cụ thể đó và để xác định lượng thời gian mà thiết bị có thể sử dụng địa chỉ trước khi nhận địa chỉ mới. 

DHCP server gửi về gói ACK xác nhận đồng ý cấp Ip với địa chỉ 192.188.161.3 cho DHCP client

> **Note** : Có 2 loại gói tin Broadcast  
Directed broadcast: Broadcast cho 1 mạng cụ thể. Vd: Netmask: 192.168.1.0/24 -> broadcast: 192.168.1.255  
Local broadcast: Khi 1 gói tin được gửi với địa chỉ local broadcast 255.255.255.255 thì tất cả các host đều nhận được hết .