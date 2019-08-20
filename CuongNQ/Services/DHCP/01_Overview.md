# DHCP - Dynamic Host Configuration Protocol
## **1) Khái niệm**
- **DHCP - Dynamic Host Configuration Protocol** là 1 giao thức mạng tự động cung cấp các thông tin TCP/IP cho client . Mỗi **DHCP Client** kết nối tới 1 **DHCP Server** trong mạng và được trả về các thông tin như `địa chỉ IP` , `subnet-mask` , `gateway` , `dns-server` ,...
- Các thuật ngữ trong **DHCP Server** :
    - **Options** : các thông tin như `địa chỉ IP` , `subnet-mask` , `gateway` , `dns-server` sẽ được **DHCP Server** cung cấp đầy đủ .
    - **Scope** : một dãy hay 1 đoạn địa chỉ IP đã được quy hoạch và chỉ định rõ ràng cho **DHCP Server** được phép cấp phát IP động thông cho **DHCP Client** .
    - **Reservation** : là những địa chỉ IP đã được "để dành" , tức là dùng để gán cố định cho 1 số client .
    - **Lease** : thời gian cho "thuê" hoặc tồn tại của IP động đối với mỗi máy Client .
## **2) Các trạng thái DHCP ( state transition of DHCP Client )**
<img src=https://i.imgur.com/iqVaCRl.png>

- Các trạng thái của **DHCP Client** :
    - `INIT`
    - `SELECTING`
    - `REQUESTING`
    - `BOUND`
    - `RENEWING`
    - `REBINDING`
    - `INIT-REBOOT`
    - `REBOOTING`
- Ở trạng thái `INIT` , máy Client gửi gói tin **`DHCP Discover`** dưới dạng ***broadcast*** để tìm kiếm DHCP Server , rồi chuyển về trạng thái `SELECTING` .
- Ở trạng thái `SELECTING` , máy Client sẽ ở chế độ chờ , đợi gói tin **`DHCP Offer`** . Sau khi nhận được 1 loạt các gói tin **`DHCP Offer`** , máy Client sẽ chọn lấy 1 ( có thể là gói tin đầu tiên nhận được , hoặc là gói có chứa IP mà nó đã từng dùng trước đó ) và gửi ***broadcast*** gói tin **`DHCP Request`** bao gồm trong đó là thông tin DHCP đã chọn . Sau đó , nó chuyển sang trạng thái `REQUESTING` .
- Ở trạng thái `REQUESTING` , khi máy Client nhận được gói tin **`DHCP Ack`** , nó sẽ bật 2 timer `T1` và `T2` dựa theo thời gian được chia địa chỉ IP ( ***lease time*** ) trong gói tin **`DHCP Ack`** , và chuyển sang trạng thái `BOUND` . Ở đây , timer `T1` và `T2` sẽ được sử dụng để gia hạn thêm thời gian thuê IP , và được đặt theo công thức sau :
    - `T1` = `0.5 x lease_time` ( VD : nếu ***lease time*** là `1h` thì `T1` được đặt là `30p` )
    - `T2` = `0.875 x lease_time` ( VD : nếu ***lease time*** là `1h` thì `T2` được đặt là `52.5p` )
- Ở trạng thái `BOUND` , máy Client sẽ kiểm tra xem IP được nhận đã bị sử dụng chưa ( ***IP conflict - xung đột IP*** ) và cấu hình card mạng theo đúng thông tin trong gói **`DHCP Ack`** . Bây giờ , máy Client đã được kết nối tới Internet . Sau đó , `T1` hết hạn trong trạng thái `BOUND` , máy Client sẽ gửi ***unicast*** bản tin **`DHCP REQUEST`** để xin tiếp tục sử dụng địa chỉ IP và chuyển sang trạng thái `RENEWING` .
- Ở trạng thái `RENEWING` , máy Client nhận được gói tin **`DHCP Ack`** bao gồm các thông tin cấu hình từ DHCP Server ( như vậy là đã chấp nhận gia hạn thời gian thuê IP ) và nó sẽ reset `T1` và `T2` . Nếu Client không nhận được phản hồi từ DHCP Server , nó sẽ tiếp tục chờ , đến khi `T2` hết hạn , nó chuyển sang trạng thái `REBINDING` . Trong quá trình `RENEWING` , máy Client vẫn tiếp tục online trong thời gian ***lease time*** cho dù có nhận được gói **`DHCP Ack`** hay không .
- Ở trạng thái `REBINDING` , máy Client gửi ***broadcast*** gói **`DHCP Request`** trên dải mạng để tất cả các **`DHCP Server`** có thể nhận được . Ở trạng thái này , nếu Client nhận được **`DHCP Ack`** , nó sẽ reset **`T1`** và **`T2`** và trở lại trạng thái `BOUND` . Tuy nhiên , nếu nó vẫn không nhận được phản hồi , nó sẽ chuyển về trạng thái `INIT` . Trong quá trình `RENEWING` , máy Client vẫn tiếp tục online cho đến hết thời gian ***lease time*** cho dù có nhận được gói **`DHCP Ack`** hay không .
- Trạng thái `INIT-REBOOT` tượng trưng cho lúc máy CLient đã nhận thức được địa chỉ IP đã được gán , và máy Client chuyển sang trạng thái này khi nó đang reboot . Ở trạng thái này , máy Client sẽ gửi ***broadcast*** gói tin **`DHCP Request`** , sau đó chuyển sang trạng thái `REBOOTING` .
- Ở trạng thái `REBOOTING` , khi nhận được bản tin **`DHCP Ack`** , máy Client sẽ bật `T1` và `T2` dựa theo ***lease time*** và chuyển sang trạng thái `BOUND` .

    <img src=https://i.imgur.com/L8AeR0d.png>


