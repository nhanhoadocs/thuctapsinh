# FILTERING DATA



## WHERE

### Chức năng

Dùng để chỉ định điều kiện tìm kiếm cho các dữ liệu được trả về bởi một câu truy vấn.



### Cú pháp

```SQL
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
```

- `search_condition` là một hoặc sự kết hợp nhiều điều kiện bằng cách sử dụng toán tử  `AND`, `OR` và `NOT`.
- Trong MySQL một biểu thức boolean có các giá trị `TRUE`, `FALSE` hoặc `UNKNOWN`.



### Ví dụ

Với toán tử `AND`:

```SQL
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
```

Với toán tử `OR`:

```SQL
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;
```

Với toán tử `BETWEEN`:

```SQL
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;
```

Với toán tử `LIKE`:

```SQL
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;
```

- `%` đại diện cho 0 hoặc nhiều ký tự
- `_` đại diện cho một ký tự đơn


Với toán tử `IN`

```SQL
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
```

Với toán tử `NOT IN`

```SQL
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode NOT IN (1 , 2, 3)
ORDER BY 
    officeCode;
```

Với toán tử `IS NULL`

```SQL
SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
```

Với các toán tử so sánh:

```SQL
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
```

```SQL
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';

SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle != 'Sales Rep';
```

```SQL
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
```

```SQL
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode >= 5;
```

```SQL
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode < 4;
```

```SQL
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;
```



### Chú ý

- Ngoài `SELECT`, `WHERE` còn được sử dụng trong các câu lệnh `UPDATE` hoặc `DELETE`




## DISTINCT

### Chức năng

Dùng để loại bỏ các hàng trùng lặp trong tập kết quả.



### Cú pháp

```SQL
SELECT DISTINCT
    select_list
FROM
    table_name;
```



### Ví dụ:

```SQL
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
```

Với hàm tổng hợp:

```SQL
SELECT 
    COUNT(DISTINCT state)
FROM
    customers
WHERE
    country = 'USA';
```

Với `LIMIT`:

```SQL
SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;
```



### Chú ý

- Nếu trong cột có các giá trị `NULL` thì sẽ vẫn còn lại một giá trị `NULL`
- Có thể sử dụng khi ``SELECT` nhiều cột
- `DISTINCT` hoạt động giống như sử dụng `GROUP BY` mà không có các hàm tổng hợp dữ liệu.
- Về cơ bản `DISTINCT` là trường hợp đặt biệt của `GROUP BY`, chỉ khác nhau ở chỗ `DISTINCT` không được sắp xếp
- Ngoài ra trong `MySQL-8.x` `GROUP BY` đã loại bỏ sắp xếp nên nó tương tự như `DISTINCT`




## AND

### Chức năng

Là toán tử logic kết hợp hai biểu thức `boolean` lại và trả về `TRUE` chỉ khi cả hai biểu thức đều là `TRUE`


### Cú pháp

```SQL
boolean_expression_1 AND boolean_expression_2
```

Bảng dưới đây minh họa kết quả của sự kết hợp:


|#		|TRUE	|FALSE	|NULL |
|-------|-------|-------|-----|
|TRUE	|TRUE	|FALSE	|NULL |
|FALSE	|FALSE	|FALSE	|FALSE|
|NULL	|NULL	|FALSE	|NULL |



### Ví dụ:

```SQL
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND state = 'CA';
```

### Chú ý

- Sử dụng trong mệnh để `WHERE` của các câu truy vấn `SELECT`, `UPDATE`, `DELETE`
- Có thể sử dụng kết hợp nhiều toán tử `AND`
- Trong MySQL `0` được coi là `FALSE` và số 1 được coi là `TRUE`





## OR

### Chức năng

Toán tử `OR` kết hợp hai biểu thức `Boolean` và trả về `TRUE` khi một trong hai điều kiện là đúng.


### Cú pháp

```SQL
boolean_expression_1 OR boolean_expression_2
```

Bảng dưới đây minh họa kết quả của sự kết hợp:

|#		|TRUE	|FALSE	|NULL|
|-------|-------|-------|----|
|TRUE	|TRUE	|TRUE	|TRUE|
|FALSE	|TRUE	|FALSE	|NULL|
|NULL	|TRUE	|NULL	|NULL|

### Ví dụ:

```SQL
SELECT    
    customername, 
    country
FROM    
    customers
WHERE country = 'USA' OR 
      country = 'France';
```



### Chú ý

- MySQL ngừng kiểm tra khi một trong các biểu thức là đúng
- Khi sử dụng nhiều toán tử logic trong một biểu thức MySQL luôn ưu tiên các toán tử `AND`
- Để thay đổi sự ưu tiên ta sử dụng dấu ngặc `(`, `)` bao lấy biểu thức 




## IN

### Chức năng

Toán tử `IN` giúp xác định xem một giá trị cụ thể có nằm trong một tập hợp các giá trị hoặc kết quả trả về bởi một truy vấn con.



### Cú pháp

```SQL
SELECT 
    column1,column2,...
FROM
    table_name
WHERE 
    (expr|column_1) IN ('value1','value2',...);
```

### Ví dụ:

```SQL
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');
```

Sử dụng với các truy vấn con:

```SQL
SELECT    
    orderNumber, 
    customerNumber, 
    status, 
    shippedDate
FROM    
    orders
WHERE orderNumber IN
(
     SELECT 
         orderNumber
     FROM 
         orderDetails
     GROUP BY 
         orderNumber
     HAVING SUM(quantityOrdered * priceEach) > 60000
);
```

### Chú ý

- Có thể kết hợp `NOT` với `IN` cho mục đích ngược lại




## BETWEEN

### Chức năng

Toán tử `BETWEEN` cho phép xác định xem một giá trị có nằm trong một phạm vi hay không.


### Cú pháp

```SQL
expr [NOT] BETWEEN begin_expr AND end_expr;
```



### Ví dụ:

```SQL
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
```

Với thời gian:

```SQL
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
```



### Chú ý

- Toán tử `BETWEEN` thường được sử dụng trong các mệnh đề `WHERE` của các câu truy vấn `SELECT`, `UPDATE` và `DELETE`
- Có thể kết hợp `NOT` với `BETWEEN` cho mục đích ngược lại




## LIKE

### Chức năng

Toán tử `LIKE` cho phép xác định một chuỗi có chứa một mô hình hay một định dạng cụ thể không.



### Cú pháp

```SQL
expression LIKE pattern ESCAPE escape_character
```

MySQL cung cấp hai ký tự đại diện để xây dựng mô hình hay định dạng:
- Ký tự `%` khớp với bất kỳ chuỗi nào có 0 hoặc nhiều ký tự.
- Ký tự `_` khớp với bất kỳ ký tự đơn nào



### Ví dụ:

Với ký tự `%`:

```SQL
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';
```

Với ký tự `_`:

```SQL
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
```



### Chú ý

- Toán tử `LIKE` thường được sử dụng trong các mệnh đề `WHERE` của các câu truy vấn `SELECT`, `UPDATE` và `DELETE`
- Khi mẫu có chứa các ký tự đặc biệt ta có thể sử dụng `\` trước các ký tự đó. 




## LIMIT

### Chức năng

`LIMIT` được sử dụng trong các câu truy vấn `SELECT` để gới hạn kết quả trả về.


### Cú pháp

```SQL
SELECT 
    select_list
FROM
    table_name
LIMIT [offset,] row_count;
```

- `offset` chỉ định vị trí bắt đầu, `offset` đầu tiên là 0.
- `row_count` chỉ định số lượng tối đa trả về.

Ngoài ra MySQL cung cấp thêm cu pháp sau để tương thích với `PostgreSQL`:

```SQL
LIMIT row_count OFFSET offset
```

### Ví dụ:

Để lấy các hàng cao nhất

```SQL
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;
```

Để lấy các hàng thấp nhất

```SQL
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;

```

Để phân trang:

```SQL
...
```



### Chú ý

- Có thể bỏ qua `offset` và mặc định nó bằng 0
- Luôn luôn sử dụng `LIMIT` mệnh đề với `ORDER BY	` để ràng buộc các kết quả theo thứ tự duy nhất.




## IS NULL

### Chức năng

Toán tử `IS NULL` nhằm xác định một giá trị nó `NULL` hay không. 


### Cú pháp

```SQL
value IS NULL
```

Để kiểm tra không `NULL` ta sử dụng cú pháp:

```SQL
value IS NOT NULL
```

### Ví dụ:

```SQL
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName; 
```

### Chú ý
...