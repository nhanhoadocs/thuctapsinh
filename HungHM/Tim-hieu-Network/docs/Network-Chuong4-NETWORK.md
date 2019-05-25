# CHƯƠNG 4: NETWORK

## Mục lục
[4.1 Tổng quan về IP](#1)
 - [4.1.1 Khái niệm ](#a)

[4.2 Địa chỉ IP)](#2)

[4.3 IPV4](#3)

[4.4 Định tuyến(Routing) ](#4)
- [4.4.1 Định tuyến ](#c1)
- [4.4.2 Phân loại định tuyến ](#c2)
- [4.4.3 Thiết bị định tuyến ](#c3)

[4.5 Cơ chế NAT ](#5)
- [4.5.1 Khái niêm cơ bản ](#c4)
- [4.5.2 Nghiệm vụ của NAT ](#c5)
- [4.5.3 Phân loại ](#c6)

 ===========================

<a name ="1"></a>
 4.1 Tổng quan về IP

 - Khái niệm: Địa chỉ IP(Internetprotocol) là số định dạng cho một phần cứng mạng,các thiết bị sử dụng địa chỉ IP để liên lạc với nhau qua mạng dựa trên IP như mạng Internet .Hầu hết các địachỉ IP có dạng như sau: 151.101.65.121 -> IPV4. 2001:4860:4860::8844 ->IPV6

 - IP dùng để làm gì
 IP cung cấp nhân danh cho 1 thiết bị mạng ,tương tự như đ/c nhà diêng.Các thiết bị mạng có các địa chỉ IP khác nhau.

 - Giải thích rõ hơn về địa chỉ IP
  Đia chỉ IP được chia thành 4 số giới hạn từ 0 -> 255.Mỗi số được lưu bởi một byte -> IP có kích thước là 4 byte được chia thành các lớp địa chỉ có 3 lớp là A,B,C

<a name ="2"></a>
  4.2 Địa chỉ IP 

  - Anycast: Định hướng đường đi ngắn nhất cho gói tin
  - Unicast: là thuật ngữ mô tả cách thức truyền tin từ 1 điểm này đến 1 điểm khác .Có một nguồn guwỉ và một nguyồn nhận ,mỗi nguồn thì được xác định một địa mạng
  - Broadcast: là đại chỉ được sử dụng để làm đích đến của một gói tin khí một host muốn gửi một gói tin đến tất cả các host còn lại trong mạng LAN
  - Multicast: Thuật ngữa mô tả các thức truyền tin từ một điểm đến một tập hợp khác 
  - Subnet Mask: Mỗi địa chỉ IP luôn đi kèm 1 subnet mask ,để xác địn net ID của đại chỉ đó.Subnet mask cũng là một dải nhị nhân dài 32 bit và chia 4 bộ 8 bit như IP
    - Net ID: là đại chỉ mạng là đại chỉ được cấp cho từng máy 
    - Host ID: là địa chỉ của máy trong mạng
- Default gateway:là cổng mặc định là đại chỉ IP của Modem,Router khi bạn set IP tĩnh thì pahỉ xem thông số này.
- IP Tĩnh: là địa chit IP mà bạn có thể tự cài đặt ,thay thế được
- IP Động: ngược lại so vối IP tĩnh bạn không thể tự thay đổi địa chit IP của nó được mà sẽ được cài đặt mặc định bởi một hệ thống mạng nào đó 
- Một địa chỉ IP được chia làm 2 phần
    - NetworkID: là 3 bộ số đầu tiên của đại chỉ IP nó được dùng để xác định loại mạng mà mà thiết bị đang kết nối vào 
    VD: địa chỉ mạng là 192.168.1.23 thì NetworkID là 192.168.1
    - Host ID: chính là bộ số cuối cùng của địa chỉ IP,dung để xác định thiết bị (như là địa chỉ nhà vậy)
- MTU (Maximum Tranmission Unit) là kính thước của gói dữ liệu lớn nhất được đo bằng byte.Kích thước thay đổi thuộc vào hình thức mạng và giao thưucs 

<a name ="3"></a>
4.3 IPV4( Internet Protocol Version 4)
IPV4 sử dụng 32 bit để đánh địa chỉ và chia thành 4 octest mỗi octest có 8 bit sấp sỉ 1 byte.Mỗi octest được đặt cách nhau bổi các dấu "."
- Lớp A:
    - 8 bit Network - 24 bit host
    - Địa chỉ mạng 0-126
    - 1 bit đầu tiên bằng 0
- Lớp b:
    - 16 bit Network - 16 bit host
    - Địa chỉ mạng 128-191
    - 2 bit đầu tiên bằng 10
- Lớp A:
    - 24 bit Network - 8 bit host
    - Địa chỉ mạng 192-233
    - 3 bit đầu tiên bằng 110
- Lớp D:
    - 4 bit đầu bằng 1110
    - Địa chỉ mạng 224-239
    - 28 bit dùng cho Multicast
- Lớp E:
    - 4 bit đầu bằng 1111
    - Địa chỉ mạng 240-255
    - 28 bit còn lại chưa rõ

    <a name ="4"></a>
4.4 Định Tuyến (Routing)

<a name ="c1"></a>
4.4.1 Định tuyến
là quý trinhg chọn đường đi trên mạng máy tính để gửi dữ liệu qua đó.Routing chỉ ra hướng đi sự d chuyển của các gói dữ liệu được đánh địa chỉ từ mạng nguồn cảu chúng dướng đến đích cuối thông qua các node trung gian thiết bị phân cướng chuyên dùng được gọi là các Router (bộ định tuyến).Tiến trình đianhj tuyến thường chỉ hướng đi dựa vào bảng định tuyến .Đó là bảng chứa các lộ trình tốt nhất để đến đích khác nhau trên mạng

<a name ="c2"></a>
4.4.2 Phân loại định tuyến 
- Định tuyến tĩnh: Việc xác định bảng định tuyến của Routẻ được thực hiện bằng tay bởi ngừi quản trị
- Định tuyến động: Việc xác định và duy chì trạng thái cảu bagr định tuyến được thực hiện tự động bởi Router
    - Định tuyến trong
    - Định tuyến ngoài 

 <a name ="c3"></a>
4.4.3 Thiết bị định tuyến
- Router: cấu tạo
    - CUP-MAIN-RAM-FLASH-Cổng kết nối.
        - CPU: Bộ vi xử lý thực hiện các câu lệnh khởi động,kết nối..
        - MAIN: là mạch điện tử kết nối truyền dẫn tín hiệu cho các chíp RAM-FLASH
        - FLASH: là bộ dữ liệu của Router nhưng tốc độ truyền nhanh hơn
        -Cổng kết nối: USB,LAN
- Chức năng: Kết nối các thiết bị với nhau bằng cách gửi các gói dữ liệu giữa các thiết bị
- Hoạt động: Mỗi thiết bị được gán cho một địa chỉ IP .Khi muốn truyền một gói tín thiết bị gửi đến Router địa chỉ IP của thiết bị sẽ giưps Router nhận biết đươc đó là máy nào,và sẽ chuyển tin đó đi đâu

<a name ="5"></a>
4.5 Cơ chế NAT

<a name ="c4"></a>
4.5.1 Khái niêm cơ bản
NAT (Network Address Tranlation) Biên dịch mạng
- Thay đổi thông tin địa chỉ IPtrong gói tin đang được truyền qua 1 thiết bị định tuyến 
- cho phép 1 hay nhiều nđại chỉ IP nội miền .được ánh xạ với 1 hay nhiều địa chỉ IP ngoại miền

<a name ="c5"></a>
4.5.2 Nghiệm vụ của NAT
NAT giống như một Router , chuyển tiếp các gói tin giưa những lớp mạng khác nhau trên mạng lớn.NAT dịch hay thay đổi 1 hoặc cả 2 địa chỉ bên trong 1 gói tin khi gói tin đó qua 1 Router.Thông thường NAT thường thay đổi đại chỉ thường là đại chỉ riêng(IP Private) cảu 1 kết nối mậngthành địa chỉ công cộng (IP Public)

<a name ="c6"></a>
4.5.2 Phân loại'
- NAT tĩnh(Static NAT): là phương thức NAT một đôi một. Một địa chỉ IP Private sẽ được map với một địa chỉ IP Public. 
 - NAT động(Dynamic NAT): Một địa chỉ IP Private sẽ được map với một địa chỉ IP Public trong nhóm địa chỉ IP Public.
 - Overloading NAT : một dạng thức của NAT động (Dynamic Overload). Nhiều địa chỉ IP Private sẽ được map với một địa chỉ IP Public qua các Port (cổng) khác nhau.
 - Overlapping NAT: khi địa chỉ IP trong hệ thống mạng nội bộ là IP Public đang sử dụng trên một hệ thống mạng khác, Router phải duy trì một bảng tìm kiếm các địa chỉ này để ngăn và thay thế bằng một IP Public duy nhất.
 


