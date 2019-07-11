# DHCP RELAY 
DHCP Relay Agent là một cấu hình được đặt cho máy tính hoặc một Router tiếp nhận các thông tin yêu cầu cấp phát IP của clients và chuyển các thông tin này đến DHCP server  

Cơ chế hoạt động :  
 DHCP relay agent là thiết bị cấu tạo để  forward các DHCP requests đến DHCP server ở subnet khác . Các thao tác như sau :  

   -  Client gửi bản tin broadcast request đến DHCP server
  -   Di server ở subnet khác nên sẽ k có bản tin nào của server phản hồi lại , DHCP relay agent sẽ lấy bản tin của client và forward trực tiếp đến DHCP server ở subnet khác . 
    - DHCP Server trả lời trực tiếp client thông qua DHCP RElay agent

Ưu diểm của DHCP Relay

 – Cấp phát được IP cho các client ở lớp mạng khác .

 – Kết hợp với hệ thống mạng không dây ( Wireless) cung cấp tại các điểm – Hotspot như: nhà ga, sân bay, khách sạn, trường học.

 – Thuận tiện cho việc mở rộng hệ thống mạng.  

# Cài đặt :  
 <img src="https://i.imgur.com/WaMcp4w.jpg">  

 - Mô hình gồm 1 DHCP SERVER , 1 DHCP RELAY AGENT , Client nhận IP từ DHCP SERVER thông qua DHCP RELAY AGENT .  
- DHCP SERVER  VÀ DHCP RELAY AGENT thuộc cùng một giải mạng 4.4.4.0/24 ,DHCP RELAY AGENT và Client thuộc cùng dải mạng 5.5.5.0/24   
**Cài đặt DHCP SERVER**  
Cấu hình DHCP server trong file dhcpd.conf  
`vi /etc/dhcp/dhcpd.conf`  

Đặt 2 dải mạng trong file , 1 dải mạng của 4.4.4.0 và 1 dải mạng của 5.5.5.0 với cấu hình sau  
<img src="https://i.imgur.com/vThQjCz.png">  

Sau khi cấu hình xong dhcp ta phải cấu hình định tuyến cho server có thể tiếp cận các mạng khác  
`vi /etc/sysconfig/network-script/route-ens37`  
<img src="https://i.imgur.com/X9s7p55.png">  

**Cài đặt DHCP RELAY AGENT**  
Cấu hình dhcp relay agent qua file dhcrelay.service  
```ssh
 # cp /lib/systemd/system/dhcrelay.service /etc/systemd/system/
 # vi /etc/systemd/system/dhcrelay.service
```  
Điền IP của DHCP SERVER sau dòng ExecStart=/usr/sbin/dhcrelay -d --no-pid   
<img src="https://i.imgur.com/gsiifDP.png">  

Đổi 0 -> 1 ở file ip-forward để RELAY AGENT có thể forward các tập tin ở /proc/sys/net/ipv4/ip_forward  
`echo > 1 /proc/sys/net/ipv4/ip_forward`  

Khởi động lại dhcp relay :  
`service dhcrelay restart`  

**Cài đặt Client**  
- Cấu hình cổng ens38 để nhận ip từ dhcp :  
<img src="https://i.imgur.com/bfH1YTP.png">  
- Dùng lệnh `dhclient` để máy nhận ip   
 Kiểm tra IP :  
<img src="https://i.imgur.com/Uv2Svn6.png">  
Cổng ens38 đã nhận đúng dải IP Được phép cấp phát từ DHCP SERVER  

- Kiểm tra trên DHCP RELAY :`service dhcrelay status`  
<img src="https://i.imgur.com/VnLEiuF.png">  
Ta thấy Relay agent đã chuyển tiếp các request và reply từ client và dhcp server  

- Kiểm tra DHCP SERVER : `service dhcpd status`  
<img src="https://i.imgur.com/1pokOsg.png">  



  








