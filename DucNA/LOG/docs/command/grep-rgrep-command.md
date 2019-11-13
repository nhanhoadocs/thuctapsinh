# Tìm hiểu về lệnh grep và egrep 
Khái niệm: lệnh `grep` và `egrep` được sử dụng để tìm kiếm trong văn bản. Nó sẽ tìm kiếm hợp với một chuỗi đầu vào được cho trước. 

## I. GREP
1. grep 'text'
```
grep 'text' <tên file>
```
```
[root@client ~]# grep 2 test 
2
12
```

2. Không phân biệt chữ hoa và chữ thường 
```
[root@client ~]# grep -i 'a' test 
2a
5a
6A
```
3. Tìm kiếm trong thư mục 
```
[root@client ~]# grep -r '192.168.80.225' /etc/
/etc/sysconfig/network-scripts/ifcfg-eth0:IPADDR="192.168.80.225"
/etc/sysconfig/network-scripts/ifcfg-eth0.bak:IPADDR="192.168.80.225"
```

4. Tìm những dòng không có từ đó 
```
[root@client ~]# grep -v '2' test 
6A
7c
8d
9b
10
11
13
14
15
```
5. Đếm dòng hiển thị option -c 
```
[root@client ~]# grep -cv '2' test 
9
```
6. Hiển thị ra số dòng của dòng đó. Số dòng là số đầu tiên 
```
[root@client ~]# grep -n '2' test 
1:1 2 3
2:2a 3 3
3:3b 2 3 2
4:4c 2 1
5:5a 2 1
12:12
```
7. Hiển thị thêm trước và sau số dòng 
```
-A : after là phía sau 
-B : before là phía trước 
```
```
[root@client ~]# grep -A 2 -B 2 '6' test 
4c 2 1
5a 2 1
6A
7c
8d
```
9. Loại bỏ tên tệp khi sử dụng option -r 
```
[root@client ~]# grep -hr '192.168.80.225' /etc/
IPADDR="192.168.80.225"
IPADDR="192.168.80.225"
```
10. Chỉ ra tên file của dòng đã được chọn 
```
[root@client ~]# grep -lr '192.168.80.225' /etc/
/etc/sysconfig/network-scripts/ifcfg-eth0
/etc/sysconfig/network-scripts/ifcfg-eth0.bak
```
## II. EGREP 
Nó có cách sử dụng như với `grep` nhưng `egrep` sẽ có với tốc độ sử lý nhanh hơn so với `grep` và `fgrep` 

## III.ACK command 
- Là một câu lệnh dùng để bổ sung thêm cho `grep`.  lệnh `ack` sẽ tìm kiếm dòng khớp với chuỗi đã cho trước trong một file hoặc một thư mục. Nếu như không có file và thư mục nào được chỉ ra thì nó sẽ thực hiện trên thư mục hiện tại.
- `ACK` command có cách dùng và gần như tất cả các option của grep 
- `ACK` nhanh hơn `GREP`
-  Màu hiển thị đẹp hơn so với GREP và có thể chọn được 
- Không cần option thì `ACK` vẫn biết đó là thư mục. Còn grep thì không.

Ví dụ:

1. Option `-i` không phân biệt chữ hoa và thường 
```
[root@client ~]# ack -i 'a' test 
2a 3 3
5a 2 1
6A
```
