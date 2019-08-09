# 1.Khái niệm 
`Netfilter` là packet filtering framework (khung lọc gói tin) bên trong Linux kernel 2.4.x và các phiên bản tiếp theo. `netfilter` là một danh sách các `hooks` nằm bên trong Linux kernel, nó cho phép kernel modules thực hiện các tác vụ đối với network stack.

Iptables được hoạt động dựa trên sự kết nối với netfilter và là tường lửa của phiên bản linux kernel 2.4.x.Đây là phiên bản nâng cấp của `ipchains` của phiên bản 2.2.x. 

Trong ipchains khi chuyển gói tin đi thì cần sử dụng option -o còn khi gói tin đến thì cần sử dụng option -i. Điều đó là không cần thiết khi đến phiên bản iptables vì INPUT sẽ không thể nhìn thấy gói tin gửi đi và ngược lại. 

Như vậy trong `ipchains` muốn xử lý một gói tin sẽ phải chuyển qua tất cả chuỗi INPUT FORWARD OUTPUT còn iptables sẽ không phải đi qua tất cả các chuỗi 


Iptables là một gói phần mềm để tạo tường lửa cho máy linux của bạn nó có các chức năng lọc gói tin, nat gói tin qua đó để giúp làm nhiệm vụ bảo mật thông tin cá nhân tránh mất mát thông tin và áp dụng nhưng chính sách đổi với người sử dụng.

Iptables là một chương trình chạy ở không gian người dùng, cho phép người quản trị hệ thống có thể cấu hình các bảng của tường lửa trong nhân Linux 
# 2. Cấu trúc iptables
![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot_4.png)

Bao gồm 3 thành phần chính: 
- Filter table 
- Nat table
- Mangle Table 

Một số khái niệm trong iptables: 
![]()
- Chain : là một chuỗi bao gồm nhiều `rule` mặc định có sãn trong các bảng 
- Rule : Là các luật đưa ra các điều kiện so sánh. tập hợp các rule vào thành một chain
- Target: là quá trình xử lý các gói tin đủ điều kiện. 
    - ACCEPT: Cho phép packet đi đến quá trình xử lí tiếp theo. Dừng việc traverse ở chain hiện tại
    - DROP : Không cho phép tiếp tục quá trình xử lí, không check đối với bất cứ rules, chains, tables nào thêm. Để gửi feedback trả lại sender, bạn nên dùng REJECT thay cho DROP
    - QUEUE : Gửi packet tới người dùng
    - RETURN : Đối với rule ở user-defined chain, không tiếp tục xử lí chain này, quay lại chain có chain đang xử lí là target. Đối với built-in chain, không tiếp tục xử lí gói tin và sử dụng policy
- Jump : là cơ chế chuyển một packet đến một target nào đó.

Chức năng của từng bảng 
## a) FILTER TABLE 
Trong bảng `filter` có những chain được xây dựng sẵn 
- Input chain: Đây là chain dùng đẻ lọc các gói tin đầu vào. Chain này là chain các gói tin bắt buộc phải đi qua để có thể được xử lý
- Output chain: đây là chain dùng để lọc các gói tin đầu ra. Sau khi gói tin được xử lý phải đi qua chain này để được ra ngoài
- Forward chain:  đây là chain dùng để chuyển gói tin qua lại giữa các mạng với nhau
## b) Bảng NAT 
Chức năng của bảng NAT 
- Thực thi chức năng NAT
- Khi một máy bên trong mạng nội bộ truy cập vào tài nguyên bên ngoài thì packet được gửi đến IPNAT, IPNAT sẽ thay đổi địa chỉ nguồn của packet bằng một địa chỉ hợp lệ trong dãy địa chỉ được cấp trên internet nếu còn.
- Khi một máy của mạng bên ngoài truy cập vào tài nguyên của mạng cục bộ qua IP NAT, khi packet đến IP NAT nó sẽ thay đổi địa chỉ đích của packet bằng một địa chỉ của mạng cục bộ
Trong bảng NAT có 3 chain mặc định:
- Prerouting chain: đây là chain dùng để thay đổi địa chỉ đích của gói tin
- Posrouting chain: Đây là chain dùng để thay đổi địa chỉ nguồn của gói tin
- Output chain: ở đây thì iptables sẽ thực hiện quá trình NAT tại đây
## c) Bảng Mangle 
Trong bảng Mangle này bao gồm tất cả các chain có sẵn của 2 bảng NAT và FILTER. Thông thường loại table này được ứng dụng trong SOHO (kiểu mạng làm việc tại nhà)
# 3. Nguyên lý hoạt động của iptables
![](https://github.com/duckmak14/linux/blob/master/iptables/images/687474703a2f2f766e657870657274732e6e65742f696d616765732f73746f726965732f69707461626c652e6a7067.jpeg)

Trên là quá trình xử lý gói tin của iptables. Các gói tin sẽ phải đi qua các bảng này để hoàn thành xong một quá trình xử lý: 

Đầu tiên gói tin từ mạng A đi vào hệ thống firewall sẽ phải đi qua bảng Mangle với chain là PREROUTING (với mục đích để thay đôi một số thông tin của gói tin trước khi đưa qua quyết định dẫn đường) sau đó gói tin đến bảng NAT với chain PREROUTING tại đây địa chỉ đích của gói tin sẽ bị thay đổi, qua bộ routing và sẽ quyết định xem gói tin đó thuộc firewall hay không: 
- TH1: nếu gói tin là của firewall: gói tin sẽ đi qua bảng mangle và đến bản filter với chain là INPUT. Tại đây gói tin sẽ được áp dụng chính sách (rule) và ứng với mỗi rule cụ thể sẽ được áp dụng với target, sau quá trình xử lý gói tin sẽ đi đến bảng mangle tiếp đến là bảng NAT với chain OUTPUT được áp dụng một số chính sách và sau đó đi lần lượt qua các bảng magle với chain POSTROUTING cuối cùng đi đến bảng NAT với chain POSTROUTING để thay đổi địa chỉ nguồn nếu cần thiết.
- TH2: gói tin không phải của firewall sẽ được đưa đến bảng mangle với chain FORWARD đến bảng filter với chain FORWARD. Đây là chain được sử dụng rất nhiều để bảo vệ người sử dụng mạng trong LAN với người sử dụng internet các gói tin thoả mãn các rule đặt ra mới có thể được chuyển qua giữa các card mạng với nhau. Sau khi đi qua card mạng với nhau gói tin phải đi lần lượt qua bảng mangle và NAT với chain POSTROUTING để thực hiên việc chuyển đổi địa chỉ nguồn với target SNAT & MASQUERADE.
# 4. Cài đặt IPTABLES
Firewalld là phiên bản firewall mới mặc định được sử dụng trong các phiên bản RHEL 7 để thay thế cho interface của iptables. Để có thể sử dụng được iptables thì ta cần phải cài đặt iptables.

Hướng dẫn cài đặt iptables
```
yum install -y iptables-services
```
Tắt firewalld service
```
systemctl stop firewalld
systemctl mask firewalld
```
Bật iptables service
```
systemctl start iptables
```
Cho phép iptables service khởi động cùng hệ thống
```
systemctl enable iptables
```
**Bạn vẫn có thể sử dụng iptables tại các phiên bản CentOS/RHEL7 tuy nhiên chỉ nên dùng 1 cái (hoặc firewalld hoặc iptables). Đối với CentOS/RHEL 7, khi bạn tắt firewalld (mặc định) hoặc tắt iptables service. Các iptables rules cũng sẽ biến mất -> Một số service hoạt động dựa trên nó như network default của KVM (LB) cũng sẽ bị ảnh hưởng**

trong khi iptables service lưu cấu hình tại `/etc/sysconfig/iptables` và `/etc/sysconfig/ip6tables` thì firewalld lại lưu nó dưới dạng một loạt các file XML trong `/usr/lib/firewalld/` và `/usr/lib/firewalld/`.

Đối với iptables, mỗi một thay đổi đồng nghĩa với việc hủy bỏ toàn bộ các rules cũ và load lại một loạt các rules mới trong file `/etc/sysconfig/iptables`. Trong khi đó với firewalld, chỉ những thay đổi mới được applied. Vì thế firewalld có thể thay đổi cài đặt trong thời gian runtim mà không làm mât bất cứ kết nối nào.
# 5. Sự khác biệt với firewalld 
![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/687474703a2f2f692e696d6775722e636f6d2f507535734f75372e706e67.png)

Ta thấy cách hoạt động của 2 thằng firewalld và iptables đều có đặc điểm cả hai cùng sử dụng iptables-tool đê giao tiếp được với netfilter

FirewallD sử dụng “zones” và “services” thay vì “chain” và “rules” trong Iptables.

Cả iptables và firewall đều là một tool được sử dụng với mục đích để gọi xuống iptables và giao tiếp với netfilter


[link tham khảo](https://www.netfilter.org/)


