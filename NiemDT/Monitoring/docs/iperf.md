**iperf** là câu lệnh được sử dụng để test bandwidth 

Để sử dụng được câu lệnh này ta cần mô hình client/server một máy đóng vai trò client và một máy đóng vai trò là server. 

![](/Monitoring/images/iperf/1.png)

Trong mô hình này máy server sẽ lắng nghe kết nối từ máy client gửi đến. Máy client sẽ liên tục gửi các gói tin để test bandwidth của card mạng. Gói tin gửi đi ở đây có thể là TCP hoặc UDP do ta quyết định.

Để dùng được câu lệnh này trước hết ta cần cài đặt nó trên cả 2 máy

```
yum install iperf
```

Để kiểm tra trên máy server ta chạy lệnh `iperf -s` còn trên máy client ta chạy lệnh `iperf -c IP-may-server`

Ví dụ

* Trên server

```
[root@test2 ~]# iperf -s
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
[  4] local 192.168.122.219 port 5001 connected with 192.168.122.229 port 57548
[ ID] Interval       Transfer     Bandwidth
[  4]  0.0-10.0 sec  24.5 GBytes  21.0 Gbits/sec
```

* Trên client

```
[root@localhost ~]# iperf -c 192.168.122.219
------------------------------------------------------------
Client connecting to 192.168.122.219, TCP port 5001
TCP window size: 3.57 MByte (default)
------------------------------------------------------------
[  3] local 192.168.122.229 port 57548 connected with 192.168.122.219 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec  24.5 GBytes  21.0 Gbits/sec
```

Như ví dụ trên tôi không sử dụng thêm các tham số gì thì gói tin ở được sử dụng ở đây là TCP. Và port mặc định ở đây là port 5001. Bạn cũng có thể thực hiện kết nối trên port khác bằng cách sử dụng option `-p` sau đó chỉ ra port. Nhưng nếu chỉ ra port thì trên máy client và server đều phải chỉ ra cùng 1 port

Hiển thị kết quả test 4s một lần trong vòng 20s dùng lệnh 

```
iperf -c 192.168.122.219 -i 4 -t 20
```

Kết quả hiển thị trên máy client sẽ như sau

```
[root@localhost ~]# iperf -c 192.168.122.219 -i 4 -t 20
------------------------------------------------------------
Client connecting to 192.168.122.219, TCP port 5001
TCP window size: 1.91 MByte (default)
------------------------------------------------------------
[  3] local 192.168.122.229 port 57558 connected with 192.168.122.219 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 4.0 sec  9.60 GBytes  20.6 Gbits/sec
[  3]  4.0- 8.0 sec  9.53 GBytes  20.5 Gbits/sec
[  3]  8.0-12.0 sec  9.40 GBytes  20.2 Gbits/sec
[  3] 12.0-16.0 sec  9.53 GBytes  20.5 Gbits/sec
[  3] 16.0-20.0 sec  9.59 GBytes  20.6 Gbits/sec
[  3]  0.0-20.0 sec  47.7 GBytes  20.5 Gbits/sec
```

**UDP**

Để sử dụng gói tin UDP để kiểm tra ta sử dụng thêm option `-u` trên cả máy client và server.

* Trên server

```
[root@test2 ~]# iperf -s -u
------------------------------------------------------------
Server listening on UDP port 5001
Receiving 1470 byte datagrams
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 192.168.122.219 port 5001 connected with 192.168.122.229 port 36728
[ ID] Interval       Transfer     Bandwidth        Jitter   Lost/Total Datagrams
[  3]  0.0-10.0 sec  1.25 MBytes  1.05 Mbits/sec   0.044 ms    0/  892 (0%)
```

Trên client

```
[root@localhost ~]# iperf -c 192.168.122.219 -u
------------------------------------------------------------
Client connecting to 192.168.122.219, UDP port 5001
Sending 1470 byte datagrams, IPG target: 11215.21 us (kalman adjust)
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 192.168.122.229 port 36728 connected with 192.168.122.219 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec  1.25 MBytes  1.05 Mbits/sec
[  3] Sent 892 datagrams
[  3] Server Report:
[  3]  0.0-10.0 sec  1.25 MBytes  1.05 Mbits/sec   0.043 ms    0/  892 (0%)
```

Ta có thể thấy bandwidth khi sử dụng gói tin UDP và TCP khác nhau là rất lớn bởi mặc định iperf giới hạn bandwidth cho kết nối UDP là 1 Mb/s. Ta có thể thay đổi thông số này là bằng cách sử dụng option `-b`

```
iperf -c 192.168.122.219 -u -b 100M
``` 

Câu lệnh kiểm tra với băng thông 100M nếu có thể đạt được

```
[root@localhost ~]# iperf -c 192.168.122.219 -u -b 100M
------------------------------------------------------------
Client connecting to 192.168.122.219, UDP port 5001
Sending 1470 byte datagrams, IPG target: 112.15 us (kalman adjust)
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 192.168.122.229 port 34477 connected with 192.168.122.219 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec   125 MBytes   105 Mbits/sec
[  3] Sent 89165 datagrams
[  3] Server Report:
[  3]  0.0-10.0 sec   125 MBytes   105 Mbits/sec   0.002 ms    0/89165 (0%)
```

Để kiểm tra tải của server ta sẽ đẩy liên tục các gói tin UDP đến server để kiểm tra. Thay đổi băng thông tối đa và quan sát băng thông tối đa mà nó đạt được

```
[root@localhost ~]# iperf -c 192.168.122.219 -u -b 5G -i 1 -t 10
------------------------------------------------------------
Client connecting to 192.168.122.219, UDP port 5001
Sending 1470 byte datagrams, IPG target: 2.19 us (kalman adjust)
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 192.168.122.229 port 44047 connected with 192.168.122.219 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec   603 MBytes  5.06 Gbits/sec
[  3]  1.0- 2.0 sec   554 MBytes  4.65 Gbits/sec
[  3]  2.0- 3.0 sec   618 MBytes  5.19 Gbits/sec
[  3]  3.0- 4.0 sec   619 MBytes  5.19 Gbits/sec
[  3]  4.0- 5.0 sec   642 MBytes  5.38 Gbits/sec
[  3]  5.0- 6.0 sec   574 MBytes  4.81 Gbits/sec
[  3]  6.0- 7.0 sec   651 MBytes  5.46 Gbits/sec
[  3]  7.0- 8.0 sec   609 MBytes  5.11 Gbits/sec
[  3]  8.0- 9.0 sec   633 MBytes  5.31 Gbits/sec
[  3]  9.0-10.0 sec   581 MBytes  4.88 Gbits/sec
[  3]  0.0-10.0 sec  5.94 GBytes  5.10 Gbits/sec
```

Ta thấy nó vẫn có thể đạt được để kiểm tra ta tiếp tục tăng băng thông tối đa lên và quan sát.

**Kiểm tra tải 2 chiều**

Để kiểm tra được tải ở cả 2 chiều ta dùng option `-d`. Lúc này máy client sẽ gửi gói tin đến server để test băng thông tại máy server sau đó 2 máy này sẽ đổi lại vai trò cho nhau

```
[root@localhost ~]# iperf -c 192.168.122.219 -d
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size: -1.00 Byte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 192.168.122.219, TCP port 5001
TCP window size:  408 KByte (default)
------------------------------------------------------------
[  5] local 192.168.122.229 port 57562 connected with 192.168.122.219 port 5001
[  4] local 192.168.122.229 port 5001 connected with 192.168.122.219 port 47868
[ ID] Interval       Transfer     Bandwidth
[  5]  0.0-10.0 sec  18.3 GBytes  15.7 Gbits/sec
[  4]  0.0-10.0 sec  6.48 GBytes  5.56 Gbits/sec
```