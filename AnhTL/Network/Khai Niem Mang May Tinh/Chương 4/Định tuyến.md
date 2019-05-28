# Định tuyến
 - Trong ngành mạng máy tính, định tuyến (tiếng Anh: routing hay routeing) là quá trình chọn lựa các đường đi trên một mạng máy tính để gửi dữ liệu qua đó. Việc định tuyến được thực hiện cho nhiều loại mạng, trong đó có mạng điện thoại, liên mạng, Internet, mạng giao thông. Thiết bị phần cứng chuyên dùng được gọi là ROUTER (bộ định tuyến)
 
- Các loại định tuyến gồm hai kiểu chính: Định tuyến tĩnh (Static) và Định tuyến động (Dymanic).

## 1. Định tuyến tĩnh ( Static )
- Là 1 quá trình định tuyến, mà để thực hiện ta phải cấu hình bằng tay, từng đường đi nước bước, địa chỉ cụ thể cho Router.
- Một dạng mặc định của định tuyến tĩnh là Default Route. định tuyến này được sử dụng khi ta chưa cấu hình định tuyến đường đi cụ thể nào.
  - Đặc điểm của Default Route là:
    + Độ ưu tiên thấp nhất, nằm chót bảng định tuyến. ( tức là khi có 1 định tuyến mới được config vào nó sẽ ưu tiên định tuyến mới luôn.)
    + Không cần biết mạng đích nằm ở đâu và subnet mask là gì.
  - Default Route, khi Router nhận được bất kỳ gói tin nào có đích đến là mạng ngoài không nằm trong bảng định tuyến thì theo mặc định nó sẽ forward gói tin đó tới một router đã được cấu hình sẵn, Router mặc định đã cấu hình đó chình là ISP.
## 2. Định tuyến động ( Dymanic )
- Là 1 dạng định tuyến mà khi ta cấu hình ở dạng này, Router sẽ thực hiện định tuyến 1 cách tự động (Automatically) mà ta không cần phải chỉ ra từng đường đi như định tuyến tĩnh nữa.

#### 2.1 Định tuyến động (Dymanic) có 2 dạng chính là:
- **Interior** route thực hiện các công việc hội tụ các routing-table trong cùng một AS ( Autonomous System )
- **Exterior** thực hiện việc routing giữa các autonomous system với nhau + các policy về sercurity .
    - **AS - Autonomous System**: Một AS là 1 nhóm các Router cùng nằm dưới 1 sự quản trị. AS Tập hợp các thiết bị lớp 3 thuộc cùng 1 sự quản lý về mặt kỹ thuật và định tuyến.
        - VD: như 1 nhà cung cấp ISP, đó là 1 AS. Khi ta truy cập vào 1 AS thì ta phải tuân thủ theo policy của AS đó.
        
##### 2.1.1 Trong Interior có 2 thuật toán là: Distance vector và Link State.

  - **Distance Vector** và **Link State** đều là các giao thức định tuyến động (Dynamic Routing Protocol) cấu hình trên các thiết bị layer 3. Chúng đều là các Interior Gateway Routing Protocol (IGRP), được triển khai bên trong 1 khu vực đặc biệt gọi là Autonomos System (AS,khu vực dùng chung tài nguyên và chịu chung sự quản lý kỹ thuật duy nhất).
  
1. Interior ( là giao thức định tuyến bên trong 1 AS như (RIP, IGRP, EIGRP, OSPF... )
-  **Distance Vector**
    - Hoạt động theo nguyên tắc Neighbor (hàng xóm) , nghĩa là mỗi router sẻ gửi routing-table (bảng định tuyến) của mình cho tất cả các router được nối trực tiếp với nó . Các router đó sau đó so sánh với bảng routing-table mà mình hiện có và kiểm tra lại các tuyến đường của mình với các tuyến đường mới nhận được, tuyến đường nào tối ưu hơn sẻ được đưa vào routing-table . 
    
    - Ưu điểm : Dễ cấu hình , router không phải xử lý nhiều nên không tốn nhiều dung lượng bộ nhớ và CPU có tốc độ xử lý nhanh hơn .
    
    - Nhược điểm :
      – Hệ thống metric quá đơn giản, dẫn đến việc các tuyến đường được chọn vào routing-table chưa phải tuyến đường tốt nhất
      – Vì các gói tin update được gửi theo định kỳ nên một lượng bandwidth đáng kể sẻ bị chiếm (mặc dù mạng không gì thay đổi nhiều) .

- **Link State**

    - Link State không gửi bảng định tuyến của mình , mà chỉ gửi tình trạng của các đường link trong linkstate-database của mình đi cho các router khác, các router sẽ áp dụng giải thuật SPF (shortest path first - đường đi ngắn nhất ) , để tự xây dựng routing-table riêng cho mình . Khi đã xây dựng routing-table xong, Link State protocol sẽ không gửi update định kỳ mà chỉ gởi khi nào có một sự thay đổi trong mạng.
    - Ưu điểm : Có thể thích nghi được với đa số hệ thống , cho phép người thiết kế có thể thiết kế mạng linh hoạt , phản ứng nhanh với tình huống xảy ra.
    – Do không gởi interval-update , nên link state bảo đảm được bandwidth cho các đường mạng .
    - Nhược điểm :
    – Do router phải xử lý nhiều , nên chiếm nhiều bộ nhớ , tốc độ CPU chậm hơn nên tăng delay.
    – Link State khá khó cấu hình để chạy tốt .

2. Exterior (Là giao thức trao đổi thông tin giữa các AS khác nhau.)
  - Khi BGP chạy trên những AS khác nhau thì nó được gọi là Exteral BGP – EBGP, chạy trong cùng 1 AS thì gọi là Internal BGP-IBGP.
  - BGP được sử dụng để trao đổi thông tin giữa các hệ thống với nhau.
    - Các BGP láng giềng được gọi là các peers phải được cấu hình trực tiếp theo kiểu tĩnh. 
    - BGP sử dụng TCP port 179. Các BGP peers sẽ trao đổi các thông tin như thông tin cập nhật, gói tin keepalive...
    - Các Routers chỉ có thể chạy một BGP tại một thời điểm
    - BGP là một giao thức kiểu path-vector. Đường đi của nó đến một mạng bao gồm một danh sách các AS.
![img](https://camo.githubusercontent.com/d04c6a86e47a35ba7ec9b9e84627f02fb44533aa/68747470733a2f2f692e696d6775722e636f6d2f7752746d6379742e706e67)

## So sánh
- Có nhiều tiêu chí để phân loại các giao thức định tuyến khác nhau. Định tuyến được phân chia thành 2 loại cơ bản:

- Định tuyến tĩnh: Việc xây dựng bảng định tuyến của router được thực hiện bằng tay bởi người quản trị.

- Định tuyến động: Việc xây dựng và duy trì trạng thái của bảng định tuyến được thực hiện tự động bởi router.

- Việc chọn đường đi được tuân thủ theo 2 thuật toán cơ bản:

  - Distance vector: Chọn đường đi theo hướng và khoảng cách tới đích.

  - Link State: Chọn đường đi ngắn nhất dựa vào cấu trúc của toàn bộ mạng theo trạng thái của các đường liên kết mạng.

![img](https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/tong-quan-ve-dinh-tuyen.jpg)
