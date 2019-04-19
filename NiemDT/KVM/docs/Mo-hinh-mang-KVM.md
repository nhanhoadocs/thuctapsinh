# Tìm hiểu một số mô hình mạng trong KVM
Cũng giống như các công cụ ảo hóa khác KVM cũng cung cấp các mô hình mạng trong việc ảo hóa network. Các mô hình bao gồm:
 * NAT
 * Bridge
 * Host-only
## 1. NAT

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/networknat.png)

Với mô hình này KVM thực hiện ánh xạ một dải địa chỉ để cung cấp cho máy ảo. Dải địa chỉ ta có thể chọn tùy ý. Với mô hình này máy ảo của ta có thể giao tiếp với internet. Nhưng có một chú rằng từ VM của ta có thể ping được ra ngoài internet nhưng máy bên ngoài sẽ không thấy được VM của ta chính vì vậy ta không thể ping từ bên ngoài đến VM sử dụng mô hình mạng NAT.

### Cách cấu hình.

Bình thường khi cài KVM nó sẽ cung cấp cho ta một mạng ảo NAT mang tên `default` mạng này thường mang dải địa chỉ IP 192.168.122.x. Ta có thể add thêm một mạng ảo cũng với mô hình NAT khác. Có nhiều cách để thực hiện việc này nhưng ở đây tôi dùng công cụ `virt-manager`
Mở công cụ `virt-manager` bằng câu lệnh `virt-manager`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net1.png)

Chọn `Edit` chọn `Connection Details`. Ta có thể thấy các mạng có ở cột bên trái. Để tạo một mạng khác ta làm như sau:

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net%202.png)

Sau đó nhập tên cho mạng và nhấn `Forward`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net3.png)

Ta chọn địa chỉ mạng cho mạng định tạo (chọn địa chỉ mạng tùy ý). Sau đó chọn dải IP cấp phát cho máy ảo trong dải mạng. Ta cũng có có thể để đặt IP tĩnh trên máy ảo nếu tích vào `Enable Static Route Definition`. Chọn xong ta nhấn `Forward`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net4a.png)

Bước này ta có thể chọn có sử dụng IPv6 hay không. Ở đây tôi không chọn.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net5.png)

Ta chỉ ra mô hình mạng. Ở đây để là `NAT` sau đó chọn `Finish` để  kết thúc.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net6.png)

Sau khi tạo ta có thể thấy

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net7.png)

### Thao tác trên VM

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net8.png)

Ta vào `Network source` chọn đúng tên mạng chúng ta vừa tạo. Sau đó chọn `Apply`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net9.png)

Ta reboot lại máy ảo và kiểm tra lại xem máy đã nhận đúng dải IP chưa

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net10.png)

## 2. Host-only
Với mô hình mạng kiểu này cũng cho phép ta cấp phát địa chỉ tùy ý giống với mô hình NAT. Nhưng ở đây máy ảo không thể nói chuyện với máy tính bên ngoài. Nó chỉ có thể trao đổi với các máy trong cùng mạng bên trong server vật lý và trao đổi với đươc máy chủ vật lý.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/networkisolated.png)

### Cấu hình
Ta cũng làm tương tự như cấu hình với NAT. Nhưng ở bước 4 ta chọn mục `Isolated virtual network` 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net11.png)

Và ta có thể thấy

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net12.png)

Bây giờ tiến hành thao tác trên máy ảo. Ta chọng đúng tên mạng ta vừa tạo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net13.png)

Tiến hành reboot máy ảo và kiểm tra IP

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net14a.png)

## 3. Bridge
Ở mô hình ta tìm hiểu về công nghệ `linux bridge`. Linux bridge là một phần mềm được tích hợp trong nhân linux để giải quyết vấn đề ảo hóa phần Network trong trong các máy vật lý. Về mặt logic Linux bridge tạo ra một con switch ảo để các VM kết nối vào và có thể nói chuyện được với nhau cũng như sử dụng để ra ngoài mạng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/networkbridge.png)

Với mô hình mạng này ta có thể dùng dải mạng tương ứng với mỗi card mạng của ta. Ta cũng có thể add thêm 1 còn switch ảo và gán cho nó các card mạng tương ứng. Lúc này khi các VM kết nối vào switch đó nó sẽ nhận địa chỉ của card đã kết nối với switch.

#### Lệnh tạo một bridge

* Tạo bridge
`brctl addbr tên_bridge`
* Gán port cho bridge
`brctl addif tên_bridge tên_card`
* Kiểm tra lại hoạt động của bridge
`brctl show`
* Ngắt card khỏi bridge
`brctl delif tên_bridge tên_card`
*Lưu ý* Với các card mạng có sẵn trên máy hoặc các card được sinh ra trong quá trình cài các phần mềm ảo hóa thì mặc định nó đã được gắn với một switch ảo có cùng tên nên vì vậy muốn kết nối bridge đến các switch đó ta chỉ cần kết nối các máy VM đến nó là được.
Thực hiện trên VM ta thực hiện giống với các mô hình trên

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net15.png)

Ta reboot lại VM và kiểm tra lại địa chỉ

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net16.png)

Ta có thể thấy card đó trên máy tôi

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/net17.png)