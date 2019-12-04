# Text Commands

Linux cung cấp các công cụ cho việc theo tác với file và text:
- Hiển thị nội dung sử dụng `cat` và `echo`
- Chỉnh sửa nội dung sử dụng `sed` và `awk`
- Tìm kiếm sử dụng `grep`




### Hiển thị nội dung
Lệnh `cat` viết tắt của `concatenate` được sử dụng để đọc và in nội dung của một file, lệnh `tac` là lệnh viết ngược lại của `cat` và cũng có một chức năng ngược lại là đọc và in nội dung của file theo kiểu đảo ngược lại.

```
[root@CentOS ~]# cat Test.txt
bbc def ghi
jkm nop fcc
AAA BBB CCC
[root@CentOS ~]# tac Test.txt
AAA BBB CCC
jkm nop fcc
bbc def ghi
[root@CentOS ~]#
```

lệnh `echo` là lệnh để hiển thị text:

```
[root@CentOS ~]# echo Test echo text
Test echo text
[root@CentOS ~]# echo HOME
HOME
[root@CentOS ~]# echo $HOME
/root
```

ta có thể in giá trị của biết bằng `echo`.

### Chỉnh sửa nội dung file
Lệnh `sed` (Stream EDitor) là một công cụ mạnh mẽ để làm việc với các đoạn text. Nó sẽ lọc và sắp xếp những sự bổ sung trong các dòng dữ liệu (data streams). Dữ liệu từ đầu vào (streams) sẽ được nhận và dưa vào một khu vực sử lý riêng. Toàn bộ danh sách hoạt động, việc chỉnh sửa được áp dụng và dữ liệu trong khu vực làm việc và nội dung cuối cùng sẽ được chuyển ra ngoài khu vực làm việc đến nơi xuất dữ liệu chuẩn.


Xóa một số dòng trong file:

```
[root@CentOS ~]# cat Test.txt
bbc def ghi
jkm nop fcc
AAA BBB CCC
[root@CentOS ~]# sed -e 2d Test.txt
bbc def ghi
AAA BBB CCC
[root@CentOS ~]#
```


Lệnh `awk` được sử dụng để trích xuất và sau đó in nội dung cụ thể của một tập tin và thường được dùng để báo cáo xây dựng. Nó là một tiện ích mạnh mẽ và ngôn ngữ lập trình được giải thích, được sử dụng để thao tác các tệp dữ liệu, truy xuất và xử lý văn bản. Nó hoạt động tốt với các trường (chứa một đoạn dữ liệu, về cơ bản là một cột) và các bản ghi (một tập hợp các trường, về cơ bản là một dòng trong một tệp).

```

[root@CentOS ~]# cat Test.txt
bbc def ghi
jkm nop fcc
AAA BBB CCC
[root@CentOS ~]# awk '{ print $1 }' Test.txt
bbc
jkm
AAA
[root@CentOS ~]# awk '{ print $2 }' Test.txt
def
nop
BBB
[root@CentOS ~]# awk '{ print $3 }' Test.txt
ghi
fcc
CCC
[root@CentOS ~]# awk '{ print $4 }' Test.txt
```

Lệnh sort được sử dụng để sắp xếp lại các dòng trong file text, theo thứ tự trên xuống hoặc từ dưới lên trên, phụ thuộc vào sort key:

```
[root@CentOS ~]# cat Test.txt
bbc def ghi
jkm nop fcc
AAA BBB CCC
[root@CentOS ~]# sort Test.txt
AAA BBB CCC
bbc def ghi
jkm nop fcc
[root@CentOS ~]# sort -r Test.txt
jkm nop fcc
bbc def ghi
AAA BBB CCC
```


Lệnh `uniq` dùng để loại bỏ các dòng bị lặp trong file text và rất hữu dụng cho việc đơn giản hóa hiển thị text file. Nó yêu cầu các đầu vào lặp bị xóa bỏ thực hiện liên tục.

```
[root@CentOS ~]# cat Test.txt
      1 bbc def ghi
      1 AAA BBB CCC
      1 jkm nop fcc
      1 AAA BBB CCC
[root@CentOS ~]# sort Test.txt | uniq -c
      2 AAA BBB CCC
      1 bbc def ghi
      1 jkm nop fcc
[root@CentOS ~]#
```

Lệnh paste để gộp các fields từ các file khác nhau:

```
[root@CentOS ~]# cat Test.txt
bbc def ghi
AAA BBB CCC
jkm nop fcc
AAA BBB CCC
[root@CentOS ~]# cat Test2.txt
11
22
44
55
66
77
[root@CentOS ~]# paste Test.txt Test2.txt
bbc def ghi     11
AAA BBB CCC     22
jkm nop fcc     44
AAA BBB CCC     55
        66
        77
[root@CentOS ~]#
```

Lệnh `join` gộp 2 file thành một field chung:

```
[root@CentOS ~]# cat names.txt
01 Mario Rossi
02 Antonio Esposito
03 Michele Laforca
04 Antonio Esposito
[root@CentOS ~]# cat ages.txt
01 34
02 46
03 29
04 46
[root@CentOS ~]# join names.txt ages.txt
01 Mario Rossi 34
02 Antonio Esposito 46
03 Michele Laforca 29
04 Antonio Esposito 46
```


Lệnh `grep` được dùng để tìm kiếm các từ khóa. Nó sẽ quét các file có một đặc điểm chung và có thể được sử dụng với các kí tự thường:

```
[root@CentOS ~]# cat Test.txt | grep jkm
jkm nop fcc
[root@CentOS ~]#
```

Lệnh `tee` lấy output của một lệnh và lưu vào file:

```
[root@CentOS ~]# ls -la | tee LS.txt
total 36
dr-xr-x---.  3 root root  186 Nov 20 22:23 .
dr-xr-xr-x. 17 root root  224 Nov 14 10:23 ..
-rw-------.  1 root root 1413 Nov 14 10:24 anaconda-ks.cfg
-rw-------.  1 root root  856 Nov 20 21:30 .bash_history
-rw-r--r--.  1 root root   18 Dec 28  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 28  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 28  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 28  2013 .cshrc
drwxr-xr-x.  2 root root   57 Nov 20 04:11 .targetcli
-rw-r--r--.  1 root root  129 Dec 28  2013 .tcshrc
-rw-r--r--.  1 root root   18 Nov 20 22:18 Test2.txt
-rw-r--r--.  1 root root   48 Nov 20 22:23 Test.txt
[root@CentOS ~]# ls
anaconda-ks.cfg  LS.txt  Test2.txt  Test.txt
[root@CentOS ~]# cat LS.txt
total 36
dr-xr-x---.  3 root root  186 Nov 20 22:23 .
dr-xr-xr-x. 17 root root  224 Nov 14 10:23 ..
-rw-------.  1 root root 1413 Nov 14 10:24 anaconda-ks.cfg
-rw-------.  1 root root  856 Nov 20 21:30 .bash_history
-rw-r--r--.  1 root root   18 Dec 28  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 28  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 28  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 28  2013 .cshrc
drwxr-xr-x.  2 root root   57 Nov 20 04:11 .targetcli
-rw-r--r--.  1 root root  129 Dec 28  2013 .tcshrc
-rw-r--r--.  1 root root   18 Nov 20 22:18 Test2.txt
-rw-r--r--.  1 root root   48 Nov 20 22:23 Test.txt
[root@CentOS ~]#
```

Lệnh wc (word count) sẽ đếm số dòng , chữ cái, kí tự trong một file hoặc một danh sách gồm nhiều file:

```
[root@CentOS ~]# cat Test.txt
Abc def ghi
BAA BBB CCC
jkm nop fcc
ZAA BBB CCC
[root@CentOS ~]# wc -l Test.txt
4 Test.txt
[root@CentOS ~]# wc -c Test.txt
48 Test.txt
[root@CentOS ~]# wc -w Test.txt
12 Test.txt
```

Lệnh `cut` để làm việc với các cột trên file và thiết kế để xuất ra nội dung của một cột cụ thể. Cột mặc định là tab character, một số sự phân cách khác có thể được sử dụng :

```
[root@CentOS ~]# cat Test.txt
Abc def ghi
BAA BBB CCC
jkm nop fcc
ZAA BBB CCC
[root@CentOS ~]# cut -d ' ' -f1 Test.txt
Abc
BAA
jkm
ZAA
[root@CentOS ~]# cut -d ' ' -f2 Test.txt
def
BBB
nop
BBB
[root@CentOS ~]# cut -d ' ' -f3 Test.txt
ghi
CCC
fcc
CCC
[root@CentOS ~]# cut -d 'c' -f1 Test.txt
Ab
BAA BBB CCC
jkm nop f
ZAA BBB CCC
```

Lệnh `head` để đọc một số dòng đầu tiên của một file ( mặc định là 10 ) và hiển thị nó trên màn hình.

```
[root@CentOS ~]# head -n 1 Test.txt
Abc def ghi
```

Lệnh `tail` in ra một số dòng cuối cùng của một file , mặc định là 10 dòng cuối.

```
[root@CentOS ~]# tail LS.txt
-rw-------.  1 root root 1413 Nov 14 10:24 anaconda-ks.cfg
-rw-------.  1 root root  856 Nov 20 21:30 .bash_history
-rw-r--r--.  1 root root   18 Dec 28  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 28  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 28  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 28  2013 .cshrc
drwxr-xr-x.  2 root root   57 Nov 20 04:11 .targetcli
-rw-r--r--.  1 root root  129 Dec 28  2013 .tcshrc
-rw-r--r--.  1 root root   18 Nov 20 22:18 Test2.txt
-rw-r--r--.  1 root root   48 Nov 20 22:23 Test.txt
[root@CentOS ~]# cat LS.txt
total 36
dr-xr-x---.  3 root root  186 Nov 20 22:23 .
dr-xr-xr-x. 17 root root  224 Nov 14 10:23 ..
-rw-------.  1 root root 1413 Nov 14 10:24 anaconda-ks.cfg
-rw-------.  1 root root  856 Nov 20 21:30 .bash_history
-rw-r--r--.  1 root root   18 Dec 28  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 28  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 28  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 28  2013 .cshrc
drwxr-xr-x.  2 root root   57 Nov 20 04:11 .targetcli
-rw-r--r--.  1 root root  129 Dec 28  2013 .tcshrc
-rw-r--r--.  1 root root   18 Nov 20 22:18 Test2.txt
-rw-r--r--.  1 root root   48 Nov 20 22:23 Test.txt
[root@CentOS ~]#
```