# Text commands

Linux cung cấp một số tiện ích để chỉnh sửa và làm việc với file:

- Hiển thị nội dung dùng `cat` và `echo`
- Sửa nội dung dùng `sed` và `awk`
- Tìm kiếm từ khóa dùng `grep`


## Hiển thị nội dung

### Câu Lệnh cat

Câu lệnh `cat` (viết tắt của từ tiếng anh concatenate) được dùng để hiển thị nội dung tập tin ra màn hình hoặc nối các tập tin với nhau và chuyển sang một tập tin khác.

#### Cú Pháp

Câu lệnh cat có cú pháp như sau:
```
cat [OPTION] [FILE]...
```

#### Hiển Thị Nội Dung Một Tập Tin

Câu lệnh dưới đây sử dụng cat để hiển thị nội dung của tập tin `mysite_access.log` ở thư mục `/var/log/apache2/`:

```
$ cat /var/log/apache2/mysite_access.log
```

#### Hiển Thị Nội Dung Nhiều Tập Tin

Câu lệnh dưới đây sử dụng cat để hiển thị nội dung của tập tin `mysite_access.log` và `mysite_error.log` ở thư mục `/var/log/apache2/`:

```
$ cat /var/log/apache2/mysite_access.log /var/log/apache2/mysite_error.log
```

#### Hiển Thị Nội Dung Tập Tin Với Số Dòng

Sử dụng tuỳ chọn `-n` để hiển thị nội dung tập tin cùng số dòng trong câu lệnh `cat`:
```
$ cat -n linux_distro.txt
1. Mac
2. Ubuntu
3. CentOS
4. Redhat
5. Linux Mint
```
Nối Nội Dung Nhiều Tập Tin

Câu lệnh dưới đây sẽ nối nội dung hai tập tin `mysite_access.log` và `mysite_error.log` vào nội dung tập tin `mysite_all.log` trong thư mục người dùng hiện tại:
```
$ cat /var/log/apache2/mysite_access.log /var/log/apache2/mysite_error.log > ~/mysite_all.log
```

Phân tích ví dụ trên:

- Đầu tiên câu lệnh cat được sử dụng để nối nội dung của hai tập tin `mysite_access.log` và `mysite_error.log` cùng nằm trong thư mục `/var/log/apache2/`
- Sau đó toán tử chuyển hướng `>` trong linux được sử dụng để tạo ra tập tin mới `mysite_all.log` trong thư mục `~` với nội dung nối hai tập tin ở trên.


Lệnh `tac` in các dòng của tệp theo thứ tự ngược lại. Mỗi dòng vẫn giữ nguyên, nhưng thứ tự các dòng được đảo ngược. Cú pháp của lệnh `tac` hoàn toàn giống với lệnh `cat`.

Qua ví dụ dưới đây chứng minh cho việc hiển thị nguợc của lệnh `tac` so với `cat`:
```
[root@localhost]# cat file1
Hello
This is file1
[root@localhost]# tac file1
This is file1
Hello
```

### Câu Lệnh echo

Câu lệnh `echo` là một trong những câu lệnh phổ biến được sử dụng trong Linux đặc biệt trong các tập tin batch để hiển thị các thông báo ra màn hình.

#### Cú Pháp

Câu lệnh `echo` có cú pháp như sau:
```
echo [-option] [strings]
```
Các tùy chọn `-e` , cùng với các công thức sau đây, được sử dụng để cho phép các chuỗi ký tự đặc biệt, chẳng hạn như các ký tự xuống dòng hoặc tab ngang.

    \n đại diện cho dòng mới
    \t đại diện cho tab ngang.

| Lệnh | Chức năng |
|------|-----------|
|echo "string" > newfile	| Dùng để thêm một chuổi vào một tệp mới.
|echo "string" >> newfile	| Dùng để nối một chuổi vào cuối tệp đã tồn tại.
|echo $VARIABLE	| Dùng để hiển thị nội dung biến môi trường.

Lệnh echo đặc biệt hữu ích để xem các giá trị của các biến môi trường.

Ví dụ: Dùng lệnh `echo` để xem biến môi trường $PATH:

```
[root@localhost dang]# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
```

## Chỉnh sửa nội dung 

### Câu lệnh Sed

1. Cú pháp chính

`sed` tượng trưng cho stream editor. Nó là 1 công cụ rất hữu ích cho việc xử lý văn bản, và là 1 tiện ích tuyệt vời để làm việc với các biểu thức chính quy. Việc sử dụng phổ biến nhất của `sed` là thay thế văn bản. 

`sed` có thể được dùng để thay thế những xuất hiện của 1 chuỗi với 1 chuỗi khác trong 1 văn bản.

```
$ sed 's/pattern/replace_string/' file
```

```
$ cat file | sed 's/pattern/replace_string/'
```
Trong đó pattern có thể là chuỗi ký tự hoặc 1 biểu thức chính quy. Trong 1 văn bản, chuỗi cần thay thế (pattern) có thể xuất hiện từ 0 đến nhiều lần, mỗi lần như vậy được gọi là 1 xuất hiện của chuỗi cần thay thế.

2. Lưu các thay đổi vào tập tin

Mặc định, sed chỉ in ra các văn bản được thay thế. Để lưu các thay đổi này vào cùng 1 tập tin, sử dụng tùy chọn -i. 

Ghi vào tập tin mới:
```
$ sed 's/text/replace/' file > newfile
```

Ghi vào tập tin cũ:
```
$ sed -i 's/text/replace/' file
```

3. Thay thế tất cả xuất hiện của mẫu

Nếu chúng ta sử dụng các cú pháp đã đề cập ở trên, sed sẽ thay thế sự xuất hiện đầu tiên của mẫu (pattern) trong mỗi dòng. Nếu chúng ta muốn thay thế tất cả xuất hiện của mẫu trong văn bản, chúng ta cần thêm tham số g vào cuối như sau:
```
$ sed 's/pattern/replace_string/g' file
```

Hậu tố `/g` có nghĩa là nó sẽ thay thế các xuất hiện của mẫu cho đến cuối văn bản, mặc định nó sẽ bắt đầu với xuất hiện thứ 1 của mẫu.

Tuy nhiên, đôi khi chúng ta không muốn thay thế tất cả xuất hiện của mẫu, mà chỉ muốn thay thế từ xuất hiện thứ N của mẫu cho đến cuối văn bản. Để làm việc này, chúng ta có thể sử dụng dạng `/Ng` như sau:

Ví dụ:
```
$ echo thisthisthisthis | sed 's/this/THIS/2g'
thisTHISTHISTHIS
```
```
$ echo thisthisthisthis | sed 's/this/THIS/3g'
thisthisTHISTHIS
```
```
$ echo thisthisthisthis | sed 's/this/THIS/4g'
thisthisthisTHIS
```

Nếu chúng ta chỉ muốn thay thế xuất hiện thứ N của mẫu trong văn bản, sử dụng dạng /N như sau:
```
$ echo thisthisthisthis | sed 's/this/THIS/2'
thisTHISthisthis
```
```
$ echo thisthisthisthis | sed 's/this/THIS/3'
thisthisTHISthis
```
```
$ echo thisthisthisthis | sed 's/this/THIS/4'
thisthisthisTHIS
```

4. Ký tự dấu phân cách

Trong các ví dụ trên, chúng ta đã sử dụng / làm ký tự dấu phân cách của sed. Chúng ta có thể sử dụng các ký tự phân cách bất kỳ như sau:
```
$ sed 's:text:replace:g'
$ sed 's|text|replace|g'
```
Khi 1 ký tự phân cách xuất hiện bên trong mẫu, chúng ta phải thoát nó bằng việc sử dụng tiền tố `\`, như sau:
```
$ sed 's|te\|xt|replace|g'
```
5. Xóa các dòng trống

Xóa các dòng trống là 1 kỹ thuật đơn giản với việc sử dụng sed. Các khoảng trống có thể được đối chiếu với biểu thức chính quy ^$:

```
$ sed '/^$/d' file
```

/pattern/d sẽ xóa các dòng trùng khớp với pattern.

Với các dòng trống, ký hiệu kết thúc dòng xuất hiện kế bên ký hiệu bắt đầu dòng.

6. Xóa các dòng chứa 1 chuỗi bất kỳ

Để xóa các dòng có chứa 1 chuỗi bất kỳ nào đó, ta sử dụng như sau:

Ví dụ: giả sử ta muốn xóa các dòng chứa chuỗi “mobile phones” trong tập tin sentence.txt

```
$ sed 's/ [^.]*mobile phones[^.]*\.//g' sentence.txt
```

7. Ký hiệu chuỗi trùng khớp (&)

Trong sed, chúng ta có thể sử dụng & như 1 chuỗi trùng khớp cho các mẫu thay thế, theo cách này, chúng ta có thể sử dụng chuỗi trùng khớp này trong chuỗi thay thế.

```
$ echo this is an example | sed 's/\w\+/[&]/g'
[this] [is] [an] [example]
```

Ở đây, biểu thức chính quy \w\+ đối chiếu tất cả các từ trong văn bản. Sau đó, chúng ta thay thế nó với [&], & tương ứng với từ trùng khớp.

8. Kết hợp nhiều biểu thức

Thông thường để kết hợp nhiều lệnh sed với nhau, chúng ta thường sử dụng toán tử pipe (|) như sau:

```
$ sed 'expression' | sed 'expression'
```

9. Trích dẫn

Thông thường, các biểu thức của sed được trích dẫn bởi dấu ngoặc đơn ”. Nhưng dấu ngoặc kép “” cũng có thể dùng được. Dấu ngoặc kép mở rộng biểu thức bằng việc đánh giá chúng. Sử dụng ngoặc kép hữu dụng khi chúng ta muốn sử dụng 1 biến trong 1 biểu thức của sed.
```
$ text=hello
$ echo hello world | sed "s/$text/HELLO/"
HELLO world
```

Tài liệu tham khảo : https://www.codehub.vn/Tim-Kiem-va-Thay-The-Van-Ban-Su-Dung-Cau-Lenh-sed-trong-Linux


### Câu lệnh Awk

***Giới thiệu***

Awk là một ngôn ngữ lập trình hỗ trợ thao tác dễ dàng đối với kiểu dữ liệu có cấu trúc và tạo ra những kết quả được định dạng. Nó được đặt tên bằng cách viết tắt các chữ cái đầu tiên của các tác giả: Aho, Weinberger và Kernighan.

Awk thường được sử dụng cho việc tìm kiếm và xử lý text. Nó sẽ tìm kiếm một hoặc nhiều file để xem xem trong các file đó có dòng nào bao gồm những `pattern` (khuôn mẫu) cho trước hay không, sau đó thực hiện những `action` (hành động) tương ứng.

Một số đặc điểm nổi bật của Awk:

- nó xem 1 file text giống như bảng dữ liệu, bao gồm các bản ghi và các trường
- tương tự những ngôn ngữ lập trình phổ biến, Awk cũng có những khái niệm như biến, điều kiện, vòng lặp
- Awk có những toán tử số học và toán tử thao tác chuỗi

Câu lệnh được viết với Awk sẽ nhận đầu vào là một file hoặc một input có dạng chuẩn, rồi tạo ra output theo chuẩn của nó. Awk chỉ làm việc với các file text.


#### Cú pháp cơ bản
```
awk '/search pattern 1/ {Actions}
         /search pattern 2/ {Actions}' file
```
Giải thích:

- `search pattern` là một biểu thức chính quy
- `Actions` là những câu lệnh sẽ được thực hiện
- `file` là file đầu vào Awk sẽ chấp nhận một vài kiểu pattern và action.

#### Cách thức hoạt động


1. Chương trình được viết với Awk đọc file đầu vào theo từng dòng một
2. Đối với mỗi dòng, nó sẽ so khớp dòng ấy lần lượt với các `pattern`, nếu khớp thì sẽ thực hiện `action` tương ứng
3. Nếu không có `pattern` nào được so khớp thì sẽ không có `action` nào được thực hiện
4. Trong cú pháp cơ bản khi làm việc với Awk, hoặc `search pattern` có thể vắng mặt, hoặc `action` có thể vắng mặt, nhưng không được khuyết cả 2
5. Nếu không có `search pattern`, Awk sẽ thực hiện `action` đã cho đối với mỗi dòng của dữ liệu đầu vào
6. Nếu `action` vắng mặt, Awk sẽ mặc định in ra tất cả những dòng khớp với `pattern` đã cho
7. Chương trình có cặp ngoặc nhọn không chứa action nào sẽ không thực hiện gì cả, kể cả thao tác mặc định (in ra tất cả các dòng)
8. Mỗi câu lệnh trong phần `action` được phân tách nhau bởi dấu chấm phẩy

#### Thực hành 

chúng ta sẽ tạo ra file `employee.txt` để sử dụng trong các ví dụ sau

```
cat employee.txt 
100  Thomas  Manager    Sales       $5,000
200  Jason   Developer  Technology  $5,500
300  Sanjay  Sysadmin   Technology  $7,000
400  Nisha   Manager    Marketing   $9,500
500  Randy   DBA        Technology  $6,000
```

#### 1. Hành động mặc định

Theo mặc định, chương trình được viết với Awk sẽ in ra từng dòng của file đầu vào:
```
awk '{print;}' employee.txt 
100  Thomas  Manager    Sales       $5,000
200  Jason   Developer  Technology  $5,500
300  Sanjay  Sysadmin   Technology  $7,000
400  Nisha   Manager    Marketing   $9,500
500  Randy   DBA        Technology  $6,000
```
Trong ví dụ này, không có sự xuất hiện của phần `pattern`, do đó lệnh `print` được áp dụng cho toàn bộ các dòng.

2. In ra những dòng có chứa xâu mẫu

```
[root@localhost imkifu]# awk '/Thomas/
/Nisha/' employee.txt
100  Thomas  Manager    Sales       $5,000
400  Nisha   Manager    Marketing
```

Ví dụ này sẽ in ra toàn bộ những dòng có chứa cụm từ `Thomas` hoặc `Nisha`. Chương trình bao gồm 2 `pattern`. Awk sẽ chấp nhận số lượng tùy ý các `pattern`, nhưng mỗi một cặp `pattern - action` phải được viết ở một dòng riêng biệt.

#### 3. Chỉ in ra những trường nhất định

Awk được thiết kế bao gồm một vài biến dựng sẵn. Đối với mỗi bản ghi, tức là một dòng, theo mặc định nó chia bản ghi này ra thành từng phần ngăn cách nhau bởi các khoảng trắng và lưu trong các biến có dạng $n. Nếu một dòng có 4 từ, các từ ấy sẽ được lưu trong các biến `$1`, `$2`, `$3` và `$4`. `$0` đại diện cho toàn bộ dòng. `NF` là biến dựng sẵn lưu giữ giá trị tổng số trường của một bản ghi.
```
➜  ~ awk '{print $2, $5;}' employee.txt 
Thomas $5,000
Jason $5,500
Sanjay $7,000
Nisha $9,500
Randy $6,000

➜  ~ awk '{print $2, $NF;}' employee.txt
Thomas $5,000
Jason $5,500
Sanjay $7,000
Nisha $9,500
Randy $6,000
```
Ở ví dụ trên, $2 và $5 đại diện cho trường Name và Salary. Chúng ta cũng có thể lấy ra giá trị của trường Salary bằng cách sử dụng biến $NF.

#### 4. Hành động khởi tạo và kết thúc

Awk có 2 `pattern` đặc biệt được chỉ ra bởi các từ khóa `BEGIN` và `END`. Cú pháp của Awk khi sử dụng với 2 `pattern` này như sau:
```
BEGIN {Actions}
{Action} # Action for every line in a file
END {Actions}
```
Ở đây, nội dung viết sau dấu # là cú pháp comment code khi làm việc với Awk. Những hành động được chỉ định trong phần `BEGIN` sẽ được thực thi trước khi đọc dòng đầu tiên từ dữ liệu nhập vào. Những hành động được sử dụng với từ khóa `END` sẽ có tác dụng ngược lại. Ví dụ:

```
[root@localhost imkifu]# awk 'BEGIN {print "Name\tDesignation\tDepartment\tSalary";}
> {print $2,"t",$3,"\t",$4,"\t",$NF;}
> END {print "Report Generated\n-----------------";}' employee.txt 
Name	Designation	Department	Salary
Thomas t Manager 	 Sales 	 $5,000
Jason t Developer 	 Technology 	 $5,500
Sanjay t Sysadmin 	 Technology 	 $7,000
Nisha t Manager 	 Marketing 	 $9,500
Randy t DBA 	 Technology 	 $6,000
Report Generated
-----------------
```
Chương trình này đã có thêm dòng tiêu đề và dòng kết thúc cho kết quả đầu ra.
#### 5. Phép so sánh
```
awk '$1 > 200' employee.txt 
300  Sanjay  Sysadmin   Technology  $7,000
400  Nisha   Manager    Marketing   $9,500
500  Randy   DBA        Technology  $6,000
```
Đối với file ví dụ employee.txt có cấu trúc như một bảng dữ liệu, trường đầu tiên là id, tương ứng với biến $1. Do đó, nếu $1 lớn hơn 200 thì chương trình sẽ thực hiện hành động mặc định là in ra màn hình nội dung cả dòng.


#### 6. Cú pháp điều kiện

Giả sử chúng ta muốn in ra danh sách những nhân viên thuộc phòng kỹ thuật. Với ví dụ này, tên phòng ban, bộ phận làm việc tương ứng với trường thứ 4, do đó cần kiểm tra điều kiện nếu biến $4 so khớp với xâu ký tự Technology thì sẽ in ra dòng tương ứng.
```
awk '$4 ~ /Technology/' employee.txt 
200  Jason   Developer  Technology  $5,500
300  Sanjay  Sysadmin   Technology  $7,000
500  Randy   DBA        Technology  $6,000
```
Toán tử  `~` (thuật ngữ tiếng Anh tương ứng là `tilde` ) được dùng để so sánh giá trị của một trường với một biểu thức chính quy. Nếu kết quả là khớp, dòng dữ liệu đó sẽ được in ra màn hình.

#### 7. Tính toán số học

Chương trình dưới đây sẽ kiểm tra xem phòng ban có phải là phòng kỹ thuật hay không, nếu có thì giá trị của biến `count` được tăng lên 1 đơn vị. Biến này được khởi tạo giá trị ban đầu bằng 0 với từ khóa `BEGIN`.
```
[root@localhost imkifu]# awk 'BEGIN {count = 0;}
$4 ~ /Technology/ {count++;}
END {print "Number of employees in Technology Dept=", count;}' employee.txt
Number of employees in Technology Dept= 3
```
Kết thúc chương trình, giá trị của biến `count` được in ra chính là số lượng nhân viên thuộc phòng kỹ thuật.

Tài liệu tham khảo : [Link](https://viblo.asia/p/tim-hieu-awk-co-ban-gGJ59229KX2)


## Thao tác với file

### Lệnh `sort`

Câu lệnh dùng để sắp xếp nội dung của file theo bảng chữ cái abc mà ko làm thay đổi dữ liệu trong file, chỉ in ra terminal:
```
[root@localhost imkifu]# sort demo.txt 
avicii
daydreamer
dsk
i am iron man
imkifu
la la land
la la land test delete
Pewnoy
pew pew
tim bergling
Uchiha Itachi
UzumakiNaruto
[root@localhost imkifu]# cat demo.txt 
la la land
imkifu
i am iron man
dsk
tim bergling
pew pew
UzumakiNaruto
Pewnoy
avicii
Uchiha Itachi
daydreamer
la la land test delete
[root@localhost imkifu]# 
```

### Lệnh `uniq`

Lệnh này dùng để loại bỏ dòng trùng lặp nhau mà không làm thay đổi dữ liệu file. Dùng option -c để đếm sỗ lần lặp

```
[root@localhost imkifu]# sort demo.txt 
avicii
daydreamer
dsk
i am iron man
imkifu
la la land
la la land
Pewnoy
Pewnoy
pew pew
Pew Pew
tim bergling
Uchiha Itachi
UzumakiNaruto
[root@localhost imkifu]# sort demo.txt | uniq -c
      1 avicii
      1 daydreamer
      1 dsk
      1 i am iron man
      1 imkifu
      2 la la land
      2 Pewnoy
      1 pew pew
      1 Pew Pew
      1 tim bergling
      1 Uchiha Itachi
      1 UzumakiNaruto
[root@localhost imkifu]# 
```

### Lệnh `paste`

Lệnh này sẽ nối hai file với nhau theo cùng dòng

```
[root@localhost imkifu]# cat newdemo.txt 
1122
12313
241234
124234
2423453245
43242
32
34
234
235
245
2345

[root@localhost imkifu]# cat demo.txt 
la la land
imkifu
i am iron man
dsk
tim bergling
pew pew
UzumakiNaruto
Pewnoy
avicii
Uchiha Itachi
daydreamer
la la land
Pew Pew
Pewnoy
[root@localhost imkifu]# paste demo.txt newdemo.txt 
la la land	1122
imkifu	12313
i am iron man	241234
dsk	124234
tim bergling	2423453245
pew pew	43242
UzumakiNaruto	32
Pewnoy	34
avicii	234
Uchiha Itachi	235
daydreamer	245
la la land	2345
Pew Pew	
Pewnoy	
[root@localhost imkifu]# 
```

### Lệnh `join`

Lệnh này sẽ kết hợp các câu lệnh có tag giống nhau thành 

```
[root@localhost imkifu]# cat demo.txt 
1 la la land
1 imkifu
2 i am iron man
2 dsk
3 tim bergling
4 pew pew
5 UzumakiNaruto
6 Pewnoy
7 avicii
8 Uchiha Itachi
8 daydreamer
9 la la land
9 Pew Pew
9 Pewnoy
[root@localhost imkifu]# cat newdemo.txt 
1	1122
2	12313
3	241234
4	124234
5	2423453245
6	43242
7	32
8	34
9	234
10	235
11	245
12 	2345

[root@localhost imkifu]# join demo.txt newdemo.txt 
1 la la land 1122
1 imkifu 1122
2 i am iron man 12313
2 dsk 12313
3 tim bergling 241234
4 pew pew 124234
5 UzumakiNaruto 2423453245
6 Pewnoy 43242
7 avicii 32
8 Uchiha Itachi 34
8 daydreamer 34
9 la la land 234
9 Pew Pew 234
9 Pewnoy 234
[root@localhost imkifu]# 
```

### Mở rộng

Lệnh `tee` lấy output từ bất kì command nào, và trong lúc nó in ra terminal, nó cũng lưu output ý vào file mình có thể đặt tên.
```
# ls -l | tee list.txt
total 32
-rw-r--r--. 1 root root   24 Mar  3 14:42 ages.txt
-rw-------. 1 root root 1883 Jan 21 20:53 anaconda-ks.cfg
-rw-r--r--. 1 root root   74 Mar  3 14:42 names.txt
-rwxr--r--. 1 root root  102 Feb 21 16:47 script.sh
-rw-r--r--. 1 root root   74 Mar  3 14:52 tr
[root@caldera01 ~]# cat list.txt
total 32
-rw-r--r--. 1 root root   24 Mar  3 14:42 ages.txt
-rw-------. 1 root root 1883 Jan 21 20:53 anaconda-ks.cfg
-rw-r--r--. 1 root root   74 Mar  3 14:42 names.txt
-rwxr--r--. 1 root root  102 Feb 21 16:47 script.sh
-rw-r--r--. 1 root root   74 Mar  3 14:52 tr
```

Lệnh `wc` (word count) đếm số dòng, từ, chữ trong 1 file hoặc nhiều files.
```
# cat names.txt
01 Mario Rossi
02 Antonio Esposito
03 Michele Laforca
04 Antonio Esposito
[root@caldera01 ~]# wc -l names.txt
4 names.txt
[root@caldera01 ~]# wc -c names.txt
74 names.txt
[root@caldera01 ~]# wc -w names.txt
12 names.txt
```
The `cut` command is used for manipulating column-based files and is designed to extract specific columns. The default column separator is the tab character. A different delimiter can be given as a command option.
```
# cut -d" " -f1 names.txt
01
02
03
04
# cut -d" " -f2 names.txt
Mario
Antonio
Michele
Antonio
# cut -d" " -f3 names.txt
Rossi
Esposito
Laforca
Esposito
```

The `head` reads the first few lines of each named file (10 by default) and displays it on standard output.
```
# head -n 2 names.txt
01 Mario Rossi
02 Antonio Esposito
```

The `tail` prints the last few lines of each named file and displays it on standard output. By default, it displays the last 10 lines.
```
# tail -n 2 names.txt
03 Michele Laforca
04 Antonio Esposito
#
# tail -f -n3 /var/log/messages
Mar  3 14:38:59 caldera01 systemd: Started Session 35 of user root.
Mar  3 15:01:01 caldera01 systemd: Starting Session 36 of user root.
Mar  3 15:01:01 caldera01 systemd: Started Session 36 of user root.
```

The `grep` comand is extensively used as a primary text searching tool. It scans files for specified patterns and can be used with regular expressions.
```
# grep Ant* names.txt
02 Antonio Esposito
04 Antonio Esposito
```

Tham khảo ở link [này](https://viblo.asia/p/tim-hieu-ve-command-grep-EoDGQqPPGbV)

[Tham khảo mở rộng](https://viblo.asia/p/su-dung-grep-va-bieu-thuc-chinh-quy-de-tim-kiem-text-gDVK2k3rZLj)

