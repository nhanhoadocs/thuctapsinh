# Shell là gì ?

Về cơ bản, SHELL (hay còn gọi là hệ vỏ) là một interface nằm giữa OS Kernel và người dùng, nó cung cấp môi trường để người dùng thao tác với Kernel. Các chương trình shell sẽ làm nhiệm vụ thông dịch (interpret) các lệnh của người dùng sang chương trình có sẵn trên hệ thống từ đó thực thi các chức năng tương ứng. Các lệnh này người dùng có thể nhập trực tiếp qua chế độ tương tác (interactive) hoặc thông qua dạng script. Các shell script sẽ được thông dịch (chứ không phải biên dịch – compile). Điểm khác biệt giữa cách thức hoạt động của shell và trình biên dịch (compiler) đó là:

- Shell đọc các lệnh trong script tuần tự từ trên xuống, tìm vị trí các lệnh đó trong hệ thống để thực thi.
- Compiler sẽ biên dịch các lệnh trong script sang một dạng mà máy tính có thể hiểu được, ví dụ mã máy và sinh ra một chương trình (program) tương ứng. Chương trình này sẽ có thể được sử dụng bởi các shell script sau này.

**Chú thích**: biên dịch và thông dịch khác nhau như nào:
``` 
Biên dịch là dịch một lần hết toàn bộ mã nguồn của một chương trình còn thông dịch là chạy đến câu lệnh nào thì dịch câu lệnh đó. Ví dụ cổ điển là thông dịch giống như một thông dịch viên dịch tiếng Việt sang tiếng Anh cho một người nước ngoài trong khi giao tiếp trực tiếp, khi họ nghe đến câu nào thì dịch đến câu đó, còn biên dịch giống như dịch một cuốn sách, sau khi dịch toàn bộ cuốn sách mới đem tới cho người đọc.
```

# Shell script là gì

Shell là chương trình giao tiếp với người dùng. Có nghĩa là shell chấp nhận các lệnh từ bạn (keyboard) và thực thi nó. Nhưng nếu bạn muốn sử dụng nhiều lệnh chỉ bằng một lệnh, thì bạn có thể lưu chuỗi lệnh vào text file và bảo shell thực thi text file này thay vì nhập vào các lệnh. Điều này gọi là shell script.

Định nghĩa: Shell script là một chuỗi các lệnh được viết trong plain text file. Shell script thì giống như batch file trong MS-DOS nhưng mạnh hơn.

Tại sao phải viết shell script:

• Shell script có thể nhận input từ user, file hoặc output từ màn hình.

• Tiện lợi để tạo nhóm lệnh riêng.

• Tiết kiệm thời gian.

• Tự động làm một vài công việc thường xuyên.

# Các loại Shell

Các loại shell thông dụng

- Shell Bourne (sh)
Do Steven Bourne viết, đó là Shell nguyên thuỷ có mặt trên hầu hết các hệ thống Unix/Linux…Nó rất hữu dụng cho việc lập trình Shell nhưng nó không xử lý tương tác người dung như các Shell khác…

- Bourne Again Shell (bash)
Đây là phần mở rộng của sh, nó kế thừa những gì sh đã có và phá huy những gì sh chưa có…Nó có giao diện lập trình rất mạnh và linh hoạt…Cùng với giao diện lệnh dễ dung…Đây là Shell được cài đặt mặc định trên các hệ thống Linux.

- Shell C (csh)
Đáp ứng tương thích cho người dung…Nó hỗ trợ rất mạnh cho những Programmer C…và với đặc tính tự động hoàn thành dòng lệnh…

- Shell Korn (ksh)
Có thể nói đây là một Shell tuyệt vời, nó kết hợp tính năng ưu việt của sh và csh…

Ngoài ra còn có các shell khác như sh, nfssh, mcs, zsh, ...

Ở bài viết này chúng ta sẽ nói chủ yếu về `bash`

#  Cấu trúc file bash

Dòng đâu tiên và bắt buộc với một file bash với đuôi mở rộng là .sh là câu lệnh sau :
```
#!/bin/bash#

// tiếp theo là những câu lệnh thực thi  
```

# Thực hành lab

chúng ta cần chuẩn bị máy tính chạy hệ điều hành Linux, trình soạn thảo. Ở đây tôi dùng Centos 7 và trình soạn thảo vim

## Tạo file bash đầu tiên
```
vim hello.sh
```

sau khi tạo file chúng ta viết vào file nội dung sau đây
```
#!/bin/bash
echo Hello World
```

sau đó ta cấp quyền thực thi cho file
```
chmod +x hello.sh 
```

cuối cùng chúng ta cho chạy file
```
./hello.sh
```
Kết quả ta nhận được là dòng chữ `Hello World` hiện ra terminal

### Lệnh so sánh với số
| Cú pháp | Ý nghĩa |
|---------|---------|
n1 -eq n2 |	Kiểm tra n1 = n2
n1 -ne n2 |	Kiểm tra n1 khác n2
n1 -lt n2 |	Kiểm tra n1 < n2
n1 -le n2 |	Kiểm tra n1 <= n2
n1 -gt n2 |	Kiểm tra n1 > n2
n1 -ge n2 |	Kiểm tra n1 >= n2

### Lệnh so sánh với chuỗi
| Cú pháp |	Ý nghĩa |
|---------|---------|
| s1 = s2 |	Kiểm tra s1 = s2
| s1 != s2 |	Kiểm tra s1 khác s2
| -z s1    |	Kiểm tra s1 có kích thước bằng 0
| -n s1    |Kiểm tra s1 có kích thước khác 0
| s1 	|   Kiểm tra s1 khác rỗng

### Toán tử kết hợp
| Column 1 |	Column 2
|----------|-------------|
| ! |	Phủ định (not)
-a 	|Và (and)
-o 	|Hoặc (or)

### Lệnh kiểm tra file (nói chung cho cả tệp và thư mục)
| Cú pháp |	Ý nghĩa
|---------|----------
-f file 	|Kiểm tra xem file có phải là tệp hay không
-d file 	|Kiểm tra xem file có phải là thư mục hay không
-r file 	|Kiểm tra file có đọc (read) được hay không
-w file 	|Kiểm tra file có ghi (write) được hay không
-x file 	|Kiểm tra file có thực thi (execute) được hay không
-s file 	|Kiểm tra file có kích thước lớn hơn 0 hay không
-e file 	|Kiểm tra xem file có tồn tại hay không

## Câu lệnh if

Cú pháp :
```
if điều_kiện
then
câu lệnh 1
…
fi
```

## if...else...fi

Cú pháp:
```
if điều_kiện then
	câu_lệnh_1
….
else
	câu_lệnh_2
fi
```

**demo** :
```
[root@naruto hokage7th]# cat ./demo1.sh 
#!/bin/bash 
choice=$1
echo Your choice is $choice

if [ $choice -lt 5 ]
then
echo Your number you choice smaller than 5
elif [ $choice -eq 5 ]
then
echo Your number you choice is equal with 5
else 
echo Your number you choice is bigger than 5
fi

[root@naruto hokage7th]# ./demo1.sh 8
Your choice is 8
Your number you choice is bigger than 5
[root@naruto hokage7th]# ./demo1.sh 5
Your choice is 5
Your number you choice is equal with 5
[root@naruto hokage7th]# ./demo1.sh 3
Your choice is 3
Your number you choice smaller than 5
[root@naruto hokage7th]# 
```

## Vòng lặp For

Cú pháp:
```
for { tên biến } in { danh sách }
do
# Khối lệnh
# Thực hiện từng mục trong danh sách cho đến cho đến hết
# (Và lặp lại tất cả các lệnh nằm trong "do" và "done")
done

#hoặc sử dụng for
for (( expr1; expr2; expr3 ))
do
# Lặp cho đến khi biểu thức expr2 trả về giá trị TRUE
done
```

**demo**
```
#  for 1
for i in 1 2 3 4 5
do
 echo $i
done

#output: 1 2 3 4 5

#for 2
for (( i = 0 ; i <= 5; i++ )) # bao quanh bằng (())
do
echo $i
done
#ouput 1 2 3 4 5
```

##  Vòng lặp While

Cú pháp
```
while	[Điều kiện]
do
command1
command2
command3	..	....
done
```

**demo** :
```
#!/bin/sh
echo "Nhap vao cac so can tinh tong, nhap so am de exit"
sum=0
read i
while [ $i -ge 0 ] # nếu i >= 0
do
sum=`expr $sum + $i`
read i # nhận giá trị từ người dùng
done
echo "Total: $sum."
```
Kết quả sau khi chạy ./demo1.sh
#ouput
./demo1.sh
Nhap vao cac so can tinh tong, nhap so am de exit
```
1
5
4
-1
Total= 10.
```
    
## Biến hệ thống

| Kí hiệu | Ý nghĩa |
|---------------|---------|
| $0 | Tên của file  Bash script.
| $1 - $9 | lần lượt là các đối số truyền vào cho file Bash script.
| $# | Số lượng các  argu | ments chúng ta truyền vào cho file the Bash script.
| $@ | Tất cả các đối số cung cấp cho file  Bash script.
| $? | Trạng thái của câu lệnh thực hiện gần nhất ( 0 -> true , 1 -> false ) 
| $$ | ID của script hiện tại .
| $* | In ra danh sách tất cả các đối số truyền vào dưới dạng 1 chuỗi |

## Các trình thay thế trong shell

là cách để bạn có thể xử lý các ký tự đặc biệt, ví dụ:
```
a=10
b=20
echo -e "Value of a is $a \n and value of b is $b"
```
Kết quả in ra sẽ là
```
Value of a is 10

and value of b is 20
```
Vậy `-e` cho phép bạn hiểu ký tự `\n` là ký tự xuống dòng. Bỏ `-e` để thấy sự khác biệt. Tương tự với `\n` bạn có thể thao tác với các ký tự đặc biệt khác.
| Kí hiệu | Ý nghĩa |
|---------|---------|
|\\ 	|Dấu chéo ngược
|\a 	|Dấu hiệu cảnh báo (BEL)
|\b |	Phím lùi (backspace)
|\c |	Gạch chéo xuống dòng
|\f 	|form feed
|\n 	|Dòng mới
|\r |	Quay trở lại
|\t 	|Tab ngang
|\v 	|Tab dọc



### Thay thế lệnh
```
DATE=`date`
echo "Date is $DATE"
```

Kết quả : 
```
Date is Thứ sáu, 14 Tháng 9 năm 2018 05:50:00 +07
```
cú pháp `command` (dấu nháy dưới phím Esc) cho phép bạn lấy kết quả của 1 command gán vào 1 biến.

### Trình thay thế biến
```
#!/bin/sh

echo ${var:-"Variable is not set"}
echo "1 - Value of var is ${var}"

echo ${var:="Variable is not set"}
echo "2 - Value of var is ${var}"

unset var
echo ${var:+"This is default value"}
echo "3 - Value of var is $var"

var="Prefix"
echo ${var:+"This is default value"}
echo "4 - Value of var is $var"

echo ${var:?"Print this message"}
echo "5 - Value of var is ${var}"
```
Kết quả
```
    Variable is not set

    1 - Value of var is

    Variable is not set

    2 - Value of var is Variable is not set

    3 - Value of var is

    This is default value

    4 - Value of var is Prefix

    Prefix 5 - Value of var is Prefix

```

| Mẫu 	| Mô tả |
|-------|-------|
${var} 	|Thay thế giá trị của var
${var:-word} 	|Nếu var là null hoặc unset, thì word được thay thế cho var. Giá trị của var không thay đổi.
${var:=word} 	|Nếu var là null hoặc unset, var được thiết lập là giá trị của word .
${var:?message} 	|Nếu var là null hoặc unset, message được in là lỗi. Lệnh này kiểm tra xem các biến có được thiết lập đúng không.
${var:+word} 	|Nếu var được thiết lập, word được thay thế cho var. Giá trị của var không thay đổ


## Function
Cú pháp
```
function_name () { 
   list of commands
}
```

Ví dụ
```
said () {
	echo "Hello Phuc"
}

said
```
```
Hello Phuc
```

### Truyền tham số cho function
```
said () {
	echo "Hello $1 $2"
}

said Phuc Phuong
```

### Return kết quả từ một hàm
```
sum () {
 	a=$(($1 + $2))
	return $a
}

sum 10 20

ret=$?

echo "value is $ret"
```

### Gọi một function trong một function khác
```
number_one () {
   echo "This is the first function"
   number_two
}

number_two () {
   echo "This is now the second function"
}

number_one
```


Nguồn tham khảo :

https://cloudcraft.info/lap-trinh-bash-shell-co-ban-phan-1/

https://viblo.asia/p/cac-kien-thuc-co-ban-ve-shell-scripts-djeZ19OmZWz#_mot-so-concepts-quan-trong-ve-shell-2

https://viblo.asia/p/tim-hieu-lap-trinh-shell-linux-p1-wjAM7ydbvmWe#_i-shell-script-la-gi-0

https://viblo.asia/p/lap-trinh-shell-bash-script-1VgZvER9KAw


https://viblo.asia/p/lap-trinh-shell-phan-2-eW65GEVOZDO

https://quantrimang.com/trinh-thay-the-shell-156627

http://www.justpassion.net/tech/programming/bash-shell/ham-trong-bash-shell.html

https://viblo.asia/p/don-gian-hoa-tac-vu-trong-linux-voi-bash-script-phan-1-gGJ59gaGZX2