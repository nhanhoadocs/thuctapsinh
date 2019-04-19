# Tìm hiểu về công nghệ Linux-bridge

`Linux bridge` là một công nghệ cung cấp switch ảo để giải quyết vấn đề ảo hóa Network bên trong các máy vật lý.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/2.png)

Chúng ta có thể thấy rằng có một con switch được tạo ra nằm bên trong của máy vật lý. Các VM kết nối đến đây để có thể liên lạc được với nhau. Nếu muốn liên lạc ra bên ngoài ta có thể kết nối con switch này với card mạng trên máy vật lý của ta (giống như ta dùng dây kết nối switch với router). Ta có thể kết nối switch với 1 hoặc nhiều port.
*Chú ý* ta không thể kết nối switch ảo với card `wireless` do HĐH không hỗ trợ.

## Cấu trúc của linux bridge

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/1.png)

Trong đó:
* **Bridge** ở đây là switch ảo 
* **Tap** hay tap interface là giao diện mạng để các VM kết nối với switch do Linux bridge tạo ra(nó hoạt động ở lớp 2 của mô hình OSI)
* **fd**: Forward data có nhiệm vụ chuyển dữ kiệu từ VM tới switch.
Switch ảo do Linux bridge tạo ra có chức năng tương tự với 1 con switch vật lý.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/3.png)

Ta có thể thấy rõ hơn cách kết nối của VM ra ngoài internet. Khi máy vật lý của ta có card mạng kết nối với internet(không phải card wireless). Trên switch ảo của ta sẽ phải có đường để kết nối ra ngoài internet(cụ thể là kết nối với card mạng của máy vật lý). Ta có thể hình dung card mạng trên máy vật lý sẽ được gắn trực tiếp vào switch ảo nên ta có thể thấy sau khi add switch ảo và card vật lý có cùng địa chỉ MAC. Và trên card vật lý sẽ không còn địa chỉ IP mà nó được gắn cho switch ảo.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/4.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/5.png)

Và bây giờ trên các VM muốn giao tiếp với nhau hoặc ra ngoài internet ta chỉ cần kết nối VM đó với switch ảo. Lúc này card mạng trên VM sẽ được gắn với 1 cổng của switch ảo thông qua  tap interface và cổng này có tên là `vnet`. Ở đây có tên là `vnet0`
Khi ta kết nối vào switch ảo các VM sẽ nhận địa chỉ IP cùng với dải địa chỉ IP của card mà ta add và switch và các địa chỉ IP này sẽ được cấp bởi dịch vụ DHCP trên router.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/6.png)

## Đường đi của gói tin ra ngoài 

Để xem đường đi của gói tin trong VM ra bên ngoài tôi dùng lệnh `tcpdump` để bắt gói tin tại các điểm ta cho rằng gói tin đi qua. Ở đây tôi bắt gói tin trên card `eth0` của VM, trên switch ảo `virbr2`, trên tap interface `vnet0`.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/25.png)

Trước tiên bạn nên chú ý đến các địa chỉ MAC sau:

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/8.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/9.png)

Sau khi bắt gói tin ghi vào file tôi dùng công cụ `wireshark` để phân tích gói tin để thấy được địa chỉ MAC mà gói tin đi qua.
 * Trên card `eth0` của VM

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/rth0.1.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/eth0.2.png)

 * Trên `vnet0`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/vnet0.1.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/vnet0.2.png)

 * Trên linux bridge `virbr2`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/virbr2.1.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/virbr2.2.png)

Như chúng ta thấy bên trên gói tin chỉ đi qua 2 địa chỉ MAC là `52:54:00:40:07:7d`-card `eth0` của VM và `52:54:00:6b:1a:f7`- card trên máy vật lý được gán với switch ảo. Như vậy ta có thể thấy đường đi của gói tin bên trong server vật lý là trong suốt. Từ VM đi thẳng đến card vật lý gắn với switch ảo và đi ra ngoài mạng.

## Tạo và quản lý linux bridge

Để tạo một linux bridge(switch ảo) ta dùng lệnh 
`brctl addbr tên_switch`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/10.png)

Tiếp theo là bước add card mạng cho switch dùng lệnh 
`brctl addif tên_switch tên_card`
 * Tên swich ở đây là switch ta vừa mới tạo ở câu lệnh bên trên
 * Tên card ở đây là card mạng trên máy vật lý của ta (trừ card wireless).

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/13.png)

Để kiểm tra những swtich ảo trên máy và những card đã được add vào switch ảo đó ta dùng lệnh 
`brctl show`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/14.png)

Tiếp sau đó ta tiến hành xin cấp IP cho NIC. Ta dùng các câu lệnh sau
`ifconfig tên_card 0`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/22.png)

Câu lệnh xóa IP của card ens9

`dhclient tên_bridge`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/16.png)

Câu lệnh này để xin cấp IP chi bridge

*Lưu ý* hai câu lệnh trên chỉ có hiệu lực đến khi ta reboot lại máy vật lý. Để VM có thể nhận được địa chỉ IP ngay cả khi servẻ vật lý bị reboot ta thực hiện ghi các dòng như sau vào file `/ect/network/interfaces`
```
auto testbr
iface testbr inet dhcp
bridge_ports ens9
bridge_stp off # kich hoat che do STP trong bridge
bridge_fd 0 
bridge_maxwait 0
```
Sau đó tiến hành chạy lênh `ifdown -a && ifup -a` để khởi động lại internet.

Và bây giờ ta có thể thấy
 * Khi chưa dùng 2 câu lệnh trên

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/17.png)

 * Sau khi dùng 2 lệnh trên

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/18.png)

Bây giờ trên VM ta có thể kết nối với switch ảo đó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/20.png)

Ta có thể thấy VM đã nhận IP

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/19.png)

Mô hình vùa tạo như sau

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/linux-bridge1.jpeg)