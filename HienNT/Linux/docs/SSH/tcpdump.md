<img src ="../../images/25 bai linux/TCPDUMP.png">  

# Tìm hiểu về TCPDUMP  
## Content  
### 1. [Giới thiệu về tcpdump](/1)  
### 2. [Một số câu lệnh hay dùng với tcpdump](/2)

## <a name ="1"></a> 1. Giới thiệu về tcpdump  
- `tcpdump` là phần mềm bắt gói tin trong mạng làm việc trên hầu hết các phiên bản hệ điều hành Linux/Unix. `tcpdump` cho phép chúng ta bắt, lưu lại các gói tin bắt được và phân tích các gói tin.  
- Sau khi kết thúc việc bắt các gói tin, tcpdump sẽ báo cáo các cột sau:
  - `Packet capture` - số lượng gói tin bắt được và xử lý.
  - `Packet received by filter` - số lượng gói tin được nhận bởi bộ lọc.
  - `Packet dropped by kernel` - số lượng packet đã bị dropped bởi cơ chế bắt gói tin của hệ điều hành. 

- Định dạng chung của một gói tin mà `tcpdump` bắt được là:  

  ```sh
  time-stamp src > dst: flags data-seqno ack window urgent options
  ```
  Trong đó:  
  - `Time-stamp` - hiển thị thời gian gói tin được capture.  
  - `Src và dst` - hiển thị địa IP của người gửi và người nhận.  
  - `Cờ Flag` bao gồm các giá trị sau:  
    - `S(SYN)` - Được sử dụng trong quá trình bắt tay của giao thức TCP.  
    - `.(ACK)` - Được sử dụng để thông báo cho bên gửi biết là gói tin đã nhận được dữ liệu thành công.  
    - `F(FIN)` - Được sử dụng để đóng kết nối TCP.  
    - `P(PUSH)` - Thường được đặt ở cuối để đánh dấu việc truyền dữ liệu.  
    - `R(RST)` - Được sử dụng khi muốn thiết lập lại đường truyền.  
  - `Data-sqeno` - Số `sequence number` của gói dữ liệu hiện tại.  
  - `ACK` - Mô tả số sequence number tiếp theo của gói tin do bên gởi truyền (số sequence number mong muốn nhận được).  
  - `Window` - Vùng nhớ đệm có sẵn theo hướng khác trên kết nối này.  
  - `Urgent` - Cho biết có dữ liệu khẩn cấp trong gói tin.  

  <img src ="../../images/25 bai linux/tcp-dia.gif">  
  
- Cài đặt `tcpdump`  
  ```sh
    # yum install -y tcpdump
  ```
## <a name="2"></a>2. Một số câu lệnh hay dùng với tcpdump
### 2.1. Hiển thị các giao diện mạng có sẵn  
- Sử dụng option `-D` với câu lệnh  
  ```sh
    # tcpdump -D
  ```
  OUTPUT
  ```sh
  1.bluetooth0 (Bluetooth adapter number 0)
  2.nflog (Linux netfilter log (NFLOG) interface)
  3.nfqueue (Linux netfilter queue (NFQUEUE) interface)
  4.usbmon1 (USB bus number 1)
  5.usbmon2 (USB bus number 2)
  6.ens33
  7.any (Pseudo-device that captures on all interfaces)
  8.lo [Loopback]
  ```

### 2.2. Bắt gói tin từ một giao diện ethernet  
- Khi thực hiện lệnh `tcpdump` bắt gói tin mà không có tùy chọn cụ thể nó sẽ bắt tất cả các gói tin đi qua tất cả các card mạng. Sử dụng option `-i` để lọc gói tin đi qua interface ethernet(IE) cụ thể:  
  Ví dụ: bắt các gói tin đi qua IE `ens33`  
  ```sh
    # tcpdump -i ens33
  tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
  listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
  23:51:20.802598 IP server.ssh > 192.168.136.1.54660: Flags [P.], seq 1525365147:1525365311, ack 1094554378, win 304, length 164
  23:51:20.809241 IP server.42830 > dns.google.domain: 5687+ PTR? 1.136.168.192.in-addr.arpa. (44)
  23:51:20.849775 IP 192.168.136.1.54660 > server.ssh: Flags [.], ack 164, win 4104, length 0
  23:51:20.929881 ARP, Request who-has server tell gateway, length 46
  23:51:20.929935 ARP, Reply server is-at 00:0c:29:ff:a5:cb (oui Unknown), length 28
  23:51:20.930721 IP dns.google.domain > server.42830: 5687 NXDomain 0/0/0 (44)
  ```  
  Các gói tin ở đây được bắt liên tục, để thoát ra bấm `Ctrl+C`  

### 2.3. Chỉ bắt đúng N gói tin  
- Sử dụng option `-c` để có thể thay đổi số lượng các gói bạn muốn bắt  
  Ví dụ: Chỉ bắt đúng 5 gói tin
  ```sh
     # tcpdump -i ens33 -c 5
  ```
  OUTPUT  
  ```sh
  tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
  listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
  23:58:26.130963 IP server.ssh > 192.168.136.1.54660: Flags [P.], seq 1526511507:1526511543, ack 1094557634, win 304, length 36
  23:58:26.136667 IP server.42353 > dns.google.domain: 9863+ PTR? 1.136.168.192.in-addr.arpa. (44)
  23:58:26.172306 IP 192.168.136.1.54660 > server.ssh: Flags [.], ack 36, win 4105, length 0
  23:58:26.361469 ARP, Request who-has server tell gateway, length 46
  23:58:26.361520 ARP, Reply server is-at 00:0c:29:ff:a5:cb (oui Unknown), length 28
  5 packets captured
  17 packets received by filter
  0 packets dropped by kernel
  ```

### 2.4. Bắt các gói có địa chỉ IP  
- Sử dụng tuỳ chọn `-n` để hiển thị địa chỉ IP của các máy liên quan. Nếu không dùng tùy chọn này chỉ bắt được các gói tin chứa các địa chỉ DNS thay vì địa chỉ IP.
  ```sh
    # tcpdump -i ens33 -n
  ```

### 2.5. Hiển thị các gói tin đã bắt được trong hệ ASCII
- Sử dụng option `-A`  
  ```sh 
    # tcpdump -A -i ens33 -n -c 2
  tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
  listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
  00:12:14.928518 IP 192.168.136.1.54660 > 192.168.136.132.ssh: Flags [.], ack 1527624263, win 4105, length 0
  E..(..@....!............A=..[..GP..     /)........
  00:12:14.983695 IP 192.168.136.132.ssh > 192.168.136.1.54660: Flags [P.], seq 1:85, ack 0, win 304, length 84
  E..|Cr@.@.e#............[..GA=..P..0.E..>s.=.N.}.^@w....4....c...P...a]7.?......:.....0..Pw......T?..s.9.4....d..0(5.......o
  2 packets captured
  2 packets received by filter
  0 packets dropped by kernel
  ```  

### 2.6. Hiển thị các gói đã bắt trong HEX và ASCII
- Sử dụng option `-XX`  
  ```sh
    # tcpdump -XX -i ens33 -n -c 1
  ```
  OUTPUT  

  <img src ="../../images/25 bai linux/ig1.png">

### 2.7. Bắt các gói và ghi vào một tệp  
- Trong trong trường hợp bạn muốn phân tích các gói tin bắt được, sử dụng tùy chọn `-w` để ghi lại các gói tin này vào một file cụ thể và sử dụng các công cụ phân tích giao thức mạng(ví dụ: Wireshark) để phân tích nó. Các file này nên có đuôi là `.pcap` để có thể sử dụng cho bất kỳ bộ phân tích giao thức mạng nào.  

- Ví dụ: ghi các gói tin bắt được trên giao diện mạng ens33 vào file `test.pcap`  
  ```sh
    # tcpdump -w test.pcap -n -i ens33
  ```  
  Kiểm tra lại xem file `test.pcap` đã tồn tại chưa  

  <img src ="../../images/25 bai linux/ig2.png">

### 2.8. Đọc các gói từ một tệp đã lưu 
- Sử dụng option `-r` để đọc các file chứa các gói tin đã lưu  
  ```sh  
    # tcpdump -r test.pcap
  ```
  OUPUT  
  ```sh
  reading from file test.pcap, link-type EN10MB (Ethernet)
  00:24:44.080261 IP server.ssh > 192.168.136.1.54660: Flags [P.], seq 1527631759:1527631795, ack 1094568930, win 304, length 36
  00:24:44.122074 IP 192.168.136.1.54660 > server.ssh: Flags [.], ack 36, win 4105, length 0
  00:24:44.139295 ARP, Request who-has gateway tell 192.168.136.1, length 46
  ```  
  Sử dụng option `-n` để nhận thông tin về địa chỉ IP thay vì DNS  
  <img src ="../../images/25 bai linux/ig3.png">

### 2.9. Bắt các gói với dấu thời gian có thể đọc được
- Sử dụng tùy chọn `-ttt`  
  ```sh
    # tcpdump -tttt -n -i ens33 -c 3
  ```
  OUTPUT  

  <img src ="../../images/25 bai linux/ig6.png">  

### 2.10. Bắt các gói nhỏ/lớn hơn N byte
- Sử dụng tùy chọn `less` để nhận các gói tin nhỏ hơn N byte  
  Ví dụ: Bắt 10 gói tin nhỏ hơn 1024 byte  
  ```sh
    # tcpdump -n -i ens33 -c 10 less 1024
  ```  
  OUTPUT  

  <img src ="../../images/25 bai linux/ig4.png">  

- Sử dụng tùy chọn `greater` để nhận các gói tin nhỏ hơn N byte 
  Ví dụ: Bắt 1 các gói tin lớn hơn 1024 byte
  ```sh
    # tcpdump -n -i ens33 -c 1 greater 1024
  ```   

### 2.11. Chỉ nhận các gói của một loại giao thức cụ thể  
- Các giao thức bạn có thể sử dụng: `fddi, tr, wlan, ip, ip6, arp, rarp, decnet, tcp và udp`.  
  Ví dụ: bắt 3 gói arp qua giao diện ens33  
  ```sh
    # tcpdump -n -i ens33 arp -c 3
  ```
  OUTPUT  

  <img src ="../../images/25 bai linux/ig5.png">  

### 2.12. Nhận gói dữ liệu trên một cổng cụ thể  
Ví dụ: Nhận 3 gói được nhận bởi port 22  
```sh
  # tcpdump -n -i ens33 port 22 -c 3
```
OUTPUT  

<img src ="../../images/25 bai linux/ig7.png">  

### 2.13. Bắt gói cho IP và cổng cụ thể  
- Bắt 4 gói tin có IP Destination là 192.168.136.1 và port 22  
  ```sh
    # tcpdump -i ens33 -n dst 192.168.136.1 and port 22 -c 4
  ```  
  OUTPUT

  <img src ="../../images/25 bai linux/ig8.png">  

- Bắt 4 gói tin có IP Source là 192.168.136.1 và port 22  
  ```sh 
    # tcpdump -i ens33 -n src 192.168.136.1 and port 22 -c 4
  ```
- Bắt 4 gói tin có IP Source là 192.168.136.1, IP Destination là 192.168.136.132 và sử dụng port 22
  ```sh
    # tcpdump -i ens33 -n src 192.168.136.1 and port 22 and dst 192.168.136.132 and port 22 -c 4
  ```

### 2.14. Bắt các gói truyền TCP giữa hai máy chủ  
Nếu hai quá trình khác nhau từ hai máy khác nhau đang giao tiếp qua giao thức tcp, chúng ta có thể bắt các gói bằng cách sử dụng tcpdump như sau.
```sh
  # tcpdump -w communication.pcap -i eth0 dst 192.168.136.132 and port 22
```
Chúng ta có thể mở tệp `communication.pcap` bằng bất kỳ công cụ phân tích giao thức mạng (Wireshark,...) để gỡ lỗi mọi sự cố tiềm ẩn.  

### 2.15. Gói bộ lọc(filter) tcpdump  
Trong lệnh tcpdump, chúng ta có thể đưa ra các điều kiện “and”, “or” và “not” để lọc các gói cho phù hợp.  
Ví dụ: lọc lấy 3 gói tin không sử dụng giao thức `arp` và `rarp`  
```sh
  # tcpdump -i ens33 -c 3 not rarp and not arp
```
OUTPUT  

<img src ="../../images/25 bai linux/ig9.png">  





## TÀI LIỆU THAM KHẢO  
- [tcpdump.org/manpages/tcpdump](https://www.tcpdump.org/manpages/tcpdump.1.html)
- https://opensource.com/article/18/10/introduction-tcpdump
- https://jvns.ca/tcpdump-zine.pdf
- https://blogd.net/linux/vi-du-ve-su-dung-lenh-tcpdump/
- http://vinahost.info/TCPDUMP-va-cac-thu-thuat-su-dung
- [capture-analyze-packets-tcpdump](https://www.linuxtechi.com/capture-analyze-packets-tcpdump-command-linux/)