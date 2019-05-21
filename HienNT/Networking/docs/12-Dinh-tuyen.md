# Định tuyến
> ## **1.Khái niệm**
- Định tuyến (Routing) là quá trình xác định đường đi tối ưu để đi đến một đích nào đó trên mạng sử dụng thiết bị chuyên dụng Router để định tuyến.  

- Bảng định tuyến là bảng chứa tất cả những đường đi tốt nhất đến một đích nào đó tính từ router. Khi cần chuyển tiếp một gói tin, router sẽ xem địa chỉ đích của gói tin, sau đó tra bảng định tuyến và chuyển gói tin đi theo đường tốt nhất tìm được trong bảng. Trong bảng định tuyến có thể bao gồm một tuyến mặc định, được biểu diễn bằng địa chỉ 0.0.0.0 0.0.0.0.  

- Bảng định tuyến của mỗi giao thức định tuyến là khác nhau, nhưng có thể bao gồm những thông tin sau:
  - Địa chỉ đích của mạng, mạng con hoặc hệ thống.- Địa chỉ IP của router chặng kế tiếp phải đến.
  - Giao tiếp vật lí phải sử dụng để đi đến Router kế tiếp.
  - Subnet mask của địa chỉ đích.
  - Khoảng cách đến đích (ví dụ: số lượng chặng để đến đích).
  - Thời gian (tính theo giây) từ khi Router cập nhật lần cuối.Giao thức định tuyến là ngôn ngữ giao tiếp giữa các router. Một giao thức định tuyến cho phép các router chia sẻ thông tin về các network, router sử dụng các thông tin này để xây dựng và duy trì bảng định tuyến. 

> ## **2,Phân loại định tuyến**  
### Định tuyến được phân chia thành 2 loại cơ bản:
- *Định tuyến tĩnh(Static Routing):* Việc xây dựng bảng định tuyến của router được thực hiện bằng tay bởi người quản trị.
- *Định tuyến động(Dynamic Routing):* Việc xây dựng và duy trì trạng thái của bảng định tuyến được thực hiện tự động bởi router. Các router tự trao đổi thông tin về các mạng. Tự chạy một phương thức tính toán nào đó để xác định xem để đi đến các mạng này thì phải sử dụng đường đi nào tối ưu. Các router cần phải chạy giao thức định tuyến để có thể tương tác trao đổi thông tin và tính toán Routing.

   Về dynamic routing. Các kĩ thuật định tuyến, chia thành 2 nhóm: định tuyến ngoài ( Exterior Gateway Protocol (EGP)) và định tuyến trong ( Interior Gateway Protocol)- IGP.  
     -  EGP: tiêu biểu là giao thức BGP(Border Gateway Protocol) là loại giao thức được dùng để chạy các router thuộc các AS khác nhau phục vụ cho việc trao đổi thông tin giữa các AS(Autonomous System) . Các AS thường là các ISP do tổ chức IANA cấp phát.
     - IGP: gồm các giao thức RIP, OSPF, EIGRP,…. Là giao thức chạy định tuyến giữa các Router nằm bên trong một AS

### Đối với IGP, ta chia thành nhiều nhánh khác nhau: 
- Các giao thức gồm 3 loại:
  + Distance – vector : mỗi router gửi cho láng giềng của nó toàn bộ bảng định tuyến của nó theo định kì. Giao thức tiêu biểu là RIP. Đặc thù của hình thức định tuyến này là có khả năng bị loop nên cần một bộ các quy tắc chống loop khá phong phú. Các quy tắc chống loop có thể làm chậm tốc độ hội tụ của giao thức.  
  + Link – state : mỗi router sẽ gửi bản tin trạng thái đường link (LSA) cho các router khác. Các Router sau khi xây dựng xong bảng định tuyến sẻ vẽ ra được một bản đồ mạng của toàn bộ hệ thống. Việc tính toán đinh tuyến thực hiện bằng giải thuật Dijkstra. Tốc độ hội tụ của các giao thức chạy link state là rất nhanh.  
  + Hybrid: tiêu biểu là giao thức EIGRP. Loại hình này kết hợp các đặc điểm của hai loại trên. Tuy nhiên, EIGRP thực chất vẫn là giao thức loại Distance – vector nhưng được Cisco cải tiến thêm để tăng tốc độ hội tụ và quy mô hoạt động. Đây cũng là loại hình định tuyến độc quyền của Cisco.
	
- Các giao thức IGP cũng có thể chia làm 2 loại:
  + Các giao thức classful: Router sẽ không gửi kèm subnet-mask trong bảng tin định tuyến của mình. Từ đó giao thức classful không hỗ trợ sơ đồ VLSM và mạng gián đoạn (Discontiguos networks). Giao thức tiêu biểu là RIPv1.  
  + Các giao thức classless: ngược lại với classful, Router có thể gửi kèm subnet-mask trog bảng địn tuyến . Từ đó các giao thức classless có hỗ trợ sơ đồ VLSM và mạng gián đoạn. Các giao thức tiêu biểu là: RIPv2, OSPF, EIGRP.  

  ![](../../images/Network/dinhtuyen.jpg)

> ## **3.Giao thức định tuyến**  
Các giao thức định tuyến sẽ sử dụng một giá trị gọi là Metric để xác định tuyến đường nào là tốt nhất. Các giao thức định tuyến khác nhau có cách thức xác định chỉ số Metric là khác nhau.  
Ví dụ:
  - RIP: Metric là Hop-count: số lượng router mà gói tin phải đi qua để đến được mạng đích  
  - OSPF: Metric là Cost=108/Bandwidth  
  - EIGRP: Metric được tính dựa vào các tham số: Bandwidth, Delay, Load, Reliability, MTU  
*Trong trường hợp cả hai tuyến đường đều có giá trị Metric giống nhau thì giao thức định tuyến sẽ truyền dữ liệu đồng thời trên cả hai (Loadbalancing)*.  

**RIP(Routing Information Protocol) là giao thức định tuyến vecto khoảng cách**
- Sử dụng metric là hop-count để tính tuyến đường tốt nhất
- Giới hạn là 15 hop --> sử dụng cho mạng nhỏ dưới 15 hop(15 router)

**OSPF(Open Shortest Path First) là chuẩn do IEEE đưa ra**
- Sử dụng trong mạng doanh nghiệp có kích thước lớn
- Metric là cost = 10^8/Bandwidth
- Sử dụng thuật toán Dijkstra để tìm đường đi ngắn nhất
- giá trị cost default của một số loại cổng:  
Ethernet (BW = 10Mbps) -> cost = 10.  
Fast Ethernet (BW = 100Mbps) -> cost = 1.   
Serial (BW = 1.544Mbps) -> cost = 64  

**Giao thức định tuyến BGP**
- BGP cung cấp định tuyến các AS(Automatic System)
- Phân loại:
  + IGP(Interio Gateway Protocol) là giao thức định tuyến bên trong 1 AS(như RIP,OSPF,EIGRP,...)
  + EGP(Exterio Gateway Protocol) là giao thức trao đổi thông tin giữa các AS khác nhau. 

Khi BGP chạy trên những AS khác nhau thì nó được gọi là Exteral BGP – EBGP, chạy trong cùng 1 AS thì gọi là Internal BGP-IBGP

> ## **4.OSPF(Open Shortest Path First)**
- Là 1 giao thức định tuyến Link-State, được sử dụng rộng rãi trong các mạng doanh nghiệp có kích thước lớn. Mỗi Router khi chạy giao thức thì sẽ gửi trạng thái đường link của nó cho tất cả các Router trong vùng(area). Sau một thời gian trao đổi thì các Router sẽ đồng nhẩt được bảng cơ sở dữ liệu trạng thái đường link(Link State Database - LSDB) với nhau, mỗi router đều có được bản đồ mạng của cả vùng. Từ bảng LSDB, router sẽ chạy giải thuật Djikstra để tính ra đường đi tối ưu nhất và xây dựng nên bảng định tuyến.

- Hoạt động:
  + Chọn Router - ID(giá trị duy nhất dùng để định danh cho các router chạy ospf trong cùng 1 vùng, trong ospf nó có định dạng là 1 địa chỉ IP): giá trị router – id là địa chỉ IP cao nhất trong các interface đang active, ưu tiên cổng loopback.  Để đổi lại router – id của tiến trình, phải thực hiện khởi động lại router hoặc gỡ bỏ tiến trình OSPF rồi cấu hình lại, khi đó tiến trình bầu chọn router – id sẽ được thực hiện lại với các interface đang hiện hữu trên router. Câu lệnh khởi động lại tiến trình OSPF:  
`Router (config) # clear ip ospf procces`  
 `Reset ALL OSPF proccess? [no]: yes`  

  + Thiết lập quan hệ láng giềng(neighbor):l  Router chạy OSPF sẽ gửi gói tin hello ra tất cả các cổng chạy OSPF, mặc định 10s/lần. Gói tin này được gửi đến địa chỉ multicast dành riêng cho OSPF là 224.0.0.5, đến tất cả các router chạy OSPF khác trên cùng phân đoạn mạng. Mục đích của gói tin hello là giúp cho router tìm kiếm láng giềng, thiết lập và duy trì mối quan hệ này
  + Trao đổi LSDB:   LSDB phải hoàn toàn giống nhau giữa các router cùng vùng. Các router sẽ không trao đổi với nhau cả một bảng LSDB mà sẽ trao đổi với nhau từng đơn vị thông tin gọi là LSA – Link State Advertisement. Các đơn vị thông tin này lại được chứa trong các gói tin cụ thể gọi là LSU – Link State Update mà các router thực sự trao đổi với nhau.


> ## **5.Giao thức EIGRP**
- EIGRP(Enhanced Interior Gateway Routing Protocol) là một giao giao thức định tuyến do Cisco phát triển, chỉ chạy trên các sản phẩm của Cisco

- EIGRP được gọi là giao thức hybrid hoặc giao thức Advanced distance vector. EIGRP không sử dụng broadcast để gửi thông tin đến các neighbors mà thay vào đó nó sử dụng multicast hay unicast.

- Hoạt động:
  + Phát hiện hàng xóm --> lưu trữ trong Neighbor Table
  + Trao đổi thông tin về cấu trúc mạng với láng giềng
  + Đặt thông tin về cấu trúc mạng học được vào Topology Table
  + Chạy thuật toán Dual với cơ sở dữ liệu đã thu thập được để tìm ra đường đi tốt nhất đến mỗi mạng trong cơ sở dữ liệu
  + Đặt đường đi tốt nhất vào bảng định tuyến.

***2 tuyến đường:***
+ Successor Route: tuyến đường chính thức được sử dụng để chuyển dữ liệu đến đích, được lưu trong bảng định tuyến
+ Fessible Successor route: tuyến đường dự phòng cho đường đi chính và lưu trong bảng cấu trúc mạng.

“Routing loop”  là một trở ngại rất lớn trong các giao thức định tuyến dạng “distancevector” Các  giao  thức  định  tuyến  dạng  “link-state”  vượt  qua  vấn  đề  này  bằng  cách  mỗi router đều nắm giữ toàn bộ cấu trúc mạng. Trong giao thức EIGRP, khi tuyến đường đi chính gặp sự cố, router có thể kịp thời đặt đường đi dự phòng vào bảng định tuyến đóng vai trò như đường đi chính.


