# Các giao thức được sử dụng trong mô hình TCP/IP
> ## **1,Các giao thức tầng ứng dụng** 
Updating...
> ## **2,Các giao thức tầng mạng** 

### **Giao thức định tuyến**
Các giao thức định tuyến sẽ sử dụng một giá trị gọi là Metric để xác định tuyến đường nào là tốt nhất. Các giao thức định tuyến khác nhau có cách thức xác định chỉ số Metric là khác nhau.  
Ví dụ:
   - RIP: Metric là Hop-count: số lượng router mà gói tin phải đi qua để đến được mạng đích
   - OSPF: Metric là Cost=108/Bandwidth
   - EIGRP: Metric được tính dựa vào các tham số: Bandwidth, Delay, Load, Reliability, MTU
*Trong trường hợp cả hai tuyến đường đều có giá trị Metric giống nhau thì giao thức định tuyến sẽ truyền dữ liệu đồng thời trên cả hai (Loadbalancing).*  

#### **RIP(Routing Information Protocol) là giao thức định tuyến vecto khoảng cách**
- Sử dụng metric là hop-count để tính tuyến đường tốt nhất
- Giới hạn là 15 hop --> sử dụng cho mạng nhỏ dưới 15 hop(15 router)  

#### **OSPF(Open Shortest Path First) là chuẩn do IEEE đưa ra**  
- Sử dụng trong mạng doanh nghiệp có kích thước lớn 
- Metric là cost = 10^8/Bandwidth  
- Sử dụng thuật toán Dijkstra để tìm đường đi ngắn nhất 
- giá trị cost default của một số loại cổng:
Ethernet (BW = 10Mbps) -> cost = 10.  
Fast Ethernet (BW = 100Mbps) -> cost = 1.  
Serial (BW = 1.544Mbps) -> cost = 64  

#### **Giao thức định tuyến BGP**   
- BGP cung cấp định tuyến các AS(Automatic System)
- Phân loại:  
  + IGP(Interio Gateway Protocol) là giao thức định tuyến bên trong 1 AS(như RIP,OSPF,EIGRP,...)
  + EGP(Exterio Gateway Protocol) là giao thức trao đổi thông tin giữa các AS khác nhau.   

Khi BGP chạy trên những AS khác nhau thì nó được gọi là Exteral BGP – EBGP, chạy trong cùng 1 AS thì gọi là Internal BGP-IBGP
