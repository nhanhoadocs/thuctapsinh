# Bash Shell Programming

**Shell** là trình thông dịch dòng lệnh cung cấp giao diện người dùng cho các cửa sổ terminal. Nó cũng có thể được dùng để chạy các *script*, ngay cả trong các phiên không tương tác mà không có cửa sổ terminal, như thể các lệnh được nhập trực tiếp.

Ví dụ 1 file *script*:
```
#!/bin/bash
echo "Xin chao !"
```

Dòng đầu tiên của file *Script* sẽ bắt đầu với `#!/bin/bash` chứa đường dẫn đầy đủ của trình thông dịch lệnh sẽ được sử dụng trên file. Trình thông dịch lệnh được giao nhiệm vụ thực thi các câu lệnh tuân theo nó trong *script*. Các trình thông dịch thường sử dụng là:

```
/usr/bin/perl
/bin/bash
/bin/csh
/bin/tcsh
/bin/ksh
/usr/bin/python
/bin/sh
```

*Script* không chỉ giới hạn trong trình thông dịch *shell*. Nó còn có thể sử dụng cho các *script* Python:
```
[root@localhost ~]# ll script1.sh
-rwxr-xr-x. 1 root root 55 Dec 16 14:58 script1.sh

[root@localhost ~]# cat script1.sh
#!/usr/bin/python
print "Welcome to the Python script"

[root@localhost ~]# ./script1.sh
Welcome to the Python script
```

Script cũng có thể tương tác với người dùng:
```
[root@localhost ~]# cat script.sh
#!/bin/bash
   echo "ENTER YOUR NAME"
   read sname
   echo "WELCOME "$sname"!"
[root@localhost ~]# ./script.sh
ENTER YOUR NAME
Hai
WELCOME Hai!
```

Mọi lệnh *shell* đều trả về 1 giá trị khi kết thúc thực hiện. Giá trị này có thể được đặt bằng câu lệnh `exit`. Giá trị trả về cho phép một quá trình giám sát trạng thái thoát của một quá trình khác thường trong mối quan hệ cha-con. Điều này giúp xác định cách quá trình này kết thúc và thực hiện bất cứ bước thích hợp nào cần thiết, phụ thuộc vào kết quả thành công hay thất bại.

**Quy ước**: thành công trả về giá trị 0, còn thất bại sẽ là một giá trị khác 0. Giá trị trả về luôn được lưu trữ trong biến `$`.

Ví dụ:
```
[root@localhost ~]# cat Test.txt
1 A
2 B
3 C
4 D
5 E
6 A
[root@localhost ~]# echo $?
0           //-> khi thành công


[root@localhost ~]# cat Test
cat: Test: No such file or directory
[root@localhost ~]# echo $?
1           //-> khi thất bại
```



## Basic Syntax(Cú pháp cơ bản)
*Script* yêu cầu bạn tuân theo 1 cú pháp ngôn ngữ tiêu chuẩn. Các quy tắc mô tả cách xác định các biến và xây dựng và định dạng các câu lệnh được phép,...

Bảng liệt kê một số cách sử dụng kí tự đặc biệt với *bash script*:

|Kí tự đặc biệt|Mô tả|
|-|-|
|`#`|Dùng để thêm comment, ngoại trừ khi sử dụng `#` hoặc `#!` khi bắt đầu 1 *script*|
|`|`|Sử dụng ở cuối dòng để biểu thị tiếp tục cho dòng tiếp theo|
|`;`|Sử dụng để giải thích những gì sau 1 lệnh mới|
|`$`|Chỉ ra đây là 1 biến|

Thi thoảng bạn muốn nhóm nhiều lệnh trên cùng 1 dòng. Kí tự `;` được sử dụng để phân cách những lệnh này và thực hiện chúng một cách tuần tự như thể chúng được gõ trên từng dòng riêng biệt.

3 lệnh trong ví dụ sau sẽ thực hiện ngay cả khi các lệnh trước chúng không thành công:
```
$ make ; make install ; make clean
```

Tuy nhiên, nếu muốn hủy bỏ các lệnh sau nếu thất bại. Ta có thể dùng các toán tử và (`&&`) như sau. Nếu lệnh đầu tiên thất bại, lệnh thứ 2 sẽ không bao giờ được thực thi. 
```
$ make && make install && make clean
```

Sử dụng toán tử hoặc (`||`). Trong trường hợp này, bạn tiến hành cho đến khi một lệnh nào đó thành công và sau đó bạn ngừng các bước tiếp theo.
```
$ cat file1 || cat file2 || cat file3
```

## Functions
Function là khối mã lệnh thực hiện 1 tập hợp các hoạt động. Các function rất hữu ích để thực hiện các thủ tục nhiều lần với các biến đầu vào khác nhau. Các function thường được gọi là chương trình con. Sử dụng function trong `script` yêu cầu 2 bước:
1. Khai báo Function
2. Gọi Function

**Khai báo Function**
```
<tên_function> () {
    command...
}
```

Ví dụ: function thực hiện in ra màn hình chữ *"Hello"* và có tên là *display*:
```
display () {
    echo "Hello"
}
```

Function không giới hạn độ dài và có chứa nhiều câu lệnh. Sau khi xác định, function có thể được gọi nhiều lần nếu cần thiết. Dưới đây là ví dụ đầy đủ về một sàng lọc thường được sử dụng: làm thế nào để truyền một đối số cho function. Đối số thứ 1, thứ 2, ... được đặt là `$1`, `$2`, ..., `$n`. Tên script là `$0`. Tất cả tham số được gọi là `$*` và tổng đối số là `$#`:

```
[root@localhost ~]# cat script.sh
#!/bin/bash
echo Ten chuong trinh: $0
echo Doi so dau tien truyen tu dong lenh: $1
echo Doi so thu 2 truyen tu dong lenh: $2
echo Doi so thu 3 truyen tu dong lenh: $3
echo Tat ca doi so duoc truyen tu dong lenh: $*
echo Tat ca duoc thuc hien voi : $0
exit 0

//Điền giá trị các đối số
[root@localhost ~]# ./script.sh A B C
Ten chuong trinh: ./script.sh
Doi so dau tien truyen tu dong lenh: A
Doi so thu 2 truyen tu dong lenh: B
Doi so thu 3 truyen tu dong lenh: C
Tat ca doi so duoc truyen tu dong lenh: A B C
Tat ca duoc thuc hien voi : ./script.sh

//Không điền giá trị các đối số
[root@localhost ~]# ./script.sh
Ten chuong trinh: ./script.sh
Doi so dau tien truyen tu dong lenh:
Doi so thu 2 truyen tu dong lenh:
Doi so thu 3 truyen tu dong lenh:
Tat ca doi so duoc truyen tu dong lenh:
Tat ca duoc thuc hien voi : ./script.sh
```

## Command substitution (Lệnh thay thế)
Bạn có thể thay thế kết quả của 1 lệnh như 1 thành phần của 1 lệnh khác. Nó có thể được thực hiện theo 2 phương thức:
1. Kèm lệnh bên trong ngoặc `()`
2. Kèm theo lệnh bên trong bằng `$()`

Bất kể phương thức nào, lệnh trong cùng sẽ được thực thi trong môi trường shell mới được khỏi chạy và đầu ra tiêu chuẩn của shell sẽ được chèn vào nơi thực hiện thay thế lệnh. Hầu như lệnh nào cũng có thể thực thi theo cách này. Cả 2 phương thức này đều cho phép thay thế lệnh. Tuy nhiên phương thức thứ 2 cho phép lồng các lệnh vào nhau.

```
[root@localhost ~]# cat count.sh
#!/bin/bash
echo "The " $1 " contains " $(wc -l < $1) " lines."
echo $?
[root@localhost ~]# ./count.sh /var/log/messages
The  /var/log/messages  contains  5711  lines.
0
```
-> Đầu ra lệnh bên trong trở thành đối số cho lệnh bên ngoài.

## Câu lệnh `if`
Một câu lệnh điểu kiện mà bất kì ngôn ngữ lập trình hay script nào đều cần phải có. Khi sử dụng `if`, các hành động tiếp theo sẽ phụ thuộc vào điều kiện của câu lệnh `if` đã được chỉ định cụ thể như:
- So sánh số hoặc chuỗi kí tự
- Trả về giá trị của lệnh(0 là thành công)
- Sự tồn tại của tập tin hay quyền.
- ....

### Cú pháp rút gọn: 
```
if TEST-COMMANDS; then CONSEQUENT-COMMANDS; fi
```

### Dạng chung hơn:
```
if condition
then
       statements
else
       statements
fi
```

Ví dụ: Kiểm tra sự tồn tại 1 file. Nếu file đó tồn tại thì in ra số dòng của file đó.
```
[root@localhost ~]# cat count.sh
#!/bin/bash
if [ -f $1 ]
then
    echo "The " $1 " contains " $(wc -l < $1) " lines.";
    echo $?
fi

[root@localhost ~]# ./count.sh /root/Test.txt
The  /root/Test.txt  contains  6  lines.
0
```

**Các option dùng để kiểm tra file:**

|Option|Mô tả|
|-|-|
|-e file|Kiểm tra nếu tập tin tồn tại|
|-d file|Kiểm tra nếu tập tin là một thư mục|
|-f file|Kiểm tra nếu tập tin là một tập tin thông thường|
|-s file|Kiểm tra nếu tập tin có kích thước khác 0|
|-g file|Kiểm tra nếu tập tin đã được thiết lập sgid|
|-u file|Kiểm tra nếu tập tin đã được thiết lập suid|
|-r file|Kiểm tra nếu tập tin có thể đọc được|
|-w file|Kiểm tra nếu tập tin có thể ghi được|
|-x file|Kiểm tra nếu tập tin có thể thực thi|

So sánh các chuỗi:
```
if [ string1 == string2 ]
then
   ACTION
fi
```

So sánh các số:
```
if [ exp1 OPERATOR exp2 ]
then
   ACTION
fi
```

**Các option so sánh:**

|Option|Mô tả|
|------|-----|
|-eq|bằng|
|-ne|không bằng|
|-gt|lớn hơn|
|-lt|nhỏ hơn|
|-ge|lớn hơn hoặc bằng|
|-le|nhỏ hơn hoặc bằng|
