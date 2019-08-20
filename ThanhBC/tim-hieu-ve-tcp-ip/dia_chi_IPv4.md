# tìm hiểu địa chỉ IPv4

- mây tính  và rourter có 1 đường kết nới  vào hệ thống qua đó IP sẽ sử dụng khi gửi  datagram. nắm giữa máy tính và đường liên kết có một giao diện ghép nối( interface).
router có nhiều giao diện mõi giao diện  ứng vơi một kết nối.
Tất cacr máy tính và router dderu phải có khả năng gủi và nhận  IP dadtataa gram neen mỗi giao diện phải có 1 địa chỉ ip. do đó đia chỉ IP dúng vơi giao diện chứ không phải với  máy tính hayy router

- Đia chỉ ip có độ dài là 32 bit (4 byte) do đó có 2^32 dịa chỉ, viết theo ký  pháp  dáu chấm  thập phân( dotted  decimal notation), 32 bit nhị phân chia thành 4 cụm 8bit gọi là các octet. Địa chỉ IP có cấu trúc 192.168.106.132.
- Địa  IP chia làm 2 phần : 
    - phần netwwork  và phần host:
- Các lớp địa chỉ IPv4 
    - Lớp A : 1 octet network và 3 octet host, dải địac chỉ từ 1.0.0.0 đến 126.0.0.0, mạng 127.0.0.0 được sử dụng làm mạng lookback., phần host có 24 bit nên mỗi mạng lớp A có (2^24-2) địa chỉ.
    - Lớp B : 2 octet network và 2 host id. Các địa chỉ mạng lớp B gồm 128.0.0.0 đến 191.255.0.0 có tất cả 2^14 mạng, một lớp mạng có (2^16 -2) host.
    - Lớp C : 3 octet network và 1 host id. 3bit đầu là 1 1 0 . . địa chỉ mạng lớp C gồm 192.0.0.0 đến 223.255.255.0 có 2^21 mạng trong lớp C. một lớp mạng có (2^8-2) host.
    - Lớp D : gồm các địa chỉ thuộc dải 224.0.0.0 đến 239.255.255.255 được sử dụng làm multicast. 224.0.0.5 sử dụng cho OSPF, 224.0.0.9 dùng cho RIP v2
    - Lớp E : từ 240.0.0.0 trở đi, được sử dụng cho mục đích dự phòng.

## Địa chỉ private và địa chỉ public  
- Địa chỉ private chỉ dc sử dụng trong mạng nội bộ không được định tuyến trên môi trường internet, được sử dụng lặp trong các LAN  khác nhau.
- Địa chỉ public: được sử dụng cho các gói tin đi trên môi trường internet. Địa chỉ public là duy nhất cho mỗi host tham gia vào internet
NAT (network address translation) được sử dụng để chuyển đổi giữa IP private và IP public.

## địa chỉ broadcast
- có 2 loại là:
    - direct broadcast: ví dụ 192.168.1.255 gửi chỉ lớp 192.168.1.0 nhân được.
    - local broadcast 255.255.255.255 gửi tất cả nhận được
## subnet mask và số prefix length.
- subnet mask là dãy nhị phân dài 32 bit đi kèm với một địa chỉ để cho phép xác đinh được network mà IP này thuộc về sử dụng phép toán AND.
- prefix length là một cách khác để xác định địa chỉ IP xác định số bit mạng trong một địa chỉ IP, viết sau địa chỉ IP  và ngăn cách bởi dấu "/".


# chia địa chỉ IP 
- Kỹ thuật chia mạng con với phương pháp (VLSM-Variable Lengh Subnet Mask)

# giao thức  cấu hình địa chỉ động( dynamic host configuartion protocol - DHCP)
- cách thức hoạt động: