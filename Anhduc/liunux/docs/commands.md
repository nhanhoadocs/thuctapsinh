[1.Lệnh echo](#echo)

[2.Lệnh cat](#cat)

[3.Lệnh sed](#sed)

[4.Lệnh grep](#grep)

[5.Lệnh awk](#awk)

[6.Lệnh sort](#sort)

[7.Lệnh uniq](#uniq)

[8.Lệnh paste](#paste)

[9.Lệnh join](#join)

[10.Lệnh tr](#tr)

[11.Lệnh wc](#wc)

[12.Lệnh tee](#tee)

[13. Lệnh cut](#cut)
<a name="echo">

# 1. Lệnh echo 
- Lệnh echo dùng để hiển thị một văn bản lên màn hình 
```
anhduc@anhduc:~$ echo text command
text command
```
- Ta có thể khai báo biến và lập lại giá trị của nó 
```
anhduc@anhduc:~$ x=10
anhduc@anhduc:~$ echo gia tri cua x=$x
gia tri cua x=10
```
- `-e` giúp nó hiểu được các ký tự có tác dụng đằng sau, ta có thể sử dụng nhiều trường đằng sau để kết hợp với nhau: như \b \n \t....
    - `\b` : dùng để loại bỏ 1 ký tự đằng trước nó 
    - `\n` : dùng để xuống dòng 
    - `\t` : dùng để cách một khoảng tab đằng trước 
    - `\v` : Xuống dòng và cách một khoảng trắng bằng các ký tự dòng trên 
    - `\r` : Xóa tất cả các ký tự trước đó 
    - `\c` : 
    ```
    anhduc@anhduc:~$ echo -e ' anh \c duc'
    anh anhduc@anhduc:~$ 
    ```
    - anhduc@anhduc:~$ echo *
        Desktop Documents Downloads examples.desktop Music nfs nfs-test Pictures PlayOnLinux's virtual drives pt Public scp snap Templates Videos vmware
    - `echo *(đuôi): in ra file có đuôi như thế
- Ta có thể gán giá trị cho ký tự được 
```
anhduc@anhduc:~$ echo "file" > a
anhduc@anhduc:~$ cat a
file
```
<a name="cat">

# 2.Lệnh cat
- Lệnh `cat` là lệnh dùng để đọc một file
- Lệnh cat có thể đọc nhiều file cùng một lúc 
```
anhduc@anhduc:~$ cat a b
file
file1
```
- Một số option của lệnh `cat`
    - `-n` để hiển thị từng dòng 
    ```
    anhduc@anhduc:~$ cat -n .bash_history 
     1	dhclient enp0s25
     2	sudo dhclient enp0s25
     3	vi /etc/network/interfaces
     4	ip a
     5	mtr 8.8.8.8
     6	ping dantri.vn 
     7	ip a
     8	sudo vi /etc/resolv.conf 
     9	ip a
    10	p a
    11	ip a
    12	ping dantri.vn 

    ```
    - `-e` để thêm ký tự $ vào cuối dòng 
    ```
    anhduc@anhduc:~$ cat -e a
    ile$
    ```
    - copy nội dung file này sang file khác 
    ```
    anhduc@anhduc:~$ cat a >> b
    anhduc@anhduc:~$ cat b
    file1
    file
    ```
    - Ghi đè file này lên file khác
    ```
    anhduc@anhduc:~$ cat a > b
    anhduc@anhduc:~$ cat b
    file
    ```
<a name="sed">

# 3. Lệnh Sed 
- Trong hệ điều hành linux thì `sed` được sử dụng rất nhiều.
- Đây là một trình soạn thảo văn bản. Khác với các văn bản thông thường `sed` chấp nhận văn bản dầu vào có thể là file trên hệ thống hay từ standard inpun và stdin
- sed sẽ dùng để chỉnh sửa từng dòng văn bản 
- Một số option 
    - `-n` ngăn chặn việc tự động in không gian mẫu
    - `-i` lưu thay đổi 
    - `-f` thêm nội dung của script-file vào các lệnh được thực thi 
    - `-i` Lưu thay đổi vào file vừa được thao tác
    - `/p` In ra vùng đã chỉ định 
### a) Thay thế một chuỗi ký tự
- Cấu trúc 
```
anhduc@anhduc:~$ echo anhduc | sed -e 's/anhduc/anh/'
anh 
```
- Trong đó
    - `s` : mô tả phép thay thế
    - Tất cả các chuỗi 1 được thay thế bằng chuỗi 2
    - tên file: là tên file ta muốn áp dụng sự thay thế
### b) Thay thế tất cả xuất hiện của mẫu 
- Nếu chỉ sử dụng mô tả `s` thì sự thay thế chỉ xảy ta ở mẫu đầu tiên. Nếu muốn thay thế tất cả sự xuất hiện của nó ở văn bản thì ta cần thêm `/g` ở cuối 
```
anhduc@anhduc:~$ echo anhducanhducanhducanhduc | sed -e 's/anhduc/anh/g'
anhanhanhanh
```

- Thay thế sự xuất hiện từ lần xuất hiện thứ 2 thì là 2g, thứ 3 là 3g...
```
anhduc@anhduc:~$ echo anhducanhducanhducanhduc | sed -e 's/anhduc/anh/2g'
anhducanhanhanh
```
- Thay thế sự xuất hiện của lần thứ n(1,2,3,4...)
```
anhduc@anhduc:~$ echo anhducanhducanhducanhduc | sed -e 's/anhduc/anh/2'
anhducanhanhducanhduc
```
### c) Xóa các dòng trống 
- Đọc file khi chưa sử dụng sed để kiểm tra các dòng trống 
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-29-53.png)
- Thực hiện lệnh sed
![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-29-33.png)
### d)Kết hợp nhiều chuỗi lệnh sed 
```
anhduc@anhduc:~$ echo abc | sed 's/a/A/' | sed 's/b/B/'
ABc
anhduc@anhduc:~$ echo abc | sed 's/a/A/; s/b/B/'
ABc
```
- Hai cách viết trên cho kết quả giống nhau nhưng mà cách viết thứ 2 ngắn ngọn hơn 
### e) xóa các  dòng chứa 1 chuỗi bất kỳ trong file
- cấu trúc 
```
sed 's/[^.]*(ký tự )[^.]*//g' duc.txt
```
- ví dụ dưới đây là xóa dòng có ký tự `a`
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-36-38.png)
<a name="Grep">

# 4. Grep 
- Lệnh `grep` : là lệnh được dùng để tìm kiếm 1 chuỗi ký tự ở trong file chỉ định 
### a) Tìm kiếm chuỗi trong file 
```
anhduc@anhduc:~/Desktop$ grep "a" duc.txt 
a
```
### b) Tìm nhiều chuỗi 
- ví dụ là tìm tất cả các chuỗi có ký  tự a ở trong file có đuôi `txt`
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-48-07.png)
### c) Tìm kiếm không phân biệt chữ hoa thường 
- Ta dùng option `-i`. Ví dụ tìm chuỗi có chưa ký tự `a`
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-50-27.png)
### d) Tìm kiếm chính xác với dòng chứa tất cả ký tự đó 
- Ta dùng option `-w`. Ví dụ tìm với chuỗi ký tự `a`
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-52-56.png)
### e) Hiện thị thêm những dòng xung quanh 
- Ta có các option là 
    - `-A` : là sau 
    - `-B` : là trước 
    - `-c` : xung quanh 
- cấu trúc 
```
grep -(A,B,C) (số dòng) "chuỗi" (tên file)
```
- ví dụ: 3 dòng trước ký tự a với tìm chính xác 
- ![](https://github.com/duckmak14/linux/blob/master/text_commands/Screenshot%20from%202018-12-20%2015-59-08.png)
### f) Tìm kiếm tất cả các file trong thư mục con 
- Để tìm kiếm một chuỗi nào đó trong tất cả các file trong một thư mục  sử dụng option `-r`. Ta cd vào thư mục đó và dùng lệnh `grep -r "chuỗi" *` hoặc ta dùng lệnh `grep -r "chuỗi" (folder)`
### g) Tìm kiếm ngược 
- Tìm kiếm ngược là tìm những dòng không chứa một chuỗi nào đó. ( ta sử dụng option `-v`)
```
grep -v "chuỗi" (tên file )
```
### h) Đếm số kết quả 
- Muốn kết quả hiện về bao nhiêu lần thì ta sử dụng option `-c` 
```
grep -c "chuỗi" (tên file)
```
### i)Chỉ hiển thị tên file 
- Sẽ có những trường hợp mà ta chỉ quan tâm đến từ khóa mà ta đang tìm xuất hiện trong những file nào. Lúc này sử dụng option `-l` 
```
grep -l "chuỗi"

grep -l "chuỗi" (thư mục)
```
### j)Hiển thị số thứ tự của dòng kết quả 
- trong một file rất lớn thì nhu cầu biết được xem kết quả ở dòng nào thì điều đó là cần thiết. Ta sử dụng option `-n` 
```
grep -n -w "chuỗi" (tên file)
```
### k) Ứng dụng 
- Để kiểm tra tiến trình nào đang chạy và ID của chương trình ta sử dụng lệnh 
```
ps ux | grep (tên chương trình)
```
- ví dụ dưới đây là kiểm tra tiến trình googlechrome 
```
anhduc@anhduc:~/Downloads$ ps ux | grep googlechrom
anhduc   16701  0.0  0.0  23076  1012 pts/1    S+   08:13   0:00 grep --color=auto googlechrom
```
<a name="awk">

# 5) lệnh awk 
a) Khái niệm 
- Lệnh `awk` được sử dụng cho việc tìm kiếm và xử lý văn bản text. Nó sẽ tìm kiếm một hoặc nhiều fie để xem trong các file đó có dòng nào bao gồm những "chuỗi" cho trước hay không. NÓ còn là một ngôn ngữ lập trình C và được sử dụng khá là phổ biến bởi tính linh hoạt của nó 
- Một số điểm nổi bật của `awk` 
    - Nó xem 1 file text giống như bảng dữ liệu, bao gồm các bản ghi  và các trường 
    - Tương tự những ngôn ngữ lập trình phổ biến, awk cũng có những khái niệm biến, điều kiện và cả vòng lặp 
    - Có những toán tử số học và toán tử thao tác chuỗi 
- Cấu trúc 
```
awk ' BEGIN {lệnh 1} pattern { lệnh 2 } END {lệnh 3}
```
- Begin: chứa các khai báo được thực thi trước khi awk đọc nội dung dữ liệu
- Pattern: gồm các pattern( các điều kiện) dùng để lọc nội dung các dòng dữ liệu. Các khai báo sẽ được thực thi trên các dòng trùng khớp với pattern 
- END: Chứa các khai báo được thực thi sau khi awk đọc xong nội dung dữ liệu 
- Ví dụ là in ra màn hình 
```
anhduc@anhduc:~/Downloads$ echo -e "dòng1 \ndòng2" | awk 'BEGIN { } { print } END { print "End" }'
dòng1 
dòng2
End
```
b) Cách thức hoạt động cửa `awk` 
- Thực thi các khai báo trong khối `BEGIN`
- ĐỌc một dòng từ tập tin hoặc stdin, và thực thi khối `ptatern`. Lặp lại bước này cho đến cuối tệp tin 
- Khi đến cuối dòng dữ liệu nhập vào, Thực thi khối END 
- Khối `BEGIN` được thực thi  trước khi awk bắt đầu đọc dữ liệu dùng để in tiêu đề
- Khối `END` tượng tự khối `BEGIN` nhưng là in ra sau khi awk đọc dữ liệu. 
- Khối `pattern` là khối quan trọng nhất. Nó bao gồm 2 phần 
    - pattern(mẫu): là mẫu đối chiếu được cung cấp, dùng để đối chiếu, so sánh với nội dung của các dòng dữ liệu. Pattern có thể là 1 biểu thức chính quy, điều kiện, 1 dãy các dòng ...
    - {commands}: Là các lệnh được thực thi với các dòng dữ liệu trùng khớp với pattern ở trên 
c) Các biến đặc biệt
- 1 số biến đặc biệt có thể dùng với awk
    - NR: số của bản ghi hiện tại, tương ứng với số dòng hiện tại khi sử dụng các dòng như các bản ghi 
    - NF: số lượng các trường (cột), tương ứng với số liệu các trường trong bản ghi hiện tại đang thực thi 
    - $0: Biến chứa nội dung văn bản của dòng hiện tại đang thực thi 
    - $1: Biến chưa văn bản của trường thứ nhất
    - $2: Biến chứa văn bản của trường thứ 2
```
anhduc@anhduc:~$  echo -e "line1 f2 f3\nline2 f4 f5\nline3 f6 f7" | awk '{ print "Line no:"NR",No of fields:"NF, "$0="$0, "$1="$1,"$2="$2,"$3="$3 }'
Line no:1,No of fields:3 $0=line1 f2 f3 $1=line1 $2=f2 $3=f3
Line no:2,No of fields:3 $0=line2 f4 f5 $1=line2 $2=f4 $3=f5
Line no:3,No of fields:3 $0=line3 f6 f7 $1=line3 $2=f6 $3=f7
```
d) TRuyền biến bên ngoài vào `awk`
- VỚi việc sử dụng option `-v`, Chúng ta có thể truyền các giá trị bên ngoài vào awk 
```
anhduc@anhduc:~$ var=100
anhduc@anhduc:~$ echo |awk -v VARR=$var '{print VARR}'
100
```
e) Các trường của lệnh `awk` 
- Length(string): trả về chiều dài của chuỗi 
- indexx(string,search_string): trả về vị trí mà search_string được tìm thấy trong string 
- Slit(string,array,delimiter): lưu trữ 1 danh sách các chuỗi được tạo bằng việc sử dụng dấu phân cách trong mảng 
- Sub(regex, replacement_str,string): thay thế chuỗi đầu tiên trùng khớp với biểu thức chính quy (regex) bằng chuỗi thay thế (replacement_str)
- match(regex,string): Trả về kết quả là một chuỗi trùng khớp với biểu thức chính quy (regex)
có dược tìm thấy trong string hay không. Nó trả về kết quả khác ) nếu có trùng khớp. 2 biến đặc biệt tương ứng vớ hàm `match` là `rstart` và `rlength` . 
<a name="sort">

# 6) lệnh `sort` 
- Lệnh `sort` là một câu lệnh dùng để sắp xếp theo thứ tự các dòng trong một file dữ liệu nào đó. Mặc định thì sort sẽ xem xét chữ cái hoặc số đầu tiên của dòng để đối chiếu. 
- Thứ tự sắp xếp dòng của lệnh `sort
    - Dòng nào bắt đầu bằng số sẽ được xếp trước những dòn bắt đầu bằng chữ
    - Nếu bắt đầu băng chữ thì sẽ được sắp xếp theo bảng chữ cái 
    - Những dòng chữ cái đầu tiên thường xuất hiện trước các dòng chữ cái viết hoa nếu cùng một chữ cái 
- Cấu trúc 
```
sort [option] [file]
```
- MỘt số option của lệnh 
    - `-o` : Để ghi dữ liệu sắp xếp vào 1 file 
    - `-r` : sắp xếp theo yêu cầu ngược lại 
    - `-c` : Để kiểm tra xem file đầu vào đã được sắp xếp chưa
    - `-k` : Để chỉ ra bạn muốn lấy trường nào làm căn cứ để sắp xếp 
<a name="uniq">

# 7) lệnh uniq
- Lệnh `uniq` là câu lệnh được sử dụng để báo các hoặc các dòng in ra trong file. Nó sẽ giúp ta xóa các dòng giống nhau mà liền kề nhau đi
- Cấu trúc lệnh 
```
uniq [option] [flile input] [file output]
```
- trong đó 
    - option : là các tùy chọn 
    - file input: đó là file nhập vào nếu không có thì dữ liệu sẽ được nhập từ bàn phím 
    - file output: là file in ra nếu không có thì dữ liệu sẽ được in ra màn hình 
- Ví dụ có 1 file ta sử dụng lệnh `cat` và sử dụng lệnh `uniq`
```
anhduc@anhduc:~/Desktop$ cat duc.txt 
a
a
b
b
c
c
```
```
anhduc@anhduc:~/Desktop$ uniq duc.txt 
a
b
c

```
- Với option `-c` thì nó sẽ in ra số dòng trùng nhau ở trước 
```
anhduc@anhduc:~/Desktop$ uniq -c duc.txt 
      2 a
      2 b
      2 c
```
- Một số option khác 
    - `-d` : chỉ in ra những dòng trùng lặp nhau 
    - `-u` : chỉ ra những dòng không trùng lặp 
<a name="paste">

# 8) lệnh `paste`
- Lệnh `paste` dùng để hiển thị các dòng tưởng ứng của file trên cùng một dòng 
- Cấu trúc 
```
paste [option] [file1] [file2]
```
- Khi ra sử dụng lệnh cat để đọc 2 file và dùng paste
```
anhduc@anhduc:~/Desktop$ cat duc.txt anhduc.txt 
a
a
b
b
c
c


1
2
3
4
5
```

```
anhduc@anhduc:~/Desktop$ paste duc.txt anhduc.txt 
a	1
a	2
b	3
b	4
c	5
c	
```
- Một số option của lệnh paste
    - `-d` Thay khoảng trắng ở giữa 2 file tưởng đương trên cùng một dòng bằng một ký tự liệt kê phía sau
    - `-s` sẽ paste vào sau một file thay vì song song thì giờ sẽ là trên cùng một dòng 
<a name="join">

# 9) lệnh Join 
- Lệnh `join` là câu lệnh để  kết nối các dòng dữ liệu của 2 files có 1 trường dữ liệu chung
- Cấu trúc 
```
join [option] [file1] [file2]
```
- Một số option của `join`
    - `-o (định dạng)` : chỉ ra định dạng của kết quả trả về
    - `-1 n` : kết nối vào trường n của file 1 
    - `-ư n` : kết nối vào trường n của file 2 
    - `-t (ký tự)` sử dụng ký tự để làm phân cách cho trường đầu vào và đầu ra

<a name="tr">

# 10) Lệnh tr
- Lệnh `tr` là một tiện ích để chuyển các ký tự được chỉ ra thành các ký tự khác hoặc xóa chúng 
- Chuyển chữ hoa thành chữ trường 
```
anhduc@anhduc:~/Desktop$ cat duc.txt 
a
b
c
anhduc@anhduc:~/Desktop$ cat duc.txt | tr a-z A-Z
A
B
C
```
- Xóa các ký tự trong file 
```
anhduc@anhduc:~/Desktop$ cat duc.txt 
a
b
c
anhduc@anhduc:~/Desktop$ cat duc.txt | tr -d 'a,b'


c
```
<a name="wc">

# 11) lệnh `wc`
- lệnh `wc`: Thường được sử dụng để tìm kiếm thông tin về số lượng dòng, số lượn từ, byte hoặc số lượn ký tự của một file hoặc một biến có nội dung.
- Cấu trúc
```
wc [option] (tên file)
```
- Một số option 
    - `-c` : tính tổng số byte
    - `-m` : tính tổng số ký tự 
    - `-w` : tổng số từ 
    - `-l` : tổng số dòng 
    - `-L` : số byte của dòng text có đọ dài lớn nhất. Nếu không có thêm option
```
anhduc@anhduc:~/Desktop$ wc duc.txt 
3 3 6 duc.txt
```
- các đọc bảng ghi 
    - cột đầu tiên: có 3 dòng 
    - Cột thứ 2: có 3 từ
    - Cột thứ 3: tổng có 6 byte ( giống với khi sử dụng `-c`)
    ```
    anhduc@anhduc:~/Desktop$ wc -c duc.txt 
    6 duc.txt 
    ```
<a name="tee">

# 12)Lệnh tee
- Lệnh `tee` Là câu lệnh cho phép lấy dữ liệu đầu ra của 1 lệnh nào đó và ghi thông tin đó vào 1 file . Sử dung option -a để ghi thông tin file đó xuống dưới dữ liệu đang có trong file
```
anhduc@anhduc:~/Desktop$ ls -l | tee duc.txt 
total 4
-rw-rw-r-- 1 anhduc anhduc 10 Thg 1 26 09:59 anhduc.txt
-rw-rw-r-- 1 anhduc anhduc  0 Thg 1 26 10:28 duc.txt
anhduc@anhduc:~/Desktop$ cat duc.txt 
total 4
-rw-rw-r-- 1 anhduc anhduc 10 Thg 1 26 09:59 anhduc.txt
-rw-rw-r-- 1 anhduc anhduc  0 Thg 1 26 10:28 duc.txt
```
<a name="cut">

# 13) lệnh `cut` 
- Lệnh `cut` là lệnh giúp chúng ta cắt một dòng và trích xuất văn bản. Nó có thể chỉ ra dấu phân cách đặt biệt các cột 
- Cấu trúc 
```
cut (option) (tên file)
```
- Một số option
    - `-b n` : Trích xuất ra byte thứ n của mỗi dòng 
    - `-b n-m` : trích xuất từ file thứ byte thứ n đến thứ m của mỗi dòng 
    - `-c n` : Trích xuất ra ký tự thứ n của mỗi dòng 
    - `-c n-m` : Trích xuất ra ký tự thứ n đến thứ m của mỗi dòng
    - `-f n` : Trích xuất ra trường thứ n của mỗi dòng 
    - `-s` : không in dòng không chứa dấu phân cách 