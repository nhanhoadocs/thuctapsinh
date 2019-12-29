### Cách thêm tự động file cấu hình cho card mạng trên CentOS 7

Mục lục  
1. [Add tự động file cấu hình card mạng trên CentOS7](#1)  
2. [Bắt gói tin và đọc file .pcap](#2) 

<a name="1"></a>
Thông thường trên CentOS 7 khi ta gán thêm 1 card mạng vào máy thì máy chưa tự động tạo file cấu hình card mạng. Giả sử tôi add thêm 1 card và chọn chế độ Host-only. Tôi sẽ kiểm tra đã tồn tại thiết bị này chưa bằng lệnh `nmcli dev status`.   

<img src ="https://i.imgur.com/INoFuOu.png"> 

Như vậy card mạng này đã tồn tại nhưng chưa có địa chỉ IP. Hệ thống báo `getting IP configuration`. Ta tiếp tục đi đến thư mục `/etc/sysconfig/network-scripts` để xem đã có file cấu hình chưa  

<img src="https://i.imgur.com/excpViv.png">  

Ta thấy file cấu hình card `ens38` chưa tồn tại. Để thêm tự động file này ta tiến hành các bước sau:  
- *Bước 1*: Đổi tên `Wired connection 1` thành `ens38` bằng lệnh `nmcli c modify "Wired connection 1" connection.id ens38`.  

- *Bước 2*: Gõ lệnh `nmcli device modify ens38 ipv4.method auto`.  
Kiểm tra xem file cấu hình đã được tự động thêm vào hay chưa  
<img src="https://i.imgur.com/wrlnqhL.png">  

Ta dùng lệnh `cat` để xem nội dung file cấu hình  

<img src="https://i.imgur.com/xXZvVhx.png">  

Muốn card mạng `ens38` được có địa chỉ IP. Ta có thể cấu hình địa chỉ IP tĩnh hoặc IP động. Ở đây tôi sẽ cấp IP động cho nó bằng cách chỉnh nó về chế độ `VMnet2` kết nối với máy chủ server (Ở bài trước ta đã cấu hình cho máy server chế độ cấp phát IP động)

<img src="https://i.imgur.com/3PWI5U4.png">  

Restart network bằng lệnh `systemctl restart network-service` và kiểm tra NIC `ens38` đã có địa chỉ IP chưa bằng lệnh `ip a`  

<img src="https://i.imgur.com/rhrAKlX.png">  

Như vậy ta đã thực hiện thành công add tự động file cấu hình card mạng và cấp phát IP động thông qua lệnh nmcli và giao thức DHCP. 

<a name="2"></a>
### 2. Bắt gói tin dhcp và lưu vào file .pcap  
Sau đây tôi sẽ chỉnh sửa file cấu hình NIC `ens38`, đưa nó về chế độ BOOTPROTO=none rồi cấp phát địa chỉ IP động. Trên máy server tôi thực hiện lệnh `tcpdump -nnvi ens37 -n port 67 and port 68 -w /opt/capturedhcp.pcap` để bắt các gói tin và ghi nó vào file `capturedhcp.pcap`.

<img src="https://i.imgur.com/i668r8m.png">  

Bên máy client ta dùng lệnh `systemctl restart network.service` để restart lại mạng.  

Tiếp tục ta tiến hành đọc file `capturedhcp.pcap`. Khi tôi sử dụng `MobaXterm` để SSH vào các máy ảo thì tôi có thể xuất file Linux ra Windows và đọc file .pcap trên Wireshark. 

<img src="https://i.imgur.com/MHhyJV2.png"> 

Chọn nơi lưu trữ trên Windows để download file về.

<img src="https://i.imgur.com/hmU7j9z.png">  

Nếu trên máy Windows của bạn đã cài Wireshark thì bạn có thể đọc file `.pcap` để theo dõi quá trình bắt các gói tin.  

<img src="https://i.imgur.com/pC4eZgW.png">

Nhìn vào hình trên ta thấy được các thông tin như Thời gian, địa chỉ IP nguồn, IP đích, giao thức, Độ dài gói tin, Tên gói tin, trạng thái.  
Tiếp theo phần bên dưới là thông tin tương ứng với các tầng:  
- Tầng Vật lý: các byte(bit) capture  
- Tầng data link: Ethernet và địa chỉ MAC, địa chỉ Broadcast 
- Tầng Network: địa chỉ IPv4 nguồn và đích
- Tầng transport: giao thức UDP, port nguồn 68, Port đích 67.
- Cuối cùng là giao thức DHCP.  


