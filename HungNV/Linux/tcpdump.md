# tcpdump
tcpdump là một bộ phân tích gói phổ biến chạy dưới dòng lệnh, nó cho phép người dùng hiển thị TCP/IP và các gói khác được truyền hoặc nhận qua mạng mà máy tính được gắn vào. tcpdump là phần mềm miễn phí

#### Các lệnh phổ biến với tcpdump

###### 1. Hiển thị các giao diện mạng 

```
[root@CentOS ~]# tcpdump -D
1.nflog (Linux netfilter log (NFLOG) interface)
2.nfqueue (Linux netfilter queue (NFQUEUE) interface)
3.usbmon1 (USB bus number 1)
4.usbmon2 (USB bus number 2)
5.ens33
6.ens34
7.any (Pseudo-device that captures on all interfaces)
8.lo [Loopback]
```

###### 2. Bắt gói tin ở các giao diện mạng

```
[root@CentOS ~]# tcpdump -i ens33
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
08:33:44.360579 IP CentOS > dns.google: ICMP echo request, id 1566, seq 1, length 64
08:33:44.361536 IP CentOS.46187 > gateway.domain: 9424+ PTR? 8.8.8.8.in-addr.arpa. (38)
08:33:44.410180 IP gateway.domain > CentOS.46187: 9424 1/0/0 PTR dns.google. (62)
08:33:44.410552 IP CentOS.36446 > gateway.domain: 55634+ PTR? 3.161.168.192.in-addr.arpa. (44)
08:33:44.410930 IP dns.google > CentOS: ICMP echo reply, id 1566, seq 1, length 64
08:33:44.462412 IP gateway.domain > CentOS.36446: 55634 NXDomain 0/0/0 (44)
08:33:44.464345 IP CentOS.47587 > gateway.domain: 61474+ PTR? 2.161.168.192.in-addr.arpa. (44)
08:33:44.500953 IP gateway.domain > CentOS.47587: 61474 NXDomain 0/0/0 (44)
^C
8 packets captured
8 packets received by filter
0 packets dropped by kernel
```

###### 3. Bắt gói tin với n gói tin

Để bắt số gói tin chỉ định, sử dụng tùy chọn -c
```
[root@CentOS ~]# tcpdump -i ens33 -c 4
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
08:36:12.639339 IP CentOS > dns.google: ICMP echo request, id 1566, seq 149, length 64
08:36:12.641149 IP CentOS.53441 > gateway.domain: 21475+ PTR? 8.8.8.8.in-addr.arpa. (38)
08:36:12.642647 IP gateway.domain > CentOS.53441: 21475 1/0/0 PTR dns.google. (62)
08:36:12.642900 IP CentOS.58427 > gateway.domain: 48589+ PTR? 3.161.168.192.in-addr.arpa. (44)
4 packets captured
8 packets received by filter
0 packets dropped by kernel
```

###### 4. Hiển thị gói tin dưới dạng HEX và ASCII 

```
[root@CentOS ~]# tcpdump -xx -i ens33 -c 2
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
08:38:06.867832 IP CentOS > dns.google: ICMP echo request, id 1566, seq 263, length 64
        0x0000:  0050 56e1 a3aa 000c 29b8 2a6a 0800 4500
        0x0010:  0054 8b44 4000 4001 3da9 c0a8 a103 0808
        0x0020:  0808 0800 6128 061e 0107 7e44 7c5d 0000
        0x0030:  0000 c93d 0d00 0000 0000 1011 1213 1415
        0x0040:  1617 1819 1a1b 1c1d 1e1f 2021 2223 2425
        0x0050:  2627 2829 2a2b 2c2d 2e2f 3031 3233 3435
        0x0060:  3637
08:38:06.868653 IP CentOS.46368 > gateway.domain: 57007+ PTR? 8.8.8.8.in-addr.arpa. (38)
        0x0000:  0050 56e1 a3aa 000c 29b8 2a6a 0800 4500
        0x0010:  0042 fed3 4000 4011 7880 c0a8 a103 c0a8
        0x0020:  a102 b520 0035 002e c396 deaf 0100 0001
        0x0030:  0000 0000 0000 0138 0138 0138 0138 0769
        0x0040:  6e2d 6164 6472 0461 7270 6100 000c 0001
2 packets captured
7 packets received by filter
0 packets dropped by kernel
```

###### 5. Bắt gói tin với địa chỉ IP 
Để gói tin hiển thị địa chỉ ip thay vì tên, ta sử dụng tùy chọn -n

```
[root@CentOS ~]# tcpdump -i ens33 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
08:41:44.961256 IP 192.168.161.3 > 123.30.181.113: ICMP echo request, id 1595, seq 38, length 64
08:41:44.965378 IP 123.30.181.113 > 192.168.161.3: ICMP echo reply, id 1595, seq 38, length 64
08:41:45.962628 IP 192.168.161.3 > 123.30.181.113: ICMP echo request, id 1595, seq 39, length 64
08:41:45.966653 IP 123.30.181.113 > 192.168.161.3: ICMP echo reply, id 1595, seq 39, length 64
08:41:46.891078 IP6 fe80::7909:cbb3:b0db:e251 > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
08:41:46.891203 IP 192.168.161.1 > 224.0.0.22: igmp v3 report, 1 group record(s)
08:41:46.908593 IP6 fe80::7909:cbb3:b0db:e251 > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
08:41:46.908717 IP 192.168.161.1 > 224.0.0.22: igmp v3 report, 1 group record(s)
08:41:46.914536 IP 192.168.161.1.mdns > 224.0.0.251.mdns: 0 AAAA (QM)? wpad.local. (28)
```  
###### 6. Thêm trường ngày khi bắt gói tin 

Để thêm trường ngày ta sử dụng tùy chọn -tttt 

```
[root@CentOS ~]# tcpdump -i ens33 -tttt
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
2019-09-14 08:44:43.286024 IP CentOS > static.vnpt.vn: ICMP echo request, id 1595, seq 216, length 64
2019-09-14 08:44:43.287104 IP CentOS.53395 > gateway.domain: 35697+ PTR? 113.181.30.123.in-addr.arpa. (45)
2019-09-14 08:44:43.288365 IP gateway.domain > CentOS.53395: 35697 1/0/0 PTR static.vnpt.vn. (73)
2019-09-14 08:44:43.288563 IP CentOS.57067 > gateway.domain: 18260+ PTR? 3.161.168.192.in-addr.arpa. (44)
2019-09-14 08:44:43.290049 IP gateway.domain > CentOS.57067: 18260 NXDomain 0/0/0 (44)
2019-09-14 08:44:43.290981 IP CentOS.33093 > gateway.domain: 6508+ PTR? 2.161.168.192.in-addr.arpa. (44)
2019-09-14 08:44:43.292131 IP gateway.domain > CentOS.33093: 6508 NXDomain 0/0/0 (44)
2019-09-14 08:44:43.295657 IP static.vnpt.vn > CentOS: ICMP echo reply, id 1595, seq 216, length 64
^C
8 packets captured
8 packets received by filter
0 packets dropped by kernel
```
###### 7. Bắt gói tin với 1 kiểu giao thức cụ thể

Ta thêm giao thức vào sau trường giao diện mạng các giao thức có thể là TCP, UDP, ARP, ...

```
[root@CentOS ~]# tcpdump -i ens33 tcp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
08:50:07.520996 IP CentOS.58138 > 67.219.148.138.http: Flags [S], seq 4021128019, win 29200, options [mss 1460,sackOK,TS val 1443081 ecr 0,nop,wscale 7], length 0
08:50:07.759264 IP 67.219.148.138.http > CentOS.58138: Flags [S.], seq 1477982118, ack 4021128020, win 64240, options [mss 1460], length 0
08:50:07.759302 IP CentOS.58138 > 67.219.148.138.http: Flags [.], ack 1, win 29200, length 0
08:50:07.759458 IP CentOS.58138 > 67.219.148.138.http: Flags [P.], seq 1:142, ack 1, win 29200, length 141: HTTP: GET /?release=7&arch=x86_64&repo=os&infra=stock HTTP/1.1
08:50:07.759569 IP 67.219.148.138.http > CentOS.58138: Flags [.], ack 142, win 64240, length 0
^C
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```
###### 8. Bắt gói tin với 1 port cụ thể 

```
[root@CentOS ~]# tcpdump -i ens34 port 22
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens34, link-type EN10MB (Ethernet), capture size 262144 bytes
08:54:09.227016 IP CentOS.ssh > 192.168.255.1.50405: Flags [P.], seq 479500646:479500710, ack 3311548176, win 324, length 64
08:54:09.228557 IP 192.168.255.1.50405 > CentOS.ssh: Flags [.], ack 64, win 2050, length 0
08:54:09.266237 IP CentOS.ssh > 192.168.255.1.50405: Flags [P.], seq 64:208, ack 1, win 324, length 144
08:54:09.266360 IP CentOS.ssh > 192.168.255.1.50405: Flags [P.], seq 208:288, ack 1, win 324, length 80
08:54:09.266444 IP CentOS.ssh > 192.168.255.1.50405: Flags [P.], seq 288:352, ack 1, win 324, length 64
```
###### 9. Bắt gói tin lưu vào 1 file

```
[root@CentOS ~]# tcpdump -i ens33 -c 5 -w tcpdump_test.pcap
tcpdump: listening on ens33, link-type EN10MB (Ethernet), capture size 262144 bytes
5 packets captured
5 packets received by filter
0 packets dropped by kernel
[root@CentOS ~]# ls
anaconda-ks.cfg  Data_nfs  tcpdump_test.pcap
```
Ở đây mình bắt 5 gói tin và lưu vào file tcpdump_test.pcap, để đọc được gói tin, sử dụng tùy chọn -r như sau:

```
[root@CentOS ~]# tcpdump -r tcpdump_test.pcap
reading from file tcpdump_test.pcap, link-type EN10MB (Ethernet)
09:21:05.558513 IP CentOS > dns.google: ICMP echo request, id 1978, seq 62, length 64
09:21:05.608684 IP dns.google > CentOS: ICMP echo reply, id 1978, seq 62, length 64
09:21:06.560371 IP CentOS > dns.google: ICMP echo request, id 1978, seq 63, length 64
09:21:06.610604 IP dns.google > CentOS: ICMP echo reply, id 1978, seq 63, length 64
09:21:07.562137 IP CentOS > dns.google: ICMP echo request, id 1978, seq 64, length 64
```

