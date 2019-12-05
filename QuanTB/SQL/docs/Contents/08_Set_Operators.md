# SET OPERATORS



## UNION

### Chức năng
Toán tử  `UNION` cho phép ta kết hợp hai hoặc nhiều bộ kết quả truy vấn thành một bộ kết quả.



### Cú pháp

```SQL
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...
```

Quy tắc cơ bản:
- Đầu tiên, số lượng và thứ tự của các cột xuất hiện trong tất cả các `SELECT` câu lệnh phải giống nhau.

- Thứ hai, các kiểu dữ liệu của cột phải giống nhau hoặc tương thích.

Theo mặc định, toán tử `UNION` loại bỏ các hàng trùng lặp ngay cả khi ta không chỉ định `DISTINCT` rõ ràng.


#### `UNION` so với `JOIN`
`JOIN` kết quả kết hợp đặt theo chiều ngang, `UNION` kết quả nối thêm được đặt theo chiều dọc. Hình ảnh sau đây minh họa sự khác biệt giữa `UNION` và `JOIN`:

<img src="../../../SQL/docs/Images/MySQL-UNION-vs-JOIN.png">



### Ví dụ

```SQL
SELECT 
    firstName, 
    lastName
FROM
    employees 
UNION 
SELECT 
    contactFirstName, 
    contactLastName
FROM
    customers;
```

### Lưu ý



## INTERSECT

### Chức năng


### Cú pháp

```SQL

```

### Ví dụ

```SQL

```

### Lưu ý



## MINUS

### Chức năng


### Cú pháp

```SQL

```

### Ví dụ

```SQL

```

### Lưu ý