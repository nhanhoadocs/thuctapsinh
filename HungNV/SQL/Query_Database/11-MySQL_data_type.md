# 11. MySQL data type 

### 1. MySQL data types

Một bảng cơ sở dữ liệu chứa nhiều cột với các kiểu dữ liệu cụ thể như số hoặc chuỗi. MySQL cung cấp nhiều loại dữ liệu khác ngoài số hoặc chuỗi. 

Trong MySQL có 3 loại dữ liệu chính: chuỗi, số và thời gian.

**Kiểu String (kiểu dữ liệu chuỗi)**: 

![Imgur](https://i.imgur.com/oR1N6uc.jpg) 

- `CHAR`: Chuỗi độ dài cố định (có thể chứa các chữ cái, số và ký tự đặc biệt). Tham số kích thước chỉ định độ dài cột tính bằng ký tự - có thể từ 0 đến 255. Mặc định là 1

- `VARCHAR(size)`: Chuỗi độ dài bất định(variable) (có thể chứa các chữ cái, số và ký tự đặc biệt). Tham số kích thước chỉ định độ dài cột tối đa tính bằng ký tự - có thể từ 0 đến 65535

- `BINARY(size)`: Bằng với CHAR (), nhưng lưu trữ chuỗi byte nhị phân. Tham số kích thước chỉ định chiều dài cột tính bằng byte. Mặc định là 1

- `VARBINARY`: Bằng với VARCHAR (), nhưng lưu trữ các chuỗi byte nhị phân. Tham số kích thước chỉ định độ dài cột tối đa tính bằng byte

- `TINYBLOB`: Dành cho BLOBs (Binary Large OBjects - Đối tượng nhị phân lớn). Độ dài tối đa: 255 byte

- `TINYTEXT`: Giữ một chuỗi có độ dài tối đa 255 ký tự

- `TEXT`: Giữ một chuỗi có độ dài tối đa 65,535 byte

- `BLOB`: Đối với BLOBs, giữ tới 65.535 byte dữ liệu

- `MEDIUMTEXT`: Giữ một chuỗi có độ dài tối đa 16.777.215 ký tự

- `MEDIUMBLOB`: Dành cho BLOBs. Giữ tới 16.777.215 byte dữ liệu

- `LONGTEXT`: Giữ một chuỗi có độ dài tối đa 4.294.967.295 ký tự

- `LONGBLOB`: Dành cho BLOBs. Giữ tới 4.294.967.295 byte dữ liệu

- `ENUM (val1, val2, val3, ...)`: Một đối tượng chuỗi chỉ có thể có một giá trị, được chọn từ danh sách các giá trị có thể. Bạn có thể liệt kê tối đa 65535 giá trị trong danh sách ENUM. Nếu một giá trị được chèn không có trong danh sách, một giá trị trống sẽ được chèn vào. Các giá trị được sắp xếp theo thứ tự bạn nhập chúng. 

- `SET (val1, val2, val3, ...)`: Một đối tượng chuỗi có thể có 0 hoặc nhiều giá trị, được chọn từ danh sách các giá trị có thể. Bạn có thể liệt kê tối đa 64 giá trị trong danh sách SET

**Kiểu dữ liệu số:** 

- `BIT`: Một loại giá trị bit. Số lượng bit trên mỗi giá trị được chỉ định theo kích thước. Tham số kích thước có thể giữ giá trị từ 1 đến 64. Giá trị mặc định cho kích thước là 1

- `TINYINT` Một số nguyên rất nhỏ. Phạm vi đã ký là từ -128 đến 127. Phạm vi chưa ký là từ 0 đến 255. Tham số kích thước chỉ định chiều rộng hiển thị tối đa (là 255)

- `INT`: Một số nguyên trung bình. Phạm vi đã ký là từ -2147483648 đến 2147483647. Phạm vi chưa ký là từ 0 đến 4294967295. Tham số kích thước chỉ định chiều rộng hiển thị tối đa (là 255)

- `FLOAT`: Một số dấu phẩy động. Tổng số chữ số được chỉ định trong kích thước. Số chữ số sau dấu thập phân được chỉ định trong tham số d. Cú pháp này không được dùng trong MySQL 8.0.17 và nó sẽ bị xóa trong các phiên bản MySQL trong tương lai

- `SMALLINT`: Một số nguyên nhỏ. Phạm vi đã ký là từ -32768 đến 32767. Phạm vi không được ký là từ 0 đến 65535. Tham số kích thước chỉ định chiều rộng hiển thị tối đa (là 255)

- `MEDIUMINT`: Một số nguyên trung bình. Phạm vi đã ký là từ -8388608 đến 8388607. Phạm vi không được ký là từ 0 đến 16777215. Tham số kích thước chỉ định chiều rộng hiển thị tối đa (là 255)

- `DOUBLE`: Một số dấu phẩy động kích thước bình thường. Tổng số chữ số được chỉ định trong kích thước. Số chữ số sau dấu thập phân được chỉ định trong tham số d

- `DECIMAL`: Một số điểm cố định chính xác. Tổng số chữ số được chỉ định trong kích thước. Số chữ số sau dấu thập phân được chỉ định trong tham số d. Số tối đa cho kích thước là 65. Số tối đa cho d là 30. Giá trị mặc định cho kích thước là 10. Giá trị mặc định cho d là 0.

- `DEC`: Bằng với `DECIMAL`

**Kiểu dữ liệu thời gian** 

- `DATE`: Kiểu ngày ở định dạng `CCYY-MM-DD` 

- `TIME`: Giá trị thời gian ở định dạng `hh: mm: ss`

- `DATETIME`: Giá trị ngày và giờ có giá trị `CCYY-MM-DD hh: mm: ss`

- `TIMESTAMP`: Giá trị dấu thời gian ở định dạng `CCYY-MM-DD hh: mm: ss`

- `YEAR`: Giá trị năm ở định dạng `CCYY` hoặc `YY`

**Kiểu dữ liệu JSON**

MySQL hỗ trợ kiểu dữ liệu gốc JSON kể từ phiên bản 5.7.8 cho phép bạn lưu trữ và quản lý các tài liệu JSON hiệu quả hơn. Kiểu dữ liệu JSON gốc cung cấp xác thực tự động các tài liệu JSON và định dạng lưu trữ tối ưu.

### 2. Kiểu dữ liệu INT

Cách sử dụng kiểu dữ liệu INT

INT viết tắt của `integer` là 1 số nguyên. 

Ví dụ: 1, 100, 4, -10 và nó không thể là 1,2, 5/3, v.v ... Một số nguyên có thể bằng 0, dương và âm.

Vì kiểu số nguyên biểu thị các số chính xác, nên ta thường sử dụng nó làm khóa chính của bảng. Ngoài ra, cột INT có thể có một thuộc tính AUTO_INCREMENT 

Tạo bảng với tên là `zerofill_tests` :
```
CREATE TABLE zerofill_tests(
    id INT AUTO_INCREMENT PRIMARY KEY,
    v1 INT(2) ZEROFILL,
    v2 INT(3) ZEROFILL,
    v3 INT(5) ZEROFILL
);
```

Chèn 1 hàng mới vào bảng `zerofill_test`: 

```
INSERT INTO zerofill_tests(v1,v2,v3)
VALUES(1,6,9);
```

Truy vấn dữ liệu từ bảng `zerofill_test`:

```
select * from zerofill_tests;
```

![Imgur](https://i.imgur.com/FJeAGxP.png)

### 3. Kiểu dữ liệu CHAR

Hàm `CHAR ()` trả về ký tự dựa trên mã ASCII

Kiểu dữ liệu `CHAR` là kiểu ký tự có độ dài cố định trong MySQL. Ta thường khai báo loại `CHAR` có độ dài chỉ định số lượng ký tự tối đa bạn muốn lưu trữ. Ví dụ, `CHAR(20)` có thể chứa tối đa 20 ký tự.

Nếu dữ liệu bạn muốn lưu trữ có kích thước cố định, thì bạn nên sử dụng loại dữ liệu CHAR. Bạn sẽ có được một hiệu suất tốt hơn so với VARCHAR trong trường hợp này. 

Tạo 1 bảng có tên là `mysql_char_test` :

```
CREATE TABLE mysql_char_test (
    status CHAR(3)
);
```

Nhập dữ liệu vào bảng: 

```
INSERT INTO mysql_char_test(status)
VALUES('Yes'),('No');
```

Sử dụng `LENGTH` để đếm số ký tự của trường status: 

```
SELECT 
    status, 
    LENGTH(status)
FROM
    mysql_char_test;
```

![Imgur](https://i.imgur.com/ypAV0Gm.png)


Nếu ta nhập số giá trị lớn hơn 3: 

```
INSERT INTO mysql_char_test(status)
VALUES('VALUE');
```

một lỗi sẽ được báo. 

![Imgur](https://i.imgur.com/QSgPNxw.png)

### 4. Kiểu dữ liệu VARCHAR

MySQL VARCHAR là chuỗi có độ dài thay đổi có độ dài có thể lên tới 65.535. MySQL lưu trữ một giá trị VARCHAR dưới dạng tiền tố có độ dài 1 byte hoặc 2 byte cộng với dữ liệu thực tế. 

Tiền tố độ dài chỉ định số lượng byte trong giá trị. Nếu một cột yêu cầu ít hơn 255 byte, tiền tố độ dài là 1 byte. Trong trường hợp cột yêu cầu nhiều hơn 255 byte, tiền tố độ dài là 2 byte. 

Ví dụ: tạo 1 bảng có tên là items: 

```
CREATE TABLE items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(3)
);
```

Chèn dữ liệu vào bảng: 
```
INSERT INTO items(title)
VALUES('ABCD');
```

Ta thấy khi chèn dữ liệu lớn hơn 3 byte, có 1 thông báo lỗi được hiển thị. 

![Imgur](https://i.imgur.com/HmSRlsU.png)

MySQL giữ lại các khoảng trắng ở cuối khi nó chèn hoặc chọn các giá trị VARCHAR

Ví dụ: 

```
INSERT INTO items(title)
VALUES('AB ');
```

```
SELECT 
    id, title, length(title)
FROM
    items;
```

![Imgur](https://i.imgur.com/F2nUpgH.png)

MySQL sẽ cắt bớt các khoảng trắng theo sau khi chèn một VARCHARgiá trị có chứa các khoảng trắng theo sau khiến chiều dài cột vượt quá và đưa ra 1 cảnh báo. 

Ví dụ: 
```
INSERT INTO items(title)
VALUES('ABC ');
```
Câu lệnh này chèn một chuỗi có độ dài bằng 4 vào cột title. MySQL vẫn chèn chuỗi, tuy nhiên, nó cắt ngắn khoảng trống trước khi chèn giá trị. Và có 1 thông báo : 

![Imgur](https://i.imgur.com/WyKwKA7.png)

```
SELECT 
    title, LENGTH(title)
FROM
    items;
```
![Imgur](https://i.imgur.com/k3Qoa1T.png)

### 5. Kiểu dữ liệu TEXT

Khác với `CHAR` và `VARCHAR`, bạn không phải chỉ định độ dài của `TEXT` cho một cột. Ngoài ra, MySQL không xóa hoặc đệm khoảng trắng khi truy xuất hoặc chèn dữ liệu `TEXT` như `CHAR` và `VARCHAR`

Loại cột text thực tế có bốn loại - `TINYTEXT`, `TEXT`, `MEDIUMTEXT` và `LONGTEXT`. 

Bốn loại văn bản rất giống nhau; sự khác biệt duy nhất là lượng dữ liệu tối đa mỗi dữ liệu có thể lưu trữ

ví dụ: 

- TINYTEXT – 255 Bytes (255 characters)
- TEXT – 64KB (65,535 characters)
- MEDIUMTEXT – 16MB (16,777,215 characters)
- LONGTEXT – 4GB (4,294,967,295 characters)

### 6. Kiểu dữ liệu DATE 

Hàm DATE () trích xuất phần ngày từ biểu thức datetime

MySQL DATE là một trong năm loại dữ liệu tạm thời được sử dụng để quản lý giá trị ngày. MySQL sử dụng yyyy-mm-dd định dạng để lưu trữ một giá trị ngày. Định dạng này là cố định và không thể thay đổi nó.

- Giá trị năm trong phạm vi 00-69 được chuyển đổi thành 2000-2069.
- Giá trị năm trong phạm vi 70-99 được chuyển đổi thành 1970 - 1999.

Chức năng của MySQL date: 

Để có được ngày giờ hiện tại, bạn sử dụng NOW():

```
Select NOW();
```

![Imgur](https://i.imgur.com/wvSW8VG.png)  

Nếu chỉ muốn hiển thị phần ngày , ta sử dụng: 

```
SELECT DATE(NOW());
```

![Imgur](https://i.imgur.com/GRr1vuj.png)

Để có được ngày hệ thống hiện tại: 

```
SELECT CURDATE();
```

![Imgur](https://i.imgur.com/l4DisC2.png)


Nếu muốn lấy các giá trị : ngày, tháng, quý và năm ta làm như sau: 

```
SELECT DAY('2020-02-13') day, 
       MONTH('2020-02-13') month, 
       QUARTER('2020-02-13') quarter, 
       YEAR('2020-02-13') year;
```

![Imgur](https://i.imgur.com/Z7Hthsh.png) 

### 7. Kiểu dữ liệu TIME 

Cú pháp:  
```
column_name TIME;
```
Ví dụ: đoạn sau xác định một cột có tên start_at với kiểu dữ liệu TIME.
```
start_at TIME;
```
Tạo bảng có giá trị `TIME`:  
```
CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME,
    end_at TIME
);
```

Chèn dữ liệu vào với định dạng `HH:MM:SS`
```
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 2','083000','101500');
```
Hoặc  
```
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 4','9:5:0',100500);
```

Kết quả: 

![Imgur](https://i.imgur.com/7DCeWsr.png)