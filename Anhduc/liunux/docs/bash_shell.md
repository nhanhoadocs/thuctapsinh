# 1. Khái niệm
a) shell 
- shell là một chương trình của linux. Nó là một bộ diễn dịch ngôn ngữ lệnh, Nó tận dụng triệt để các trình tiện ích và chương trình ứng dụng có trên hệ thống 
- Một số loại shell phổ biến 
    - shell bourne(sh) : đây là shell có mặt trên hầu hết các hệ thống linux nó rất hữu ích cho việc lập trình shell nhưng độ tương tác người dùng thấp 
    - Bourne again shell(bash): Đây là phiên bản nâng cấp của (sh) được nâng cấp giao diện lệnh dễ dùng và là loại shell được cài mặc định trên các linux 
    - Shell C(csh): Đáp ứng tương thích cho người dùng và có tính hỗ trợ cao cho chương trình C và với đặc tính tự động hoàn thành dòng lệnh,
    - Shell korn(ksh): Nó là một loại shell kết hợp tính năng của sh và csh 
- Shell script: là một file chứa một chuỗi các lệnh được viết trong file text và shell thực thi file này thay vì gõ lệnh vào shell 
- Các bước để tạo ra một shell script
    - Tạo một file 
    ```
    anhduc@anhduc:~/Desktop$ touch test.sh
    ```
    - ở đầu một file thì ta cần phải khai báo file là một file shell script thì thường sẽ là `#!/bin/bash` hoặc `#!/bin/sh`
    - Sau ghi viết xong file thì ta cần chạy file
    ```
    anhduc@anhduc:~/Desktop$ bash test.sh 
    hello world
    ```
# 2) Khai báo biến
- Biến được gán trực tiếp. Giá tị của biến có thể là số hoặc là một chuỗi ký tự. Cú pháp
```
(tên biến)=(giá trị)
```
- Lưu ý giữa tên biến dấu bằng và giá trị không được có dấu cách 
- Nếu giá trị là một chuỗi ký tự thì cần đặt trong `""`
- Để gọi giá trị biến đã gán ta sử dụng ký tự `$` phía trước tên biến có thể sử dụng một trong 2 cách `$tên_biến` hoặc là `${tên biến}`
### Một số biến đặc biệt
- có một số biến mà ta không cần gán giá trị trưc tiếp cho nó. Ta chỉ cần gọi nó ra còn giá trị của nó tùy thuộc vào lúc ta chạy chương trình `./tên_file (chuỗi ký tự)` Thì các biến đặc biệt đó là
    - `$#` sẽ trả về tổng số từ của chuỗi 
    - `$0` trả về `tên file` 
    - `$1` trả về từ đầu tiên của chuỗi 
    - `$2` trả về từ thứ 2 của chuỗi.......
    - `$9` trả về từ thứ 9 của chuỗi
    - `$@` trả về một chuỗi đầy đủ 
- Ví dụ file sau 
```
#!/bin/sh
echo "I was called with $# parameters"
echo "My name is $0"
echo "My first parameter is $1"
echo "My second parameter is $2"
echo "All parameters are $@
```
- Kết quả trả về khi chạy file 
```
anhduc@anhduc:~/Desktop$ ./test.sh a b c
I was called with 3 parameters
My name is ./test.sh
My first parameter is a
My second parameter is b
All parameters are a b c
```
# 3) vòng lặp 
### a)for 
```
for biến in giá_trị
do 
    lệnh
done
```
`giá_trị` có thể gồm nhiều giá trị ngăn cách nhau bởi dấu cách

Hoặc
```
for (( expr1; expr2; expr3 ))
do 
    lệnh (lệnh ở đây được thự hiện cho đến biểu thức expr2 là sai)
done
```
### b)while
```
while [ điều kiện ]
do
    lệnh
done
```
### c)If
```
if [ điều kiện ]
then
    lệnh nếu điều kiện đúng
else
    lệnh nếu điều kiện sai
fi
```
hoặc 
```
if [ điều kiện ]
then
    lệnh nếu điều kiện đúng
fi
```
- Với trường hợp này nếu điều kiện đúng thì thực hiện lệnh còn điều kiện sai thì thoát khỏi vòng lặp

- Hoặc ta có thể lồng nhiều điều kiện vào với nhau bằng cách
```
if [ điều kiện ]
then
    lệnh nếu điều kiện đúng
elif [ điều kiện tiếp theo nếu điều kiện trên là sai ]
then
    lệnh nếu điều kiện đầu sai điều kiện sau đúng
else
    lệnh nếu ko thỏa nãn bất kỳ điều kiện nào
fi
```
### d)case 
```
case điều_kiện in
    TH1) 
        lệnh
        ;;
    TH2)
        lệnh
        ;;
    .......
    THn)
        lệnh
        ;;
    *)
        lệnh
        ;;
esac
```
- trong đó * ở trường hợp cuối cùng thể hiện những trường hợp không trùng với trường hợp nào được liệt kê ở trên.

- Chú ý ta có thể đặt các vòng lặp lồng vào nhau để giải quyết một bài toán cụ thể.
# 4)Cấu trúc
Để tránh việc lặp đi lặp lại một đoạn code ta có thể đặt nó trong một cấu trúc và những lần sau muôn sử dụng lại ta chỉ cần gọi lại nó
```
!#/bin/sh

tên()
{
    lệnh
}

# đoạn thân code

# muốn gọi lại cấu trúc bên trên
tên $đối_số
```
# 5)Phép kiểm tra so sánh 
### a)Lệnh kiểm tra file
|Cú pháp|Ý nghĩa|
|-------|-------|
|-f file|kiểm tra xem có phải là file hay không|
|-d file|kiểm tra xem có phải thư mục hay không|
|-r file|kiểm tra xem file có đọc được không|
|-w file|kiểm tra xem file có ghi được không|
|-x file|kiểm tra xem file có thực thi được không|
|-s file|kiểm tra xem kích thước file có > 0 hay không|
|-e file|kiểm tra file có tồn tại hay không|
### b)So sánh So sánh số với số
|Cú pháp|Ý nghĩa|
|-------|-------|
|n1 -eq n2|	kiểm tra n1 = n2|
|n1 -ne n2|	kiểm tra n1 khác n2|
|n1 -lt n2|	kiểm tra n1 < n2|
|n1 -le n2|	kiểm tra n1 <= n2|
|n1 -gt n2|	kiểm tra n1 > n2|
|n1 -ge n2|	kiểm tra n1 >= n2|
### c)So sánh chuỗi
|Cú pháp|Ý nghĩa|
|-------|-------|
|s1 = s2|	kiểm tra s1 = s2|
|s1 != s2|	kiểm tra s1 khác s2|
|-z s1|	Kiểm tra s1 có kích thước bằng 0|
|-n s1|	Kiểm tra s1 có kích thước khác 0|
|s1|	Kiểm tra s1 khác rỗng|
### d)Phép tính

|Cú pháp|Ý nghĩa|
|-------|-------|
|expr n1 + n2|	n1 + n2|
|expr n1 - n2|	n1 - n2|
|expr n1 / n2|	n1 / n2|
|expr n1 * n2|	n1 x n2|

- Lưu ý trong phép kiểm tra nếu phép kiểm tra là đúng thì kết quả trả về là 0 còn sai thì kết quả trả về là khác 0