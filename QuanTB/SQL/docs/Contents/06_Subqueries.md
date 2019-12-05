# SUBQUERIES



## Subquery

### Chức năng
MySQL subquery là một truy vấn lồng nhau trong truy vấn khác như `SELECT`, `INSERT`, `UPDATE` hoặc `DELETE`. Ngoài ra, một truy vấn con có thể được lồng bên trong một truy vấn con khác.



### Cú pháp

`NO`



### Ví dụ

```SQL
SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
```

### Lưu ý



## Derived

### Chức năng


### Cú pháp

```SQL

```

### Ví dụ

```SQL

```

### Lưu ý



## EXISTS

### Chức năng
`EXISTS` được dùng để kiểm tra sự tồn tại của kết quả trả lại do các subquery.



### Cú pháp

```SQL
SELECT 
    select_list
FROM
    a_table
WHERE
    [NOT] EXISTS(subquery);
```



### Ví dụ

```SQL
SELECT 
    employeenumber, 
    firstname, 
    lastname, 
    extension
FROM
    employees
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            offices
        WHERE
            city = 'San Francisco' AND 
           offices.officeCode = employees.officeCode);
```



### Lưu ý