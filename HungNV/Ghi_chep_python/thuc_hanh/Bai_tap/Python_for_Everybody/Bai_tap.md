# Bài tập 

## Cài đặt Python

## Chương 1: Why should you learn to write programs?
#### Bài tập 1: Chức năng của bộ nhớ thứ cấp trong máy tính là gì?

```
a) Thực hiện tất cả các tính toán và logic của chương trình
b) Truy xuất các trang web qua Internet
c) Lưu trữ thông tin trong thời gian dài, thậm chí vượt quá chu kỳ năng lượng
d) Lấy đầu vào từ người dùng
```

#### Bài tập 2: Chương trình là gì?

#### Bài tập 3: Sự khác biệt giữa trình biên dịch và trình thông dịch là gì?

#### Bài tập 4: Điều nào sau đây chứa "mã máy"?

```
a) Trình thông dịch Python
b) Bàn phím
c) Tệp nguồn Python
d) Tài liệu xử lý văn bản 
```

#### Bài tập 5: Điều gì sai với đoạn mã sau : 

```
>>> primt 'Hello world!'
File "<stdin>", line 1
  primt 'Hello world!'
                     ^
SyntaxError: invalid syntax
>>>
```

#### Bài tập 6: Chọn trường hợp trong máy tính có 1 biến như "x" được lưu trữ sau khi dòng Python sau kết thúc ?

```
x = 123
```

```
a) Đơn vị xử lý trung tâm
b) Bộ nhớ chính 
c) Bộ nhớ thứ cấp 
d) Thiết bị đầu vào 
e) Thiết bị đầu ra
```


#### Bài tập 7: Chương trình sau sẽ in ra điều gì ? 

```
x = 43
x = x + 1
print(x)
```
```
a) 43
b) 44
c) x + 1
d) Lỗi vì x =x+1 về mặt toán học là không thể
```

#### Bài tập 9 : Làm thế nào để bạn sửa lỗi 1 cú pháp ?

## Chương 2: Variables, expressions, and statements

#### Câu 1: Viết chươn trình sử dụng `input` để nhắc người dùng về tên của họ sau đó in ra màn hình cú pháp `Hello + tên người dùng` 

```
Enter your name: Chuck
Hello Chuck
```

#### Câu 2: Viết chương trình cho người dùng hàng giờ và đánh giá mỗi giờ sau đó in ra tổng lương

```
Enter Hours: 35
Enter Rate: 2.75
Pay: 96.25
```

#### Câu 3: Giả sử thực hiện các câu lệnh gán sau: 

```
width = 17
height = 12.0
```

Đối với mỗi biểu thức sau, hãy viết giá trị của biểu thức và kiểu(giá trị của biểu thức)

```
1. width//2

2. width/2.0

3. height/3

4. 1 + 2 * 5
```

#### Câu 4: Viết chương trình để người dùng nhập vào nhiệt độ Celsius, chuyển đổi nhiệt độ thành Fahrenheit và in ra nhiệt độ đã chuyển đổi 

## Chương 3 : Conditional execution

####  Bài 1 : Viết lại tính toán lương của bạn để cho nhân viên 1,5 lần mức lương hàng giờ cho số giờ làm việc trên 40 giờ.

```
Enter Hours: 45
Enter Rate: 10
Pay: 475.0
```

#### Bài 2: Viết lại chương trình thanh toán của bạn bằng cách sử dụng `try` và `except` để chương trình của bạn xử lý đầu vào không phải là số bằng cách in một tin nhắn và thoát khỏi chương trình. Sau đây cho thấy hai thực thi của chương trình: 

```
Enter Hours: 20
Enter Rate: nine
Error, please enter numeric input
```

```
Enter Hours: forty
Error, please enter numeric input
```

#### Bài 3:  Viết chương trình để Cho sẵn điểm từ 0,0 đến 1,0. Nếu nhập vào điểm nằm ngoài phạm vi, hãy in thông báo lỗi. Nếu điểm nằm trong khoảng từ 0,0 đến 1, hãy in một lớp bằng bảng sau:


```
 Score   Grade
>= 0.9     A
>= 0.8     B
>= 0.7     C
>= 0.6     D
 < 0.6     F
```

## Chương 4: Function 

### Bài 1 : Mục đích của từ khóa "def" trong Python là gì?

```
a) It is slang that means "the following code is really cool"
b) It indicates the start of a function
c) It indicates that the following indented section of code is to be stored for later
d) b and c are both true
e) None of the above
```

### Bài 2: Chương trình Python sau sẽ in ra cái gì?

```
def fred():
   print("Zap")

def jane():
   print("ABC")

jane()
fred()
jane()
```

```
a) Zap ABC jane frane jane
b) Zap ABC Zap
c) ABC Zap jane
d) ABC Zap ABC
``` 

### Bài 3: Viết lại tính toán thanh toán của bạn với mỗi giờ làm thêm thì sẽ được gấp rưỡi so với trong giờ hành chính. Tạo 1 hàm gọi là `computepay`, có 2 tham số (`hours` and `rate`)

```
Enter Hours: 45
Enter Rate: 10
Pay: 475.0
```

### Bài 4 : Viết lại chương trình điểm từ chương trước bằng cách sử dụng hàm gọi là computergrade lấy điểm là tham số của nó và trả về điểm dưới dạng chuỗi 

```
 Score   Grade
>= 0.9     A
>= 0.8     B
>= 0.7     C
>= 0.6     D
 < 0.6     F
```

## Chương 5: Iteration 

### Bài 1 : Viết chương trình nhập vào các số liên tục cho đến khi người dùng nhập vào "done". Sau khi "done" được nhập, in ra tổng, số chữ số vừa nhập và trung bình của các số. Nếu người dùng nhập vào bất cứ điều gì khác số, phát hiện sai lầm của họ sử dụng `try` và `exept` và in ra 1 thông báo lỗi sau đó bỏ qua đến số tiếp theo.

```
Enter a number: 4
Enter a number: 5
Enter a number: bad data
Invalid input
Enter a number: 7
Enter a number: done
16 3 5.333333333333333
```

### Bài 2: Viết chương trình nhắc nhở danh sách các số như trên và cuối cùng sẽ in ra số lớn nhất và nhỏ nhất thay vì in ra trung bình cộng.


## Chương 6: String

### Câu 1: Cho chuỗi sau:  Sử dụng `find` và cắt chuỗi để trích xuất phần của chuỗi sau ký tự dấu `:` và sau đó sử dụng `float` để chuyển chuỗi được trích xuất thành số dấu phẩy động

``` 
str = 'X-DSPAM-Confidence: 0.8475 '
``` 

### Câu 2: Đọc tài liệu về các phương thức chuỗi tại : https://docs.python.org/library/stdtypes.html#string-methods . Bạn có thể muốn thử nghiệm với 1 trong số đó để đảm bảo hiểu cách nó làm việc. `Strip` and `replace` cực kỳ hữu ích . 

Các tài liệu sử dụng cú pháp có thể gây nhầm lẫn. Ví dụ, trong find(sub[, start[, end]]), dấu ngoặc chỉ ra các đối số tùy chọn. Vì thể `sub` là cần thiết, nếu `start` là optional, và nếu bạn bao gồn `start`, khi `end` là tùy chọn. 

## Chương 7. File 

### Bài 1: Viết chương trình đọc qua 1 tệp và in tất cả nội dung của tệp (từng dòng một) bằng chữ in hoa. Thực hiện chương trình sẽ như sau: 

```
python shout.py
Enter a file name: mbox-short.txt
FROM STEPHEN.MARQUARD@UCT.AC.ZA SAT JAN  5 09:14:16 2008
RETURN-PATH: <POSTMASTER@COLLAB.SAKAIPROJECT.ORG>
RECEIVED: FROM MURDER (MAIL.UMICH.EDU [141.211.14.90])
     BY FRANKENSTEIN.MAIL.UMICH.EDU (CYRUS V2.3.8) WITH LMTPA;
     SAT, 05 JAN 2008 09:14:16 -0500
```

có thể tải xuống tệp từ [đây](https://www.py4e.com/code3/mbox-short.txt)

### Bài 2: Viết chương trình để nhắc tên tệp, sau đó đọc qua tệp và tìm các dòng có dạng : 

```
X-DSPAM-Confidence: 0.8475
```

Khi bạn gặp một dòng bắt đầu bằng "X-DSPAM-Confidence:" hãy tách dòng đó để trích xuất số dấu phẩy động trên dòng. Đếm các dòng này và sau đó tính tổng giá trị độ tin cậy của thư rác từ các dòng này. Khi bạn đến cuối tập tin, hãy in ra độ tin cậy thư rác trung bình.

```
Enter the file name: mbox.txt
Average spam confidence: 0.894128046745

Enter the file name: mbox-short.txt
Average spam confidence: 0.750718518519
```

Kiểm tra tệp của bạn trên các tệp mbox.txt và mbox-short.txt

### Bài 3: Đôi khi các lập trình viên cảm thấy buồn chán hoặc muốn có 1 chút niềm vui, họ thêm 1 `Easter Egg` vào chương trình của họ. Sửa đổi chương trình trên để nó in 1 thông điệp vui nhộn khi người dùng nhập tên tệp chính xác "na na boo boo". Chương trình nên hoạt động bình thường cho tất cả các tệp khác tồn tại. Dưới đây là 1 mẫu thực hiện của chương trình: 

```
python egg.py
Enter the file name: mbox.txt
There were 1797 subject lines in mbox.txt

python egg.py
Enter the file name: missing.tyxt
File cannot be opened: missing.tyxt

python egg.py
Enter the file name: na na boo boo
NA NA BOO BOO TO YOU - You have been punk'd!
``` 

## Chương 8: List 

### Bài 1: Tải xuống một bản sao của tệp [tại đây](https://www.py4e.com/code3/romeo.txt). Viết chương trình mở tệp romeo.txt và đọc từng dòng một. Đối với mỗi dòng, chia dòng thành một danh sách các từ bằng cách sử dụng hàm `split`. Đối với mỗi từ, kiểm tra xem từ đó đã có trong danh sách chưa. Nếu từ không có trong danh sách, hãy thêm nó vào danh sách. Khi chương trình hoàn thành, sắp xếp và in các từ kết quả theo thứ tự bảng chữ cái

```
Enter file: romeo.txt
['Arise', 'But', 'It', 'Juliet', 'Who', 'already', 'and', 'breaks', 'east', 'envious', 'fair', 'grief', 'is', 'kill', 'light', 'moon', 'pale', 'sick', 'soft', 'sun', 'the', 'through', 'what', 'window', 'with', 
'yonder']
```

### Bài 2: Viết chương trình đọc qua dữ liệu hộp thư và khi bạn tìm thấy dòng bắt đầu bằng "From", bạn sẽ chia dòng thành các từ bằng cách sử dụng hàm `split`. Chúng tôi quan tâm đến việc ai đã gửi tin nhắn, đó là từ thứ hai trên dòng From.

```
From stephen.marquard@uct.ac.za Sat Jan 5 09:14:16 2008
```

**Bạn sẽ phân tích dòng From và in ra từ thứ hai cho mỗi dòng From, sau đó bạn cũng sẽ đếm số dòng From (không phải From :) và in ra một số đếm ở cuối. Đây là một đầu ra mẫu tốt với một vài dòng bị loại bỏ:**

```
python fromcount.py
Enter a file name: mbox-short.txt
stephen.marquard@uct.ac.za
louis@media.berkeley.edu
zqian@umich.edu

[...some output removed...]

ray@media.berkeley.edu
cwen@iupui.edu
cwen@iupui.edu
cwen@iupui.edu
There were 27 lines in the file with From as the first word
```

### Bài 3 : Viết lại chương trình nhắc người dùng về danh sách các số và in ra tối đa và tối thiểu các số ở cuối khi người dùng nhập "done". Viết chương trình để lưu trữ các số mà người dùng nhập vào danh sách và sử dụng các hàm `max()` và hàm `min()` để tính các số tối đa và tối thiểu sau khi vòng lặp hoàn thành.

```
Enter a number: 6
Enter a number: 2
Enter a number: 9
Enter a number: 3
Enter a number: 5
Enter a number: done
Maximum: 9.0
Minimum: 2.0
```

## Chương 9 : Dictionary 

### Bài 1: Viết chương trình phân loại từng thông điệp thư theo ngày nào trong tuần cam kết được thực hiện. Để thực hiện việc này, hãy tìm các dòng bắt đầu bằng "From", sau đó tìm từ thứ ba và tiếp tục đếm từng ngày trong tuần. Vào cuối chương trình in ra nội dung từ điển của bạn (thứ tự không quan trọng).

Dòng mẫu : 

```
From stephen.marquard@uct.ac.za Sat Jan  5 09:14:16 2008
```

Đầu ra mẫu : 

```
python dow.py
Enter a file name: mbox-short.txt
{'Fri': 20, 'Thu': 6, 'Sat': 1}
```

### Bài 2 : Viết chương trình đọc qua nhật ký thư, xây dựng biểu đồ bằng từ điển để đếm xem có bao nhiêu thư đến từ mỗi địa chỉ email và in từ điển.

```
Enter file name: mbox-short.txt
{'gopal.ramasammycook@gmail.com': 1, 'louis@media.berkeley.edu': 3,
'cwen@iupui.edu': 5, 'antranig@caret.cam.ac.uk': 1,
'rjlowe@iupui.edu': 2, 'gsilver@umich.edu': 3,
'david.horwitz@uct.ac.za': 4, 'wagnermr@iupui.edu': 1,
'zqian@umich.edu': 4, 'stephen.marquard@uct.ac.za': 2,
'ray@media.berkeley.edu': 1}
```

### Bài 3: Thêm mã vào chương trình trên để tìm ra ai có nhiều tin nhắn nhất trong tệp. Sau khi tất cả dữ liệu đã được đọc và từ điển đã được tạo, hãy xem qua từ điển bằng một vòng lặp tối đa (xem Chương 5: Vòng lặp tối đa và tối thiểu) để tìm ra ai có nhiều tin nhắn nhất và in ra bao nhiêu tin nhắn mà người đó có.

```
Enter a file name: mbox-short.txt
cwen@iupui.edu 5

Enter a file name: mbox.txt
zqian@umich.edu 195
```

### Bài 4: Chương trình này ghi lại tên miền (thay vì địa chỉ) nơi thư được gửi từ thay vì thư đến từ ai (tức là toàn bộ địa chỉ email). Vào cuối chương trình, in ra nội dung từ điển của bạn.

```
python schoolcount.py
Enter a file name: mbox-short.txt
{'media.berkeley.edu': 4, 'uct.ac.za': 6, 'umich.edu': 7,
'gmail.com': 1, 'caret.cam.ac.uk': 1, 'iupui.edu': 8}
```
