# Hướng dẫn phân tích gói tin DHCP với tcpdump
#### 1.Tổng quan về DHCP và tcpdump    

- DHCP (Dynamic Host Configuration Protocol) : là giao thức cấu hình máy chủ động dùng để cung cấp quản lý trung tâm nhanh chóng, tự động và là trung tâm phân phối địa chỉ ip trong mạng 
- tcpdump : là phần mềm bắt gói tin trong mạng làm việc trên hầu hết các hệ điều hành linux, tcpdump cho phép bắt và lưu lại gói tin bắt được

#### 2.Hướng dẫn phân tích gói tin DHCP 

Trước tiên, ta phải cài tcpdump bằng lệnh: 
```
yum install -y tcpdump
```
Để bắt được gói tin khi DHCP cấp lần đầu tiên, ta phải xác nhận `BOOTPROTO` là `none`. Nếu là giá trị khác, ta tiến hành sửa lại sau đó `reboot` máy. 

![Imgur](https://i.imgur.com/8q65Cd0.png)

Kiểm tra lại địa chỉ ip : 

![Imgur](https://i.imgur.com/CkEpgcz.png)

ta thấy card ens33 chưa được set ip.

Mở 2 terminal, 1 bên thực hiện lệnh chỉnh sửa file của card ens33 và để `BOOTPROTO=dhcp` , 1 bên thực hiện lệnh tcpdump để bắt gói tin khi dhcp cấp ip.

![Imgur](https://i.imgur.com/UXLQeLN.png)

sau đó tiến hành restart network để máy nhận cập nhật cấu hình mới.

![Imgur](https://i.imgur.com/8ae2jgH.png)

ta thấy ở đây, sau khi restart, ta bắt đưuọc 4 gói tin chính là 4 bản tin DHCP DISCOVER, DHCP OFFER, DHCP REQUEST, DHCP ACK. 

![Imgur](https://i.imgur.com/6eDWlaw.png)

###### 1: DHCP Client gửi yêu cầu đến DHCP Server được gọi là bản tin DHCP Discover  
###### 2: DHCP Server cung cấp địa chỉ cho Client gọi là bản tin DHCP OFFER  
###### 3: DHCP Server phản hồi máy chủ DHCP bằng bản tin DHCP REQUEST để chấp nhận.  
###### 4: DHCP Server gửi ACK được sử dụng để xác nhận rằng thiết bị (DHCP Client)  có địa chỉ IP cụ thể đó và để xác định lượng thời gian mà thiết bị có thể sử dụng địa chỉ trước khi nhận địa chỉ mới. 