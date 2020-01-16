# Các chế độ card mạng trong KVM
Cũng như các công cụ ảo hóa khác thì KVM cũng cung cấp các mô hình mạng trong việc ảo hóa network. Có 3 chế độ card mạng tương ứng với 3 mô hình mạng:
- NAT
- Bridge
- Host-only

## 1. NAT
- Với mô hình này KVM thực hiện ánh xạ một dải địa chỉ để cung cấp cho máy ảo. 

- Dải địa chỉ ta có thể chọn tùy ý. Với mô hình này máy ảo của ta có thể giao tiếp với internet. 

- Nhưng có một chú rằng từ VM của ta có thể ping được ra ngoài internet nhưng máy bên ngoài sẽ không thấy được VM của ta chính vì vậy ta không thể ping từ bên ngoài đến VM sử dụng mô hình mạng NAT.

<img src ="..\images\networknat.png">

### Cách cấu hình
Mặc định, sau khi cài đặt xong KVM,  ta sẽ có một mạng ảo NAT mang tên `default`, thường mang dải địa chỉ IP `192.168.122.x`.

Ta có thể add một mạng ảo với mô hình NAT khác. Ở đây, tôi sẽ dùng `virt-manager` để thực hiện

Mở Virt-manager bằng câu lệnh `virt-manager`:

<img src = "..\images\Screenshot_20.png">

Chọn ***Edit -> Connection Details***. Chọn tab Virtual network, ta thấy danh sách các mạng ở bên trái. Để thêm mạng, ta click biểu tưởng + :

<img src = "..\images\Screenshot_21.png">

Nhập tên cho mạng

<img src = "..\images\Screenshot_22.png">

Chọn dải mạng định tạo. Sau đó, chọn dải cấp cho máy ảo, hoặc có thể chọn đặt IP tĩnh

<img src ="..\images\Screenshot_23.png">

Sau đó, bạn sẽ được hỏi có sử dụng IPv6 không. Ở đây, mình không sử dụng.

<img src = "..\images\Screenshot_24.png">

Chọn mô hình mạng là `NAT` rồi ***Finish***

<img src ="..\images\Screenshot_25.png">

Sau khi tạo thành công, ta sẽ thấy mạng ở trên giao diện Network của Virt-manager

<img src= "..\images\Screenshot_26.png">


**Trên VM** : Ta vào phần thiết lập thông số Card mạng rồi chọn mạng NAT vừa tạo.

<img src = "..\images\Screenshot_29.png">

Reboot máy và kiểm tra IP xem đã đúng dải mạng chưa

<img src = "..\images\Screenshot_30.png">



## 2. Host-only
- Với mô hình mạng kiểu này cũng cho phép ta cấp phát địa chỉ tùy ý giống với mô hình NAT. 

- Máy ảo không thể nói chuyện với máy tính bên ngoài.

- Nó chỉ có thể trao đổi với các máy trong cùng mạng bên trong server vật lý và trao đổi với đươc máy chủ vật lý.

<img src ="..\images\networkhostonly.png">

### Cách cấu hình
Tương tự cách tạo mạng NAT. Nhưng khi đến bước chọn kiểu mạng, ta sẽ chọn mục **Isolated virtual network**

<img src= "..\images\Screenshot_27.png">

Sau khi tạo thành công, ta sẽ thấy mạng vừa tạo :

<img src = "..\images\Screenshot_28.png">


## 3. Bridge
- Linux bridge là một phần mềm được tích hợp trong nhân linux để giải quyết vấn đề ảo hóa phần Network trong trong các máy vật lý. 

- Về mặt logic Linux bridge tạo ra một con switch ảo để các VM kết nối vào và có thể nói chuyện được với nhau cũng như sử dụng để ra ngoài mạng

<img src = "..\images\networkbridge.png">

Với mô hình mạng này ta có thể dùng dải mạng tương ứng với mỗi card mạng của ta. Ta cũng có thể add thêm 1 còn switch ảo và gán cho nó các card mạng tương ứng. Lúc này khi các VM kết nối vào switch đó nó sẽ nhận địa chỉ của card đã kết nối với switch

### Lệnh tạo 1 bridge
- Tạo bridge: `brctl addbr tên_bridge`
- Gán port cho bridge: `brctl addif tên_bridge tên_card`
- Kiểm tra lại hoạt động của bridge: `brctl show`
- Ngắt card khỏi bridge: `brctl delif tên_bridge tên_card`

**Lưu ý:** Với các card mạng có sẵn trên máy hoặc các card được sinh ra trong quá trình cài các phần mềm ảo hóa thì mặc định nó đã được gắn với một switch ảo có cùng tên nên vì vậy muốn kết nối bridge đến các switch đó ta chỉ cần kết nối các máy VM đến nó là được. Thực hiện trên VM ta thực hiện giống với các mô hình trên.