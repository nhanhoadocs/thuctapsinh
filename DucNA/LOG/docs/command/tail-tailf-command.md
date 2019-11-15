# Tìm hiểu về hai lệnh tail và tailf trong linux
##  I. Command tail
Khái niệm: `Tail` là một command giúp xuất ra phần cuối của các tệp được cung cấp thông qua đầu vào. Và kết quả được trả về theo mặc định là 10 dòng cuối cùng. Lệnh `tail` còn có thể theo dõi theo file theo thời gian thực 

1. Đọc theo mặc định hiển thị 10 dòng cuối 
```
[root@client ~]# tail test 
6
7
8
9
10
11
12
13
14
15
``` 
2. Giới hạn số dòng hiện thị ra 
```
[root@client ~]# tail -n 2 test 
14
15
```
3. Giới hạn số bit hiển thị ra 
```
tail -c <số byte> <tên file>
```
```
[root@client ~]# tail -c 12 test 
12
13
14
15
```
4. Hiển thị nhiều file 
```
[root@client ~]# tail -n 2 test http.pcap 
==> test <==
14
15

==> http.pcap <==

 

```
5. Đọc nhiều file và tắt những dòng ghi chú 
```
[root@client ~]# tail -q -n 2 test http.pcap 
14
15

 

```
6. Theo dõi file theo thời gian thực. Thường là theo dõi file log 
```
[root@client ~]# tail -f  /var/log/messages
Nov 12 07:01:01 client systemd: Removed slice User Slice of root.
Nov 12 08:01:01 client systemd: Created slice User Slice of root.
Nov 12 08:01:01 client systemd: Started Session 119 of user root.
Nov 12 08:01:01 client systemd: Removed slice User Slice of root.
Nov 12 08:05:34 client systemd: Created slice User Slice of root.
Nov 12 08:05:34 client systemd: Started Session 120 of user root.
Nov 12 08:05:34 client systemd-logind: New session 120 of user root.
Nov 12 08:05:58 client yum[6949]: Installed: epel-release-7-11.noarch
Nov 12 08:06:45 client yum[6984]: Installed: perl-File-Next-1.16-1.el7.noarch
Nov 12 08:06:45 client yum[6984]: Installed: ack-2.26-1.el7.noarch
Nov 12 08:35:01 client systemd: Started Session 121 of user root.
Nov 12 08:35:01 client systemd-logind: New session 121 of user root.
Nov 12 08:35:22 client systemd: Stopping The Apache HTTP Server...
Nov 12 08:35:23 client systemd: Stopped The Apache HTTP Server.
Nov 12 08:35:23 client systemd: Starting The Apache HTTP Server...
Nov 12 08:35:23 client httpd: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using fe80::c20a:a698:665b:b5bb. Set the 'ServerName' directive globally to suppress this message
Nov 12 08:35:24 client systemd: Started The Apache HTTP Server.
```
Sau khi mở thêm 1 terminal và `restart httpd` tự động thêm các dòng từ 8h 35 phút trở đi. Đó là log restart httpd 

7. tailf tương tự command `tail -f` có tác dụng theo dõi file thường là dùng để theo dõi file log. Sự khác biệt giữa `tailf` và `tail -f` 
- Giống nhau: Cùng hiển thị 10 dòng cuối và đợi xem các sự ghi thêm của file 
- Khác nhau: Khi cùng đọc một tệp thì
    - Tail -f: Sẽ đọc 10 dòng cuối và cho ghi ra dữ liệu 
    - Tailf : Sẽ đọc cả file và bắt đầu ghi ra tệp 