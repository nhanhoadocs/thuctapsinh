# 1.Khái niệm 
- Lệnh `mtr` là sự kết hợp giữa lệnh `ping` và `traceroute` 
- Cách thức hoạt động: nó gửi yêu cầu ICMP đến đích và lắng nghe đích đến để trả lời lại. Nó sẽ gửi các gói tin qua các nút mạng để đến được đích 
# 2. Cách cài đặt 
- Đối với hệ thống Ubuntu/Debain
```
anhduc@anhduc:~$ sudo apt-get install mtr
...
Preparing to unpack .../archives/mtr_0.92-1_amd64.deb ...
Unpacking mtr (0.92-1) ...
Setting up mtr (0.92-1) ...
Processing triggers for man-db (2.8.3-2) ...
```
- Đối với hệ thống của centos
```
[root@localhost ~]# yum install mtr
...
Installed:
  mtr.x86_64 2:0.85-7.el7                                                                                                                             

Complete!
```
# 3. Các option thường gặp 
- `-r`(report) : option này cho phép in ra một bảng báo cáo với số chu kỳ được chỉ định bởi option `-c`
```
[root@localhost ~]# mtr -r 8.8.8.8
Start: Mon Nov 26 12:53:00 2018

HOST: localhost.localdomain       Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- gateway                    0.0%    10    0.2   0.5   0.2   0.7   0.0
  2.|-- hn003-srv-tmg.nhanhoa.loc  0.0%    10    1.2   2.0   1.1   8.3   2.1
  3.|-- 10.56.239.4                0.0%    10    2.8   7.0   2.5  33.0   9.7
  4.|-- localhost                  0.0%    10    3.5   3.4   2.7   4.9   0.6
  5.|-- localhost                  0.0%    10   35.5  31.8  27.9  35.5   2.5
  6.|-- localhost                  0.0%    10   40.1  40.1  39.7  40.7   0.0
  7.|-- 72.14.208.125              0.0%    10   42.2  42.4  41.9  43.0   0.0
  8.|-- 108.170.241.112            0.0%    10   28.5  28.9  28.1  30.4   0.3
  9.|-- 209.85.250.119             0.0%    10   44.8  44.8  44.0  47.0   1.0
 10.|-- 172.253.50.223             0.0%    10   54.4  55.0  54.4  55.6   0.0
 11.|-- 209.85.247.44              0.0%    10   50.6  50.9  49.9  51.4   0.0
 12.|-- 216.239.50.243             0.0%    10   54.4  54.3  53.1  55.6   0.5
 13.|-- ???                       100.0    10    0.0   0.0   0.0   0.0   0.0
```
- `-c` : option này định dạng số lần ping của máy. thường được sử dụng với option -r
```
[root@localhost ~]# mtr -r -c 3 8.8.8.8
```
- `-p`Nó xác định kích thước gói tin gửi đi 
```
[root@localhost ~]# mtr -p 8.8.8.8
1 192.168.54.2 0 1 1 0 0 0
2 172.16.10.1 0 1 1 1 1 1
2 hn003-srv-tmg.nhanhoa.local 0 1 1 1 1 1
3 10.56.239.4 0 1 1 2 2 2
4 27.68.241.85 0 1 1 3 3 3
4 localhost 0 1 1 3 3 3
5 27.68.229.9 0 1 1 31 31 31
5 localhost 0 1 1 31 31 31
6 27.68.240.250 0 1 1 39 39 39
6 localhost 0 1 1 39 39 39
7 72.14.208.125 0 1 1 42 42 42
8 108.170.241.112 0 1 1 28 28 28
9 209.85.250.119 0 1 1 43 43 43
10 172.253.50.223 0 1 1 53 53 53
11 209.85.247.44 0 1 1 51 51 51
12 216.239.50.243 0 1 1 53 53 53
```
- `-n` : để kết quả trả về sẽ hiển thị địa chỉ ip của trang web
```
[root@localhost ~]# mtr -n -r  8.8.8.8
Start: Mon Nov 26 13:05:21 2018
HOST: localhost.localdomain       Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.54.2               0.0%    10    0.5   0.4   0.3   0.6   0.0
  2.|-- 172.16.10.1                0.0%    10    1.0   1.2   0.9   1.6   0.0
  3.|-- 10.56.239.4                0.0%    10    4.2   3.0   2.1   4.2   0.3
  4.|-- 27.68.241.85               0.0%    10    2.8   3.4   2.8   3.9   0.0
  5.|-- 27.68.229.9                0.0%    10   36.1  34.8  30.8  41.8   3.3
  6.|-- 27.68.240.250              0.0%    10   39.8  39.6  39.1  39.9   0.0
  7.|-- 72.14.208.125              0.0%    10   42.8  42.4  41.7  43.1   0.0
  8.|-- 108.170.241.112            0.0%    10   29.3  28.7  28.0  29.3   0.0
  9.|-- 209.85.250.119             0.0%    10   44.0  43.9  43.4  44.2   0.0
 10.|-- 172.253.50.223             0.0%    10   53.7  54.3  53.7  54.8   0.0
 11.|-- 209.85.247.44              0.0%    10   50.3  50.7  50.1  51.1   0.0
 12.|-- 216.239.50.243             0.0%    10  108.3  61.7  55.2 108.3  16.5
 13.|-- ???                       100.0    10    0.0   0.0   0.0   0.0   0.0
```
- `-i` : để cài đặt thời gian các gói tin được gửi đi 
```
[root@localhost ~]# mtr -i 2 dantri.com
```
- Trong đó 2 chính là mỗi 2 giây lại gửi đi một gói tin kiểm tra 
- `-h` : option dùng để tìm hiểu tất cả các option của lệnh 
```
[root@localhost ~]# mtr -h
usage: mtr [-BfhvrwctglxspQomniuT46] [--help] [--version] [--report]
		[--report-wide] [--report-cycles=COUNT] [--curses] [--gtk]
		[--csv|-C] [--raw] [--xml] [--split] [--mpls] [--no-dns] [--show-ips]
		[--address interface] [--filename=FILE|-F]
		[--ipinfo=item_no|-y item_no]
		[--aslookup|-z]
		[--psize=bytes/-s bytes] [--order fields]
		[--report-wide|-w] [--inet] [--inet6] [--max-ttl=NUM] [--first-ttl=NUM]
		[--bitpattern=NUM] [--tos=NUM] [--udp] [--tcp] [--port=PORT] [--timeout=SECONDS]
		[--interval=SECONDS] HOSTNAME

```
- Cách đọc bản báo cáo của option `-r`
    - cột `HOST` : số nút mạng đi qua để đến đích
    - cột `localhost..`: Địa chỉ nút mạng mà gói tin đi qua
    - cột `loss%` : Tỷ lệ gói tin mất tại mỗi nút mạng 
    - cột `snt` : Đếm số gói tin đã được gửi đi
    - cột `Last` :độ trễ của gói tin cuối cùng được gửi đi
    - cột `Avg`  :độ trễ trung bình của tất cả gói tin gửi đi
    - cột `Best` :độ trễ ngắn nhất trong các gói tin gửi đi rồi
    - cột `Wrst`  : độ trễ dài nhất trong các gói tin gửi đi 
    - cột `StDev` : độ lệch chuẩn của độ trễ cho mỗi máy chủ
    