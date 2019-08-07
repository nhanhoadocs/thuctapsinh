 ### **Địa chỉ IPV4** :  
 - Là địa chỉ logic để các thiết bị có thể kết nối nhận dạng với nhau trên mạng .  
	- Địa chỉ IPv4 có 32 bit , được chia thành hai phần Network ID  và Host ID.  
	- Được chia làm 4 octet, mỗi octet có 8 bit  .  

	


### **Phân lớp IP** : Classful và Classless  
- Classful : Gồm các lớp A,B,C,D,E.  
Lớp A : bit đầu tiên là 0 , 8 bit networ , còn lại là bit host  
Lớp B :bit đầu tiền là 10 , 16 bit network .  
Lớp C: bit đầu tiên là 110. 24 bit network .  
Lớp D : bit đầu tiền là 1110,28 bit network  
Lớp E : bit đầu tiền là 1111,28 bit network  
- Classless :  
sử dụng subnet mask để chia các lớp mạng .  

-Cấu trúc của IPv4 :
<img src = "https://i.imgur.com/2Uh97Gd.png" >  
- Subnet Mask :  
	* Dùng để xác định khối địa chỉ của mạng  . Độ dài 32 bit , bit 1 là network bit 0 là host.  
	* Số host trong một subnet : 2^n-2 ( n là số bit 0 )

- VLSM ( Variable length subnet mask)
	* Số subnet được tạo ra : 2^m ( m là số bit mượn từ Host ID)
	* Số host cần tạo : 2^n -2 ( n là số bit của host còn lại )
	* Số bit subnet mới : số bit subnet cũ + m.

 ### **Các phương pháp định tuyến** :  

1.**Định tuyến tĩnh**: 


Cấu hình định tuyến trục tiếp , không cả khả năng cập nhật .    
2. **Định tuyến động** :  

Các Router sẽ trao đổi thông tin định tuyến với nhau . Từ thông tin nhận được sẽ xây dựng các bảng định tuyến . Các router phải chạy các giao thức định tuyến để có thể vận hành , xác định đường đi tốt nhất . Có thể tự động tìm ra những tuyến đường thay thế khi mạng thay đổi .   
- **RIP (Routing Information Protocol)** :  
   - Là một giao thức định tuyến distance-vector .  
	- Sử dụng hop counts để tính toán đường đi tốt nhất.   
	- Update interval mặc định là 30s , invalid time là 180s .      

   - *Cấu hình* :  
```  
Router(config)#router rip  
Router(config)#ver 2  
Router(config-router)#network <address>  
```  
- **OSPF ( Open-Shortest-Path-First)** :  
	* Là giao thức định tuyến Link-state , xác định đường đi dựa trên thuật toán Dijkstra  
	* Sử dụng LSA ( Link State Advertisement) để quảng bá .  
	* Các mạng sử dụng OSPF luôn có area 0 ( backbone area ) và tất cả các vùng khác được nối trực tiếp vào area đó  

   - *Cấu hình* :  
```    
hostname(config)#router ospf process_id  
hostname(config-router)#ip_address netmask area area_id  

```  
- **EIGRP ( Enhanced Interior Gateway Routing Protocol )** :
	* Là giao thức định tuyến Hybrid Routing , là sự kết hợp của Distance Vector và Link States
	* Khi xác định đường đi sử dụng Feasible Distance (FD) và ADvertised Distance (AD) .AD là cost từ láng giềng đến đích . FD là tổng cost từ nguồn đến đích
	* Successor là primary route ,Feasible successor là backup route . FD nhỏ nhất thì được lựa chọn làm Successor , còn  Feassible successor được bầu nếu có AD nhỏ hơn FD của successor route   .

   - Cấu hình :  
```
Router(config)# router eigrp <AS number>  
Router(config-router)#network  
 
```
-BROADCAST IP  :  
Ping đến tất cả các ip trong mạng .  Ứng dụng : request DHCP,bản tin ARP,gửi ad của các giao thức như RIP
