# S5.1 - Table & Column Aliases

## Chức năng
MySQL Aliases dùng để cải thiện đọc của các truy vấn bằng cách đặt bí danh.

## Đặt bí danh cho các cột
Đôi khi các tên của cột thực tế dài và khó hiểu, vì vậy đặt bí danh cho cột là một ý tưởng hợp lí.

### Cú pháp
```
SELECT 
   [column_1 | expression] AS descriptive_name
FROM table_name;
```

Nếu bí danh có dấu khoảng trắng thì ta sử dụng thêm dấu 
```
`descriptive name`
```

### Ví dụ
Sử dụng bảng `employese` 

<img src = "https://i.imgur.com/CjSGH6D.png">

Truy vấn sau đây chọn tên và họ của nhân viên. Nó sử dụng hàm `CONCAT_WS ()` để ghép tên và họ thành tên đầy đủ.
```
SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;
```
<img src = "https://i.imgur.com/oAuCcDu.png">


Bảng kết quả tên cột nhìn dài và khó hiểu. Nên ta sẽ đặt bí danh cho nó:
```
SELECT
   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;
```
<img src = "https://i.imgur.com/LGRY2H1.png">

Trong MySQL, bạn có thể sử dụng bí danh cột trong `ORDER BY`, `GROUP BY` và `HAVING` để chỉ cột.

## Đặt bí danh cho bảng
Cũng giống như cột, bạn có thể đặt bí danh cho bảng.
### Cú pháp
```
table_name AS table_alias
```

Các bí danh cho bảng thường được sử dụng trong câu lệnh có chứa `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`.

### Ví dụ
Đặt `employese` bí danh bảng là e.
```
SELECT * FROM employees e;
```

Sử dụng bảng `employese`. Truy vấn danh sách nhân viên sắp xếp theo `firstName`:

<img src = "https://i.imgur.com/CjSGH6D.png">

```
SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;
```
<img src = "https://i.imgur.com/vfBHx4S.png">