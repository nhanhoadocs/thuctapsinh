# File on python 

python có chức năng để create, read, update, delete file

## Xử lý tệp tin 

Hàm chính để làm việc với các tệp trong python là `open()` 

Các hàm `open()` có 2 tham số: `filename` và `mode`

Có 4 chế độ khác nhau để mở tệp : 

- `r` : read 
- `a`: append
- `w`: write 
- `x` : create 

Ngoài ra có thể chỉ định thêm nếu muốn mở tệp ở chế độ nhị phân hoặc văn bản : 

- `t` : text 
- `b` : binary

## Mở file trong python 

### Đọc theo ký tự

Giả sử ta có 1 file ở đường dẫn sau: /root/hung.txt

Tiến hành mở file : 

```
f = open("/root/hung.txt", "r")
print(f.read())
```
phương thức `read()` trên sẽ in ra toàn bộ nội dung file 

Hoặc ta có thể in ra số ký tự chỉ định như sau: 

```
f = open("/root/hung.txt", "r")
print(f.read(5))
```

### Đọc dòng 

Có thể trả về 1 dòng bằng cách sử dụng `readline()` : 

Ví dụ muốn đọc 1 dòng của tệp :

```
f = open("/root/hung.txt", "r")
print(f.readline())
```
Muốn đọc bao nhiêu dòng thì ta in ra bằng đó các phương thức  `readeline()`

```
f = open("/root/hung.txt", "r")
print(f.readline())
print(f.readline())
```

### Tìm kiếm thông qua 1 tệp tin 
Nếu ta muốn đọc 1 tệp và chỉ in ra các dòng bắt đầu bằng `From: `, chúng ta có thể sử dụng phương thức chuỗi để chỉ chọn những dòng có tiền tố như mong muốn. 

Ví dụ : sử dụng `startswith` để chọn những từ xuât hiện đầu dòng, tại đây mình sẽ hiển thị những dòng có nguyen xuất hiện đầu dòng. 
```
fhand = open('/root/hung.txt')
for line in fhand: 
    if line.startswith("nguyen")
        print(line)
```
### Cho phép người dùng chọn tên tệp 

Đối với các ví dụ trên, ta thấy rằng mỗi khi ta muốn mở 1 tệp, a phải nhập vào cú pháp kèm với đường dẫn của tệp đó. Tại ví dụ này ta có thể nhập thể sử dụng các chuwong trình để nhập vào các tệp mà k cần thay đổi mã python. 
Ví dụ sau: nhập vào đường dẫn file. in ra số lần xuất hiện những dòng có nguyen ở đầu dòng. 

```
fname = input("Nhap vao duong dan:")
fhand = open(fname)
count =0
for line in fhand:
    if line.startswith('nguyen'):
        count = count + 1
print("So tu xuat hien dau dong:", count, 'nguyen line in',fname)
```

### Sử dụng try, except and open 

`try` cho phép bạn thử nghiệm 1 khối mã lỗi
`except` cho phép xử lý các lỗi
`finally` cho phép thực thi mã, không phụ thuộc vào kết quả của try- và except

Khối try gây ra lỗi, khối except sẽ được thực thi. Nếu không có khối try, chương trình sẽ sập và phát sinh lỗi. 

ví dụ sau: nếu nhập vào file không hợp lệ hoặc không phải 1 file thì sẽ sinh ra lỗi. nếu file đúng sẽ được in ra kết quả. 

```
fname = input('Enter the file name: ')
try:
    fhand = open(fname)
except:
    print('File cannot be opened:', fname)
    exit()

count = 0
for line in fhand:
    if line.startswith('nguyen') :
        count = count + 1
print('There were', count, 'subject lines in', fname)
```

### Viết vào file 

Để viết vào file, bạn cần mở nó với chế độ `w` hoặc `a`

##### Sử dụng w để ghi đè 

Nếu ghi đè nó sẽ xóa toàn bộ dữ liệu trong file và ghi lên đó

```
wr = open('/root/hung.txt','w')
wr.write('Nguyen viet Hung\n')
wr.close()
```

### Sử dụng a để ghi nối vào file 

```
write = open('/root/hung.txt','a')
write.write('Ghi noi vao file\n')
write.close()
```

