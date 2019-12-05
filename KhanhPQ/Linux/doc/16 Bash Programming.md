# I)	Bash shell programming
Trình thông dịch giữa người dùng và OS

1 OS có nhiều shell khác nhau . Điển hình trên Linux là bash.Ngoài bash ra ta có thể sử dụng python để viết các script

shell script là 1 tập hợp các lệnh được viết trên 1 file -> shell sẽ thực hiện chạy file đó thay vì việc ta phải nhập từng lệnh -> tự động hóa 1 số công việc


Tạo và chạy 1 file shell script :

+) Tạo 1 file -> Dùng trình soạn thảo để mở và chỉnh sửa file

+) Dòng đầu tiên của file cần khai báo path shell cụ thể sử dụng trong chương trình. Thường sẽ là #!/bin/sh hoặc #!/bin/bash (đối với bash. đối với các shell khác thì sẽ khác)

+) Thêm quyền thực thi cho file (chmod)

+) Chạy file script bằng 1 trong 3 cách sau ./tên_file;bash tên_file hoặc sh tên_file
 
 

Ngoài ra ta có thể tương tác với script thông qua các biến được nhập vào từ bàn phím khi thực thi script:
 

Khi thực thi xong shell script -> luôn trả về 1 giá trị để thông báo xem việc thực thi có thành công hay không	-> Lưu tại biến $?
$? = 0	-> việc thực thi thành công
$? != 0	-> Thực thi thất bại 
 


# II)	Basic Syntax

## 1)	Biến,mảng

VARIABLE_NAME=variable_value	(không cách,tên biến viết hoa)


Khi shell chạy.Có 3 loại biến chính:

Local Variables

Environment Variables

Shell Variables


Ex1:	

NAME=”khanh”

echo $NAME
  
  
Ex2: Biến chỉ đọc -> Không thay đổi được

NAME="Zara Ali"

readonly NAME

NAME="Qadiri"

--> /bin/sh: NAME: This variable is read only.


Ex3: hủy bỏ 1 biến

unset variable_name

#!/bin/sh

NAME="Zara Ali"

unset NAME

echo $NAME

-> Sẽ không hiển thị gì khi chạy script

-> Không dùng unset cho các biến readonly


Ex4: 1 số Special Variable

#!/bin/sh

echo "File Name: $0"

echo "First Parameter : $1"

echo "Second Parameter : $2"

echo "Quoted Values: $@"

echo "Quoted Values: $*"

echo "Total Number of Parameters : $#"


Here is a sample run for the above script −

$./test.sh Zara Ali

File Name : ./test.sh

First Parameter : Zara

Second Parameter : Ali

Quoted Values: Zara Ali

Quoted Values: Zara Ali

Total Number of Parameters : 2


#!/bin/sh

for TOKEN in $*

do

   echo $TOKEN
   
done

Here is a sample run for the above script −

$./test.sh Zara Ali 10 Years Old

Zara

Ali

10

Years

Old


Ex5: Mảng

array_name=(value1 ... valuen)

Sử dụng:	${array_name[index]}

 


2) Cần tuân thủ 1 số quy tắc,cú pháp tiêu chuẩn


Character	Description

#	Sử dụng để thêm comment, Chỉ có ngoại lệ khi ta sử dụng #, or as #! khi bắt đầu script để khai báo path shell

|	sử dụng ở cuối dòng để biểu thị kéo dài biểu thức tiếp ở dòng tiếp theo

;	Phân tách các lệnh ra ( khi viết trên cùng 1 dòng).

$	Đánh dấu đó là biến


Ex:

$make;make install;make clean

Các lệnh sẽ vẫn chạy dù 1 trong 3 lệnh bị lỗi

$make && make install && make clean

Nếu 1 trong 3 lệnh bị lỗi thì cả 3 lệnh không chạy

$cat file1 || cat file2 || cat file 3

Chạy từng lệnh . Nếu 1 lệnh thực thi thành công thì dừng .Còn nếu sai -> thực hiện tiếp đến các lệnh tiếp theo

# III)	Function

Function là 1 khối code thực hiện 1 nhiệm vụ,thủ tục ( hữu ích khi thực hiện nhiều lần vs các biến đầu vào giống/khác nhau)

2 bước:

+) Khai báo, viết 1 hàm

+) Gọi và sử dụng hàm đó

Cú pháp:

function_name () {

       command...
       
    }


Ex:

display () {

       echo "This is a sample function"
       
    }


Đôi khi ta cần truyền các đối số cho function.

Các đối số được đánh thứ tự $1,$2,….$n

Tên của script được lưu tại $0

Tất cả các đối số $*

Tổng tất cả các đối số $#


# IV)	Thay thế Lệnh (command substituation)

Đôi khi ta cần chèn các lệnh vào giữa các lệnh trong script

	SỬ dụng (‘)

	hoặc sử dụng $()	-> Nên dùng cách này vì nó có thể lồng thêm lệnh vào bên trong nó


Các lệnh được chèn vào script sẽ được thực hiện trước các câu lệnh chứa nó khi script được thực thi

Đầu ra của lệnh bên trong thành đối số của lệnh bên ngoài
 



V)	If statement

Ở dạng rut gọn:	if TEST-COMMANDS; then CONSEQUENT-COMMANDS; fi

Dạng phổ biến hay dùng:

	if condition
  
	then
  
      		statements
          
	else
  
       		statements
          
	fi

 






1 số option cho việc check file


Option	Action

-e file	Kiểm tra xem file có tồn tại hay không

-d file	Kiểm tra  xem đó có phải 1 dir hay không

-f file	Kiểm tra xem đó có phải 1 file không

-s file	Kiểm tra xem size file có khác 0 hay không

-g file	Check if the file has sgid set.

-u file	Check if the file has suid set.

-r file	Kiểm tra xem file có đọc được hay không

-w file	Kiểm tra xem file có ghi được hay không

-x file	Kiểm tra xem file có thực thi được hay không





CŨng có thể sử dụng if để so sánh chuỗi: 

if [ string1 == string2 ]

then

   ACTION
   
fi


So sánh chuỗi

Cú pháp	Ý nghĩa

s1 = s2	kiểm tra s1 = s2

s1 != s2	kiểm tra s1 khác s2

-z s1	Kiểm tra s1 có kích thước bằng 0

-n s1	Kiểm tra s1 có kích thước khác 0

s1	Kiểm tra s1 khác rỗng












Hoặc so sánh số:

 if [ exp1 OPERATOR exp2 ]
 
then

   ACTION
   
fi

Option	Action

-eq                       So sánh bằng

-ne                        So sánh không bằng

-gt	                          >

-lt	                          <

-ge	                          >=

-le	                           <=








 





Phép tính

Cú pháp	Ý nghĩa

expr n1 + n2	n1 + n2

expr n1 - n2	n1 - n2

expr n1 / n2	n1 / n2

expr n1 * n2	n1 nhân n2

Lưu ý trong phép kiểm tra nếu phép kiểm tra là đúng thì kết quả trả về là 0 còn sai thì kết quả trả về là khác 0

