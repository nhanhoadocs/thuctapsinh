# 8. Modifying data in MySQL

### 1. INSERT (chèn dữ liệu)

INSERT cho phép ta chèn 1 hoặc nhiều hàng vào 1 bảng. 

- Đầu tiên, ta chỉ định tên bảng và danh sách các cột được phân tách bằng dấu phẩy bên trong dấu ngoặc đơn sau mệnh đề `INSERT INTO`

- Sau đó, ta đặt danh sách các giá trị được phân tách bằng dấu phẩy của các cột tương ứng bên trong dấu ngoặc đơn theo từ khóa `VALUES`

- Số lượng cột và giá trị phải giống nhau. Ngoài ra, vị trí của các cột phải tương ứng với vị trí của các giá trị của chúng.

VÍ DỤ: 
  
Đầu tiên ta tạo 1 bảng mới có tên task để thực hành INSERT. 

```
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY (task_id)
);
```

Câu lệnh sau chèn 1 hàng mới vào bảng `tasks`

```
INSERT INTO tasks(title,priority)
VALUES('Learn MySQL INSERT Statement',1);
```

Để kiểm tra dữ liệu đã nhập vào từ bảng tasks: 

![Imgur](https://i.imgur.com/cR7WTsb.png)

![Imgur](https://i.imgur.com/zDKt6YJ.png)

theo như bảng đã tạo, giá trị mặc định của `priority` là 3. Nên nếu muốn để giá trị mặc định khi thêm dữ liệu, ta sẽ chỉ định cột priority là default. 

```  
INSERT INTO tasks(title,priority)
VALUES('Understanding DEFAULT keyword in INSERT statement',DEFAULT);
```
Kiểm tra lại dữ liệu đã nhập: 

![Imgur](https://i.imgur.com/RKjGAYp.png)

**Chèn ngày**

Để chèn dữ liệu ngày vào bảng, ta sử dụng định dạng sau: 

```
'YYYY-MM-DD'
```

- YYYY đại diện cho một năm có bốn chữ số, ví dụ, năm 2018.
- MM đại diện cho một tháng có hai chữ số, ví dụ: 01, 02 và 12.
- DD đại diện cho một ngày có hai chữ số, ví dụ: 01, 02, 30.

ví dụ để chèn ngày vào bảng tasks với ngày bắt đầu và ngày đáo hạn : 

```
INSERT INTO tasks(title, start_date, due_date)
VALUES('Insert date into table','2018-01-09','2018-09-15');
```  

hoặc sử dụng hàm current_date để nhập dữ liệu ngày của hệ thống: 

```
INSERT INTO tasks(title,start_date,due_date)
VALUES('Use current date for the task',CURRENT_DATE(),CURRENT_DATE())
```
Ta kiểm tra lại dữ liệu đã nhập: 

![Imgur](https://i.imgur.com/u3IyHkG.png)

**Chèn nhiều dữ liệu vào cùng lúc:**

![Imgur](https://i.imgur.com/KA6N5Wv.png)

và ta kiểm tra lại : 

![Imgur](https://i.imgur.com/HHxbxPY.png)

### 2. Insert into select 

Chèn dữ liệu vào bảng từ tập kết quả của truy vấn :

Câu lệnh `INSERT INTO SELECT` rất hữu ích khi bạn muốn sao chép dữ liệu từ các bảng khác vào một bảng hoặc để tóm tắt dữ liệu từ nhiều bảng vào một bảng. 

### 3. UPDATE 

Câu lệnh UPDATE để sử đổi dữ liệu trong 1 bảng.  

**Cú pháp** : 

```
UPDATE [LOW_PRIORITY] [IGNORE] table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];
```
- Đầu tiên, chỉ định tên của bảng mà bạn muốn cập nhật dữ liệu sau từ khóa `UPDATE`
- Xác định cột nào bạn muốn cập nhật và giá trị mới trong mệnh đề `SET`. Để cập nhật giá trị trong nhiều cột, bạn sử dụng danh sách các phép gán được phân tách bằng dấu phẩy bằng cách cung cấp một giá trị trong mỗi phép gán của cột dưới dạng giá trị bằng chữ, biểu thức hoặc truy vấn con .
- Chỉ định những hàng nào sẽ được cập nhật bằng một điều kiện trong `WHERE`. Điều khoản `WHERE` này là tùy chọn. Nếu bạn bỏ qua nó, `UPDATE` sẽ cập nhật tất cả các hàng trong bảng.


Ví dụ về update: 

Sử dụng bảng `employees` từ cơ sở dữ liệu mẫu .

Trong ví dụ này, ta sẽ cập nhật email của Mary Pattersonemail mới: mary.patterso@classicmodelcars.com.

Đầu tiên, xem địa chỉ mail của Mary Pattersonemail : 

```  
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
 ```
 
 ![Imgur](https://i.imgur.com/vQZICQY.png)
 
 
 Tiếp theo, ta cập nhật địa chỉ email mới: 
 ```
 UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
 ```
 
kiểm tra lại sự thay đổi : 

![Imgur](https://i.imgur.com/wdUPGlI.png)

mail đã được thay đổi. 

Sử dụng `UPDATE` để sửa giá trị trong nhiều cột: 

```
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
```

Kiểm tra lại thay đổi: 

![Imgur](https://i.imgur.com/kgoj21Z.png)

![Imgur](https://i.imgur.com/byoJpjh.png)


### 4. DELETE 

Để xóa dữ liệu khỏi bảng, ta sử dụng câu lệnh `Delete`. 

- Đầu tiên chỉ định bảng mà ta cần xóa dữ liệu 

- Sử dụng những điều kiện để chỉ định những hàng cần xóa trong mệnh đề `WHERE`, Nếu hàng khớp với mệnh đề, nó sẽ bị xóa. 

**Cú pháp:**
```
DELETE FROM table_name
WHERE condition;
```

Ví dụ: 

Giả sử muốn xóa các nhân viên trong bảng `employees` có officeCode =4 ta làm như sau: 

```
DELETE FROM employees 
WHERE
    officeCode = 4;
```

Truy vấn sau sẽ sắp xếp khách hàng theo tên của khách hàng theo thứ tự abc và xóa 10 khách hàng đầu tiên

```
DELETE FROM customers
ORDER BY customerName
LIMIT 10;
```

Tương tự, truy vấn sau đây sẽ chọn khách hàng `France`, sắp xếp họ theo giới hạn tín dụng từ thấp đến cao và xóa 5 khách hàng đầu tiên. 

```
DELETE FROM customers
WHERE country = 'France'
ORDER BY creditLimit
LIMIT 5;
```
Ta có thể xóa tất cả các hàng trong bảng mà không xóa bảng, điều này sẽ giữ nguyên cấu trúc bảng. 

```
DELETE FROM table_name;
```




### 5. DELETE JOIN 

Xóa dữ liêu từ nhiều bảng sử dụng `Delete Join`  

###### DELETE INNER JOIN 

**Cú pháp:**
```
DELETE T1, T2
FROM T1
INNER JOIN T2 ON T1.key = T2.key
WHERE condition;
```

Ví dụ: 

Đầu tiên ta tạo 2 bảng có tên là t1 và t2: 
```
DROP TABLE IF EXISTS t1, t2;
 
CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);
 
CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);
 
INSERT INTO t1 VALUES (1),(2),(3);
 
INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);
```

Dưới đây là 2 bảng t1 và t2 : 

![Imgur](https://i.imgur.com/g4x4JKv.png)

![Imgur](https://i.imgur.com/xdwqwGg.png)


Câu lệnh sau sẽ xóa hàng với id=1 trong bảng t1 và hàng với ref=1 trong bảng t2 bằng cách sử dụng câu lệnh DELETE INNER JOIN: 

```
DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;
```
 
Kiểm tra lại sau khi xóa: 

![Imgur](https://i.imgur.com/PSMAYXz.png)

![Imgur](https://i.imgur.com/WrYFiFT.png)

### 6. REPLACE

Sử dụng câu lệnh `REPLACE` của MySQL để chèn hoặc cập nhật dữ liệu trong các bảng cơ sở dữ liệu.

###### Sử dụng `REPLACE` để chèn 1 hàng mới trong Mysql. 

**Cú pháp:**
```
REPLACE [INTO] table_name(column_list)
VALUES(value_list);
```

Nó tương tự như câu lệnh `INSERT` ngoại trừ từ khóa `REPLACE`.

Ví dụ ta có bảng `cities` như sau: 

![Imgur](https://i.imgur.com/3aMlu1v.png)

Sau đó ta sử `REPLACE` để cập nhật dân số lên 3696820: 

```
REPLACE INTO cities(id,population)
VALUES(2,3696820);
```
Và đây là kết quả: 

![Imgur](https://i.imgur.com/GIC2rh8.png)

Cũng giống như Insert Into, REPLACE cũng sử dụng để thêm dữ liệu: 

```
REPLACE INTO cities
SET id = 4,
    name = 'Phoenix',
    population = 1768980;
```

![Imgur](https://i.imgur.com/OjcVBZI.png)



