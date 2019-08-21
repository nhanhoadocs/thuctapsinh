# 1.Khái niệm và Ứng dụng 
- Linux bridge là một công nghệ để tạo ra virtual network 
- linux bridge là một phần mềm được tích hợp vào trong nhân linux để giải quyết vấn đề ảo hóa phần network trong các máy vật lý.
- Linux bridge như là một con switch ảo để cho các VM kết nối được vào và ta có thể nói chuyện được với nhau và ra mạng ngoài. Ta thấy rằng con switch được tạo ra nằm bên trong của máy vậy lý.
- ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/2.png)
- Chú ý: Ta không thể kết nổi switc ảo với card wireless do hệ điều hành không hỗ trợ
# 2. Cấu trúc của bridge 
- ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/Linux-bridge/1.png)
- Tap: ta có thể hiểu được nó là một giao diện mạng để các máy ảo có thể giao tiếp được với bridge và nó nằm trong nhân kernel tap hoạt động ở lớp 2 trong mô hình OSI
- fd( forward data ): Dùng để chuyển tiếp data từ máy ảo 
- Bridge: là switch ảo là do linux bridge tạo ra nó có một số tính năng giống như switch vật lý
    - STP: là tính năng chống loop gói tin trong switch 
    - Tính năng tạo ra các vlan 
    - FDB: Là tính năng chuyển gói tin theo data-base để tăng tốc cho switch
# Tạo và quản lý linux-bridge
### Chuẩn bị 
- Một máy VM có cài đặt KVM 
- Cài đặt gói wget
- Có file centos7.iso
- Cài gói `tcpdump`
- Cài đặt gói -X 

### Các bước thực hiện 
- Cài đặt gói tcpdump
```
yum install tcpdump 
```
- Cài gói -X
```
yum install "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y
```
- Cài wget 
```
yum install wget 
```
- Cài file centos7 iso 
```
wget http://centos-hn.viettelidc.com.vn/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso
```
-  Để tạo một linux bridge ta dùng lệnh ` brctl addbr tên_switch` 
- Sau khi tạo xong ta cần add `bridge` vào card mạng để có thể sử dụng được ta dùng lệnh `brctl addif card`
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot.png)
- Sau khi add thêm card mạng ta có sử dụng `brctl show` để kiểm tra xem đã add thành công chưa
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_1.png)
- Để có thể sử dụng được kiểu mạng bridge ta cần phải chuyển địa chỉ ip của card mạng ban đầu để chuyển cho bridge thì mới có thể sử dụng được card bridge này  ta sử dụng `iconfig` 
- Như ta thấy nếu không  add card mạng thì ta sẽ thấy card `ens9` sẽ có ip mà kiểu mạng bridge(br0) sẽ không có địa chỉ ip 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_5.png)
- Nhưng ở trong centos chưa có sẵn lệnh này nên ta phải cài đặt khi chưa cài đặt ta sẽ thấy 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_2.png)
- Ta cần sử dụng 2 lệnh sau 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_3.png)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_4.png)
- sau khi cài đặt xong thì ta sử dụng lệnh để xóa ip của card `ens9`
```
ifconfig Tên_card(ens9) 0
```
- Đây là ip của card `ens9` sau khi sử dụng lệnh trên 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_1.png)

- Sau đó xin cấp địa chỉ ip đó cho `bridge` 
```
dhclient tên_bridge(br0)
```
- Sau khi sử dụng lệnh trên thì card mạng bridge đã được cung cấp dải mạng 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_2.png)
- Sau khi ta chuyển xong card mạng thì ta sẽ thấy được rằng ip ở card ens9 đã mất 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_6.png)
- Rôi ta sử dụng card mạng này để tạo máy ảo. Ta phải chỉ ra đúng tên card mạng 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_7.png)\
- Sau khi ta đã sử dụng kiểu mạng bridge thì card eth0 sẽ cùng địa chỉ mạng với tap(vnet0)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_4.png)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_3.png)
- Ta kiểm tra ip xem có giống với dải card mạng bridge ta tạo ra không 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_3.png)
- Địa chỉ bridge
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot_5.png)
- Như vậy ta đã thấy được VM được tạo ra có cùng dải mạng với lại card bridge mà ta tạo ra
- Ta kiểm tra đường đi của máy xem có đi đúng đường không ta đi kiểm tra 3 điểm: 
    - card ens9 của host KVM 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_10.png)
    - card vnet0(tap)
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_12.png)
    - card eth0 của VM 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/screenshot_13.png)
    - card linux bridge
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/linux_bridge/update/screenshot6.png) 
- Như vậy ta thấy rằng card eth0 của VM đã được gắn thằng với switch được tạo ra bởi kiểu mạng `bridge` của host KVM tạo ra nên ta mới thấy rằng đường đi với nó có địa chỉ đầu và cuối giống nhau dù ta có bắt gói tin ở 4 điểm khác nhau. Có nghĩa là đường đi của nó đều đi qua tất cả các điểm này đầu là VM(192.168.10.3) và điểm cuối là (8.8.8.8)
- Như vậy ta sẽ thấy mô hình đường đi của kiểu mạng linux_bridge là như sau 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/NAT.lab/Untitled%20Diagram.png)