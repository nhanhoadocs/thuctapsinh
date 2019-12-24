# DHCP (Dynamic Host Configuration Protocol)

## 1. DHCP là gì?
DHCP (Dynamic Host Configuration Protocol) là giao thức cấu hình tự động cho host. 

## 2. DHCP dùng để làm gì?
Nó cung cấp cho các host địa chỉ IP, Subnet Mask, default Gateway. Nó cung cấp 1 database trung tâm để theo dõi tất cả các máy tính trong hệ thống mạng. Mục đích là tránh trường hợp 2 máy tính khác nhau lại chung 1 địa chỉ IP. Ngoài việc cung cấp địa chỉ IP, DHCP còn cung cấp các thông tin cấu hình khác, cụ thể là DNS.

Và nó thường được cấp phát bởi DHPC server được tích hợp sẵn trên router.

DHCP giao tiếp bằng UDP và sử dụng port 67 và 68. DHCP server sử dụng port 67 để nghe thông tin từ các client và sử dụng port 68 để reply thông tin.

Hiện nay DHCP có 2 version: IPv4 và IPv6

Ưu điểm khi sử dụng DHCP:
- Tập trung quản trị thông tin cấu hình host
- Cấu hình động các máy
- Cấu hình IP cho các máy một cách liền mạch
- Sự linh hoạt
- Đơn giản hóa vài trò quản trị của việc cấu hình địa chỉ IP của client.
- Sự linh hoạt


## 3. Thành phần DHCP
Kiến trúc DHCP thì bao gồm 3 thành phần: 
1. DHCP client: thiết bị bất kì có thể kết nối mạng và có thể giao tiếp với DHCP server. Nó có thể là máy tính, điện thoại, cũng có thể là máy in mạng, máy chủ, ...
2. DHCP server: thiết bị cấp phát địa chỉ IP
3. DHCP relay agent: là thiết bị trung gian chuyển tiếp yêu cầu giữa DHCP client và DHCP server. Chúng không phải thành phần thiết yếu của 1 mạng thông thường. Tuy nhiên, khi làm việc với các hệ thống mạng lớn, phức tạp, chúng sẽ trở nên rất cần thiết.

### Một số thuật ngữ
- Option : các thông tin như địa chỉ IP, subnet mask, gateway, dns-server sẽ được DCHP Server cung cấp đầy đủ
- Scope : 1 dãy hay 1 đoạn địa chỉ IP đã được quy hoạch và chỉ định rõ ràng cho DHCP Server được phép cấp phát IP động cho DHCP Client.
- Reservation : những địa chỉ IP để dành, tức là để dùng gán cho 1 số client cố định
- Lease : thời gian cho "thuê" hoặc tồn tại của IP động đối với mỗi Client.

## 4. Nguyên lí hoạt động
<img src = "https://i.imgur.com/cKGFLy3.png">

Thành phần chính gồm 4 gói tin : DISCOVER, OFFER, REQUEST, ACK

Kịch bản quá trình cấp phát IP trong giao thức DHCP:
1. Client tạo ra bản tin DISCOVER để yêu cầu cấp phát địa chỉ IP và gửi đi tới các Server. (Do chưa biết chính xác địa chỉ Server cấp IP cho mình nên gói tin sẽ gửi ở dạng Broadcast)
2. Các Server nhận bản tin DISCOVER của Client gửi:
    
    2.1. Nó sẽ kiểm tra xem địa chỉ IP nào phù hợp để cấp cho Client.
    
    2.2. Server tạo bản tin OFFER (chứa thông tin về IP và các thông số cấu hình khác mà Client yêu cầu để có thể sử dụng để truy cập Internet)

    2.3. Các Server sẽ gửi bản tin OFFER dưới dạng Broadcast.
3. Client nhận các gói OFFER 
    
    3.1. Client chọn OFFER (có thể là gói tin đầu tiên nhận được , hoặc là gói có chứa IP mà nó đã từng dùng trước đó ). Còn nếu không nhận được gói OFFER nào thì nó sẽ gửi lại gói DISCOVER 1 lần nữa:

    3.2. Tạo gói REQUEST và gửi dưới dạng Broadcast tới tất cả các Server. Nếu nó nhận OFFER từ Server nào thì gói REQUEST gửi về Server đó sẽ mang ý nghĩa đồng ý nhận IP, còn các Server khác thì thông báo là không nhận OFFER đó.

4. Server nhận bản tin REQUEST (Đối với các Server không được nhận OFFER thì sẽ bỏ qua gói tin này)

    4.1. Server xử lí gói tin REQUEST: Kiểm tra xem IP này còn sử dụng được không.
    
    4.2. Nếu còn sử dụng được thì nó ghi lại thông tin và gửi lại gói tin ACK cho Client. Nếu không thì sẽ gửi lại PNAK để quay lại bước 1.


**Lưu ý: **
Để phân tích được gói tin của giao thức DHCP thì ta phải sử dụng một lệnh được gọi là tcpdump


