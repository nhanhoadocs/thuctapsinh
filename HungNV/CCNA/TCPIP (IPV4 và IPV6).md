# TCP/IP (IPV4 và IPV6)
### IPV4 (internet protocol version 4)
Gồm 32 bit để đánh địa chỉ, chia thành 4 byte biểu diễn dưới dạng x.x.x.x, X là 1 số nguyên trong khoảng 2-255. có 4 tỷ địa chỉ ( 2^32 )
Kích cỡ gói tin là 576 byte và có thể chia nhỏ.
 + IP Public: gọi là IP công cộng
 + IP Private; Gọi là IP riêng
###### 1. Ip private
gồm 3 dải mạng ( ranger )
 - 24 bit block: 10.0.0.0 đến 10.255.255.255
 - 20 bit block: 172.16.0.0 đến 172.31.255.255
 - 16 bit block: 192.168.0.0 đến 192.168.255.255
Chỉ dùng trong mạng Lan
###### 2. Ip public
* Có 2 dạng:
  - Dạng Dinamic: Cấp phát tự động
  - Dạng Static: Cấp trả phí
* Mạng internet được chia thành 2 phần là internet và lan.
  - Internet là mạng chỉ có ip public làm việc với nhau
  - Lan là chỉ có máy tính dùng ip Private làm việc với nhau 
  - Những máy tính trong mạng lan muốn truy cập ra ngoài internet thì phải truy cập thông qua 1 thiết bị gọi là router để biến ip private thành ip public gọi là kỹ thuật Nat ( network andress translation )
  - Sau khi ip private chuyển thành ip public nó chỉ tồn tại ở dạng Dynamic và thay đổi liên tục
> => ipv6 ra đời sẽ giải quyết vấn đề ngày 1 hết địa chỉ ipv4
 
### Ipv6 (internet protocol version4)
 - Sử dụng 128bit để đánh địa chỉ, số địa chỉ tối đa gồm 2^128 địa chỉ, sắp xếp thành 8 nhóm 16 bit
 - Sử dụng các cụm số hexa phân tách bởi dấu : 
 - Ipv6 xử lý các gói tin hiệu quả hơn ipv4, cải thiện hiệu suất và tính năng bảo mật.
###### Giải pháp chuyển đối ipv4 sang ipv6:
 **1.** Chạy song song 2 giao thức
 Một thiết bị khi được cấu hình sẽ chạy song song ipv4 vầ ipv6 cùng 1 lúc. Giao thức ipv4 sẽ đảm nhận trách nhiệm giao tiếp với các thiết bị có ipv4 và ipv6 sẽ giao tiếp với thiết bị được cấu hình ipv6 thông qua router.   
 **2.** Kỹ thuật đường hầm
 Nhét gói tin ipv6 vào trong gói tin ipv4  
 **3.** Nat-pt
 Biên dịch giữa gói tin ipv6 và ipv4.
 