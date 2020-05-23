# Phân tích đường đi các gói tin với các chế độ card mạng trong KVM

## 1. Bridge (Làm rõ trong phần Linux Bridge)
## 2. Host-only

Với mô hình mạng Host-Only thì các VM chỉ có thể giao tiếp với nhau qua 1 switch ảo, và không thể ra ngoài in internet

Mô hình

![Imgur](https://i.imgur.com/TyX8HNy.png)

Ping ra ngoài internet và ping máy trong cùng mạng Host-only

![Imgur](https://i.imgur.com/IFIuPPR.png)

## 3. NAT

Mô hình

![Imgur](https://i.imgur.com/W9uMwks.png)

Với mô hình mạng NAT, KVM tạo ra một thiết bị là virtual router. Khi ta tạo một dải mạng với mô hình NAT thì lúc này virtual router sẽ NAT từ dải mạng mà ta tạo ra ra địa chỉ của card mạng vật lý trên KVM host để đi ra ngoài internet.

Khi một dải mạng tạo ra ta sẽ thấy trên KVM host xuất hiện một thêm một card mạng. Card mạng này đóng vai trò là gateway cho dải mạng mà ta tạo ra.

Ping 8.8.8.8 để xem gói tin đi qua những điểm nào


Thành phần cấp DHCP cho máy ảo trong chế độ NAT này: là Virtual Router, ở đây là virbr1 cấp IP cho VM.

![Imgur](https://i.imgur.com/S8pJfNm.png)

### Lab:

Thêm card NAT vào máy KVM (ens38), khởi động virt-manager, tạo một mạng mới. Edit -> Connection Details -> Virtual Networks -> dấu `+`

Đặt tên cho mạng này

![Imgur](https://i.imgur.com/4ZVBuQD.png)

Chọn dải mạng

![Imgur](https://i.imgur.com/dngTODa.png)

Có thể chọn dùng IPv6 hay không, ở đây tôi không chọn

Chọn mode NAT cho mạng, phần destination chọn ens38 vừa thêm vào máy KVM

![Imgur](https://i.imgur.com/LoYIenK.png)

Add mạng vừa tạo vào máy VM1 

![Imgur](https://i.imgur.com/tJA4WC3.png)

Khởi động máy VM1, có thể thấy VM1 đã nhận dải mạng và có thể ping đến 8.8.8.8

![Imgur](https://i.imgur.com/EXNqqBS.png)

Sau đó thực hiện bắt gói tin 

```
    Trên VM1
    # tcpdump -i eth0 icmp -w vm1nat1111.pcap
    Trên KVM
    # tcpdump -i ens38 icmp -w ens38nat1111.pcap
    # tcpdump -i virbr1 icmp -w virbr1nat1111.pcap
```

Phân tích các gói tin bắt được bằng wireshark 

Trên card `eth0` của VM1

![Imgur](https://i.imgur.com/Ur6mT1C.png)

Trên card `ens38` của KVM

![Imgur](https://i.imgur.com/CBLmmd9.png)

Trên `virbr1` của KVM 

![Imgur](https://i.imgur.com/ZiB98D9.png)

Có thể thấy đường đi gói tin như sau

![Imgur](https://i.imgur.com/j6DKKxq.png)


Tham khảo: https://blog.cloud365.vn/linux/mo-hinh-mang-nat-kvm/