# NAT (Network Address Translation - dịch địa chỉ mạng)

#### 1. Khái niệm
- NAT (Network Address Translation) giống như một Router, chuyển tiếp các gói tin giữa những lớp mạng khác nhau trên một mạng lớn. NAT dịch hay thay đổi một hoặc cả hai địa chỉ bên trong một gói tin khi gói tin đó đi qua một Router, hay một số thiết bị khác. Thông thường NAT thường thay đổi địa chỉ thường là địa chỉ riêng (IP Private) của một kết nối mạng thành địa chỉ công cộng (IP Public).

- NAT chuyển các địa chỉ riêng thành các địa chỉ publc , địa chỉ có khả năng định tuyến khi máy chủ mạng nội bộ cần phải kết nối tới được với máy chủ bên ngoài của mạng Internet. Thêm vào đó, nhiều tổ chức có thể khai triển cùng IP với nhau, NAT sẽ được sử dụng để giải quyết vấn đề khi các tổ chức này muốn giao tiếp trao đổi với nhau qua mạng.

#### 2. Lợi ích của việc sử dụng NAT
- Những lợi ích chính của NAT là việc thoải mái sử dụng số lượng địa chỉ ip private rộng lớn.

- Giảm thiếu hụt địa chỉ của IPv4

- NAT che giấu IP bên trong LAN.

- Khi bạn sử dụng địa chỉ Ip private dù cho bạn có đổi nhà cung cấp dịch vụ, bạn sẽ không cần phải đánh lại địa chỉ cho các thiết bị trong mạng cục bộ mà bạn chỉ phải thay đổi cấu hình NAT trên firewall để trùng với địa chỉ IP public mới.

- Theo nguyên tắc hoạt động của NAT thì với 1 IP public nó có thể cho phép hơn 65000 thiết bị bên trong truy cập ra ngoài mạng internet thông qua 1 IP public duy nhất.

#### 3. Kỹ thuật NAT
- **Static NAT (NAT Tĩnh)**
  - **Static NAT** là phương thức NAT một đôi một. Một địa chỉ IP Private sẽ được map với một địa chỉ IP Public. 
  - NAT tĩnh được sử dụng khi thiết bị cần truy cập từ bên ngoài mạng.

   ![img](https://st.quantrimang.com/photos/image/2015/12/11/NAT-tinh.jpg)

  - Trong Static NAT (NAT tĩnh), địa chỉ IP của máy tính là 192.168.32.10 luôn được Router biên dịch đến địa chỉ IP 213.18.123.110 để ra ngoài internet.
 
- **Dynamic NAT (NAT động)**
  - Một địa chỉ IP Private sẽ được map với một địa chỉ IP Public trong nhóm địa chỉ IP Public.
  
   ![img](https://st.quantrimang.com/photos/image/2015/12/11/NAT-dong.jpg)

  - Trong Dynamic NAT (NAT động), máy tính có địa chỉ IP 192.168.32.10 luôn được Router biên dịch đến địa chỉ đầu tiên 213.18.123.100 trong dãy địa chỉ IP từ 213.18.123.100  đến 213.18.123.150.
  
- **Overloading NAT**
  - NAT Overloading là một dạng thức của NAT động (Dynamic Overload). Nhiều địa chỉ IP Private sẽ được map với một địa chỉ IP Public qua các Port (cổng) khác nhau.

  - Cũng giống như PAT (Port Address Translation), một địa chỉ NAT hoặc Port sẽ có nhiều mức độ NAT khác nhau.
  
   ![img](https://st.quantrimang.com/photos/image/2015/12/11/NAT-overload.jpg)

  - Trong Overloading NAT, mỗi máy tính trong mạng nội bộ (Private Network) được Router biên dịch đến cùng một địa chỉ IP 213.18.123.100 nhưng trên các cổng giao tiếp khác nhau.
  
- **Overlapping NAT**

   ![img](https://st.quantrimang.com/photos/image/2015/12/11/NAT-overlap.jpg)
   
  - Khi địa chỉ IP trong hệ thống mạng nội bộ là IP Public đang sử dụng trên một hệ thống mạng khác, Router phải duy trì một bảng tìm kiếm các địa chỉ này để ngăn và thay thế bằng một IP Public duy nhất.
  

- Hệ thống mạng nội bộ thông thường là LAN (Local Are Network), hay còn gọi là Stub Domain. Một Stub Domain là một LAN sử dụng địa chỉ IP nội bộ.
  
- Một Stub Domain có thể bao gồm cả địa chỉ IP Public và IP Private. Bất kỳ máy tính nào sử dụng địa chỉ IP Private đều phải dùng NAT (Network Address Translation) để trao đổi thông tin với các máy tính khác.


## END