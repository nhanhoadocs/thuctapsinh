# Các chế độ mạng trong linux bridge

Cũng như các công cụ ảo hóa khác thì KVM cũng cung cấp các mô hình mạng trong việc ảo hóa network. Có 3 chế độ card mạng tương ứng với 3 mô hình mạng:

- NAT
- Bridge
- Host-only

## 1. NAT

![Imgur](https://i.imgur.com/VYwjdL0.png)

- Trong mô hình này KVM thực hiện ánh xạ một dải địa chỉ để cung cấp cho máy ảo

- Dải địa chỉ ta có thể chọn tùy ý. Với mô hình này máy ảo của ta có thể giao tiếp với internet.

- Nhưng có một chú ý rằng từ VM của ta có thể ping được ra ngoài internet nhưng máy bên ngoài sẽ không thấy được VM của ta chính vì vậy ta không thể ping từ bên ngoài đến VM sử dụng mô hình mạng NAT.

### Cách cấu hình 

Mặc định, sau khi cài đặt xong KVM, ta sẽ có một mạng ảo NAT mang tên `default`, thường mang dải địa chỉ IP `192.168.122.0`

Có thể add một mạng ảo với mô hình NAT khác. Ở đây sử dụng `virt-manager`. Mở virt-manager bằng lệnh `# virt-manager`:

![Imgur](https://i.imgur.com/MlbPM1b.png)

Chọn **Edit** -> **Connection Details** -> **Virtual Network**. Bên trái chính là danh sách các mạng, để thêm một mạng mới click vào dấu `+`

![Imgur](https://i.imgur.com/4VPN6mt.png)

Chọn tên cho mạng mới

![Imgur](https://i.imgur.com/XgJUBL8.png)

Chọn dải mạng cho mạng mới. Có thể chọn DHCP để cấp IP cho máy ảo hoặc chọn cấu hình IP tĩnh

![Imgur](https://i.imgur.com/NOi8X0N.png)

Tiếp tục, chọn có sử dụng IPv6 không. Ở đây tôi không sử dụng

[Imgur](https://i.imgur.com/HooGFWy.png)

Chọn mode là NAT, ở phần Destination có thể chọn một card mạng ở chế độ NAT từ máy thật.

![Imgur](https://i.imgur.com/t6HFqFK.png)

Sau khi finish, mạng vừa tạo sẽ xuất hiện trong danh sách mạng

![Imgur](https://i.imgur.com/5ILY3oH.png)

Trên VM đã tạo, vào phần **Show virtual hardware details** để thiết lập mạng mới vào card mạng cũ, hoặc cũng có thể thêm một card mạng mới rồi thiết lập mạng vừa tạo trên card mạng đó ở phần **Add hardware**

![Imgur](https://i.imgur.com/T3UfCtV.png)

Reboot lại VM sẽ thấy xuất hiện dải mạng vừa thêm

## Host-only

![Imgur](https://i.imgur.com/oPA6y9a.png)

- Với mô hình mạng kiểu này cũng cho phép ta cấp phát địa chỉ tùy ý giống với mô hình NAT.

- Máy ảo không thể nói chuyện với máy tính bên ngoài.

- Nó chỉ có thể trao đổi với các máy trong cùng mạng bên trong server vật lý và trao đổi với đươc máy chủ vật lý.

### Cách cấu hình

Tương tự cách tạo mạng NAT nhưng ở đây chọn kiểu mạng sẽ là **Isolated virtual network**

![Imgur](https://i.imgur.com/6bSal6M.png)

Sau khi tạo thành công

![Imgur](https://i.imgur.com/kkkMv8e.png)

## Bridge

- Linux bridge là một phần mềm được tích hợp trong nhân linux để giải quyết vấn đề ảo hóa phần Network trong trong các máy vật lý.

- Về mặt logic Linux bridge tạo ra một con switch ảo để các VM kết nối vào và có thể giao tiếp được với nhau cũng như sử dụng để ra ngoài mạng

![Imgur](https://i.imgur.com/rCNgdAz.png)

Với mô hình mạng này ta có thể dùng dải mạng tương ứng với mỗi card mạng của ta. Ta cũng có thể add thêm 1 còn switch ảo và gán cho nó các card mạng tương ứng. Lúc này khi các VM kết nối vào switch đó nó sẽ nhận địa chỉ của card đã kết nối với switch

### Lệnh tạo một bridge

- Tạo bridge: `brctl addbr tên_bridge`
- Gán port cho bridge: `brctl addif tên_bridge tên_card`
- Kiểm tra lại hoạt động của bridge: `brctl show`
- Ngắt card khỏi bridge: `brctl delif tên_bridge tên_card`

**Lưu ý:** Với các card mạng có sẵn trên máy hoặc các card được sinh ra trong quá trình cài các phần mềm ảo hóa thì mặc định nó đã được gắn với một switch ảo có cùng tên nên vì vậy muốn kết nối bridge đến các switch đó ta chỉ cần kết nối các máy VM đến nó là được. Thực hiện trên VM ta thực hiện giống với các mô hình trên.