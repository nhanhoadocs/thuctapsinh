## Hướng dẫn sử dụng tcpdump bắt và phân tích gói tin
`tcpdump` là một câu lệnh dùng để bắt và phân tích gói của một giao thức trong máy tính. Dưới đây là hướng dẫn một số cách dùng của lệnh `tcpdump`. Dưới đây là một số option của tcpdump thường xuyên sử dụng và tôi sẽ liệt kê chúng ở bên dưới 

1. Bắt gói tin từ một giao diện ethernet cụ thể
```
tcpdump -i (tên_ethernet)
```
```
sudo tcpdump -i enp37s0
[sudo] password for anhduc: 
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp37s0, link-type EN10MB (Ethernet), capture size 262144 bytes
```
2. bắt gói tin với số lượng xác định 
```
tcpdump -c (number) -i (ethernet)
```
```
anhduc@anhduc:~$ sudo tcpdump -c 2 -i enp37s0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp37s0, link-type EN10MB (Ethernet), capture size 262144 bytes
21:20:55.763211 IP a96-16-169-82.deploy.static.akamaitechnologies.com.https > anhduc.53432: Flags [P.], seq 1149191083:1149191114, ack 3662912889, win 294, options [nop,nop,TS val 597743568 ecr 1334154960], length 31
21:20:55.764136 IP anhduc.53432 > a96-16-169-82.deploy.static.akamaitechnologies.com.https: Flags [P.], seq 1:36, ack 31, win 486, options [nop,nop,TS val 1334174961 ecr 597743568], length 35
2 packets captured
6 packets received by filter
0 packets dropped by kernel
```
3. Bắt thông tin ghi vào một file 
```
tcpdump -w (tên_file)
```
4. Bắt gói tin với một giao thức cụ thể 
```
tcpdump -i (tên_ethernet) (tên giao thức)
```
```
anhduc@anhduc:~$ sudo tcpdump -c 2 -i enp37s0 udp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp37s0, link-type EN10MB (Ethernet), capture size 262144 bytes
09:48:10.595405 IP6 anhduc.49786 > hkg12s01-in-x02.1e100.net.443: UDP, length 23
```
5. Nhận các gói tin trên một cổng cụ thể thông qua tcpdump port
```
tcpdump -i (eth0) port (22)
```
có rất nhiều các option khác nữa bạn có thể thao khảo các option của nó [tại đây](https://securitydaily.net/phan-tich-goi-tin-15-lenh-tcpdump-duoc-su-dung-trong-thuc-te/)

phần trên tôi đã nói về cách để bắt một gói tin để có thể phân tích được gói tin đó thì chúng ta sử dụng phần mềm wireshark để có thể phần tích được nó. Dưới đây tôi sẽ thực hiện một bài lab nhỏ để các bạn có thể hiểu hơn được về cách làm việc của `tcpdump` và phân tích gói tin bằng wireshark

## Kịch bản sử dụng tcpdump 
Tôi sẽ xin ngừng cấp địa chỉ IP tại máy tính của mình sau đó xin cấp lại địa chỉ IP và bắt gói tin trong quá trình máy tính của tôi xin cấp địa chỉ IP để các bạn có thể thấy phương pháp hoạt động mà chúng ta sử dụng. Ta sẽ sử dụng 2 terminal để có thể vừa bắt gói tin bằng `tcpdump` và vừa xin cấp ip bằng `dhclient`

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/liunux/images/tcpdump.png)

## Thực hiện 
Trước khi xin cấp lại địa chỉ Ip thì ta sử dụng lệnh tcpdump để có thể bắt gói tin với giao thức DHCP. Gói tin của giao thức DHCP sử dụng port của UDP để giao tiếp chính vì thế mà ta phải sử dụng lệnh tcpdump như sau 
```
anhduc@anhduc:~$ sudo tcpdump udp -i enp37s0 -w dhcp.pcap 
```
Trong thời gian lệnh `tcpdump` tạo list danh sách gói tin để  bắt thì ngay sau đó chúng ta xin cấp lại địa chỉ IP mới với lệnh dhclient 
```
anhduc@anhduc:~$ sudo dhclient 
```
Kết qủa của tôi thu được sau khi sử dụng 2 câu lệnh đó là thu được một file có chứa thông tin và cách thức hoạt của giao thức DHCP như sau. 
```
anhduc@anhduc:~$ sudo tcpdump udp -i enp37s0 -w dhcp.pcap 
[sudo] password for anhduc: 
tcpdump: listening on enp37s0, link-type EN10MB (Ethernet), capture size 262144 bytes
^C8 packets captured
8 packets received by filter
0 packets dropped by kernel
```