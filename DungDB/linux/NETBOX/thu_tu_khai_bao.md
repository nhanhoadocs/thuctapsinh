# Thứ tự khai báo

Cách khai báo: Khai báo theo tài liệu: https://github.com/hungviet99/thuc_tap/tree/master/NetBox

Khai báo theo thứ tự tương tự mẫu sau:

Mẫu:

- Thêm các site

Region có thể có region cha, region con

![Imgur](https://i.imgur.com/JKzqBJ8.png)

Site nằm trong region

![Imgur](https://i.imgur.com/1E1ej0h.png)

- Thêm power panel, power feed, để trống phần Rack, tí nữa add vào sau.

![Imgur](https://i.imgur.com/teGTH70.png)

![Imgur](https://i.imgur.com/6f7R9qo.png)

- Thêm IPAM: Vlan group, Vlan, RIR, Aggregates, Prefix.

![Imgur](https://i.imgur.com/rRlPYwb.png)

![Imgur](https://i.imgur.com/YTfcxP9.png)

![Imgur](https://i.imgur.com/CYWikal.png)

![Imgur](https://i.imgur.com/9UgzSwI.png)

Gán các VLAN vào các prefix

![Imgur](https://i.imgur.com/gpCaXgp.png)

Quản lý IP: Chọn vào các prefix muốn xem, chọn vào IP addresses

![Imgur](https://i.imgur.com/q81xcmx.png)

Các IP đã khai báo và đã dùng hiển thị ở đây. Có thể thấy các IP còn trống, có thể dùng được ở đây (IP available)

![Imgur](https://i.imgur.com/esLybRH.png)

IP khi add vào thiết bị nếu nằm trong prefix sẽ tự động thêm.

![Imgur](https://i.imgur.com/TkRa0Mc.png)

- Thêm các hãng thiết bị trong device, có thể thêm luôn các inventory liên quan như card mạng, RAM, ổ cứng, nguồn, vv. Sau khi thêm các inventory này sẽ mặc định luôn cho thiết bị này. (Ví dụ thiết bị có card mạng onboard thì thêm luôn card mạng đó tại đây)

Hoặc có thể để trống phần inventory và thêm sau khi lắp lên tủ rack (lâu hơn nếu sử dụng nhiều thiết bi này)

![Imgur](https://i.imgur.com/tx85qXZ.png)

![Imgur](https://i.imgur.com/JMioOWD.png)

![Imgur](https://i.imgur.com/kKMzREW.png)

Phần device sẽ thêm thẳng trên tủ rack cho dễ thao tác.

- Khai báo rack role và rack group. Thêm tủ rack tại địa điểm mong muốn. Thêm power feed và 2 PDU cho tủ rack (Mỗi PDU 35 chân cắm). Click vào vị trí U đề thêm thiết bị. Khai báo nguồn cho thiết bị (power port kết nối với PDU để lấy điện). Thêm các interface mạng. Thêm IP, MAC cho port và kết nối với các thiết bị khác. 

![Imgur](https://i.imgur.com/QKtMy3S.png)

![Imgur](https://i.imgur.com/GY18gwQ.png)

Tạo một rack tại CMC-HNI

![Imgur](https://i.imgur.com/KA5WKvU.png)

Bên trong tủ rack

![Imgur](https://i.imgur.com/DyS2Dph.png)

Mỗi rack có 2 PDU. Mỗi rack có 2 power feed (1 để dùng, 1 để dự phòng)

![Imgur](https://i.imgur.com/gnvtKYb.png)

PDU cần nối với power feed

![Imgur](https://i.imgur.com/1KQRXCi.png)

Thêm các power outlet cho PDU

![Imgur](https://i.imgur.com/ueJzIvj.png)

Ví dụ server Cehp_06

![Imgur](https://i.imgur.com/jEGTfsE.png)

Cáp nối nguồn điện

![Imgur](https://i.imgur.com/EkSMS3U.png)

Có thể khai báo dịch vụ ở service, Các thiết bị liên quan ở Related Devices. Note các thông tin khác về server này ở comments. 

![Imgur](https://i.imgur.com/tGjbfhN.png)

Các kết nối mạng. Hiển thị kết nối từ thiết bị này từ thiết bị này đến các thiết bị khác. Ví dụ eth0 đang nối đến port 8 của SW provider

(Nếu thêm nhiều interface một lúc thì không thể thêm địa chỉ MAC được)

![Imgur](https://i.imgur.com/YPcxZqH.png)

Ví dụ một kết nối 

![Imgur](https://i.imgur.com/x9sTZfK.png)

- Khai báo các thành phần khác trong server trong phần Inventory.

![Imgur](https://i.imgur.com/pWtYb7f.png)

**Lưu ý** khi chọn dây: Dây mạng thường dùng CAT 5, CAT 5e, CAT 6. Kết nối dây nguồn thì chọn loại dây là power. Chân nguồn dùng loại C14, C13.

Chú ý các phần sau, dùng để quản lý inventory, kết nối và các thành phần thiết bị

![Imgur](https://i.imgur.com/n6Qid08.png)