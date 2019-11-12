# Lịch sử hình thành, phát triển và đặc điểm của DHCP

## 1. Lịch sử.

Trước khi tìm hiểu về giao thức DHCP là gì hoạt động như thế nào thì ta phải tìm hiếu các giao thức đã phát triển thành nó.

### 1.1 Giao thức ARP.

Address Resolution Protocol (ARP): Giao thức phân giải địa chỉ.

Ta đã biết mỗi một máy tính có một card mạng và sở hữu một địa chỉ MAC cố định và duy nhất. Và các card mạng trong một mạng LAN sẽ liên lạc với nhau thông qua địa chỉ này tại tầng Data-link của mô hình OSI.

Và khi một máy tính được kết nối vào mạng LAN nó cũng được cấp phép một địa chỉ mang tính chất quy ước là IP, sử dụng ở tầng Network của mô hình OSI. Chúng ta hoàn toàn có thể tự thay đổi địa chỉ này theo ý muốn của mình. 

Vậy làm sao để một máy tính A có thể biết được địa chỉ MAC của một máy tính B có địa chỉ IP để gửi gói tin cho nó?

Cách hoạt động của ARP.
- Máy tính A kiểm tra cache xem có lưu ánh xạ giữa địa chỉ IP va MAC không.
- Máy A khởi tạo gói tin ARP Request. Nó sẽ gửi  gói tin broadcast đến toàn bộ các máy khác trong mạng với địa chỉ MAC và IP máy gửi là địa chỉ của chính nó và địa chỉ IP máy nhận là địa chỉ IP của máy B.
- Các máy trong toàn mạng sẽ nhận được gói tin ARP Request đó sau đó các máy tính kiểm tra địa chỉ IP nhận nếu trùng thì tiếp tục xử lý, nếu không trùng thì hủy bỏ.
- Máy B thấy trùng địa chỉ IP nhận thì thực hiện xử lý.
- Máy B  cập nhật bảng ánh xạ địa chi IP và địa chỉ MAC lấy trong gói tin ARP Request được nhận từ máy A.
- Máy B đồng thởi gửi gói tin ARP Reply đến máy A băng địa chỉ đích và nguồn vừa được cập nhật.
- Gói tin ARP Reply gửi từ máy B được máy A nhận được.
- Máy A cập nhật địa chỉ IP và MAC vào cache và được tái sử dụng cho lần sau kết nối.

Vậy giao thức ARP thực hiện trên kiểu kết nối client- server.

### 1.2 Giao thức RARP.

Reverse Address ResolutionProtocol (RARP): giao thức phân giải địa chỉ ngược.
Đây là giao thức được sử dụng trên máy chủ để xác định địa chỉ IP từ  địa chỉ MAC của thiết bị.

RARP server là nơi lưu trữ tất cả các ánh xạ địa chỉ IP và địa chỉ MAC của các Host  trong mạng.

RARP client là một máy tính cần xác định địa chỉ IP của Host với đầu vào là địa chỉ MAC.

Cách hoạt động của RARP.
- Máy tính RARP client gửi 1 gói tin RARP Request và gửi Broadcast đến tất cả các máy trong mạng.
- Máy tính RARP server nhận được gói tin này nó nhìn lên địa chỉ MAC trong tệp cấu hình nếu không thấy trùng với địa chỉ MAC trong cache thì hủy bỏ, nếu trùng thì tiếp tục xử lý.
- Máy tính RARP server thấy có ánh xạ thì thưc hiện tạo gói tin RARP Reply và gửi tới địa chỉ MAC và IP của máy nguồn.
- Máy tính RARP client nhận được gói tin và lưu lại để tải sử dụng cho các lần sau.

Hạn chế của giao thức này là chỉ hoạt động ở lớp 2 và cấp phát địa chỉ IP, không cấp thêm giá trị nào cả, trên mỗi mạng phải cần có 1 RARP server để đáp ứng nhu cầu giao tiếp và mỗi RARP server cần cấp phát địa chỉ IP bằng tay.

### 1.3 Giao thức BOOTP.

Bootstrap Protocol (BOOTP): giao thức bootstrap.

BOOTP hoạt đọng tương tự như RARP.

BOOTP được tạo ra để khắc phục các hạn chế của RARP.

BOOTP triển khai lớp 3, gưi thêm các thông tin khác ngoài địa chỉ IP.

BOOTP cung cấp các thông tin khác như địa chỉ IP, subnet mask, địa chỉ bộ định tuyến, địa chỉ MAC, ...

BOOTP sử dụng UDP đê gửi các thông tin đó trong mạng.
 
Trong một mạng lớn thì chỉ cần sủ dụng 1 hay 2 BOOTP server qua việc sủ dụng BOOTP replay agents.

BOOTP là một giao thức cấu hình tĩnh. Chỉ hoạt động tốt khi liên kết giữa địa chỉ IP và MAC là tĩnh.

BOOTP không tự động cấu hình, không cập phát địa chỉ IP tạm thời, không có khả năng tương thích cao, nếu cấu hình mannual dễ bị lỗi.

### 1.4 Giao thức DHCP.

Dynamic Host Configuration Protocol (DHCP): Giao thức cấu hình máy chủ động.

DHCP được cải tiến từ giao thức BOOTP.

DHCP chuyển cấp phát địa chỉ IP tĩnh thành cấp phát địa chỉ IP động, và có khả năng tự động gán địa chỉ IP khi có một máy vào mạng.

DHCP có thể đặt cho một địa chỉ IP một khoảng thời gian sử dụng điều này dẫn đến tránh lãng phi dịa chỉ IP không sử dụng.

DHCP có khẳ năng tương tác cao với các máy khác. Có thể tự động cấu hình và không gặp lỗi.

DHCP cần sử dụng bộ nhớ để lưu trữ và chuyến tiếp thông tin.

DHCP ngày nay là giao thức cấu hình host được sử dụng ở hầu khắp mọi nơi trong mô hình mạng gia đình tới mạng doanh nghiệp.

DHCP hoạt động theo mô hình client- server

DHCP server lăng nghe trên công 67. DHCP client lắng nghe trên cổng 68.

