# Mục Lục

[1. BGP (Border Gateway Protocol)](#BGP)

[2. DHCP (Dynamic Host Configuration Protocol)](#DHCP)

[3. DNS (Domain Name System)](#DNS)

[4. SSH (Secure Shell)](#SSH)

### <a name = "BGP"> 1. BGP (Border Gateway Protocol) </a>
#### Khái Niệm
- Giao thức cổng biên (BGP - Border Gateway Protocol) là một giao thức cổng ngoài được tạo ra để trao đổi thông tin định tuyến cho Internet. Bằng cách sử dụng một cấu trúc liên kết tùy ý, BGP có thể kết nối bất kỳ mạng nội bộ nào của các hệ thống tự trị ( AS - Autonomous system).
- Nó được đặt tên là Giao thức cổng biên bởi vì trong bộ định tuyến BGP này phải giao tiếp với một thiết bị ngang hàng trong một hệ thống tự trị khác thường nằm gần rìa (viền) của hệ thống tự trị. Giao tiếp này xảy ra khi một cặp hệ thống tự trị chấp nhận trao đổi thông tin định tuyến và liên quan đến các bộ định tuyến để trở thành đồng nghiệp BGP.

#### Hoạt động và Port của BGP
- Các thiết bị tìm đường (router) sử dụng BGP kết nối từng cặp (peering) với nhau bằng cách thiết lập phiên làm việc trên giao thức TCP qua cổng **179** và phải cấu hình trực tiếp theo kiểu tĩnh. Phiên kết nối này được duy trì bằng việc gửi các thông điệp keep-alive 19 byte mỗi 60 giây (mặc định). Có bốn loại thông điệp BGP là open (mở phiên kết nối), update (thông báo hoặc rút lại một đường đi), notification (thông báo lỗi), keep-alive (duy trì phiên kết nối)

- Một cách phân loại giao thức định tuyến đó là liệu chúng là Interio hay là Exterio
  - IGP (Interio Gateway Protocol) là giao thức định tuyến bên trong 1 AS như (RIP, IGRP, EIGRP, OSPF...).
  - EGP (Exterio Gateway Protocol) là giao thức trao đổi thông tin giữa các AS khác nhau.
    +EGP là: loại giao thức định tuyến này có khả năng trao đổi các định tuyến từ bên trong và bên ngoài mạng cục bộ của một tổ chức hoặc nhóm cụ thể. 
    
![img](https://vnpro.vn/wp-content/uploads/2015/07/Border-Gateway-Protocol.jpg)

Khi BGP chạy trên những AS khác nhau thì nó được gọi là Exteral BGP – EBGP, chạy trong cùng 1 AS thì gọi là Internal BGP-IBGP

### <a name = "DHCP"> 8. DHCP (Dynamic Host Configuration Protocol) </a>
#### Khái Niệm
- Dynamic Host Configuration Protocol (DHCP - giao thức cấu hình động máy chủ) là một giao thức cho phép cấp phát địa chỉ IP một cách tự động cùng với các cấu hình liên quan khác như subnet mask và gateway mặc định. Máy tính được cấu hình một cách tự động vì thế sẽ giảm việc can thiệp vào hệ thống mạng. Nó cung cấp một database trung tâm để theo dõi tất cả các máy tính trong hệ thống mạng. Mục đích quan trọng nhất là tránh trường hợp hai máy tính khác nhau lại có cùng địa chỉ IP.

- Người quản trị có thể quản lý tập chung việc cấp phát địa chỉ IP và các thông tin liên quan như subnet mask, DNS server…

- Nếu không có DHCP, các máy có thể cấu hình IP thủ công (cấu hình IP tĩnh). Ngoài việc cung cấp địa chỉ IP, DHCP còn cung cấp thông tin cấu hình khác, cụ thể như DNS.

#### Version
- Hiện nay DHCP có 2 version: cho IPv4 và IPv6.

#### Công dụng 
- DHCP tự động quản lý các địa chỉ IP và loại bỏ được các lỗi có thể làm mất liên lạc. Nó tự động gán lại các địa chỉ chưa được sử dụng
- DHCP tự động gán địa chỉ IP thích hợp với cho những máy con khi kết nối vào máy chủ DHCP nếu họ bật DHCP. Cũng vậy, DHCP tự động gán địa chỉ cho người dùng di động tại mạng con họ kết nối.

#### Quá Trình hoạt động
- Bước 1: Máy trạm sẻ phát ra một bản tin broadcast để tìm kiếm DHCP Server để thuê địa chỉ. Client sẻ gửi bản tin broadcast( có chứa địa chỉ MAC của client) với gói tin DHCP Discover lên mạng.

- Bước 2: Nhiều DHCP Server có thể nhận thông điệp và chuẩn bị địa chỉ IP cho máy trạm. Nếu Server có cấu hình địa chỉ IP hợp lệ cho máy trạm. Server sẻ gửi thông điệp “DHCP Offer” chứa các thông số cần thiết và gửi về địa MAC của Client đã gửi lên.
  - Địa chỉ IP “Offer”, subnet mask, địa chỉ IP của máy chủ (địa chỉ Gateway) và thời gian cho thuê đến Client, DNS Server…..

- Bước 3: Khi Client nhận được gói tin DHCP Offer và chấp nhận thuê địa chỉ IP trong gói tin Offer. Client sẽ gửi bản tin DHCP Request để yêu cầu DHCP Server cấp phát địa chỉ IP .

- Bước 4: Cuối cùng, DHCP Server sẻ khẳng định lại với Client bằng bản tin DHCP Acknowledge. Sau đó DHCP Server tiến hành cấp phát địa chỉ IP, subnet mask, địa chỉ Gateway  và các thông tin khác cho Client. Và Client có thể sử dụng trong thời hạn “lease” đã được thiết lập trên DHCP Server. Khi hết hạn “lease” để tiếp tục sử dụng địa chỉ IP thì Client sẻ gửi một bản tin DHCPRequest trực tiếp (unicast) đến DHCP server mà nó đã xin địa chỉ  ban đầu. Nếu DHCP server còn hoạt động, nó sẽ reply bằng một gói tin DHCP-ACK để renew địa chỉ cho DHCP client. Gói tin này bao gồm thông các thông số cấu hình mới cập nhật nhất trên DHCP server.

![img](https://qph.fs.quoracdn.net/main-qimg-4d40799655a61cbcee6d7b8b0721231c)
Quá trình hoạt động của DHCP.
### <a name = "DNS"> 9. DNS (Domain Name System) </a>
#### Khái niệm
- Hệ thống phân giải tên miền (hay được viết tắt là DNS do tên tiếng Anh Domain Name System) là một hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền trên Internet.

#### Chức năng
- Nó chuyển tên miền có ý nghĩa cho con người sang kiểu số thập phân
  - Ví dụ, www.example.com dịch thành 208.77.188.166.
  - Người sử dụng chỉ cần nhớ "tên", không cần phải nhớ địa chỉ IP (địa chỉ IP là những con số rất khó nhớ
- Vì tên miền internet sẽ dễ nhớ hơn rất nhiều so với các địa chỉ IP như là 208.77.188.166 (IPv4) hoặc 2001: db8: 1f70:: 999: de8: 7648:6 e8 (IPv6). 
- Máy tỉnh chỉ hiểu được các dạng số. Nên DNS sẽ có nhiệm vụ phân giải tên miền kia thành các số để máy hiểu được.

#### Cách sử dụng DNS.
- Do các DNS có tốc độ biên dịch khác nhau, có thể nhanh hoặc có thể chậm, do đó người sử dụng có thể chọn DNS server để sử dụng cho riêng mình. Có các cách chọn lựa cho người sử dụng. Sử dụng DNS mặc định của nhà cung cấp dịch vụ (internet), trường hợp này người sử dụng không cần điền địa chỉ DNS vào network connections trong máy của mình. Sử dụng DNS server khác (miễn phí hoặc trả phí) thì phải điền địa chỉ DNS server vào network connections. Địa chỉ DNS server cũng là 4 nhóm số cách nhau bởi các dấu chấm (192.168.1.2).

#### Port
- Giao thức DNS được khuyến cáo chạy trên nền UDP 53 thay vì TCP 53.
- Vì TCP 53 bị cắm cờ đỏ vì trước đó đã bị khai thác và khả năng bị tấn công cao.

#### Cơ chế hoạt động của DNS
- Có thể tham khảo ở hình dưới đây.
![img](https://whitehat.vn/image/xenforo_image/1490892963How_DNS_Works.jpg)

### <a name = "SSH"> 10. SSH (Secure Shell) </a>
#### Khái niệm
- SSH (Secure Shell) là một giao thức mạng dùng để thiết lập kết nối mạng một cách bảo mật. SSH hoạt động ở lớp trên trong mô hình phân lớp TCP/IP. 

#### Công cụ
- Các công cụ SSH (như là SecureCRT, PuTTy,…) cung cấp cho người dùng cách thức để thiết lập kết nối mạng được mã hoá để tạo một kênh kết nối riêng tư. Hơn nữa tính năng tunneling (hoặc còn gọi là port forwarding) của các công cụ này cho phép chuyển tải các giao vận theo các giao thức khác.

#### Công dụng
- SSH là giao thức an toàn dùng để quản trị từ xa, nó sử dụng phương pháp mã hóa. Chống các hiện tượng nghe trộm, đánh cắp thông tin trên đường truyền. 
- Các chương trình trước đây như: telnet, rlogin không sử dụng phương pháp mã hóa. Vì thế có thể bị nghe trộm, thậm trí đọc được toàn bộ nội dung của phiên làm việc chỉ bằng cách sử dụng 1 số công cụ đơn giản.

#### Cách thức làm việc của SSH
- SSH làm việc qua 3 bước đơn giản:
  - Định danh host - xác định định danh của hệ thống tham gia vào phiên làm việc SSH.
  - Mã hóa - Thiết lập mã hóa.
  - Xác thực người sử dụng có quyền đăng nhập hệ thống.
    + Định danh: việc định danh host được thực hiện qua việc trao đổi khóa. 2 hệ thống máy chủ và khách sẽ sử dụng các loại khóa để sử dụng trao đổi dữ liệu giữa 2 máy. Quá trình này được xem như các bước nhận diện máy chủ và máy khách.
    
    + Mã hóa: Sau khi hoàn tất việc thiết lập phiên làm việc bảo mật ( trao đổi khóa, định danh). Quá trình trao đổi dữ liệu sẽ diễn ra thông qua một bước trung gian đó là mã hóa/giải mã. Điều đó có nghĩa là dữ liệu gửi/nhận trên đường truyền đều được mã hoá và giải mã theo cơ chế. Việc lựa chọn cơ chế mã hóa thường do máy khách quyết định. Các cơ chế mã hóa thường được chọn gồm: 3DES, IDEA và Blowfish. Khi cơ chế mã hóa được lựa chọn, máy chủ và khách sẽ trao đổi khóa cho nhau. Tin tặc khó có thể nghe trộm được do không biết khóa mã hóa.
    
    + Chứng thực: Việc chứng thực là bước cuối cùng trong ba bước, và là bước đa dạng nhất. Tại thời điểm này. Việc chứng thực mật khẩu là một cách rất thông dụng để định danh người sử dụng, ngoài ra cũng có các cách khác: chứng thực RSA, sử dụng ssh-keygen và ssh-agent để chứng thực các cặp khoá.
    
#### Sử dụng SSH trong những trường hợp nào.
- Trong các trường hợp kết nối, đăng nhập vào 1 hệ thống, thiết bị, nào đó.
