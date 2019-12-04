# GROUPING DATA



## GROUP BY

### Chức năng
Mệnh đề `GROUP BY` nhóm các hàng thành một tập hợp có chung giá trị hoặc biểu thức



### Cú pháp

```SQL
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;
```



### Ví dụ

```SQL
SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;
```

```SQL
SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;
```



### Lưu ý
- `GROUP BY` phải xuất hiện sau mệnh đề `FROM` và `WHERE`



## HAVING

### Chức năng
Mệnh đề `HAVING` trong SQL cho bạn khả năng để xác định các điều kiện để lọc nhóm kết quả nào sẽ xuất hiện trong kết quả cuối cùng.

Mệnh đề `WHERE` đặt các điều kiện trên các cột đã lựa chọn, trong khi mệnh đề `HAVING` đặt các điều kiện trên các nhóm đã được tạo bởi mệnh đề `GROUP BY`.



### Cú pháp

```SQL
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
```



### Ví dụ

Lọc các đơn hàng có tổng doanh số lơn hơn 1000:

```SQL
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 1000;
```

### Lưu ý
- Được sử dụng kết hợp với `GROUP BY` vì nó không hỗ trợ lọc các hàm tổ hợp.



## ROLLUP

### Chức năng


### Cú pháp

```SQL

```

### Ví dụ

```SQL

```

### Lưu ý