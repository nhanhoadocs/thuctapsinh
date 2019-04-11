# Tầng mạng

## Các mô hình dịch vụ mạng 
- Xác định đường đi ( Path determination )
- Chuyển mạch ( Switching ) ( chuyển mạch gói - datagram và chuyển mạch ảo - virtual circuit )
- Thiết lập đường truyền ( Call setup )

## Các nguyển lý định tuyến
- Thuật toán định tuyến toàn cục ( global )
- Thuật toán định tuyến phân tán 

Thuật toán thường sử dụng trong Internet gồm hai kiểu chính: thuật toán global link state tĩnh và thuật toán distance vector động 

- Định tuyến tĩnh
- Định tuyến động
- Định tuyến phân cấp
- Định tuyến nội miền ( RIP,OSPF,IGRP,...)
- Định tuyến ngoại miền ( BGP )

<img src= "https://i.imgur.com/wRtmcyt.png" >



## Internet Protocol
### IPv4
- Network ID
- Host ID
- SubNetmask
- Broadcast

*tìm hiểu về IPv4 chi tiết:*
https://www.evernote.com/l/AlmCLppCWIVA67URQNnpPjpl0rDeLR-i_UE/


#### Khuôn gói dữ liệu IPv4:
- Phiên bản ( version )
- Độ dài tiêu đề (Header length)
- Kiểu dịch vụ (Type of service - TOS)
- Độ dài gói dữ liệu (datagram length)
- Định danh, cờ và vị trí phân đoạn (Identifier, Flag, Fragmention Offset)
- Thời gian tồn tại (Time to live)
- Giao thức (Protocol)
- Checksum của tiêu đề (Header checksum)
- Địa chỉ IP nguồn và đích
- Lựa chọn (Option)
- Dữ liệu (Payload)

<img src="https://i.imgur.com/CG6QHab.png">

-----------------------------------------



- Cấu tạo thiết bị định tuyến ( Router )
- DHCP ( đặt IP động )
- NAT 
- PAT
- ICMP






### IPv6
- Độ dài 128 bit
- Viết bằng số thập lục phân, chia thành 8 nhóm, nhóm 2byte, phân cách nhau bằng dấu :
- Chia thành ba loại
     - Unicast
     - Anycast
     - Multicast

