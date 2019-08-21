#### Các lệnh cấu hình cơ bản Switch Cisco

##### 1- Các lệnh trợ giúp:

Switch> ? Phím ? : được dùng làm phím trợ giúp giống như router  
Switch> enable: Là chế độ User  
Switch# : Là chế độ Privileged  
Switch# disable: Thoát khỏi chế độ privileged  
Switch> exit : Thoát khỏi chế độ User  

##### 2- Các câu lệnh kiểm tra :

Switch# show running-config: Hiển thị file cấu hình đang chạy trên RAM  
Switch# show startup-config: Hiển thị file cấu hình đang chạy trênNVRAM  
Switch# show interfaces: Hiển thị thông tin cấu hình về các interface có trên switch và trạng thái của các interface đó.  
Switch# show interfaces Vlan 1: Hiển thị các thông số cấu hình của Interface VLAN 1, Vlan 1 là vlan mặc định trên tất cả các switch của cisco.  
Switch# show version: Hiển thị thông tin về phần cứng và phần mềm của switch  
Switch# show flash: Hiển thị thông tin về bộ nhớ flash  
Switch# show mac-address-table: Hiển thị bảng địa chỉ MAC hiện tại của switch  

##### 3- Cấu hình Hostname :

Switch# configure terminal: Chuyển cấu hình vào chế độ Global Configuration  
Switch(config)# hostname 2960Switch: Đặt tên cho switch là 2960Switch. Câu lệnh đặt tên này thực thi giống trên router

Cấu hình Password : 

2960Switch(config)#enable password cisco: Cấu hình Password enable cho switch là Cisco  
2960Switch(config)#enable secret class : Cấu hình Password enable được mã hóa là class  
2960Switch(config)#line console 0 : Vào chế độ cấu hình line console    
2960Switch(config-line)#login : Cho phép switch kiểm tra password khi người dùng login vào switch thông qua console  
2960Switch(config-line)#password cisco : Cấu hình password cho console là Cisco  
2960Switch(config-line)#exit :Thoát khỏi chế độ cấu hình line console  
2960Switch(config-line)#line vty 0 4 :Vào chế độ cấu hình line vty  
2960Switch(config-line)#login : Cho phép switch kiểm tra password khi người dùng login vào switch thông qua telnet  
2960Switch(config-line)#password cisco : Cấu hình password cho phép telnet là Cisco  
2960Switch(config-line)#exit : Thoát khỏi chế độ cấu hình của line vty  

##### 4- Cấu hình IP và Gateway :

2960Switch(config)# Interface vlan 1 : Vào chế độ cấu hình của interface vlan 1  
2960Switch(config-if)# ip address 172.16.10.2 255.255.0.0 : Gán địa chỉ ip và subnet mask để cho phép truy cập switch từ xa.  
2960Switch(config)#ip default-gateway 172.16.10.1 : Cấu hình địa chỉ default gateway cho Switch  

##### 5- Cấu hình mô tả interface :

2960Switch(config)# interface fastethernet fa0/1 : Vào chế độ cấu hình của interface fa0/1  
2960Switch(config-if)# description Finace VLAN : Thêm một đoạn mô tả cho interface này.