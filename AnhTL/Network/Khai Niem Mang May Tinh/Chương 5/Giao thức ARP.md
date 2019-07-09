# Giao thức ARP ( Address Resolution Protocol)

#### Mục lục

[I. Định nghĩa](#dinh-nghia)

[II. Chức năng](#cn) 

   - [Phân giải địa chỉ IP sang địa chỉ MAC](#phangiai)
  
   - [Duy trì bộ nhớ ánh xạ ARP table](#duytri)
  
[III. Cơ chế hoạt động](#coche)
  - [Cách thức hoạt động của ARP trong mạng Local](#work)
  - [ARP trong môi trường mạng lớp 3](#lop3)
      - [ARP Proxy](#proxy)
<hr>

## <a name="dinh-nghia"> I. Định nghĩa </a>

- Giao thức phân giải địa chỉ (Address Resolution Protocol hay ARP) là một giao thức truyền thông được sử dụng để chuyển địa chỉ từ tầng mạng (địa chỉ IP- Network layer) sang tầng liên kết dữ liệu (địa chỉ MAC - Datalink layer ) theo mô hình OSI.
       - Trong mạng máy tính của phiên bản IPv6, chức năng của ARP được cung cấp bởi Neighbor Discovery Protocol (NDP).
  
## <a name="cn"> II. Chức năng</a>

**Có 2 chức năng chính**:
  - Chuyển đổi địa chỉ IPv4 sang địa chỉ MAC
  - Duy trì bộ nhớ ánh xạ giữa IP vs MAC ( cache of mappings )
      - [ARP cache](#cache) : bộ nhớ của ARP chứa nội dung cặp địa chỉ MAC vs địa chỉ IP kèm theo.
## <a name="phangiai">Phân giải địa chỉ IP sang MAC : </a>
-	Khi packets gửi từ tầng Network xuống Data links để đóng gói thành frames, có 1 cơ chế liên kết giữa địa chỉ IP ở tầng trên với địa chỉ MAC ở tầng dưới và lưu trong 1 bảng gọi là ARP table. 
    -	ARP table lưu trong Ram.
    -	Mỗi hàng trong ARP chứa 1 cặp : IP - MAC
-	Địa chỉ IP và địa chỉ MAC trong bảng gắn liền với nhau, từ địa chỉ IP có thể truy ra địa chỉ MAC của thiết bị.
-	Sử dụng trong mạng LAN nội bộ
-	**Hoạt động** : một host A muốn gửi dữ liệu tới host B, nhưng chỉ biết địa chỉ IP của B , nó kiểm tra trong bảng ánh xạ ARP xem có cặp địa chỉ IP – MAC nào của B không, có thì n sẽ căn cứ vào địa chỉ MAC đó và gửi tới địch.
      - Trường hợp không có, host A sẽ gửi 1 bản tin ARP request đến các host kèm theo địa chỉ IP của máy B, khi máy B nhận được, nó sẽ kiểm tra , nếu đúng địa chỉ IP của nó , máy B sẽ gửi bản tin trả lời lại kèm theo địa chỉ MAC của mình. Máy A căn cứ vào đó gửi bản tin tới máy B.
## <a name="duytri"> Duy trì bộ nhớ ánh xạ ARP :</a>

Có 2 cách để thu thập địa chỉ IP -MAC :

-	Kiểm soát đường truyền trong phân vùng mạng :  Một node nhận các frames đi qua, nó sẽ lưu lại địa chỉ IP và MAC của các Frame đó rồi ánh xạ chúng thành các cặp.

-	Thiết bị gửi 1 bản tin broadcast gọi là bản tin ARP request đến tất cả các host trong mạng LAN. Frame đó chứa IP của máy đích. Máy nào nhận được kiểm tra đúng là IP máy mình thì gửi lại một bản tin ARP reply bao gồm địa chỉ MAC của nó. Máy gửi nhận được và lưu cặp IP-MAC đó vào ARP table.

    - Nếu trường hợp không có thiết bị nào phản hồi lại, packet sẽ bị xóa. Việc gửi bị thất bại này sẽ được báo lên các tầng trên, ở một số thiết bị  như router , nó sẽ quyết định có nên gửi đến máy nguồn 1 bản tin ICMPv4 thông báo lỗi hay không.
-	Các cặp ánh xạ này sẽ được lưu trong một thời gian nhất định, sau một thời gian không có sự giao tiếp địa chỉ này sẽ bị xóa.
 
## <a name="coche"> III. Cơ chế định tuyến của ARP : </a>

### <a name="work"> Cách thức hoạt động của ARP trong mạng local </a>
ARP về cơ bản là một quá trình 2 chiều request/response giữa các thiết bị trong cùng mạng nội bộ. Thiết bị nguồn request bằng cách gửi một bản tin local broadcast trên toàn mạng. Thiết bị đích response bằng một bản tin unicast trả lại cho thiết bị nguồn.

**Các loại bản tin ARP**

![Imgur](https://i.imgur.com/3w1cyS2.png)

- Có hai dạng bản tin trong ARP : một được gửi từ nguồn đến đích, và một được gửi từ đích tới nguồn.
    - Request : Khởi tạo quá trình, gói tin được gửi từ thiết bị nguồn tới thiết bị đích
    - Reply : Là quá trình đáp trả gói tin ARP request, được gửi từ máy đích đến máy nguồn
    
![Imgur](https://i.imgur.com/vwI74cj.png)

**Các bước hoạt động trong mạng local**

**B1. Source Device Checks Cache** : Trong bước này, thiết bị sẽ kiểm tra cache ( bộ đệm ) của mình. Nếu đã có địa chỉ IP đích tương ứng với MAC nào đó rồi thì lập tức chuyển sang bước 9

**B2. Source Device Generates ARP Request Message** : Bắt đầu khởi tạo gói tin ARP Request với các trường địa chỉ như trên

**B3. Source Device Broadcasts ARP Request Message** : Thiết bị nguồn quảng bá gói tin ARP Request trên toàn mạng

**B4. Local Devices Process ARP Request Message** : Các thiết bị trong mạng đều nhận được gói tin ARP Request. Gói tin được xử lý bằng cách các thiết bị đều nhìn vào trường địa chỉ Target Protocol Address. Nếu trùng với địa chỉ của mình thì tiếp tục xử lý, nếu không thì hủy gói tin

**B5. Destination Device Generates ARP Reply Message** : Thiết bị với IP trùng với IP trong trường Target Protocol Address sẽ bắt đầu quá trình khởi tạo gói tin ARP Reply bằng cách lấy các trường Sender Hardware Address và Sender Protocol Address trong gói tin ARP nhận được đưa vào làm Target trong gói tin gửi đi. Đồng thời thiết bị sẽ lấy địa chỉ datalink của mình để đưa vào trường Sender Hardware Address

**B6. Destination Device Updates ARP Cache** : Thiết bị đích ( thiết bị khởi tạo gói tin ARP Reply ) đồng thời cập nhật bảng ánh xạ địa chỉ IP và MAC của thiết bị nguồn vào bảng ARP cache của mình để giảm bớt thời gian xử lý cho các lần sau

**B7. Destination Device Sends ARP Reply Message** : Thiết bị đích bắt đầu gửi gói tin Reply đã được khởi tạo đến thiết bị nguồn. Gói tin reply là gói tin gửi unicast

**B8. Source Device Processes ARP Reply Message** : Thiết bị nguồn nhận được gói tin reply và xử lý bằng cách lưu trường Sender Hardware Address trong gói reply như địa chỉ phần cứng của thiết bị đích

**B9. Source Device Updates ARP Cache** : Thiết bị nguồn update vào ARP cache của mình giá trị tương ứng giữa địa chỉ network và địa chỉ datalink của thiết bị đích. Lần sau sẽ không còn cần tới request

### <a name="lop3"> ARP với máy đích nằm ngoài mạng local : </a>

Khi một host A muốn gửi tới host B nhưng B nằm ngoài vùng mạng LAN của nó.
-	Host A không có địa chỉ MAC của máy nguồn , nó sẽ gửi bản tin ARP request tới thiết bị Router ( hoặc next hop ) bằng đường gateway để xác định MAC của router. 
-	Router gửi bản tin phản hồi lại kèm theo địa chỉ MAC của nó cho host A.
-	Host A lưu vào bảng ARP cặp IP-MAC của router, và tiến hành gửi tin .
-	Router nhận được gói tin, căn cứ vào địa chỉ IP đích và port đã lưu trong bảng routing table , router gửi bản tin ARP request để tìm địa chỉ MAC của máy B .
-	Máy B nhận được bản tin request, reply lại bao gồm địa chỉ MAC của mình, router sẽ gửi bản tin từ máy A đến máy B.

#### <a name="proxy"> ARP Proxy : </a> 
- **Dùng cho các dải mạng khác nhau ở 2 phân vùng mạng khác nhau, giao tiếp qua Router**

*Khi 2 máy A và B ở 2 phân vùng mạng khác nhau muốn gửi dữ liệu cho nhau phải qua Router . Router không chuyển tiếp các gói tin broadcast nên 2 máy sẽ không gửi được cho nhau , ARP Proxy xinh ra để giải quyết vấn đề này.*

![Imgur](https://i.imgur.com/RmnDC0Q.png)

- Khi máy A muốn gửi tin tới máy B, nó sẽ gửi bản tin ARP request tới Router. Router gửi về bản tin reply bao gồm địa chỉ MAC của chính nó thay vì địa chỉ MAC của máy B, vì 2 máy ở 2 phân vùng mạng khác nhau nên không thể gửi tin trực tiếp cho nhau.
- Dựa trên địa chỉ MAC Router, Máy A gửi bản tin tới Router, Router sẽ chuyển tiếp sang cho máy B. Trường hợp máy B cũng tương tự.

![Imgur](https://i.imgur.com/PXpGy2e.png)

#### Ưu & nhược điểm của ARP proxy :

**Ưu điểm**
  - Thuận tiện gửi tin giữa các phân vùng mạng khác nhau
  
**Nhược điểm**
  - Tăng độ phức tạp của mạng
  - Nguy cơ an toàn bảo mật không được bảo đảm khi các router được thiết lập proxy, dẫn đến khả năng có thể giả mạo proxy.
   
   
### Mở rộng :

#### <a name="cache"> ARP Caching </a>

- **Static ARP Cache Entries**: Đây là cách mà các thành phần tương ứng trong bảng ARP được đưa vào lần lượt bởi người quản trị. Công việc được tiến hành một cách thủ công

- **Dynamic ARP Cache Entries**: Đây là quá trình mà các thành phần địa chỉ hardware/IP được đưa vào ARP cache một cách hoàn toàn tự động bằng phần mềm sau khi đã hoàn tất quá trình phân giải địa chỉ. Chúng được lưu trong cache trong một khoảng thời gian và sau đó sẽ được xóa đi

- Sau 10-20 phút bộ nhớ cache sẽ xóa các địa chỉ và câp nhật lại 

### Tham Khảo: 

1. https://letonphat.wordpress.com/2010/11/25/tổng-quan-arp-arp-cache-proxy-arp/

2. https://www.cisco.com/c/en/us/support/docs/ip/dynamic-address-allocation-resolution/13718-5.html