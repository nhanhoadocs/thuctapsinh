# MODIFYING DATA



## INSERT

### Chức năng
Câu lệnh `INSERT` cho phép ta chèn một hoặc nhiều hàng vào một bảng.


### Cú pháp

```SQL
INSERT INTO table(c1,c2,...)
VALUES (v1,v2,...);
```

### Ví dụ

Tạo một bảng mới `tasks` để thực hành câu lệnh `INSERT`:
```SQL
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

Chèn dữ liệu vào bảng:

```SQL
INSERT INTO tasks(title, priority)
VALUES('Mệnh đề INSERT', 1);
```

SELECT dữ liệu trong bảng `tasks`:

```SQL
SELECT * from tasks;
```

Kết quả:

<img src="https://i.imgur.com/yxmnNSp.png">

Chèn vào table với giá trị mặc định:

```SQL
INSERT INTO tasks(title,priority)
VALUES('INSERT Default Value', DEFAULT);
```

Kết quả select sau khi `INSERT`:

<img src="https://i.imgur.com/bixzAYM.png">

Giá trị của `priority` được đặt thành `3` vì ta đã set giá trị mặc định từ khi tạo bảng.

`INSERT` ngày giờ vào bảng:

```SQL
INSERT INTO tasks(title, start_date, due_date)
VALUES('Insert date into table','2018-01-09','2018-09-15');
```
Kết quả select sau khi chạy lệnh:

<img src="https://i.imgur.com/L1osyvZ.png">

Chèn nhiều hàng vào bảng:

```SQL
INSERT INTO tasks(title, priority)
VALUES
    ('Cong viec dau tien', 1),
    ('Cong viec thu hai',2),
    ('Cong viec thu 3',3);
```

Kết quả select sau khi chạy lệnh:

<img src="https://i.imgur.com/3mAOVQu.png">



### Lưu ý



## INSERT INTO SELECT

### Chức năng
Ngoài việc `INSERT` dữ liệu được cung cấp ta có thể `INSERT` dữ liệu từ các nguồn khác như dữ liệu được `SELECT` ra, `INSERT INTO SELECT` là lệnh có thể thực hiện điều đó.



### Cú pháp

```SQL
INSERT INTO table_name(column_list)
SELECT 
   select_list 
FROM 
   another_table
WHERE
   condition;
```



### Ví dụ
Ta tạo một bảng mới để thực hành với lếnh sau:

```SQL
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);
```

Tiếp theo ta thực hiện `INSERT` dữ liệu vào `suppliers` bằng cách lấy dữ liệu từ `customers` với những khách hàng ở `USA` và state là `CA`:

```SQL
INSERT INTO suppliers (
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';
```

Sau khi thực hiện ta select từ `suppliers` ra như sau:

```SQL
SELECT * FROM suppliers;
```

Kết quả:

<img src="https://i.imgur.com/M3cXYZC.png">


### Lưu ý



## INSERT IGNORE

### Chức năng
Khi ta thực hiện chèn dữ liệu vào bảng bằng câu lệnh `INSERT` nếu có lỗi xảy ra câu lệnh sẽ bị hủy và trả về thông báo lỗi, tùy nhiên khi ta sử dụng `INSERT IGNORE` thì những hàng có dữ liệu không hợp lệ sẽ được bỏ qua và những hàng hợp lệ sẽ tiếp tục được chèn và bảng.




### Cú pháp

```SQL
INSERT IGNORE INTO table(column_list)
VALUES( value_list),
      ( value_list),
      ...
```



### Ví dụ
Ta sẽ tạo một bảng mới có tên là `subscribers` để thực hành với `INSERT IGNORE`

```SQL
CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE
);
```
ta cho cột `email` `UNIQUE` để đảm bảo `email` không bị trùng dữ liệu.

Tiếp theo ta chèn một row vào bảng này:

```SQL
INSERT INTO subscribers(email)
VALUES('subscribersemail@gmail.com');
```

sau đó ta select dữ liệu từ bảng ra có được như sau:

<img src="https://i.imgur.com/Pg1V6TO.png">

tiếp theo ta sẽ thực hiện `INSERT` tiếp vào bảng này 2 row với một row có dữ liệu không hợp lệ ( email đã bị trùng với dữ liệu đã có trong bảng ) như sau:

```SQL
INSERT IGNORE INTO subscribers(email)
VALUES ('emailsubscribers@gmail.com'),
       ('subscribersemail@gmail.com');
```

sau khi thực thi lệnh kết quả trả về cảnh báo về dữ liệu bị trùng lặp, ta sẽ select dữ liệu ra để kiểm tra:

<img src="https://i.imgur.com/w56ij1d.png">

### Lưu ý



## UPDATE

### Chức năng
Lệnh `UPDATE` dùng để cập nhật các giá trị trong bảng, ta có thể cập nhật nhiều giá trị cùng lúc.


### Cú pháp

```SQL
UPDATE [LOW_PRIORITY] [IGNORE] table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];
```

Trong đó:
- sau từ khóa `UPDATE` ta chỉ định tên bảng mà ta muốn `UPDATE`
- Tiếp theo ta chỉ định các cột sau mệnh đề `SET`
- Để cập nhật giá trị cho các cột ta sử dụng phép gán với tên cột và giá trị, mỗi cặp cách nhau bằng dấu phẩy `,`.
- Khi chỉ định hàng nào được cập nhật ta sử dụng điều kiện trong mệnh đề `WHERE`

MySQL hỗ trợ hai đối số trong mệnh đề `UPDATE`:
- `LOW_PRIORITY` cho phép cập nhật dữ liệu ở mức độ ưu tiên thấp, nghĩa là khi không còn kết nối đọc từ bảng.
- `IGNORE` cho phép tiếp tục cập nhật khi xảy ra lỗi trong khi cập nhật.
### Ví dụ

Ta sẽ cập nhật lại `email` của `Mary Patterson` ở bảng `employees` trong cơ sở dữ liệu mẫu, dưới đây là giá trị ban đầu khi ta chưa cập nhật:

```SQL
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
```

<img src="https://i.imgur.com/EJM3UV7.png">

tiếp theo ta cập nhật lại `email` thành `mary.patterson@classicmodelcars.com`:

```SQL
UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
```

sau đó ta `SELECT` lại để kiểm tra, kết quả như sau:

<img src="https://i.imgur.com/5hcYcff.png">

Tiếp theo ta sử dụng `UPDATE` để cập nhật giá trị trong nhiều cột:

```SQL
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
```

kết quả sẽ như sau:

<img src="https://i.imgur.com/SMlqink.png">

Ta còn có thể sửa đổi giá trị khi cập nhật, ví dụ như sau:

```SQL
UPDATE employees
SET email = REPLACE(email,'@classicmodelcars.com','@mysqltutorial.org')
WHERE
   jobTitle = 'Sales Rep' AND
   officeCode = 6;
```

### Lưu ý
- Mệnh đề `WHERE` rất quan trọng, đôi khi ta quên nó và dẫn đến vô tình cập nhật tất cả các hàng trong bảng.



## UPDATE JOIN

### Chức năng
Ta có thể sử dụng mệnh đề `JOIN` để cập nhật giá trị trong bảng.



### Cú pháp

```SQL
UPDATE T1, T2,
[INNER JOIN | LEFT JOIN] T1 ON T1.C1 = T2. C1
SET T1.C2 = T2.C2, 
    T2.C3 = expr
WHERE condition
```

### Ví dụ

```SQL

```

### Lưu ý



## DELETE

### Chức năng
Mệnh đề `DELETE` sử dụng để xóa các giá trị trong bảng.



### Cú pháp

```SQL
DELETE FROM table_name
WHERE condition;
```

Trong đó:
- Đầu tiên ta chỉ định bảng muốn xóa sau `FROM`
- Ta chỉ định điều kiện để xóa dữ liệu trong mệnh đề `WHERE`

### Ví dụ
Ta sử dụng bảng `employees` để thực hành:

```SQL
DELETE FROM employees 
WHERE
    officeCode = 4;
```
Sau khi thực hiện lệnh tất cả nhân viên có mã văn phòng bằng 4 sẽ bị xóa khỏi cơ sở dữ lệu.

### Lưu ý
- Khi sử dụng mệnh đề `DELETE` ta cần hết sức lưu ý và có thể vô tình xóa toàn bộ dữ liệu.
- Ta có thể kết hợp với mệnh đề `LIMIT` để đặt giới hạn xóa.



## DELETE with INNER JOIN

### Chức năng
Sử dụng để xóa từ hai hoặc nhiều bảng khác nhau



### Cú pháp

```SQL
DELETE T1, T2
FROM T1
INNER JOIN T2 ON T1.key = T2.key
WHERE condition;
```

### Ví dụ
Giả sử ta có hai bản `t1` và `t2` có cấu trúc như sau:

```SQL
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

<img src="https://i.imgur.com/gAyCLFN.png">

Câu lệnh sau sẽ xóa hàng có id 1 trong bảng t1 và hàng có ref 1 trong bảng t2:

```SQL
DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;
```

### Lưu ý



## REPLACE

### Chức năng
`REPLACE` là một lệnh giúp ta thay thế dữ liệu trong bảng, nó tương tự như `INSERT` câu lệnh nhưng khi gặp lỗi trong quá trình chèn dữ liệu thì nó sẽ xóa dữ liệu bị trùng lặp trong bản đi và chèn dữ liệu mới vào.

### Cú pháp

```SQL
REPLACE [INTO] table_name(column_list)
VALUES(value_list);
```