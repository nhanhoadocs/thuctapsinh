# Text commands

Linux cung cấp các tiện ích cho thao tác tập tin và văn bản như sau:

|Tiện ích|Lệnh|
| ----------------- |:----------:|
|Hiển thị nội dung|`cat` và `echo`|
|Chỉnh sửa nội dung|`sed` và `awk`|
|Tìm theo mẫu|`grep`|

## 1. Hiển thị nội dung

Lệnh `cat` là viết tắt của "concatenate" được sử dụng để đọc và in ra nội dung của file. `tac` là lệnh ngược lại của `cat` có chức năng đọc và in ra nội dung file theo chiều đảo ngược lại
```
[root@localhost ~]# cat Test.txt
AAA BBB CCC

111 222 333
[root@localhost ~]# tac Test.txt
111 222 333

AAA BBB CCC
```

Lệnh `echo` hiển thị text ra màn hình:

    [root@localhost ~]# echo Test
    Test 

Ngoài ra có thể in ra giá trị của biến `# echo $<biến>`

    [root@localhost ~]# echo $HOME
    /root

## 2. Chỉnh sửa nội dung file

### Lệnh `sed`

Là 1 công cụ xử lí văn bản mạnh mẽ, viết tắt của "stream editor". Nó sẽ lọc văn bản cũng như thực hiện thay thế trong luồng dữ liệu. Dữ liệu từ nguồn (hoặc luồng) được lấy và di chuyển vào không gian xử lý. Toàn bộ danh sách các thao tác, sửa đổi được áp dụng lên dữ liệu trong không gian xử lý, nội dung cuối cùng được chuyển đến không gian đầu ra tiêu chuẩn (hoặc luồng).

Ví dụ: thay đổi nội dung file 

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

Ví dụ xóa một dòng
```
[root@localhost ~]# cat Test.txt
DDD BBB CCC

111 222 333
[root@localhost ~]# sed -e 2d Test.txt
DDD BBB CCC
111 222 333
```

Sửa 1 file rồi lưu vào file mới

    #sed 's/text/replace/' file > newfile

Sửa 1 file rồi lưu vào file cũ

    #sed -i 's/text/replace/' file

Khi muốn chỉnh sửa từ thứ N xuất hiện trong văn bản, ta dùng hậu tố /g và /Ng. Ví dụ: 

![Imgur](https://i.imgur.com/nlgtxvp.png)

Xóa các dòng trống

    # sed '/^$/d' file

![Imgur](https://i.imgur.com/jNVEf25.png)

### Lệnh `awk`

Được sử dụng để trích xuất và sau đó in nội dung cụ thể của tệp và thường được sử dụng để xây dựng báo cáo. Nó là một tiện ích mạnh mẽ và là ngôn ngữ thông dịch, được sử dụng để thao tác với tệp dữ liệu, truy xuất và xử lý văn bản. Nó hoạt động tốt với các trường (chứa 1 mẩu g, thực chất là 1 dòng trong file).dữ liệu, thực chất là một cột) và ghi lại (1 tập hợp các trường, thực chất là 1 dòng trong file).

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
Lọc các kí tự
Các kí tự cần lọc được đặt trong `'//'`.
Ví dụ:

![Imgur](https://i.imgur.com/VXSQs0d.png)

Lọc dựa trên số dòng

![Imgur](https://i.imgur.com/hwFBcB9.png)

Tham khảo `man sed` và `man awk` để biết thêm chi tiết về 2 lệnh này.

### Lệnh `sort`

Lệnh sort được sử dụng để sắp xếp các dòng của tệp văn bản theo thứ tự tăng dần hoặc giảm dần, theo một khoá sắp xếp. Khóa sắp xếp mặc định là thứ tự của các ký tự ASCII (theo thứ tự bảng chữ cái). Cú pháp của lệnh sort:

    #sort <tuỳ chọn> <file>

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

Các option:
-r: sắp xếp ngược
-n: sắp xếp các số theo thứ tự từ bé đến lớn
-rn: sắp xếp các số theo thứ tự từ lớn đến bé
-R: sắp xếp ngẫu nhiên
-o: các dòng trùng lặp sẽ đứng cạnh nhau

Cú pháp <() cho phép đầu ra của lệnh được chuyển dưới dạng tệp đầu vào sang lệnh khác mà không cần phải tạo thủ công một tệp tạm thời

![Imgur](https://i.imgur.com/Yfq6QH7.png)

Sắp xếp theo cột (-k)

![Imgur](https://i.imgur.com/4dp9lCh.png)


### Lệnh `uniq`

Sử dụng để xóa các dòng trùng lặp trong văn bản 
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

Dùng để kết hợp các trường(fields) từ các file khác nhau

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

Dùng để kết hợp 2 file với nhau theo một trường chung

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

Được dùng để dịch các ký tự được chỉ định sang ky tự khác hoặc xóa chúng đi
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

Được đùng để lấy đầu ra của bất kỳ lệnh nào và trong lúc gửi ra đầu ra tiêu chuẩn, nó sẽ lưu vào 1 file.

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

### Lệnh `wc`

Dùng để đếm số lượng dòng(-l), từ(-w) và ký tự(-c) trong một tệp hoặc danh sách các tệp.
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

Sử dụng để trích xuất các cột trong tệp. Dấu phân cách cột mặc định sẽ là kí tự tab, hoặc có thể được tùy chỉnh bằng câu lệnh.

### Lệnh head 

In ra đầu dòng đầu tiên của file (mặc định là 10). Có thể thay đổi được qua option `-n số_dòng` 

    [root@localhost ~]# head -n 2 Test.txt
    1 A
    2 B

### Lệnh `tail`

In ra đầu dòng đầu tiên của file (mặc định là 10). Có thể thay đổi được qua option `-n số_dòng` 

    [root@localhost ~]# tail -n 2 Test.txt
    5 E
    6 A