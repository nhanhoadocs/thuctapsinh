# Text Commands

Linux cung cấp các tiện ích cho thao tác tập tin và văn bản như sau:

|Tiện ích|Lệnh|
|-|-|
|Hiển thị nội dung|`cat` và `echo`|
|Chinh sửa nội dung|`sed` và `awk`|
|Tìm theo mẫu|`grep`|


## 1. Hiển thị nội dung
Lệnh `cat` là viết tắt của "*concatenate*" được sử dụng để đọc và in ra nội dung của file. `tac` là lệnh ngược lại của `cat` có chức năng là đọc và in ra nội dung file theo chiều đảo ngược lại:
```
[root@localhost ~]# cat Test.txt
AAA BBB CCC

111 222 333
[root@localhost ~]# tac Test.txt
111 222 333

AAA BBB CCC
```

Lệnh `echo` là lệnh hiển thị text lên màn hình:
```
[root@localhost ~]# echo Test echo text
Test echo text
```

Ngoài ra, ta có thể in ra giá trị của biến: `# echo $<biến>`
```
[root@localhost ~]# echo $HOME
/root
```

## 2. Chỉnh sửa nội dung file
### Lệnh `sed`
Là 1 công cụ xử lí văn bản mạnh mẽ, viết tắt của "*stream editor*". Nó sẽ lọc văn bản cũng như thực hiện thay thế trong luồng dữ liệu. Dữ liệu từ nguồn (hoặc luồng) được lấy và di chuyển vào không gian xử lý. Toàn bộ danh sách các thao tác, sửa đổi được áp dụng lên dữ liệu trong không gian xử lý, nội dung cuối cùng được chuyển đến không gian đầu ra tiêu chuẩn (hoặc luồng).

Ví dụ : Thay đổi nội dung file
```
[root@localhost ~]# cat Test.txt
AAA BBB CCC

111 222 333
[root@localhost ~]# sed s/AAA/DDD/ Test.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# cat Test.txt
AAA BBB CCC

111 222 333
[root@localhost ~]# sed s/AAA/DDD/ Test.txt > Test2.txt
[root@localhost ~]# cat Test2.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# sed -i s/AAA/DDD/ Test.txt
[root@localhost ~]# cat Test.txt
DDD BBB CCC

111 222 333
```

Ví dụ : Xóa 1 dòng
```
[root@localhost ~]# cat Test.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# sed -e 2d Test.txt
DDD BBB CCC
111 222 333
```

### Lệnh `awk` 
Được sử dụng để trích xuất và sau đó in nội dung cụ thể của tệp và thường được sử dụng để xây dựng báo cáo. Nó là một tiện ích mạnh mẽ và là ngôn ngữ thông dịch, được sử dụng để thao tác với tệp dữ liệu, truy xuất và xử lý văn bản. Nó hoạt động tốt với các trường (chứa 1 mẩu dữ liệu, thực chất là một cột) và ghi lại (1 tập hợp các trường, thực chất là 1 dòng trong file).

```
[root@localhost ~]# awk '{print $0}' Test.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# awk '{print $1}' Test.txt
DDD

111
[root@localhost ~]# awk '{print $3}' Test.txt
CCC

333
```

Tham khảo `man sed` và `man awk` để biết thêm chi tiết về 2 lệnh này.

### Lệnh sort
Được sử dụng để sắp xếp lại các dòng của tệp văn bản theo thứ tự tăng dần hoặc giảm dần, theo 1 tiêu chuẩn nào đó(sort key).

```
[root@localhost ~]# cat Test.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# sort Test.txt

111 222 333
DDD BBB CCC
[root@localhost ~]# sort -r Test.txt
DDD BBB CCC
111 222 333

```

### Lệnh `uniq`
Dùng để xóa các dòng trùng lặp trong tệp văn bản. Nó đòi hỏi các mục trùng lặp phải được loại bỏ liên tiếp.
```
[root@localhost ~]# cat Test.txt
DDD BBB CCC
ABC
111 222 333
Computer
Computer
[root@localhost ~]# uniq Test.txt
DDD BBB CCC
ABC
111 222 333
Computer
[root@localhost ~]# uniq -c Test.txt
      1 DDD BBB CCC
      1 ABC
      1 111 222 333
      2 Computer
```

### Lệnh `paste`
Dùng để kết hợp các trường(fields) từ các file khác nhau.

```
[root@localhost ~]# cat Test.txt
DDD BBB CCC
ABC
111 222 333
Computer
Computer
[root@localhost ~]# cat number.txt
1
2
3
4
5
[root@localhost ~]# paste Test.txt number.txt
DDD BBB CCC     1
ABC     2
111 222 333     3
Computer        4
Computer        5
```

### Lệnh `join`
Dùng để kết hợp 2 file với nhau theo 1 trường chung
```
[root@localhost ~]# cat Test.txt
1 A
2 B
3 C
4 D
5 E
[root@localhost ~]# cat number.txt
1 Mot
2 Hai
3 Ba
4 Bon
5 Nam
[root@localhost ~]# join Test.txt number.txt
1 A Mot
2 B Hai
3 C Ba
4 D Bon
5 E Nam
```

## 3. Tìm theo mẫu
### Lệnh `grep`
Được sử dụng rộng rãi như một công cụ tìm kiếm văn bản chính. Nó quét các tệp cho các mẫu chỉ định và có thể được sử dụng với các biểu thức thông thường.
```
[root@localhost ~]# cat Test.txt
1 A
2 B
3 C
4 D
5 E
6 A
[root@localhost ~]# grep A Test.txt
1 A
6 A
```

### Lệnh `tr`
Được sử dụng để dịch các kí tự được chỉ định sang kí tự khác hoặc xóa chúng đi.
```
[root@localhost ~]# cat Test.txt
1 A
2 B
3 C
4 D
5 E
6 A
[root@localhost ~]# cat Test.txt | tr A a
1 a
2 B
3 C
4 D
5 E
6 a
```

### Lệnh `tee`
Lệnh này sẽ lấy đầu ra của bất kì lệnh nào và trong lúc gửi ra đầu ra tiêu chuẩn, nó sẽ lưu vào 1 file

```
[root@localhost A]# ls -l | tee list.txt
total 12
-rw-r--r--. 1 root root 33 Dec  9 13:55 file1.txt
-rw-r--r--. 1 root root 27 Dec  9 13:55 file2.txt
-rw-r--r--. 1 root root 39 Dec  9 13:50 file4.exe
-rw-r--r--. 1 root root  0 Dec 16 13:48 list.txt
[root@localhost A]# cat list.txt
total 12
-rw-r--r--. 1 root root 33 Dec  9 13:55 file1.txt
-rw-r--r--. 1 root root 27 Dec  9 13:55 file2.txt
-rw-r--r--. 1 root root 39 Dec  9 13:50 file4.exe
-rw-r--r--. 1 root root  0 Dec 16 13:48 list.txt
```

### Lệnh `wc`(Word count)
Lệnh này đếm số lượng dòng(`-l`), từ(`-w`) và ký tự(`-c`) trong một tệp hoặc danh sách các tệp.

```
[root@localhost ~]# cat Test.txt
1 A
2 B
3 C
4 D
5 E
6 A
[root@localhost ~]# wc -l Test.txt
6 Test.txt
[root@localhost ~]# wc -w Test.txt
12 Test.txt
[root@localhost ~]# wc -c Test.txt
24 Test.txt
```

### Lệnh `cut`
Sử dụng để trích xuất các cột trong tệp. Dấu phân cách cột mặc định sẽ là kí tự `tab`, hoặc có thể được tùy chỉnh bằng câu lệnh.

```
[root@localhost ~]# cut -d" " -f1 Test.txt
1
2
3
4
5
6
[root@localhost ~]# cut -d" " -f2 Test.txt
A
B
C
D
E
A
```

### Lệnh `head`
In ra vài dòng đầu tiên của file(mặc định là 10). Có thể thay đổi được qua option `-n số_dòng`
```
[root@localhost ~]# head -n 2 Test.txt
1 A
2 B
```

### Lệnh `tail`
In ra vài dòng cuối cùng của file(mặc định là 10). Có thể thay đổi được qua option `-n số_dòng`
```
[root@localhost ~]# tail -n 2 Test.txt
5 E
6 A
```