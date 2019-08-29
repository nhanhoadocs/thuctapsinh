# TÌM HIỂU VỀ TẦNG  MẠNG
## Mô hình dịch vụ của tầng mạng
- Tầng mạng chuyển gói tin segment của tầng giao vận từ máy tính này đến máy tính khác. vì thế tầng mạng có 3 chức năng chính là 
    - Xác định đường đi (path determination): các định các router trong gian , tuyến đường mà gói tin đi được  truyền từ nời gủi đến nới nhận, định tuyến.( routing algorithm)
    - Chuyển mạch ( switching ) : khi gói tin đầu vào router phải quyết định gủi gói tiin đến đầu ra tích hợp
    - Thiết lập đường truyền ( call setup): bắt tay ba bước.

# mô hình dịch vụ mạng
- Chuyển mạch ảo( virtual circuit), và chuyển mạch gói( datagram).
    - 3 giai đoạn trong quá trình chuyền mạch ảo:
        -  Thiết lập mạch ảo: tầng mạng ác định tuyến giữa bên gủi và bên nhận, cập nhật bảng định tuyến và dữ trự tài nguyên trong mỗi thiết bị chuyển mạch.
        - Truyền dữ liệu: sau khi thiết lập dũ liêu ducojd truyền.
        - Giả phóng mạch ảo: bắt đầu từ phía gửi báo cho tầng mạng yêu cầu đóng VC

    - Signaling mesage : thông điệp báo hiệu .
    - Signal protocol: giao thức báo hiệu

    - Dịch vụ mạng ATM là  VC trong mạng internet cung cấp dịch vụ chuyển mach gói.
    - Trong phạm vi cùng một mạng  những kết nối  khác nhau có thể được cung cấp nhưng lớp dịch vụ khác nhau.
        - Dịch vụ truyền vói tốc độ cố định - Cosntant bit rate (CBR): là mô hình dc chuẩn hóa, sử dụng truyền đa phương tiện theo thòi gian thực  với tốc độ truyền cố định. các ATM cell đc truyền vs 1 độ trễ nào đó
        - Dịch vụ truyến với tộc độ không xác định ( Unspecified bit rate UBR) : không đảm bảo tốc độ, đỗ trễ, mất mát dữ liệu, dùng cho các dịch vụ truyền cố định như mail, newsgroup.
        - Dịch vụ truyền với tốc độ có sẵn ( available rate bit -ABR):  loại nhóm dịch vụ kiểu cố gắng tối đa nhưng ưu việt hơn, có 2 tính ăng bổ sung là tóc dộ truyền cell nhỏ nhất và có phản hồi về tắc nghẽn tầng mạng
        - Dịch vụ truyến với tốc độ biến đổi( variable bit rate - VBR): thực hiện thời gian thực , tỷ lệ mất gói dũ liệu, độ trễ có thể chấp  nhận được thỏa thuận trước giống dịch vụ  CBR. tuy nhiên tốc độ gửi thay đổi theo số người dùng.

## Nguồn gốc dịch vụ chuyển mạch gói và chuyển mạch ảo.




## các nguyên lý định tuyến.
- Thuật toán đinh tuyến: thuật toán xác định đường đi cho gói tin.
    - Có thể phân loại thuật toán theo toàn cục hoặc phân tán.
        - thuật toán định tuyến toàn cục ( global) ; xác định đường đi  ngắn nhất giữa nguồn và đích bằng cách sủ dụng tất cả thông tin về tông thể mạng ( tìm đường đi ngắn nhất có trọng số).
        - Thuật toán đinh tuyến phân tán: tính  toán được các nut cạnh nhau sau đó qua trao đổi thông tin với các nút hàng xóm, sẽ dần xác định được đường đi của có giá trị nhỏ nhất, thuật toán distant vector(thuật toán cây khung nhỏ nhất, paim , kruskal)
    - Có thể phân loại theo  theo tính chất tĩnh hay động.
        - Thuật toán tĩnh : tuyến đường thay đổi rất ít theo thời gian
        - Thuật toán động: cho phép thay đổi các đường đi khi lưu lượng mạng hay kiến trúc thay đổi

### Thuật toán định tuyến Link-state


### Thuật toán Distance vector
- Là thuật toán lặp, không đồng bộ và phân tán

## Định tuyến phân cấp:
- Phạm vi (scale): khi số lượng router lớn khối lượng thông tin nhiều , lưu trữ và trao đổi giữa các bảng thông tin  định tuyến sẽ tốn toàn bộ băng thông
- Quản trị ( administrative automomy): thuật toán đinh tuyến hay che giấu cấu trúc mạng. Các miền tự quản(Autonomous System - AS) phải dùng cùng thuật toán định tuyến

# Internet Protocol. 
- Sử dụng dich vụ chuyển mạch gói ( datagram). khi nhận segment từ tâng giao vận tậng mạng đặt segment trong gói dữ liệu với các trường địa chỉ gủi và nhận chuyển gói tin đến router đầu tiên trên đường đi 
- Trong kiểu mạng chuyển mạch gói trong internet có  3 thành phần:
    - Giao thức mạng , xác định di chỉ tầng mạng, ý nghĩa các trường trong datagram (gói dữ liệu PDU- protocol data unit)
    - Bộ phận xác định đường đi 
    - Chức năng báo lỗi vá khả năng trả lời một số yêu cầu về thông tin tầng mạng.
## địa chỉ ipv4 
    - Có file tìm hiểu riêng.
## Giao thức  cấu hình địa chỉ động (dynamic host configuartion protocol - DHCP)
- cách thức hoạt động:
- giao thức  cấu hình địa chỉ động( dynamic host configuartion protocol - DHCP): khi máy DHCP server trong mạng nhận được 1 yêu cầu của cảu DHCP client  nó sẽ phân phối một địa chỉ IP cho máy khách yeu cầu.
- ISP phân phối một không gian địa chỉ rất lớn và người quản trị phải liên lạc với ISP của mình
## chuyển datagram từ nguồn đến đích: vấn đề địa chỉ và định tuyến.
- khuôn dạng chung của địa chỉ ip có 4 phần: misc fields, source IP address, Destination IP address và data.

## khuôn dạng gói dữ liệu IP 
- Phiên bản( version) : dùng 4 bit xác định phiên bản giao thức của gói dữ liệu, và xác định trường còn lại 
- Độ dài tiêu đề( header length):4 bit được dùng để xacsc định vị trí bắt đầu của dữ liệu thực sử trong gói dữ liệu IP.
- Kiểu dịch vụ (type of service - TOS) : phân biệt các kiểu khac nhau của gói dữ liệu IP.
- Độ dài gói dự liệu( datagram length): đây là tông độ dài gói IP. độ dài của gói dự liệu là 16 bit nên vè lý thuyết kich thước tối đa của gói dự liệu IP là 65, 535 bytes
- Định danh, cờ và vị trí phân đoạn( Identfier, flags, fragmention offset) : sử dụng phân mảnh gói IP 
- Thời gian tồn tại( time to live -TTL): đảm bảo gói dữ liệu  không thể lưu truyền mãi trong mạng mỗi lầnđi qua router sẽ -1 nếu ttl =0 thì sẽ loại bỏ.
- Giao thức(protocol): dc sử dụng khi gói dữ liệu IP đến được máy đích, giá trị trường này xác định giao thức tầng giao vận
- Checksum của tiêu đề ( Header checksum): giúp router phát hiện lỗi trong tiêu đề gói dự liệu IP.
- Địa chỉ IP nguồn và đích: có 32 bit địa chỉ IP của máy tính gửi và máy tính nhận.
- Lựa chọn( option): cho phép mở rộng tiêu đề IP 
- Dữ liệu(payload): là trường quan trọng nhất đây là gói dự liệu của tâng giao vận (TCP or UDP segment).

## Phân mảnh (fragmention) và Hợp nhất (reassembly ) gói tin
- MTU ( maximum transfer unit) :số lượng dữ liệu tối đa của gói tin  trên một đường truyền vật lý
- Gói dữ liệu IP đạt trong gói dữ liệu của tang liên kết dữ liệu  giửa 2 router kế tiếp nhay trên đường truyền  vì thế giá trị của MTU của giao thức ở tâng liên kết  dữ liệu giói hạn gói tin  IP.
- Fragmentation - phân mảnh dữ liệu trong gói dữ liệu và gửi những gói dữ liệu này đi. các mảnh tách rời này càn được rap lại trước khi chuyển lên tâng giao vận tại máy tính nhận. IPv4 quyết định viecj hợp nhất các mảnh dự liệu tại thiết bị đầu cuối chứ không phải tại router..
    - Máy tính sử dụng các trường identification , flag và fragmentation để thự hiện công việc ráp lại các gói tin  vì tỏng máy tính sẽ phải sử lý rất nhiều gói tin .
    - Khi tạo ra một gói tin IP ngoài địa chỉ gủi và đị chỉ nhận thì cần có thêm  cac trường  identification và một số trường định danh khác, giá trị đinh danh tăng dần . nếu gói đến địa chỉ thì nhận  thì trường cơ của mảng cuối cùng  phải có giá trị  = 0;
##  Giao thức kiểm soat lỗi ICMP( Internet control mesage protocol)
- ICMP  được các máy tính đầu cuối, router và các cổng gateway sử dụng để trao đổi thông tin tầng mạng với nhau.
- ICMP được sử dụng  chủ yếu cho việc báo lỗi.
- ICMP thường được coi một phần của IP, theo kiến trúc là năm trên IP, được đặt trong gói IP.
- ICMP có trường kiểu(type) và trường mã (code), chứa 8bytes đầu tiên của gói dữ liệu IP gây ra lỗi.
- Chương trình ping là một ứng dụng
- Có 13 trường hợp của mã( code) và ICMPtype
- Chương trình traceroute xác định tất cả các router trên tuyến đường giữa bất kỳ hai thiết bị đầu cuối.

# Định tuyến trên Internet.
## Định tuyến nội miền (intra -AS routing)
- Giao thức định tuyến nội miền( interior gateway protocol).
- có 3 giao thức định tuyến nội miền được sử dụng rộng rãi
    - RIP: routing information protocol:
    - một số đặc điểm sau:
        + Định tuyến nội miền: cho phép các router trong 1 miền trao đổi với nhau
        + Đo khoảng cách bằng chặng: giá trị đường đi giữa hai thiết bị  đầu cuối xác định bắng số lượng các router trung gian trên đường đi đó 15 hop tối đa.
        + Truyền thông không tin cây: UDP
        + Gủi quảng bá ( broadcast và multicast): v1 broadcast và v2 multicast.
        + thuật toán distance vector : định tuyến trao đổi 30s 1 lần các thông điệp RIP max chứa 25 địa chỉ đích tới.
        +các máy tính có thể thụ động nhận thông tin  từ các router.
    - OSPF (open sortest path first)
    - Sử dụng cho mạng lớn, có các đặc điểm sau:
        + Định tuyến nội miền: 
        + Hỗ trợ phân mạng và CIDR : chia 32 bit mặt nạ chia mạng và các mạng con
        + trao đổi thong tin kiểm chứng: phải có thủ tục kiểm tra  để xác định mình nhận được thông điệp từ đúng phía bên kia
        - Sử dụng thuật toán Link state 
        + hỗ trọ phân cấp trong miền : ospf  cho phép phân miên thành nhiều miền con.
    - EIGRP (Enhanced Interior Gateway Routing Protocol)
        - Giao thức này được thiết kế bởi Cisco Systems như là một giao thức độc quyền, chỉ có trên các bộ định tuyến của Cisco
## định tuyến liên miền( inter-AS routing) 
- Sử dụng giao thức BGP( border gateway protocol)
    - định tuyến liên miền: cung cấp thông tin giữa các miền, chuỗi liên kết AS.
    - hỗ trơ thiết lập chính sách (policy): ví dụ như việc quảng bá ra bên ngoài,...
    - Truyền thông tin cậy: sử dụng TCP 

# IPv6:

- Có file riêng

# chuyển từ IPv4 sang IPv6
- Có thể sủ dụng đồng thời hay dùng riêng rẽ.
- Giải pháp đơn giẩn nhất để đưa vào các thiết bị hỗ trợ IPv6 là dual-stack các thiết bị cùng triển khai cả IPv4 và IPv6. có thể sử dụng  hỗ trọ tên miền DNS
- Giải phải thứ 2 là giải pháp đường ống (tunneling) router IPv4 nằng giữa 2 router sử dụng IPv6 là một đường ống nó sẽ đặt toàn bộ dữ liệu gói IPv6 vao trường payload của gói dữ liệu IPv4.

##Cơ chế dịch chuyển địa chỉ (NAT- network address translation)
- NAT chuyển các gói tin  giữa những lớp mạng  khác nhau trên một mạng lớn, nó có thể dịch hay thay đổi một hoặc 2 địa chỉ bên trong một gói tin đi qua router
    - Thông thường NAT thay đổi địa chỉ riêng (IP pritave) của 1 kết nối  thành địa chỉ công cộng (IP public)
    - NAT cũng có thể coi như là một tường lửa cơ bản.
    - Nó duy trì một bảng địa chỉ thông tin về mỗi gói tin được gửi qua.
    - Phân loại NAT:
        + Static NAT : nat tĩnh là 1 địa chỉ ip private sẽ được map với 1 địa chỉ  ip public.
        + Dynamic NAT: NAT động là 1 địa chỉ IP private sẽ được map với một địa chỉ IP public trong nhóm địa chỉ IP public.
        + Overloading NAT:  là một dang thức của NAT động. nhiều địa chỉ private sẽ được map với một địa chỉ IP public qua các cổng khác nhau. giống như PAT ( port address translation) 
        + Overlapping NAT: nat biên dịch một địa chỉ nội bộ thành một địa chỉ public cũng như biên dịch ngược lại 
    - Hệ thống mạng LAN nôi bộ còn được gọi là stub Domain sử dụng địa chỉ IP  nội bộ

- Ưu điểm của NAT: tiết kiệm không gian  địa chỉ IP, một mạng riêng lớn  cũng chỉ càn 1 địa chỉ ip  thật., các tổ chức có thể tự cấp phát địa chỉ cho các máy tính trong cơ quan minh và thực hiện ánh xạ địa chỉ tại router, nết tổ chức muốn chuyển ISP thì chỉ cân cấu hình lại bảng NAT.

- Nhược điểm: vì NAT sử dụn ánh xạ đợn giản nên giữa địa chỉ thật và địa chỉ ảo  do thay đổi nhiều  trong công việc  nên trường tiêu đề có thể bị thay dổi  nên giá trị checksum phải tính toán lại , kiểm tra gói TCP or UDP và thay đổi số hiệu cổng và checksum trong tiêu đề có thế vi phạm cở chế phân tầng , phức tạp trong dịch vụ  FTP vì có 2 port là 21 va 20.

## kiểm soát tắc nghẽn.
- phương châm phòng hơn chống: giải quyết tắc nghẽn ngay khi có gói tin bị mất hoặc quá thời qian phản hồi.
- còn tiếp.

