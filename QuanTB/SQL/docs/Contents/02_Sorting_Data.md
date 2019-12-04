# SORTING DATA



## ORDER BY

### Chức năng

Dùng để sắp xếp các dữ liệu được trả về từ truy vấn `SELECT`.



### Cú pháp

```SQL
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
```

- `ASC` (ascending) là sắp xếp tăng dần
- `DESC` (descending) là sắp xếp giảm dần



### Ví dụ

Sắp xếp theo một cột:

```SQL
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname;
```

Sắp xếp theo một biểu thức:

```SQL
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
```

Sắp xếp theo một danh sách tùy chỉnh:

```SQL
SELECT 
    orderNumber, 
    status
FROM
    orders
ORDER BY 
    FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
```



### Chú ý

- Luôn được sử dụng sau `FROM` và `SELECT`
- Mặc định nếu không chỉ rõ sẽ được sắp xếp theo `ASC`