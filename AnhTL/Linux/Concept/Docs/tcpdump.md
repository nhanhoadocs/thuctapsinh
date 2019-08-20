# 1. Khái niệm 
- Tcpdum là phần mềm bắt gói tin trong mạng làm việc trên hầu hết các phiên bản hệ điều hành linux 
- Tcpdum cho phép bắt và lưu trữ những gói tin bắt được, từ đó chúng ta có thể sử dụng để phân tích
- Để sử dụng được tcpdump trên linux thì ta cần phải cài đặt 
- Với ubuntu 
```
sudo apt-get install tcpdump
```
- Đối với centos 
```
sudo yum install tcpdump
```
# 2. Tìm hiểu về một số câu lệnh của tcpdump
## 1.Hiển thị các giao diện mạng
Với option -D sẽ hiển thị ra danh sách các giao diện mạng có sẵn và ta có thể bắt các gói tin trên các giao diện này.
```
anhduc@anhduc:~$ tcpdump -D
1.wlp4s0 [Up, Running]
2.vmnet0 [Up, Running]
3.vmnet1 [Up, Running]
4.vmnet2 [Up, Running]
5.vmnet8 [Up, Running]
6.enp0s25 [Up, Running]
7.any (Pseudo-device that captures on all interfaces) [Up, Running]
8.lo [Up, Running, Loopback]
9.bluetooth0 (Bluetooth adapter number 0)
10.nflog (Linux netfilter log (NFLOG) interface)
11.nfqueue (Linux netfilter queue (NFQUEUE) interface)
12.usbmon1 (USB bus number 1)
13.usbmon2 (USB bus number 2)
14.usbmon3 (USB bus number 3)
15.usbmon4 (USB bus number 4)
```
## 2. Bắt gói tin từ một giao diện ethernet
Khi thực hiện lệnh tcpdump mà không có tùy chọn cụ thể nó sẽ bắt tất cả các gói tin đi qua tất cả các card mạng. Option -i cho phép lọc ra một interface ethernet cụ thể. Các interface ở đây là các interface mà là vừa liệt kê ở trên.
```
[root@localhost ~]# tcpdump  -i ens33 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
17:45:43.383315 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 37247508:37247696, ack 2768982635, win 313, options [nop,nop,TS val 3107676 ecr 100245872], length 188
17:45:43.383442 IP niemdt.43562 > localhost.localdomain.ssh: Flags [.], ack 188, win 2630, options [nop,nop,TS val 100245885 ecr 3107676], length 0
17:45:43.383904 IP localhost.localdomain.39356 > gateway.domain: 38493+ PTR? 1.169.168.192.in-addr.arpa. (44)
17:45:43.387245 IP gateway.domain > localhost.localdomain.39356: 38493 2/0/0 PTR niemdt., PTR niemdt.local. (90)
17:45:43.387466 IP localhost.localdomain.49260 > gateway.domain: 56539+ PTR? 129.169.168.192.in-addr.arpa. (46)
17:45:43.390594 IP gateway.domain > localhost.localdomain.49260: 56539 NXDomain 0/0/0 (46)
17:45:43.391922 IP localhost.localdomain.50361 > gateway.domain: 38567+ PTR? 2.169.168.192.in-addr.arpa. (44)
```
# 3. Hiển thị các gói tin được bắt trong hệ ASCII 
- Ta sử dụng option -A 
```
[root@localhost ~]# tcpdump  -A -i ens33 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
17:55:45.922994 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 42079260:42079448, ack 2768986727, win 313, options [nop,nop,TS val 3710215 ecr 100848411], length 188
E...|.@.@..............*......bg...9.......
.8.........?....}U.....T.X^...._...x..7..8...:N<PC......H.Q........!.}.l.......G=0...*\...]Yce.?)...........;h..A......H.g,P....{..[.B.X..5.+..9>...?..."......,a....,..l..d....S.X.m.. ..Y..._%.. H
17:55:45.923138 IP niemdt.43562 > localhost.localdomain.ssh: Flags [.], ack 188, win 2630, options [nop,nop,TS val 100848425 ecr 3710215], length 0
E..4d.@.@..K.........*....bg......
FY*.....
...).8..
17:55:45.923597 IP localhost.localdomain.60201 > gateway.domain: 39049+ PTR? 1.169.168.192.in-addr.arpa. (44)
E..He5@.@............).5.4...............1.169.168.192.in-addr.arpa.....
17:55:45.926703 IP gateway.domain > localhost.localdomain.60201: 39049 2/0/0 PTR niemdt., PTR niemdt.local. (90)
E..v.g.....:.........5.).b...............1.169.168.192.in-addr.arpa..................niemdt..............niemdt.local.
17:55:45.926990 IP localhost.localdomain.38746 > gateway.domain: 20990+ PTR? 129.169.168.192.in-addr.arpa. (46)
E..Je8@.@............Z.5.6..Q............129.169.168.192.in-addr.arpa.....
```
# 4. Chỉ bắt đúng N gói tin
Như ví dụ trên ta thấy nó sẽ bắt tất cả các gói tin. Đẻ bắt đúng N gói tin ta dùng option -c VD chỉ bắt đúng 3 gói tin
```
[root@localhost ~]# tcpdump  -i ens33 -c 5
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
17:52:31.065914 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 37249380:37249568, ack 2768982823, win 313, options [nop,nop,TS val 3515358 ecr 100653548], length 188
17:52:31.066085 IP niemdt.43562 > localhost.localdomain.ssh: Flags [.], ack 188, win 2630, options [nop,nop,TS val 100653568 ecr 3515358], length 0
17:52:31.066943 IP localhost.localdomain.50401 > gateway.domain: 62043+ PTR? 1.169.168.192.in-addr.arpa. (44)
3 packets captured
12 packets received by filter
0 packets dropped by kernel
```
# 5. Hiển thị các gói tin bắt được dưới dạng HEX và ASCII
- Ta sử dụng option -XX
```
[root@localhost ~]# tcpdump  -XX -i ens33 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
17:59:21.373759 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 42086304:42086492, ack 2768988359, win 313, options [nop,nop,TS val 3925668 ecr 101063859], length 188
	0x0000:  0050 56c0 0008 000c 2945 c5d5 0800 4510  .PV.....)E....E.
	0x0010:  00f0 7cbe 4000 4006 e965 c0a8 a981 c0a8  ..|.@.@..e......
	0x0020:  a901 0016 aa2a 0282 2fa0 a50b 68c7 8018  .....*../...h...
	0x0030:  0139 d4b6 0000 0101 080a 003b e6a4 0606  .9.........;....
	0x0040:  1cb3 7b43 e0b0 5a5c 111e 49d9 cbe5 da37  ..{C..Z\..I....7
	0x0050:  70d9 d0b0 b37d 059e b690 62b4 f1c2 863a  p....}....b....:
	0x0060:  e6e1 2ae9 1433 fb58 fc0b 2b30 6000 3822  ..*..3.X..+0`.8"
	0x0070:  219d 622c 856a e37b 59e9 11fc e80f 40f5  !.b,.j.{Y.....@.
	0x0080:  c8bb d7f3 09d5 950d 831f be47 ce19 a254  ...........G...T
	0x0090:  6539 fa73 a393 ef0d 6f4e c536 9a7f c147  e9.s....oN.6...G
```
# 6. Bắt gói tin và ghi vào một file 
- tcpdump cho phép bạn lưu gói tin thành một file, và sau đó bạn có thể sử dụng với mục đích phân tích khác.
```
[root@localhost ~]# tcpdump  -XX -i ens33 -c 3 -w test.pcap
tcpdump: listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
3 packets captured
3 packets received by filter
0 packets dropped by kernel
```
# 7.Đọc các gói tin từ một file
- Ta sử dụng option -r 
```
[root@localhost ~]# tcpdump -r tcpdump1.pcap 
reading from file tcpdump1.pcap, link-type EN10MB (Ethernet)
18:06:09.930288 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 42089408:42089532, ack 2768988807, win 313, options [nop,nop,TS val 4334224 ecr 101472411], length 124
18:06:09.930400 IP niemdt.43562 > localhost.localdomain.ssh: Flags [.], ack 124, win 2631, options [nop,nop,TS val 101472432 ecr 4334224], length 0
18:06:25.845018 IP niemdt.43820 > localhost.localdomain.ssh: Flags [P.], seq 2113396405:2113396441, ack 3828181549, win 331, options [nop,nop,TS val 101488346 ecr 3028360], length 36
```
# 8. Bắt các gói tin với địa chỉ IP
- Trong các ví dụ phía trên hiển thị gói tin với địa chỉ DNS chứ không phải địa chỉ IP
```
[root@localhost ~]# tcpdump  -i ens33 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
18:18:33.234994 IP 192.168.169.129.ssh > 192.168.169.1.43562: Flags [P.], seq 42104460:42104648, ack 2768991395, win 313, options [nop,nop,TS val 5077526 ecr 102215720], length 188
18:18:33.235133 IP 192.168.169.1.43562 > 192.168.169.129.ssh: Flags [.], ack 188, win 2630, options [nop,nop,TS val 102215737 ecr 5077526], length 0
18:18:33.235307 IP 192.168.169.129.ssh > 192.168.169.1.43562: Flags [P.], seq 188:560, ack 1, win 313, option
```
# 9.Bắt gói tin với dấu thời gian
- Option -tttt hiển thị các gói tin có thêm trường ngày
```
[root@localhost ~]# tcpdump  -i ens33 -tttt
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
2018-12-13 18:21:08.993694 IP localhost.localdomain.ssh > niemdt.43562: Flags [P.], seq 42105708:42105896, ack 2768991727, win 313, options [nop,nop,TS val 5233286 ecr 102371479], length 188
2018-12-13 18:21:08.993933 IP niemdt.43562 > localhost.localdomain.ssh: Flags [.], ack 188, win 2630, options [nop,nop,TS val 102371495 ecr 5233286], length 0
2018-12-13 18:21:08.994813 IP localhost.localdomain.56796 > gateway.domain: 17615+ PTR? 1.169.168.192.in-addr.arpa. (44)
```
# 10. Đọc các gói tin lớn hơn N bytes
- Bạn có thể chỉ nhận những gói tin lớn hơn N byte thông qua một bộ lọc “greater”
```
tcpdump -w test.pcap greater 1024
```
# 11. Đọc các gói tin nhỏ hơn N bytes
- Bạn có thể chỉ nhận những gói tin nhỏ hơn N byte thông qua bộ lọc “less”.
```
tcpdump -w test.pcap less 1024
```
# 12. Bắt các gói tin qua một port cụ thể   
```
[root@localhost ~]# tcpdump -i ens33 port 22
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
14:26:39.652629 IP localhost.localdomain.ssh > niemdt.55314: Flags [P.], seq 1893310016:1893310204, ack 4289076250, win 313, options [nop,nop,TS val 186911 ecr 3042695548], length 188
14:26:39.652769 IP niemdt.55314 > localhost.localdomain.ssh: Flags [.], ack 188, win 1444, options [nop,nop,TS val 3042695562 ecr 186911], length 0
14:26:39.653274 IP localhost.localdomain.ssh > niemdt.55302: Flags [P.], seq 2490664896:2490665004, ack 4156428662, win 334, options [nop,nop,TS val 186911 ecr 3042615703], length 108
```
# 13. Bắt các gói tin trên địa chỉ nguồn hoặc đích
- Bắt theo địa chỉ nguồn: **tcpdump src IP**
- Bắt theo địa chỉ đích: **tcpdump dst IP**
# 14. Bộ lọc các gói
- Trong lệnh tcpdump bạn có thể sử dụng điều kiện “and”, “or” hoặc “not” để lọc các gói tin.
```
tcpdump -i ens33 not arp and not rarp
