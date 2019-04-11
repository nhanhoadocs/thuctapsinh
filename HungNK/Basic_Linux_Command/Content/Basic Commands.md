## Định vị ứng dụng

Dựa vào phân bố cụ thể, các chương trình và gói phần mềm có thể được cài đặt ở nhiều thư mục khác nhau. Và những chương trình thực thi thì sẽ thường để ở các thư mục sau

    /bin  
    /usr/bin
    /sbin
    /usr/sbin
    /opt.

- Lệnh Which dùng để truy tìm các câu lệnh khác nằm ở đâu


```
$which ls

/bin/ls
```
- Nếu lệnh `Which` không tìm được thì có một lệnh khác có thể thay thế `Whereis`. Nó sẽ tìm cả cách gói có cùng tên.

```
$Whereis ls
ls: /usr/bin/ls  usr/share/man/man1/ls.1.gz
```

## Truy cập thư mục

|*Câu lệnh*|*Kết quả*|
|-------|-----------|
|ls 	  |Liệt kê tất cả có trong tại thư mục đó|
|ls –a  |Liệt kê tất cả, kể cả những file tàng hình|
|tree   |Liệt keefile hệ thống dưới dạng cây|
|tree -d|Chỉ liệt kê thư mục và một số file name|


- Chúng ta có thể in ra vị trí của mình đang ở đâu bằng câu lệnh `pwd`, sau đó kết hợp với `ls` biết mình muốn liệt kê cái gì

## Liên kết và tượng trưng

- Câu lệnh `ln` có thể tạo ra để liên kết link cứng và link mềm, được biết đến với tên khác là symbolic links hoặc symlinks. Có hai kiểu links phổ biến trên hệ điều hành UNIX

- đầu tiên ta tạo file1.txt

```
touch file1.txt
```

- sau đó t liên kết file2.txt với file1.txt

```
# ln file1.text file2.text
```
- lúc này nó đã liên kết hai file lại với nhau, bất cứ thay đổi nào ở file2.txt đều sẽ được thay đổi ở file1.txt
- thực tế, hai file này đều trỏ đến một file trên bộ nhớ mà thôi, chỉ là chúng ta có hai cách gọi đến cái file ý bằng hai cái tên là file1.txt và file2.txt

- để làm rõ hơn ta dùng lệnh echo để ghi vào file1.txt. Bây giờ file1.txt vẫn còn trống.

```
echo "this is the first line we write" > file1.txt
```

- sau đó chúng ta xem file1

```
cat file1.txt
```
- để chứng minh, chúng ta tiếp tục xem file2
```
cat file2.txt
```
- và chúng ta nhận được hai kết quả giống nhau




- khi chúng ta xóa file1.txt, file2.txt vẫn còn và vẫn có nội dung cũ

