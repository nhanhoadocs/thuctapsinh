# MẠNG MÁY TÍNH 

## I. Network

### 1. Các khái niệm cơ bản

 **Mạng ( networking)**: chỉ khái niệm kết nối các thiết bị lại với nhau nhằm mục đích chia sẻ thông tin. Khái niệm mạng liên quan đến nhiều vấn đề, bao gồm :

 + **Giao thức truyền thông (protocol)**: mô tả những nguyên tắc mà tất cả các thành phần cần tuân thủ để có thể trao đổi với nhau

 + **Topo ( mô hình ghép nối mạng/ hình trạng mạng)**: mô tả cách thức nối các thiết bị với nhau

 + **Địa chỉ**: mô tả cách thức định vị một đối tượng trên mạng

 + **Định tuyến (routing)**: mô tả cách thức truyền dữ liệu từ thiết bị này sang thiết bị khác 

 + **Tính tin cậy ( reliability)**: giải quyết tính toàn vẹn của dữ liệu, đảm bảo dữ liệu được nhận chính xác như dữ liệu được gửi đi

 + **Khả năng liên tác (interoperability)**: chỉ mức độ các sản phẩm phần mềm và phần cứng của hãng sản xuất khác nhau có thể làm việc cùng nhau

 + **An ninh (securiity)**: đảm bảo an toàn hoặc bảo về tất cả các thành phần của mạng

 + **Chuẩn (standard)**: thiết lập các quy tắc và luật lệ cụ thể cần phải tuân theo
 
 + **Mạng máy tính** là tập hợp các máy tính và các thiết bị phụ trợ khác dử dụng chung một nhóm giao thức để chia sẻ tài nguyên thông qua các phương tiện truyền thông mạng.

### 2. Phân loại mạng máy tính 

#### a. Phân loại theo diện hoạt động

- **LAN (local area network)** - mạng cục bộ : liên kết các tài nguyên máy tính trong một vùng địa lí có kích thức hạn chế như một phòng, vài phòng, .... Theo IEEE xác định bán kính của LAN nhỏ hơn 10km
- **WAN (wide area network)** - mạng diện rộng: liên kết các tài nguyên máy tính trong một vùng địa lí có bán kính trên 100km. Có thể coi mạng WAN gồm nhiều mạng LAN khác nhau 
- **MAN ( metropolitan area netwwork)** - mạng đô thị: liên kết các tài nguyên máy tính trong một thành phố. MAN có bán kính lớn hơn LAN nhưng lại nhỏ hơn WAN
- **PAN (personal area network)** - mạng cá nhân: chỉ mạng máy tính nhỏ sử dụng trong gia đình.
- **GAN ( gobal area network)** - mạng toàn cầu: là mạng của các WAN trải rộng trên phạm vi toàn cầu.

#### b. Phân loại theo mô hình ghép nối

- **Point-to-point ( điểm - điểm)**: gồm nhiều nút , mỗi nút chỉ liên kết với một nút liền kề nó. Nếu một nút muốn liên kết với nút không liền kề thì nút đó phải liên kết thông qua rất nhiều nút khác 
 + **Star ( hình sao)** : có một hub xử lí trung tâm - hub này là trung tâm truyền tin cho tất cả các nút
  ![Mô hình sao](https://imgur.com/dTRyDR9.png)
 + **Tree ( cây )** : là mô hình phân cấp gồm một nút gốc hoặc hub nối đến các nút mức hai hoặc ba, các thiết bị mức hai lại được nối đến các thiết bị mức ba, mức bốn,..
  ![Mô hình Cây](https://imgur.com/eGVZGej.png)
- **Broadcast ( điểm - nhiều - điểm)**: mô hình này gốm các nút dùng chung một kênh truyền thông, dữ liệu từ một máy gửi đi sẽ được truyền đến tất cả các nút tham gia kênh dùng chung. Các máy sẽ kiểm tra xem liệu có phải là đích đến của thông điệp nhận được hay không bằng các kiểm tra địa chỉ đến của thông điệp. Các máy không phải là đích của thông điệp sẽ ỏ qua thông điệp. mô hình phổ biến là bus và ring
  ![Mô hình Bus](https://imgur.com/oIslHLG.png)
  ![Mô hình Ring](https://imgur.com/8kKYQwq.png)
- **Mutildrop ( đa chặng)** 

#### c. Phân loại theo kiểu chuyển

- **Chuyển mạch ảo ( circuit-switched)** phải thiết lập mạch vật lí giữa nút nguồn và đích trước khi chuyển dữ liệu thực sự. Mạch này tồn tại trong suốt thời gian chuyển dữ liệu, mạng điện thoại công cộng là một ví dụ điển hình
  ![Chuyển mạch ảo](https://imgur.com/RaSh62A.png)

- **Mạng chuyển gói ( packet-switched network)**: thông điệp đầu tiên được chia thành những đơn vị nhỏ hơn gọi là gói ( packet ), sau đó packet lần lượt được gửi tới nút nhận qua mạng  lưới các thiết bị chuyển mạch trung gian. Khi đến thiết bị trung gian, thiets bị này căn cứ vào địa chỉ địch của paket để di chuyển đến thiết bị kế tiếp. Mạng toàn cầu internet đang áp dụng công nghệ chuyển mạch gói này.
  ![Chuyển mạch gói](https://imgur.com/qYe9SiF.png)

## II. Mô tả network diagram

 - Theo PMBok, Network Diagram ( project schedule network ) là một thành phần không thể thiếu trong khi tạo schedule, là ouput của sequence activities process.

 - Phương pháp Network Diagram áp dụng lý thuyết đồ thị có hướng vào trong các thuật toán để lập kế hoạch tiến độ và tổ chức thực hiện dự án.

  ![](https://imgur.com/kK2UWxz.png)

 - Có nhiều phương pháp sơ đồ được phát triển, dưới đây là một số phương pháp chính hay được nhắc đến:
   + CPM (Critical Path Method): là phương pháp xác định đường đi dài nhất trong network tính từ thời điểm khởi công đến thời điểm kết thúc dự án. Đường đi dài nhất (hay còn gọi là Đường găng) chính là tổng thời gian thực hiện dự án.

   + PERT (Project Evaluation and Review Technique): là phương pháp áp dụng kết hợp giữa lý thuyết xác suất thống kê (để ước tính thời lượng của công việc) với dạng sơ đồ mạng đường găng (CPM) sử dụng lý thuyết đồ thị.

   + ADM (Arrow Diagram Method): là phương pháp sơ đồ mạng CPM thể hiện activity bằng mũi tên. Loại này chỉ thể hiện được mối quan hệ FS (Finish to Start).

   + MPM (Metra Potential Method): là phương phá sơ đồ mạng CPM thể hiện activity bằng nút (node), quan hệ giữa các nút bằng mũi tên (do người Pháp phát triển độc lập với PERT vào năm 1958).

   + PDM (Precedence Diagram Method): là phương phá sơ đồ mạng CPM thể hiện activity bằng nút (node), quan hệ giữa các nút bằng mũi tên do Mỹ phát triển trên cơ sở cải tiến phương pháp CPM của Hoa Kỳ và MPM của Pháp. Phương pháp này chú trọng đến việc thể hiện tất cả các mối quan hệ trên thực tế giữa các activities mà phương pháp ADM không thể hiện được. Phương pháp PDM là cơ sở thuật toán cho phần mềm Microsoft Project.

   + CCM (Critial Chain Method): sơ đồ mạng chuỗi găng.

 - Trong dự án phát triển phần mềm, một trong công việc quan trọng nhất mà chúng ta thường tập trung vào làm rõ trong giai đoạn lập kế hoạch là Xác định phạm vi dự án (Define Scope). Một trong những tài liệu quan trọng phải tạo được ra là WBS (Work Breakdown Structure). Mục chi tiết nhất trên WBS gọi là gói công việc (work package).

 - Từ WBS này chúng ta sẽ tạo ra được 2 loại sơ đồ, một cái ở mức tổng thể (master) và một cái ở mức chi tiết (detail).

  ![](https://imgur.com/jA5QkR4.png)

 - Ở giai đoạn schedule, bạn thường phải tạo 2 loại schedule sau mà thuộc phải lấy két quả từ network diagram
 
   + Master Schedule
   + Detail Schedule

## III. Phân biệt public và private của network, ip

### 1. Sự khác nhau giữa public network và private network

 - Nếu thiết lập kết nối mạng đó là mạng riêng tư (Private network), Windows sẽ cho phép máy tính hoặc các thiết bị khác tìm thấy máy tính của bạn để chia sẻ file hoặc thực hiện một số công việc khác. Tính năng chia sẻ tập tin HomeGroup cũng được kích hoạt.

 - Còn trên một mạng công cộng (Public network) được kết nối từ quán cà phê chẳng hạn, Windows sẽ không cho phép máy tính hay các thiết bị khác tìm thấy thiết bị của bạn. Thậm chí nếu đã kích hoạt HomeGroup, tính năng này cũng sẽ không hoạt động trên một mạng công cộng nhằm đảm bảo sự riêng tư và bảo mật dữ liệu của người dùng.

 - Như vậy, Windows ngầm hiểu rằng mạng rineg tư là một kết nối đáng tin cậy để chia sẻ file hoặc hco phép các máy tính có cùng kết nối mạng làm việc với nhau, còn mạng công cộng chỉ để truy cập mạng chứ không nhằm thực hiện mực đích chia sẻ nào khác.


### 2. Sự khác nhau giữa public ip và private ip
 - IP public là địa chỉ được ISP cấp và nhìn thấy, truy cập từ  Internet và có địa chỉ duy nhất.

  + IP tĩnh: không được thay đổi trong quá trình sử dụng -> dùng cho hosting web

  + IP động: có thể thay đổi được khi người dùng truy cập internet

 - IP private: được cấp phát bới InterNIC cho phép công ty tổ chức chọn một mạng cục bộ riêng -> phân biệt máy tính với mạng riêng: trường học, gia đình, ... để truy cập đến thiết bị cục bộ, NAT hỗ trợ hoặc kết nối trực tiếp.

## IV. Kiến trúc mạng máy tính 

### 1. Kiến trúc mạng máy tính 

 - Kiến trúc mạng (Network Architecture): Cách nối các máy tính với nhau ra sao và tập hợp các qui tắc, qui ước mà tất cả các thực thể tham gia truyền thông trên mạng phải tuân theo. Gồm 2 thành phần:

   + Cách nối: Đồ hình mạng (Network Topolopy)
   + Qui tắc, qui ước: Giao thức mạng (Network Protocol)
### 2. Mô hình peer to peer

 - Mạng ngang hàng (p2p) là mạng mà trong đó hai hay nhiều máy tính chia sẻ tập tin và truy cập các thiết bị như máy in mà không cần đến máy chủ hay phần mềm máy chủ. Mạng ngang hàng thường được tổ chức thành các nhóm làm việc workgroup. Mô hình này không có quá trình đăng nhập tập trung, nếu đã đăng nhập vào mạng bạn có thể sử dụng tất cả tài nguyên trên mạng. Truy cập vào các tài nguyên phụ thuộc vào người đã chia sẻ các tài nguyên đó, do vậy bạn có thể phải biết mật khẩu để có thể truy nhập được tới các tài nguyên được chia sẻ.

 - Mạng p2p được tạo ra bởi hai hay nhiều máy tính được kết nối với nhau và chia sẻ tài nguyên mà không phải thông qua một máy chủ dành riêng. Mạng p2p có thể là kết nối tại chỗ – hai máy tính nối với nhau qua cổng USB để truyền tập tin. P2p cũng có thể là cơ sở hạ tầng thường trực kết nối 5-6 máy tính với nhau trong một văn phòng nhỏ bằng cáp đồng. Hay nó cũng có thể là một mạng có quy mô lớn hơn nhiều, dùng các giao thức và ứng dụng đặc biệt để thiết lập những mối quan hệ trực tiếp giữa người dùng trên internet.

![Peer to peer](https://imgur.com/DH5kvu6.png)

### 3. Mô hình client - server

 - Mô hình phần mềm Client/Server là mô hình giải pháp phần mềm cho việc khắc phục tình trạng quá tải trên mạng và vượt qua những ngăn cách về sự khác nhau trong cấu trúc vật lý cũng như hệ điều hành của các hệ thống máy tính khác nhau trên mạng.

 - Mỗi phần mềm xây dựng theo mô hình Client/Server sẽ được chia làm hai phần: phần hoạt động trên máy phục vụ gọi là phần phía Server và phần hoạt động trên trạm làm việc gọi là phần phía Client. Với mô hình này các trạm làm việc cũng được gọi là các Client (hay máy Client) còn các máy phục vụ gọi là các Server. Nhiệm vụ của mỗi phần được quy định như sau:

   + Phần phía Server quản lý các giao tiếp môi trường bên ngoài tại Server và với các Client, tiếp nhận các yêu cầu dưới dạng các xâu ký tự (query string), phân tích các query string, xử lý dữ liệu và gửi kết quả trả lời về phía các Client.

   + Phần phía Client tổ chức giao tiếp với người dùng, với môi trường bên ngoài tại trạm làm việc và với phía Server, tiếp nhận yêu cầu của người dùng, thành lập các query string gửi về phía Server, tiếp nhận kết quả và tổ chức trình diễn chúng.

![Client - server](https://imgur.com/gbqM2EF.png)

## V. Chức năng của hub, switch, router 

- Hub có 2 loại là Active Hub và Smart Hub. Active Hub là loại Hub được dùng phổ biến, cần được cấp nguồn khi hoạt động, được sử dụng để khuếch đại tín hiệu đến và cho tín hiệu ra những cổng còn lại, đảm bảo mức tín hiệu cần thiết. Smart Hub (Intelligent Hub) có chức năng tương tự như Active Hub, nhưng có tích hợp thêm chip có khả năng tự động dò lỗi – rất hữu ích trong trường hợp dò tìm và phát hiện lỗi trong mạng.

 - Switch có thể liên kết được nhiều Segment lại với nhau. Số lượng Segment tuỳ thuộc vào số cổng (Port) trên Switch. Tương tự như cách hoạt động của Bridge, Switch cũng sao chép các gói tin mà nó nhận được từ các máy trong mạng, sau đó, Switch tổng hợp các gói tin này lên bảng Switch, bảng này có vai trò cung cấp thông tin nhằm giúp các gói tin được gởi đến đúng địa chỉ trong hệ thống mạng. Ngoài ra, Switch còn có một khả năng khách là tạo mạng LAN ảo (VLAN) nhằm tăng hiệu quả của việc sử dụng hệ thống mạng LAN thông qua việc tăng tính bảo mật, kha thác tối đa lợi ích sử dụng của các cổng ( Port) hay tăng cường tính linh động trong việc thêm hoặc bớt máy vào hệ thống mạng.

- Chức năng chủ yếu của Router là gởi các gói dữ liệu mạng giữa 2 hoặc nhiều mạng, từ một tới nhiều điểm đích đến cuối cùng từ router sao cho việc gởi và nhận phải đúng địa chỉ. Router còn có thể phát sóng Wifi (Wifi giúp chúng ta kết nối mạng mà không cần dùng đến cáp mạng đấy ^^!) hoặc truyền các gói tín hiệu thông qua Modern.

## VI. Chức năng của Firewall và gateway

 - Chức năng chính của firewall là kiểm soát luồng thông tin giữa môi trường internet với nhau. Thiết lập cơ chế điều khiển dòng thông tin giữa mạng bên trong và mạng internet. 

  + Cho phép hoăc cấm các dịch vụ truy cập ra ngoài.

  + Cho phép hoặc cấm các dịch vụ từ ngoài truy cập vào trong.

  + Theo dõi luồng dữ liệu giữ môi trường intranet và internet .

  + Kiểm soát địa chỉ truy cập, cấm hoăc cho phép địa chỉ được truy nhập.

  + Kiểm soát người dùng và việc truy cập của người dùng.

  + Kiềm soát nội dung thông tin , gói tin lưu chuyển trên hệ thống mạng.

  + Lọc các gói tin dựa vào địa chỉ nguồn, địa chỉ đích và số cổng ( port), giao thức

  + Có thể sử dụng để ghi lại tất cả các sự cố gắng truy nhập vào mạng và báo cáo cho người quản tri

 - Gateway báo hiệu SGW: cung cấp kênh báo hiệu giữa mạng IP và mạng chuyển mạch kênh. Gateway báo hiệu là phần tử trung gian chuyển đổi giữa báo hiệu trong mạng IP (ví dụ H.323) và báo hiệu trong mạng chuyển mạch kênh (ví dụ R2, CCS7). Gateway báo hiệu có các chức năng sau:

   + Chức năng kết nối các giao thức điều khiển cuộc gọi.

   + Chức năng kết cuối báo hiệu từ mạng chuyển mạch kênh: phối hợp hoạt động với các chức năng báo hiệu của Gateway điều khiển truyền tải kênh thoại.

   + Chức năng báo hiệu: chuyển đổi báo hiệu giữa mạng IP với báo hiệu mạng chuyển mạch kênh phi phối hợp hoạt động với Gateway điều khiển truyền tải kênh thoại.

   + Chức năng giao diện mạng chuyển mạch gói: kết cuối mạng chuyển mạch gói.

   + Chức năng bảo mật kênh báo hiệu: đảm bảo tính bảo mật của kênh báo hiệu nối với thiết bị đầu cuối 

   + Chức năng quản lý: giao tiếp với hệ thống quản lý mạng.

   + Chức năng ghi các bản tin sử dụng: xác định hoặc ghi lại các thông tin về sự kiện (truy nhập, cảnh báo) và tài nguyên.

   + Chức năng báo cáo các bản tin sử dụng: báo các các bản tin đã được sử dụng ra thiết bị ngoại vi.

