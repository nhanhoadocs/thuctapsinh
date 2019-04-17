# Bash shell programming
#### Shell là gì?
Như chúng ta đã biết thì máy tính chỉ có thể hiểu được các bit nhị phân. Trong khi con người vẫn thường giao tiếp với máy tính qua giao diện hoặc dòng lệnh. Như vậy tại sao máy tính có thể hiểu được ngôn ngữ của con người. Đó là nhờ một chương trình đặc biệt gọi là chương trình `shell`. Nó đóng vai trò như một trình biên dịch đừng ở giữa người dùng và nhân cuả hệ điều hành. Một hệ điều hành có thể có nhiều loại shell khác nhau. Trong đó `bash` là một ví dụ điển hình. Cung cấp nhiều tiện ích và là shell mặc định được sử dụng trên linux.
`shell script` là một chuỗi các lệnh được viết trong file text. Và shell thực thi file text này thay vì nhập vào các lệnh.

Để tạo một `shell script` ta gồm các bước sau.
 * Tạo một file
 * Dùng một trình soạn thảo trên máy để mở file. Viết các câu lệnh cần thực hiện trong 1 file có thể bao gồm các phép toán. Có một chú ý là ở dòng đầu tiên của file cần khai báo shell cụ thể sử dụng trong chương trình. Thường sẽ là `#!/bin/sh` hoặc `#!/bin/bash`
 * Sau đó dùng lệnh `chmod` để cấp quyền thực thi cho file vừa tạo
 * Để chạy file đó ta có các cách sau `./tên_file`, `bash tên_file` hoặc `sh tên_file`

Khi thực hiện với `shell script` ta có thể coi như ta đang lập trình để chương trình tự thực hiện một công việc nào đó thay vì ta phải làm thủ công bằng cách nhập vào từng lệnh.

### 1. Khai báo biến
Biến được gán trực tiếp. Giá trị của biến có thể là số hoặc một chuỗi. 
`TÊN_BIẾN=giá_trị`
*Chú ý* giữa tên biến dâú bằng và giá trị không được có dấu cách. 
Nếu `giá trị` là một chuỗi gồm nhiều từ thì cần đặt trong dấu `" "`
Để gọi giá trị biến đã gán ta sử dụng ký tự `$` phía trước tên biến có thể sử dụng một trong 2 cách `$TÊN_BIẾN` hoặc `${TÊN_BIẾN}`
**Một số biến đặc biệt**
Có một số biến mà ta không cần gán giá trị trực tiếp cho nó. Ta chỉ cần gọi nó ra còn giá trị của nó tùy thuộc vào lúc ta chạy chương trình
VD `./tên_file chuỗi`

Thì các biến đặc biệt đó là
 * `$#` sẽ trả về tổng số từ của chuỗi
 * `$0` trả về `tên_file`
 * `$1` trả về từ đầu tiên của chuỗi
 * `$2` trả về từ thứ 2 của chuỗi
 ................
 * `$9` trả về từ thứ 9 của chuỗi
 * `$@` trả về một chuỗi đầy đủ

VD một file `test` có nội dung như sau

```
#!/bin/sh
echo "I was called with $# parameters"
echo "My name is $0"
echo "My first parameter is $1"
echo "My second parameter is $2"
echo "All parameters are $@"
```

Khi chạy file này sẽ trả về kết quả như sau:

```
[client2@localhost ~]$ ./test dinh trong niem
I was called with 3 parameters
My name is ./test
My first parameter is dinh
My second parameter is trong
All parameters are dinh trong niem
```
### 2. Vòng lặp
**for**

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

**while**

```
while [ điều kiện ]
do
    lệnh
done
```

**if**

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

Với trường hợp này nếu điều kiện đúng thì thực hiện lệnh còn điều kiện sai thì thoát khỏi vòng lặp

Hoặc ta có thể lồng nhiều điều kiện vào với nhau bằng cách

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

**case**

``` 
case điều_kiện in
    TH1) 
        lệnh
        ;;
    TH2)
        lệnh
        ;;
    THn)
        lệnh
        ;;
    *)
        lệnh
        ;;
esac
```

trong đó `*` ở trường hợp cuối cùng thể hiện những trường hợp không trùng với trường hợp nào được liệt kê ở trên.

*Chú ý* ta có thể đặt các vòng lặp lồng vào nhau để giải quyết một bài toán cụ thể.

**3. Cấu trúc**

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

**4. Phép kiểm tra so sánh**

1. Toán tử kết hợp

| !   | Phủ định (not)|
| ---- | -------------- |
| -a  | Và (and) |
| -o  | Hoặc (or) |

2. Lệnh kiểm tra file

| Cú pháp  | Ý nghĩa |
| -------  | ----- |
| -f file | kiểm tra xem có phải là file hay không |
| -d file | kiểm tra xem có phải thư mục hay không |
| -r file | kiểm tra xem file có đọc được không |
| -w file | kiểm tra xem file có ghi được không |
| -x file | kiểm tra xem file có thực thi được không |
| -s file | kiểm tra xem kích thước file có > 0 hay không |
| -e file | kiểm tra file có tồn tại hay không |

3 . So sánh

So sánh số với số

| Cú pháp | Ý nghĩa |
| ----- | -----|
| n1 -eq n2 | kiểm tra n1 = n2 |
| n1 -ne n2 | kiểm tra n1 khác n2 |
| n1 -lt n2 | kiểm tra n1 < n2 |
| n1 -le n2 | kiểm tra n1 <= n2 |
| n1 -gt n2 | kiểm tra n1 > n2 |
| n1 -ge n2 | kiểm tra n1 >= n2 |

So sánh chuỗi

| Cú pháp | Ý nghĩa | 
| ------ | ------- |
| s1 = s2 | kiểm tra s1 = s2 |
| s1 != s2 | kiểm tra s1 khác s2 |
| -z s1 | Kiểm tra s1 có kích thước bằng 0 |
| -n s1 | Kiểm tra s1 có kích thước khác 0 |
| s1 | Kiểm tra s1 khác rỗng |

Phép tính

| Cú pháp | Ý nghĩa |
| ----- | ------ |
| expr n1 + n2 | n1 + n2 |
| expr n1 - n2 | n1 - n2 |
| expr n1 / n2 | n1 / n2 |
| expr n1 * n2 | n1 nhân n2 |

*Lưu ý* trong phép kiểm tra nếu phép kiểm tra là đúng thì kết quả trả về là `0` còn sai thì kết quả trả về là khác `0`
 