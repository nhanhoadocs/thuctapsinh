# NAT ( network address translation ) 
- Là quá trình thay đổi thông tin địa chỉ ip trong gói tin đang được truyền qua 1 thiết bị định tuyến.
#### Có 3 loạt Nat:
###### 1. Nat tĩnh ( static nat ): biên dịch địa chỉ ip cố định
 vd: Địa chỉ ip của máy tính là 192.168.32.10 luôn được biên dịch đến địa chỉ ip 213.18.123.110
###### 2. Nat động ( Dynamic nat ): 1 địa chỉ ip private sẽ được nat với 1 địa chỉ ip trong nhóm địa chỉ ip public 
 vd: Địa chỉ ip 192.168.32.10 luoon được biên dịch đến địa chỉ trong dãy từ  ( 213.18.123.10 đến 213.18.123.1150 )
###### 3.Nat overload ( quá tải địa chỉ mạng ): là giả pháp được dùng nhiều nhất đặc biệt trong các modem ADSL, chuyển nhiều địa chỉ ip private thành 1 địa chỉ ip pubic khi đi ra ngoài bằng cách phân biệt qua số Port
> ###### Cấp ip: ( Dynamic Host Configuration protocol ): Mọi thiết bị kết nối và mạng cần 1 địa chỉ ip và được cấp phát bởi máy chủ DHCP Server thường được tích hợp trên router, DHCP client là thiết bị có thể kết nối



