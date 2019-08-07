# Chương 1 : Giới thiệu chung
**1.1 Mạng truyền thông và công nghệ mạng** :   
 1.1.1 Giới thiệu chung :   
     -Tìm hiểu về các kiến thức căn bản : Protocol , Topo, Địa chỉ , Định tuyến , Reliability , Interoperability , Security ,Standard

1.1.2 Mạng máy tính :  
-Tìm hiểu về Các thành phần mạng  thiết bị , nút ,máy tính , Phương tiện và các giao thức truyền thông mạng , Môi trường truyền thông media : Cáp (cable) và không dây , Giao thức : VD : TCP/IP

1.1.3 Phân loại mạng máy tính :  
-**Theo diện hoạt động**  :LAN,MAN,WAN,GAN,PAN,SAN  
-**Theo mô hình kết nối** : Point-to-Point,Broadcast   
-**Theo kiểu chuyền** :Circuit switched và Packet Switched  

1.1.4 Địa chỉ mạng , định tuyến tính tin cậy , tính liên tác và an ninh mạng :  

1.1.5 Chuẩn mạng :
-Chuẩn chính thức, Chuẩn thực tế ,Chuẩn riêng của hãng, Chuẩn hiệp hội 

1.2 Mô hình OSI :     
**Open Systems Interconnection** là mô hình cho phép bất cứ hệ thống nào có thể truyền thông với nhau mà không cần quan tâm đến    kiến trúc bên dưới của chúng .Được dùng chủ yếu cho việc nghiên cứu , học tập .  
 Gồm 7 tầng : Application , Presentation,Session , Transport , Network , Data link , Physical
1.2.2 Chức năng các tầng : 
- **Tầng Physical**:  
	* Truyền luồng bit dữ liệu qua môi trường vật lí  . Các giao thức là FDDI , Ethernet , ...
	* Dữ liệu tầng này được chuyển thành các bit . Các thiết bị đại diện tầng này là cáp mạng , cáp quang,Hub ....


- **Tầng Data Link** :  
	* Đóng gói dữ liệu thành các frame để tạo truyền thông giữa các nút nối với nhau .Giao thức chính là Frame Relay , PPP ,HDLC,...
	* Dữ liệu tầng này là các Frame . Thiết bị đại diện tầng này là Switch,Bridge


- **Tầng Network** :  
  * Định tuyến gói dữ liệu để truyền dữ liệu từ nơi gửi đến nơi nhận .Xác định địa chỉ logic (IP)
  * Dữ liệu tầng này là Packet . Thiết bị đại diện của tầng này là Router 


- **Tầng Transport** : 
	* Thiết lập kết nối và đảm bảo sự tin cậy . Hai giao thức chính là TCP và UDP.
	* Dữ liệu tầng này là Segment  


-**Tầng Session** : 
	* Kiểm soát , duy trì các tiến trình khi kết nối .Các giao thức điển hình là SQL,...
	* Dữ liệu tầng này là các data


- **Tầng Presentation** :
	* Biểu diễn thông tin và mã hóa ,xác định định dạng như GIF ,JPG ,PNG,...
	* Dữ liệu tầng này là các data


- **Tầng Application** :
	* Tạo giao diện cho người dùng sử dụng .Cung cấp các dịch vụ như Telnet , FTP , Email (SMTP) ,HTTP....
	* Dữ liệu trên tầng này là các data .

1.2.3 Bộ giao thức TCP/IP:
Là bộ giao thức cho phép kết nối chuyển đổi dữ liệu trên mạng một cách đồng nhất . Mô hình TCP/IP được sử dụng rộng rãi trên toàn cầu .
TCP/IP gồm 4 tầng : Application , Transport , Internet  , Network Access
- Application :
	* Gồm tiến trình và ứng dụng , giao diện cung cấp cho người sử dụng để truy cập mạng . Ứng dụng : Telnet , FTP ,Email , WWW


- Transport : 
	* Phụ trách luồng giữ liệu , tầng này có 2 giao thức chính là TCP và UDP .


- Internet : 
	* Xử lý quá trình truyền gói tin trên mạng . Các giao thức bao gồm IP , ICMP ,ARP ....
	* Thiết bị đại diện tầng này là Router .


- Network Access : 
	* Đảm bảo việc truyền dữ liệu vật lí được đảm bảo . Giao thức gồm ARP , HDLC ,FrameRelay , ....
	* Thiết bị đại diện là Switch , dây mạng ....



TCP/IP UPDATED model gồm 5 tầng : Application , Transport , Network , Data Link , Physical 

**SO SÁNH OSI VÀ TCP/IP :**  
|  |OSI |TCP/IP|  
|--|---|------|  
|Giống|-Đều là mô hình gồm nhiều tầng|  
|     |-Đều có các giao thức |
|     |-Đều là mô hình đảm bảo việc truyền dữ liệu trong mạng.|
|Khác |-Có 7 tầng  |-Có 4 tầng , Gộp 3 tầng đầu của mô hình OSI thành tầng Application , gộp 2 tầng cuối thành Network Access | 
|   | -Mô hình được sử dụng như hướng dẫn|-Là mô hình chính của internet|
|   |-Mô tả chi tiết việc dữ liệu được vận chuyển |-Mô tả phương thức hoạt động của internet|  
|  | -Phân biệt rõ chức năng giữa các tầng|-Các chức năng của vài tầng ở osi được gộp chung lại |  
|  |-Phát triển mô hình trước rồi mới đến dịch vụ |-Phát triển từ dịch vụ rồi mới đến mô hình |

1.3 Phương phấp tiếp cận :  
 Từ trên xuống , Học từ tầng Application xuống Physical