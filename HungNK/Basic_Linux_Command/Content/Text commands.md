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