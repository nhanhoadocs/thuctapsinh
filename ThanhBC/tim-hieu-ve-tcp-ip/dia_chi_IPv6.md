# Tìm hiểu về địa chỉ IPv6
- IPv6 còn được gọi ( internet protocol version 6) sử dụng 128 bit   là giao thức truyền thông cung cấp hệ thống đánh giá vị trí và định tuyến luu lượng các trên internet.
## Ưu điểm so với IPv4:
- không gian địac chỉ lớn 2^128 địa chỉ.
- header được cải  thiện.
- tự động cấu hình không trạng thái.
- multicast tăng cường truyền thông hiệu quả.
- jumbograms: hỗ trọ packet payload cực lớn hiệu quả.
- bảo mật lớp mạng, mã hóa và xac thực truyền thông.
- khả năng QoS ( quality of service) đánh dấu cho các gói tin và dán nhãn để xác định đường đi ưu tiên.
- anycast. dịch vụ dự phòng có cấu truc đặc biệt.
- tính di dộng dễ dang xử lý vói thiết bị di đông hay chuyển vùng.

## Cấu trúc , phân chia bộ phận

- Địa chỉ IPv6  có dang:
2001:0j68:0000:0000:0000:0000:1986:69af
- quy ước viết tắt địa chỉ IPv6:
    - dãy 4 chữ số 0 liên tục sẽ viết tắt với nhau bằng ": :".
    - các sô 0 trong nhóm, được bỏ qua nếu khối đó bắt đầu bằng 4 sô 0 thì bỏ 1 số 0 mỗi khối, nếu khối có 3 sô 0 thì bỏ 1 số 0 mỗi khối, nếu khối có 2 sô 0 thì bỏ 1 số ko mỗi khối nếu khối có 1 số 0 thì bỏ số 0 viết lại là ": :".
    - theo quy ước trên ta sẽ viết lại địa chỉ IPV6 như sau
2001:0j68: :1986:69af

- truy cấp địa chỉ IPv6 qua web port 80 ta nhập sau 
http://[ địa chỉ IPv6 ] :  "port" /

- Địa chỉ IPv6 có 3 phần:
    - 3 octet đầu: 2001:0j68:0000 : là phần site prefix:  nó được gán đến trang của bạn bằng môi ISP , các máy tính trong một vị trí sẽ được chia sẻ cùng một site  prefix. Site prefix hướng tới dùng chung khi nó nhạn ra mạng của bạn và nó sẽ cho phép mạng có khả năng truy cập.

    - 1 octet tiếp theo :0000 : là phần subnet ID miêu tả cấu trúc của trang mạng, các mạng con làm việc với nhau, có độ dài 16 bytes.

    - 4 octet cuối :0000:0000:1986:69af : là phần interface ID nhận dạng  host riêng duy nhất trong mạng, được cấu hình dựa vào địa chỉ MAC của giao diện mạng  có thể cấu hình định dạng EUI-64

# Các loại địa chỉ IPv6.
- MULTICAST, UNICAST VÀ ANYCAST.

## UNICAST.
- có 2 loại là unicast toàn cục và unicast liên kêt cục bộ.
- unicast toàn cục là có thể truy cập rộng rãi 
    - site prexit chiếm 48 bit
    - subnet ID chiếm 16 bit
- unicast liên kết cục bộ chỉ có thể truy cập tói các máy tính khác mà đã chia sẻ liên kết.
    - có 128 byte chiều dài
        - site prexit chiếm 10 bit       
        - subnet ID chiếm 64 bit
        - interface  ID dài 54 bit, bắt nguồn từ 48 bit địa chỉ MAC đã gán vào card mạng để giao thức phân rang giới

## MULTICAST.
- dùng nhận dạng một nhóm giao diện mạng. các giao diện mạng điển hình dc định vị trên các máy tính phức hợp nhưng ko phải là thiết bị thuần túy
- sử dụng gửi thông tin đến bất kỳ các mang giao diện nào

## ANYCAST.
- là sự kết hợp các địa chỉ UNICAST và MULTICAST
- anycast gửi dũ liệu đến 1 người nhân cụ thể ở ngoài  nhóm người nhận
