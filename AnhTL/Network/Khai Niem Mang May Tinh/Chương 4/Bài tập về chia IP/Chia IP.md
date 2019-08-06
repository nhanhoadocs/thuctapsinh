# Bài Tập IP

#### 1. Cho địa chỉ IP 172.16.4.0 / 255.255.0.0

- Chia ra làm 6 phòng ban mỗi phòng ban 20 máy

B1: Ta xác định số subnet và host của mỗi subnet để chia cho tối ưu nhất.

B2: Tiến hành mượn bit: ta mượn 11 bit của phần subnet mask.
- Do đây là địa chỉ thuộc lớp B và mặc định có 16 bit là NetID
  - Quy ra nhị phân ta có: 11111111.11111111.**11111111.111**00000 ( Phần đậm là số bit mượn )
  - Đổi thành thập phân: 255.255.255.224
  - Ta có 172.16.4.0/27

  
B3: Ta thực hiện bước nhảy: Lấy 32 bit mặc định trừ đi số bit của NetID lúc này là 27.

- 32 - 27 = 5
- Rồi dùng công thức: 2^n để ra được dải địa IP cấp cho host: 2^5 = 32

B4: Ta có địa chỉ mạng là: 
  - 172.16.4.0/27 255.255.255.224
  - 172.16.4.32/27 255.255.255.224
  - 172.16.4.64/27 255.255.255.224
  - 172.16.4.96/27 255.255.255.224
  - 172.16.4.128/27 255.255.255.224
  - 172.16.4.160/27 255.255.255.224

- Ở mỗi địa chỉ mạng thì chỉ cấp được 30 địa chỉ IP do trừ đi 2 địa chỉ IP đó là:
  - Địa chỉ mạng (dùng để định tuyến): 172.16.4.0
  - Địa chỉ Broadcast: 172.16.4.32
