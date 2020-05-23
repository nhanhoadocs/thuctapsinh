# Công nghệ Linux Bridge
## 1. Linux Bridge là gì?

Linux Bridge là một mô hình ảo hóa mạng được hỗ trợ bởi KVM. Linux bridge là một công nghệ cung cấp switch ảo để giải quyết vấn đề ảo hóa Network bên trong các máy vật lý.

![Imgur](https://i.imgur.com/DwDUOY7.png)

Chúng ta có thể thấy rằng có một con switch được tạo ra nằm bên trong của máy vật lý. Các VM kết nối đến đây để có thể liên lạc được với nhau. Nếu muốn liên lạc ra bên ngoài ta có thể kết nối con switch này với card mạng trên máy vật lý của ta (giống như ta dùng dây kết nối switch với router). Ta có thể kết nối switch với 1 hoặc nhiều port.

**Chú ý:** Không thể kết nối switch ảo với card wireless do HĐH không hỗ trợ.
### Chuẩn bị

Một máy chạy hệ điều hành Centos7 hoặc Ubuntu đã cài KVM bên trong đó đã có một VM.

Chú ý máy vật lý ở đây là máy cài KVM. Máy này có thể là một máy ảo nhưng ở đây ta coi nó như một server vật lý.

## 2. Cấu trúc Linux Bridge

![Imgur](https://i.imgur.com/79VJ2Jp.png)

Trong đó:
- **Bridge** ở đây là switch ảo
- **Tap (Tap interface)** là giao diện mạng để các VM kết nối với switch do linux bridge tạo ra (hoạt động ở lớp Data-link của mô hình OSI)
- **fd (Forward data)** có nhiệm vụ chuyển dữ liệu từ VM đến switch 

Switch ảo do linux bridge tạo ra có chức năng tương tự một con switch vật lý 

![Imgur](https://i.imgur.com/2hrL6mW.png)

Ta có thể thấy rõ hơn cách kết nối của VM ra ngoài internet. Khi máy vật lý của ta có card mạng kết nối với internet (không phải card wireless). Trên switch ảo của ta sẽ phải có đường để kết nối ra ngoài internet(cụ thể là kết nối với card mạng của máy vật lý). Ta có thể hình dung card mạng trên máy vật lý sẽ được gắn trực tiếp vào switch ảo nên ta có thể thấy sau khi add switch ảo và card vật lý có cùng địa chỉ MAC. Và trên card vật lý sẽ không còn địa chỉ IP mà nó được gắn cho switch ảo.

![Imgur](https://i.imgur.com/43XQftO.png)

![Imgur](https://i.imgur.com/1rrOFG4.png)

Khi các VM muốn giao tiếp với nhau hoặc ra ngoài internet, ta chỉ cần kết nối VM đó với switch ảo. Lúc này card mạng trên VM sẽ được gắn với 1 cổng của switch ảo thông qua tap interface và cổng này có tên là vnet.

Khi ta kết nối vào switch ảo các VM sẽ nhận địa chỉ IP cùng với dải địa chỉ IP của card mà ta add vào switch và các địa chỉ IP này sẽ được cấp bởi dịch vụ DHCP trên router.

![Imgur](https://i.imgur.com/ip4709x.png)

Với mô hình này gói tin bên trong VM đi ra ngoài mạng sẽ đi từ VM đến thẳng card vật lý gắn với switch ảo và đi ra ngoài mạng.

## 3. Chức năng của một switch ảo do Linux bridge tạo ra

- STP (Spanning Tree Protocol): là tính năng chống loop gói tin trong switch
- VLan: là tính năng rất quan trọng trong một switch
- FDB (Forwarding Database): là tính năng chuyển gói tin theo database được xây dựng giúp tăng tốc độ của switch

## 4. Tạo và quản lí Linux bridge

Tạo bridge và tiến hành set IP, rồi gắn card mạng vào nó

```
# nmcli con add type bridge autoconnect yes con-name testbr1 ifname testbr1 
# nmcli con mod testbr1 ipv4.addresses192.168.10.10/24 ipv4.method manual
# nmcli con mod testbr1 ipv4.gateway 192.168.10.2
# nmcli con mod testbr1 ipv4.dns 8.8.8.8
# nmcli con del ens33
# nmcl con add type bridge-slave autoconnect yes con-name ens33 ifname ens33 master testbr1
```

Sau đó tiến hành reboot lại máy.

Khi máy reboot xong, ra kiểm tra lại switch ảo trên máy và các card add vào nó. Sử dụng lệnh `# brctl show`

![Imgur](https://i.imgur.com/PUcEsdF.png)

Giờ ta thấy IP của testbr1

![Imgur](https://i.imgur.com/CizSeKR.png)

Bây giờ VM có thể kết nối tới switch ảo đó

![Imgur](https://i.imgur.com/6P675Kn.png)

Có thể thấy VM đã nhận IP và có thể kết nối ra internet

![Imgur](https://i.imgur.com/XOwMEKa.png)

**Lưu ý:** Khi thực hiện lab trên VMware cần chú ý dải mạng của máy cài KVM phải có DHCP

![Imgur](https://i.imgur.com/Z7gNun8.png)

## Lab đường đi gói tin linux bridge

Đứng trên máy VM1 ping đến `8.8.8.8`.
Thực hiện bắt gói tin ICMP trên các điểm `eth0` của VM1, `vnet0` (tap), `testbr1`, `ens33` của KVM.

```
Trên KVM
tcpdump -i ens33 icmp -w ens33.pcap
tcpdump -i testbr1 icmp -w testbr1.pcap
tcpdump -i vnet0 icmp -w vnet0.pcap

# Trên VM
tcpdump -i eth0 icmp -w vm1.pcap
```

Thực hiện ping đến 8.8.8.8

### Kết quả:

- Card `ens33` của KVM

 ![Imgur](https://i.imgur.com/5Q7XtQk.png)

- Card `vnet0` của KVM

![Imgur](https://i.imgur.com/9XoKT8n.png)

- Card `testbr1` trên KVM

![Imgur](https://i.imgur.com/5OBz54S.png)

- Card `eth0` của VM1

![Imgur](https://i.imgur.com/1RdPccR.png)

Như vậy ta thấy rằng card `eth0` của VM đã được gắn thằng với switch được tạo ra bởi kiểu mạng bridge của host KVM tạo ra nên ta mới thấy rằng đường đi với nó có địa chỉ đầu và cuối giống nhau dù ta có bắt gói tin ở 4 điểm khác nhau. Có nghĩa là đường đi của nó đều đi qua tất cả các điểm này đầu là VM1 (192.168.10.146) và điểm cuối là (8.8.8.8)

Mô hình ta vừa tạo như sau:

![Imgur](https://i.imgur.com/Q9V1Euv.png)

![Imgur](https://i.imgur.com/jPXcOnN.png)

Cũng với sơ đồ mạng trên, đứng ở máy VM1 ping đến máy VM2 và bắt gói tin ở các điểm eth0-VM1, vnet0, testbr1, ens33, vnet1, eth0-VM2.

**Kết quả**:

Tại eth0 của VM1

![Imgur](https://i.imgur.com/kRmZdZ2.png)

Tại vnet0 của KVM

![Imgur](https://i.imgur.com/kzJAKW0.png)

Tại testbr1 của KVM

![Imgur](https://i.imgur.com/tzapilP.png)

Tại ens33 của KVM

![Imgur](https://i.imgur.com/TS6uPei.png)

Tại vnet1 của KVM

![Imgur](https://i.imgur.com/eROkrkN.png)

Tại eth0 của VM2

![Imgur](https://i.imgur.com/KRBxuEC.png)

Có thể thấy đường đi của gói tin khi ping từ VM1 đến VM2 như sau:

eth0(VM1) -> tap vnet0 -> linux bridge testbr1 -> tap vnet1 -> eth0(VM2)

Không đi qua ens33

Tham khảo: https://github.com/danghai1996/thuctapsinh/tree/master/HaiDD/KVM/kvm