# VLSM (Variable-Lengh Subnet Mask) AND CIDR (Classless Inter-Domain Routing)


### VLSM là gì

##### Khái Niệm ( VLSM - Variable Lenght Subnet Maks)

- VLSM ( Variable Lenght Subnet Maks) là một kỹ thuật mà các quản trị viên sử dụng để chia Subnet  một cách hiệu quả hơn. Bằng cách sử dụng VLSM, thì với chỗ cần xài ít IP thì sử dụng vs netmask dài, còn những chỗ cần nhiều IP thì ta để netmask ngắn lại. Với ví dụ dưới đây sẽ rõ hơn :
Ví dụ một công ty có sơ đồ như hình và được cấp  ip là 172.16.33.0/20 yêu cầu chia IP đủ cho các chi nhánh và các IP giữa các Router :
Ở trong hình ta thấy chỗ cần ít IP như giữa 2 đầu nối router ta để nestmask của nó là (/30) còn chỗ cần nhiều ip cho thì ta để ngắn lại (/26).

![img](https://3.bp.blogspot.com/-_EIlIyICQjI/Wkud-raapDI/AAAAAAAAAXk/8_75pcB2zvUiCgoQXLF2wyAWRK7T5OUzACLcBGAs/s640/7-1024x730.png)

### CIDR là gì?

##### khái niệm (CIDR-Classless Inter-Domain Routing)

- CIDR (Classless Inter-Domain Routing) là một phương pháp để phân bổ các địa chỉ IP và định tuyến IP. CIDR được giới thiệu vào năm 1993 để thay thế cho kiến trúc giải trước của mạng IP trước đó. Mục tiêu của nó là để làm chậm sự cạn kiệt tài nguyên địa chỉ IPv4.

- CIDR (Classless Interdomain Routing) là một cách để gộp (aggregation) các địa chỉ mạng lại thành một địa chỉ mới. CIDR khắc phục được vấn đề thiếu hụt địa chỉ ip  và bảng định tuyến lớn
Ví Dụ : Ta có 8 địa chỉ lớp C : 192.168.48.0/24 -192.168.55.0/24, nếu sử dụng trong bảng định tuyến sẽ phải viết 8 câu lệnh route, nhưng với cách dùng của CIDR, thì 8 địa chỉ có thể được biểu diễn bằng 1 địa chỉ duy nhất 192.168.48.0/21.

### So sánh VLSM và CIDR
- VLSM nó sẽ giới hạn khả năng chia mạng con theo phân lớp, tức là:
  - Class a: thì chỉ được / từ 8 đến 30 bit network để chia ip cho host.
  - CLass b: chỉ được / từ 16 đến 30 bit network để chia ip cho host.
  - Class c: được / từ 24 đến 30 bit network để chia ip.
  - VD: 192.168.1.0/25 - 255.255.255.128 (VLSM )
	+ Tức là nó chỉ chia trong phạm vi của class đó thôi
- CIDR thì ngược lại. Nó không giới hạn khả năng chia mạng con theo phân lớp.
  - Class c có thể lấy bit của phần netID để chia subnet. 
  - VD2: 192.168.1.0/23 - 255.255.254.0 (CIDR)
  - 11000000.10101000.00000001.00000000 (tương tụ địa chỉ mạng - 11111111.11111111.11111110.00000000 ( tương tự netmask)
- Tức là Class C có thể lấy bit của phần NetId để chia subnet được. VLSM thì không.

## END