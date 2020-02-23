### Tìm hiểu về DHCP 
Mục lục
1. [DHCP là gì? Lịch sử phát triển và đặc điểm của DHCP](#1)  
2. [Cơ chế hoạt động của DHCP](#2)

<a name="1"></a>

### 1. DHCP là gì? Lịch sử phát triển và đặc điểm của DHCP
DHCP (Dynamic Host Configuration Protocol) - Giao thức cấu hình máy chủ động.  
Lịch sử phát triển của nó phát triển ban đầu từ giao thức RARP, phát triển lên BOOTP và cuối cùng được cải tiến lên DHCP do nhu cầu cải tiến kĩ thuật mạng.  
- `RARP` là một giao thức mạng sơ khai được dùng bởi các máy client để yêu cầu có một địa chỉ Ipv4 để sử dụng cho mục đích liên lạc với các máy khác trong trạm. (thời kì đầu, khi mới có địa chỉ IP và các máy bắt đầu dùng địa chỉ IP để liên lạc thay cho địa chỉ MAC). Hạn chế của RARP là giao thức lớp 2, chỉ cấp địa chỉ IP và không cấp thêm một thông tin nào khác, là giao thức cấp địa chỉ tĩnh sơ khai và còn cần nhiều sự tương tác của người quản trị mạng khi phải cấu hình thông tin trên RARP server trước.  
- BOOTP: RARP rõ ràng là không đủ sức cung cấp thông tin cấu hình TCP/IP cho các máy tính. Để hổ trợ vừa cho các máy tính không có đĩa cứng vừa cho việc cấu hình TCP/IP tự động, vì thế mà BOOTP (Bootstrap) được tạo ra. BOOTP được tạo ra để giải quyết các hạn chế của RARP.  
    - Nó vẫn còn dựa vào quan hệ client/server, nhưng nó được triển khai ở tầng cao hơn, dùng UDP cho việc vận chuyển. Nó không còn phụ thuộc vào phần cứng đặc biệt nào của nhà sản xuất như là RARP.  
    - Hỗ trợ gởi thêm thông tin tới máy client ngoài địa chỉ IP.Thông tin thêm này thường được gởi trong một thông điệp duy nhất.  
    - Nó có thể sử dụng trong môi trường client và server ở trong những hệ thống mạng gồm nhiều NetID khác nhau. Điều này cho phép quản lý địa chỉ IP tập trung ở một server. 
    - Sử dụng IP/UDP (port 67 cho địa chỉ đích của server, và port 68 cho địa máy client) và do đó, có thể di chuyển qua router. Đây là một lợi thế vì có thể dùng giao thức phân giải địa chỉ qua môi trường liên mạng LAN.  
    - Nhưng bên cạnh đó, nó vẫn còn một số hạn chế là không cấp được địa chỉ IP động khi mà nhu cầu cấp địa chỉ động trở thành rõ rệt hơn bao giờ hết khi Internet thực sự khởi đầu cất cánh vào cuối thập niên 1990 và việc gán địa chỉ IP tĩnh và dùng mãi cho mỗi máy để chúng kết nối vào mạng là một phí phạm.

=> Cải tiến BOOTP thành DHCP.
- DHCP: là giao thức cấu hình hoạt dộng được thiết kế làm giảm thời gian cấu hình cho mạng TCP/IP bằng cách tự động gán địa chỉ IP.  

*Đặc điểm DHCP*:  
    - Làm việc theo mô hình client-server
    - DHCP server làm việc trên cổng 67
    - DHCP server làm việc trên cổng 68  
    **Ưu điểm**:  
    - Tập trung quản trị thông tin cấu hình IP  
    - Cấu hình động, liền mạch  
    - Khả năng mở rộng  
    - Đơn giản hóa vai trò quản trị của việc cấu hình địa chỉ IP của client.  

*Cơ chế phân bổ địa chỉ IP*:  
- Manual Allocation: một địa chỉ IP cụ thể được cấp phát trước cho một thiết bị duy nhất bởi người quản trị. DHCP chỉ truyền tới thiết bị đó.   
=> Dùng cho thiết bị cần một địa chỉ IP cố định.  
- Automatic Allocation: DHCP tự động gán một địa chi IP vĩnh viễn với một thiết bị, chọn từ pool có sẵn.  
=> Dùng cho trường hợp: giới hạn thời gian sử dụng các địa chỉ IP của một client gần như là "mãi mãi".  
- Dynamic Allocation: DHCP gán địa chỉ IP từ một pool các địa chỉ trong một khoảng thời gian hạn chế được lựa chọn bởi server, hoặc cho đến khi client nói với DHCP server rằng nó không cần địa chỉ này nữa.  

*Lợi ích của Dynamic Allocation*:  
- automation
- Quản lý tập trung
- Tái sử dụng và chia sẻ địa chỉ IP
- Tránh xung đột.  
<a name="2"></a>

### 2.Cơ chế hoạt động của DHCP 

1. Khi máy client muốn kết nối với 1 mạng mới thì nó sẽ gửi  broadcast một gói tin DHCPDISCOVER đến local subnet của nó. Địa chỉ IP đích là 255.255.255.255. Vì client chưa có địa chỉ IP nên nó coi 0.0.0.0 là IP nguồn. Mục đích của gói tin DHCPDISCOVER là cố gắng tìm một DHCP server.  

<img src="https://i.imgur.com/LAfrDqb.png">  

2. Sau khi nhận được gói tin DHCPDISCOVER, DHCP server sẽ kiểm tra trong pool địa chỉ IP của mình có IP nào chưa được cấp phát và chọn IP đó rồi gửi gói tin DHCPOFFER đến máy client.  

<img src="https://i.imgur.com/DJBXl8m.png">  

3. Nếu máy khách chấp nhận địa chỉ IP đó thì nó sẽ gửi một gói tin DHCPREQUEST đến cho DHCP server đấy. DHCPREQUEST này vẫn là một gói tin broadcast bởi vì nó chưa nhận được acknowledged IP. Máy client có thể nhận được nhiều gói tin DHCPOFFER được gửi từ nhiều DHCP server.  

<img src="https://i.imgur.com/Y1Yu7Kn.png">  

4. Khi DHCP server nhận được gói tin DHCPREQUEST từ máy client, nó sẽ xác nhận bằng cách gửi lại một gói tin DHCPACK gồm thông tin địa chỉ IP, lease-time, DNS...  

<img src="https://i.imgur.com/YaphwBe.png">  

Ví dụ capture quá trình nhận gửi các gói tin từ DHCP server đến client có địa chỉ MAC là `00:0c:29:22:05:38`.  

<img src="https://i.imgur.com/rRXtwYL.png"> 