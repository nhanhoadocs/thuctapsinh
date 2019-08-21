# Các câu lệnh sử dụng trong router và chức năng.
## Mode làm việc chính của router.
- User EXEC mode: chế độ người dùng.
    - Router > ---------------
    - Khi mới vào CLI là đang ở chế độ này.
- Privileged EXEC mode: chế độ đặc quyền.
    - Router #----------------
    - Vào chế độ này gõ lệnh: "Router>enable"
- Global configuration mode: chế độ cấu hình toàn cục.
    - Router (config)#------------
- Chế độ cấu hinh cổng
    - Router (config-if)#----------
## Các câu lệnh.
- Router# configure terminal: chuyển từ chế độ privileged sang global.
- Router# show running-config : kiểm tra file cấu hình đang chạy.
- Router# copy running-config startup-config : ghi file cấu hình vào NVRAM.
- Router# show startup-config : kiểm tra file cấu hình có thông tin đang chạy.
- Router# show ip interface brief : hiện thi các interface đang hoạt động.
- Router(config)#hostname R1: đặt tên cho router ở đây tên là R1.
- Router(config)# service password-encryption : mã hóa password trên router.
- R1(config)#enable password router1: đặt pass khi chuyển từ chế độ user sang privileged sẽ yêu cầu, ở đây pass là router1
- R1(config)#enable secret router1s: đặt pass khi chuyển từ privileged sang global, ở đây pass là router1s.
- R1(config)#line console 0: đến cấu hình router bằng console 0 để cấu hình. 
- Khi đã vào chế độ cấu hình cổng console ta có thế đặt pass khi mỗi lần truy cập vào cổng console.
    - R1(config-line)#password router1c. ở đây pass là router1c
- R1(config-line)#line vty 0 4: kết nối cấu hình router qua telnet
    - R1(config-line)#password router1v ở đây pass là router1v
### Cấu hình các cổng trong router.
- Trở về mode R1(config)#----------
- R1 (config)# interface f0/0 : đến cổng fastEthernet0/0.
- R1(config-if)# no shut : không tắt cổng này trên router.
- R1(config-if)# ip address 192.168.1.1 255.255.255.0 :đặt địa chỉ ip và subnet mask cho cổng này.
- R1(config-if)#clock rate 64000 : bật xung nhịp với DCE 64000 micro/giây.

- R1(config-if)# exit : thoát cấu hình.
