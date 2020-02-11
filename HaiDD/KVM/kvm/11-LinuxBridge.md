# Công nghệ Linux Bridge

## 1. Linux bridge là gì? 

**Linux Bridge** là một công nghệ cung cấp switch ảo để giải quyết vấn đề ảo hóa Network bên trong các máy vật lí

<img src="..\images\Screenshot_100.png">

Ta có thể thấy có một con switch được tạo ra nằm trong bên máy vật lí. Các VM kết nối đến đây để có thể liên lạc được với nhau. Nếu muốn liên lạc ra bên ngoài ta có thể kết nối con switch này với card mạng trên máy vật lý của ta (giống như ta dùng dây kết nối switch với router). Ta có thể kết nối switch với 1 hoặc nhiều port.

**Chú ý**: Ta không thể kết nối switch ảo với card wireless do HĐH không hỗ trợ.

## 2. Cấu trúc của Linux Bridge

<img src="..\images\Screenshot_101.png">

**Trong đó:**

- `bridge` : ở đây là switch ảo
- `tap` : (tap interface) là giao diện mạng để các VM kết nối với switch do Linux bridge tạo ra(hoạt động ở lớp 2 của mô hình OSI)
- `fd` : (Forward data) có nhiệm vụ chuyển dữ liệu từ VM đến switch. Switch ảo do Linux bridge tạo ra có chức năng tương tự như 1 con switch vật lí.

<img src = "..\images\Screenshot_102.png">

Ta có thể thấy rõ hơn cách kết nối của VM ra ngoài internet. Khi máy vật lý của ta có card mạng kết nối với internet(không phải card wireless). Trên switch ảo của ta sẽ phải có đường để kết nối ra ngoài internet(cụ thể là kết nối với card mạng của máy vật lý). Ta có thể hình dung card mạng trên máy vật lý sẽ được gắn trực tiếp vào switch ảo nên ta có thể thấy sau khi add switch ảo và card vật lý có cùng địa chỉ MAC. Và trên card vật lý sẽ không còn địa chỉ IP mà nó được gắn cho switch ảo.

<img src= "..\images\Screenshot_103.png">

<img src = "..\images\Screenshot_104.png">

Khi các VM muốn giao tiếp với nhau hoặc ra ngoài internet, ta chỉ cần kết nối VM đó với switch ảo. Lúc này card mạng trên VM sẽ được gắn với 1 cổng của switch ảo thông qua tap interface và cổng này có tên là `vnet`. 

Khi ta kết nối vào switch ảo các VM sẽ nhận địa chỉ IP cùng với dải địa chỉ IP của card mà ta add và switch và các địa chỉ IP này sẽ được cấp bởi dịch vụ DHCP trên router.

<img src = "..\images\Screenshot_105.png">

## 3. Chức năng của một switch ảo do Linux bridge tạo ra
- **STP**: là tính năng chống loop gói tin trong switch
- **VLan**: là tính năng rất quan trọng trong một switch
- **FDB**: là tính năng chuyển gói tin theo database được xây dựng giúp tăng tốc độ của switch

## 4. Tạo và quản lí Linux bridge
Ta tạo bridge và tiến hành set IP, rồi gắn card mạng vào nó

<img src= "..\images\Screenshot_108.png">

Sau đó, ta tiến hành reboot lại máy.

Khi máy reboot xong, ra kiểm tra lại switch ảo trên máy và các card add vào nó. Sử dụng lệnh `brctl show`

<img src="..\images\Screenshot_109.png">

Bây giờ ta thấy IP của `testbr`

<img src= "..\images\Screenshot_110.png">

Bây giờ, trên VM ta có thể kết nối đến switch ảo đó

<img src= "..\images\Screenshot_111.png">

Ta có thể thấy VM đã nhận IP và kết nối ra ngoài internet

<img src  ="..\images\Screenshot_114.png">

**Lưu ý:** Khi lab trên VMware cần lưu ý dải mạng của máy cài KVM phải có quyền DHCP (tức là được quyền cấp IP)

<img src = "..\images\Screenshot_113.png">

### Lab
Ta ping từ VM1 ra server của Google `8.8.8.8`.

Ta thực hiện bắt gói tin ICMP trên các điểm `eth0` của VM, `vnet0`(tap), `testbr`, `ens33` của KVM

```
Trên KVM
tcpdump -i ens33 icmp -w ens33.pcap
tcpdump -i testbr icmp -w testbr.pcap
tcpdump -i vnet0 icmp -w vnet0.pcap

# Trên VM
tcpdump -i eth0 icmp -w vm1.pcap
```

Ping tới `8.8.8.8`:
```
ping -c 1 8.8.8.8
```

**Kết quả:**
- Card `ens33` của KVM

<img src ="..\images\Screenshot_127.png">

- Card `vnet0` trên KVM

<img src ="..\images\Screenshot_128.png">

- Card `testbr` trên KVM

<img src ="..\images\Screenshot_129.png">

- Card `eth0` của VM

<img src ="..\images\Screenshot_130.png">

Như vậy ta thấy rằng card `eth0` của VM đã được gắn thằng với switch được tạo ra bởi kiểu mạng bridge của host KVM tạo ra nên ta mới thấy rằng đường đi với nó có địa chỉ đầu và cuối giống nhau dù ta có bắt gói tin ở 4 điểm khác nhau. Có nghĩa là đường đi của nó đều đi qua tất cả các điểm này đầu là VM(192.168.37.129) và điểm cuối là (8.8.8.8)

**Mô hình ta vừa tạo như sau:**

<img src="..\images\Screenshot_115.png">

<img src ="..\images\Screenshot_126.png">


**Tham khảo**:
- https://github.com/hocchudong/Linux-bridge
- https://blog.cloud365.vn/linux/huong-dan-tao-su-dung-mo-hinh-mang-linux-bridge-KVM/