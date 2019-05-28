# IP - INTERNET PROTOCOL
### IP là gì?
- Địa chỉ IP (IP là viết tắt của từ tiếng Anh: Internet Protocol - giao thức Internet) là một địa chỉ đơn nhất mà những thiết bị điện tử hiện nay đang sử dụng để nhận diện và liên lạc với nhau trên mạng máy tính bằng cách sử dụng giao thức Internet.

- Bất kỳ thiết bị mạng nào bao gồm bộ định tuyến, bộ chuyển mạch mạng, máy vi tính, máy chủ hạ tầng (như NTP, DNS, DHCP, SNMP, v.v.), máy in, máy fax qua Internet, và vài loại điện thoại—tham gia vào mạng đều có địa chỉ riêng, và địa chỉ này là đơn nhất trong phạm vi của một mạng cụ thể. Vài địa chỉ IP có giá trị đơn nhất trong phạm vi Internet toàn cầu, trong khi một số khác chỉ cần phải đơn nhất trong phạm vi một công ty.

- Giao thức Internet phiên bản 4 (IPv4) định nghĩa một địa chỉ IP là một số 32-bit. Tuy nhiên, do sự phát triển của Internet và sự cạn kiệt các địa chỉ IPv4 sẵn có, một phiên bản IP mới (IPv6), sử dụng 128 bit cho địa chỉ IP, đã được phát triển vào năm 1995 và Ipv6 được triển khai tiến hành từ giữa những năm 2000.

### Cấu trúc địa chỉ IPv4
- Địa chỉ IPv4 gồm 32 bit nhị phân với mỗi bit được gắn giá trị 1 hoặc 0. Do địa chỉ IPv4 chia làm 4 phần bằng nhau và được phân cách bởi dấu chấm "." với mỗi phần là là 8 bit (1 byte) với giá trị thập phân tuơng ứng từ 0 đến 255, ta gọi mỗi phần này là một octet.
  - Ví dụ địa chỉ ip được viết dưới dạng thập phân là: 192.168.1.8
   Tuơng ứng với các bit là: 11000000.10101000.00000001.00001000
- Như vậy, với 32 bit, giới hạn của địa chỉ IPv4 là từ 0.0.0.0 đến 255.255.255.255.

- Địa chỉ IP được chia làm 2 phần: Network ID và Host ID.
  -  **Network ID** là địa chỉ mạng, địa chỉ mạng là địa chỉ được cấp cho từng mạng riêng. 
 
  -  **Host ID** (hay Host Address) là địa chỉ của máy trong mạng.
  
![img](https://media.geeksforgeeks.org/wp-content/cdn-uploads/IP_addressing_3.jpg)

### Các lớp của địa chỉ IPv4
- Ban đầu địa chỉ ip được chia làm 2 phần: 8 bit đầu là Network và 24 bit sau là Host. Tuy nhiên như vậy số network chỉ giới hạn ở con số 256 mạng mà thôi. Sau này, một địa chỉ IP được phân chia lại thành 5 lớp như sau:

  - **Lớp A:** gồm các địa chỉ IP có oc-tet đầu tiên mang giá trị nằm trong khoảng từ 1-126

  - **Lớp B:** gồm các địa chỉ IP có oc-tet đầu tiên mang giá trị nằm trong khoảng từ 128-191

  - **Lớp C:** gồm các địa chỉ IP có oc-tet đầu tiên mang giá trị nằm trong khoảng từ 192-223

  - **Lớp D:** gồm các địa chỉ IP có oc-tet đầu tiên mang giá trị nằm trong khoảng từ 224-239

  - **Lớp E:** gồm các địa chỉ IP có oc-tet đầu tiên mang giá trị nằm trong khoảng từ 240-255
  
- Trong thực tế, chỉ có các địa chỉ lớp A,B,C là được sử dụng, địa chỉ lớp D được dùng trong một vài ứng dụng dạng truyền thông đa phương tiện, như chuyển tải luồng video trong mạng. Riêng lớp E vẫn còn nằm trong phòng thí nghiệm và dự phòng!

![img](https://1.bp.blogspot.com/-Lj5iAsyu1Us/V2yB1Dq-nlI/AAAAAAAABP8/NjVY_TeAMCAV46ucVwJ1kGKl8KuQZDshQCLcB/s1600/ipclass.png)

##### Class A
- Địa chỉ lớp A sử dụng 1 Octet đầu tiên làm net-id, phần còn lại làm host-id. Bit đầu tiên của địa chỉ lớp A luôn là 0.
  - 10.0.0.1 - 255.0.0.0
  - Giá trị nhỏ nhất của Octet 1: 00000000 (nhị phân) hay 0 (Thập phân)
  - Giá trị lớn nhất của Octet 1: 01111111 (nhị phân) hay 127 (Thập phân)
  - Default subnet mask: 255.0.0.0
  
- Tuy nhiên, địa chỉ 0 (Thập phân) không được sử dụng và địa chỉ 127 (thập phân) được dành cho Loopback và chuẩn đoán, kiểm tra lỗi, nên dải địa chỉ lớp A sẽ là từ 1.x.x.x đến 126.x.x.x

##### Class B
- Địa chỉ lớp B sử dụng 2 Octet đầu tiên để làm net-id, 2 Octet còn lại làm host-id. 2 bits đầu tiên của địa chỉ lớp B luôn là 10.
  - 172.16.0.1 - 255.255.0.0
  - Giá trị nhỏ nhất của Octet 1: 10000000 (nhị phân) hay 128 (thập phân)
  - Giá trị lớn nhất của Octet 1: 10111111 (nhị phân) hay 191 (thập phân)
  - Default subnet mask: 255.255.0.0
- Vậy dải địa chỉ lớp B sẽ là từ 128.x.x.x đến 191.x.x.x

##### Class C
- Địa chỉ lớp C sử dụng 3 Octet đầu tiên để làm net-id,  Octet 4  làm host-id. 3 bits đầu tiên của địa chỉ lớp C luôn là 110:
  - 192.168.1.0 - 255.255.255.0
  - Giá trị nhỏ nhất của Octet 1: 11000000 (nhị phân) hay 192 (thập phân)
  - Giá trị lớn nhất của Octet 1: 11011111 (nhị phân) hay 223 (thập phân)
  - Default subnet mask: 255.255.255.0
- Vậy dải địa chỉ lớp C bắt đầu từ 192.x.x.x đến 223.x.x.x

- Ngoài ra còn có địa chỉ lớp D (224.x.x.x – 239.x.x.x) và lớp E (240.x.x.x - 254.x.x.x) dùng để thí nghiệm và nghiên cứu.

##### Subnet mask
- Mỗi địa chỉ IP luôn đi kèm với một Subnet mask, để xác định được phần net-id của địa chỉ đó. Subnet mask cũng là một dải nhị phân dài 32 bits và chia ra 4 bộ 8 bits như địa chỉ IP.

- Subnet mask được sử dụng để xác định khối địa chỉ IP được cung cấp.

- Subnet mask bao gồm phần các bits 1 và phần còn lại là các bits 0, subnet mask có bao nhiêu bit 1 thì địa chỉ IP tương ứng sẽ có bấy nhiêu bit phần net-id.

- Ví dụ: với subnet mask như sau: 11111111 11111111 11111111 00000000 (255.255.255.0) bao gồm 24 bits 1, thì địa chỉ IP mang subnet mask này cũng sẽ có 24 bits phần net-id.

- Có thể viết trực tiếp như sau: 192.168.1.3 - 255.255.255.0 hoặc sử dụng prefix length: 192.168.1.3/24
 
- Lưu ý, một địa chỉ IP có thể thuộc các mạng khác nhau nếu sử dụng các subnet mask khác nhau. Để xác định địa chỉ IP đó thuộc mạng nào, ta chỉ cần lấy địa chỉ IP AND (bitwise) với subnet mask tương ứng.

  - Ví dụ: 192.168.1.3 AND 255.255.255.0 = 192.168.1.0 vậy địa chỉ 192.168.1.3/24 thuộc mạng 192.168.1.0/24
  - ví dụ: 192.168.48.2 and 255.255.255.248 = 192.168.48.0 vậy địa chỉ 192.168.48.2/21 thuộc mạng 192.168.48.0/21

##### Chia subnet
- Ví dụ. Công ty có 1 đường IP 192.168.1.0 được yêu cầu chia làm 3 mạng con cho 3 phòng ban trong công ty, mỗi phòng tầm 20 máy.
  - Trước hết ta thực hiện phân tích cấu trúc địa chỉ IP: 192.168.1.0 
    + Địa chỉ netmask: 255.255.255.0
    + NetID: 11111111.11111111.11111111
    + HostID: 00000000
- Trong ví dụ này ta chia làm 3 subnet nên cần mượn 2 bit ở phần **HostID** để thêm vào **HostID** . Ta có công thức 2^n>=m (với m là số subnet cần chia, n là số bit mượn). Ở đây 2^2>=3
- Sau khi mượn ta có 1 NetID:
    + Netmask: 255.255.255.192
    + NetID: 11111111.11111111.11111111.**11**
    + HostID: 000000    
- Địa chỉ IP mới lúc này là: 192.168.1.0/26 ( 26 là do 24 bit mặc định + thêm 2 bit mượn = 26)
- Ta xác định bước nhảy K=256-192=64
- Ta có các mạng con sau:
    + 192.168.1.0/26 - 255.255.255.192
    + 192.168.1.64/26 - 255.255.255.192
    + 192.168.1.128/26 - 255.255.255.192
- Ta lấy số bit của toàn bộ địa chỉ IP là 32 trừ đi số bit được sử dụng để thiết lập mạng là 26 ( 32 - 26 = 6)
- Như vậy số máy trên mỗi mạng là: 2^6-2 = 62 ( trừ đi 2 là do có 2 địa chỉ không được sử dụng là địa chỉ mạng: 192.168.1.0 và địa chỉ broadcast: 192.168.1.255)

### Các loại địa chỉ IP

##### Địa chỉ Unicast

- Khi ta muốn gửi gói tin đến một máy tính cụ thể, khi đó địa chỉ để bạn gửi tới sẽ là một địa chỉ unicast. Đây đơn giản chỉ là địa chỉ IP của một thiết bị nào đó trong cùng hoặc mạng cục bộ khác.

##### Địa chỉ Multicast
- Trường hợp ta muốn gửi gói tin đến nhiều máy tính, ta không thể gửi lần lượt đến tất cả các máy được. Vì thế, địa chỉ bạn cần gửi tới trong trường hợp này sẽ là một địa chỉ Multicast, địa chỉ này đại diện cho một nhóm các thiết bị.

  - Địa chỉ multicast này chính là các địa chỉ trong dải địa chỉ lớp D.

##### Địa chỉ Broadcast
- Khi muốn gửi thông điệp đến tất cả các máy trong mạng nội bộ, đó là lúc ta cần sử dụng đến địa chỉ Broadcast. Địa chỉ Broadcast là địa chỉ có toàn bộ các bits phần host-id là 1. Khi gói tin được gửi đến địa chỉ Broadcast, thì nó sẽ được gửi tới tất cả các máy cùng mạng, tức là cùng phần net-id. Vì đại diện cho toàn bộ thiết bị trong mạng nên địa chỉ Broadcast không thể đặt được cho bất kỳ thiết bị nào.

  - Ví dụ: 192.168.1.255/24 là địa chỉ Broadcast của mạng 192.168.1.0/24.

#### Địa chỉ mạng
- Không chỉ các thiết bị mới có địa chỉ IP, mà các mạng thành phần của Internet hay mạng cục bộ cũng có một địa chỉ để xác định chính xác mạng đó. Khi tất cả các bits phần Host của một địa chỉ IP là 0, thì địa chỉ đó được gọi là địa chỉ mạng của mạng đó. Vì đại diện cho mạng nên địa chỉ mạng cũng không thể đặt được cho bất kỳ thiết bị nào.

  - Ví dụ: 192.168.1.0/24 là địa chỉ mạng của mạng 192.168.1.0/24.

#### Default Gateway
- Như một cổng thoát hiểm, khi gói tin cần gửi đến địa chỉ không cùng mạng hiện tại, hoặc đơn giản là không biết gửi đi đâu, thì gói tin đó sẽ được gửi tới địa chỉ Default gateway, thường là một interface của Router nối trực tiếp với mạng đó. Tại đây, Router sẽ dùng các chức năng định tuyến để chuyển tiếp gói tin đi các hướng khác nhau.

  - Default Gateway thường là địa chỉ IP có thể sử dụng đầu tiên của mạng đó.

  - Ví dụ: Default gateway của mạng 192.168.1.0/24 là 192.168.1.1/24.

#### Sự giới hạn của đia chỉ IP.
- Số lượng địa chỉ IP là rất lớn, nhưng không phải là vô hạn. Vì vậy để bảo tồn địa chỉ IP, người ta chia địa chỉ IP ra làm 2 loại là địa chỉ public và địa chỉ private.

#### Địa chỉ public.
- public: Là địa chỉ công cộng độc nhất, không được trùng với 1 IP nào cả kể cả Lan hay Wan.  Địa này do các nhà ISP cung cấp cho mình. Địa chỉ này là đầu nối để dữ liệu có thể gửi ra ngoài, hoặc vào trong.
  
#### Địa chỉ private
- Chỉ sử dụng được trong mạng cục bộ, có thể tái sử dụng lại ở mạng cục bộ khác, nhưng trong một mạng thì vẫn phải mang giá trị duy nhất.

- Với mỗi phân lớp địa chỉ IP, thì có một dải địa chỉ dùng để làm địa chỉ private cho lớp đó:

  - Lớp A: Từ 10.0.0.0 đến 10.255.255.255, subnet mask 255.0.0.0
  - Lớp B: Từ 172.16.0.0 đến 172.31.255.255, subnet mask 255.240.0.0
  - Lớp C: Từ 192.168.0.0 đến 192.168.255.255, subnet mask 255.255.0.0
  
- Khi các thiết bị sử dụng địa chỉ IP private trong mạng cục bộ muốn truy cập được Internet – môi trường không sử dụng địa chỉ private, công nghệ NAT (Network Address Translation) được cài đặt trên các thiết bị router(đã được gán 1 địa chỉ IP Public) được sử dụng để chuyển IP private thành IP public và ngược lại, giúp cho các thiết bị trong mạng cục bộ vẫn có thể truy cập được Internet.

### IPv6
- Độ dài 128 bit
- Viết bằng số thập lục phân, chia thành 8 nhóm, nhóm 2byte, phân cách nhau bằng dấu :
- Chia thành ba loại
     - Unicast
     - Anycast
     - Multicast
     
## END
