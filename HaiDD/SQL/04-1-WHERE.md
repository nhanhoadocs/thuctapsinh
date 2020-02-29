# S4.1 - `WHERE`

## Chức năng
`WHERE` : Dùng để lọc kết quả truy vấn(SELECT), cập nhật(UPDATE), xóa (DELETE)

## Cú pháp cơ bản
```
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
```

- `search_condition` là sự kết hợp của một hoặc nhiều biến vị ngữ bằng cách sử dụng toán tử logic `AND`, `OR`, `NOT`,`=`.
- Trong MySQL một biểu thức boolean có các giá trị `TRUE`, `FALSE` hoặc `UNKNOWN`.

## Thứ tự đánh giá SQL
<img src = "https://i.imgur.com/7bSN5JH.png">

## Cách sử dụng
Ta sẽ sử dụng bảng `employees` để thực hiện

<img src = "https://i.imgur.com/KWTyRMo.png">

### 1. Sử dụng `WHERE` với toán tử `=`:

Lọc các nhân viên có `jobtitle` là "*Sales Rep*"
```
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
```

Kết quả:

<img src = "https://i.imgur.com/4sNW9JU.png">

### 2. Sử dụng `WHERE` với toán tử `AND`:

Lọc các nhân viên có `jobtitle` là "*Sales Rep*" và `officeCode` = 2;
```
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 2;
```
Kết quả:

<img src = "https://i.imgur.com/mlrPOXn.png">

### 3.  Sử dụng `WHERE` với toán tử `OR`:

Lọc các nhân viên có `jobtitle` là "*Sales Rep*" hoặc `officeCode` = 1;

```
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1;
```
Kết quả:

<img src = "https://i.imgur.com/HLZTo9K.png">

### 4. Sử dụng `WHERE` với toán tử `BETWEEN`:

`expression BETWEEN low AND high`

Lọc các nhân viên có `officeCode` trong khoảng từ 1 đến 3:
```
select 
	firstName,
	lastName,
	officeCode
from
	employees
where
	officeCode between 1 and 3;
```
Kết quả:

<img src = "https://i.imgur.com/2qaVtsx.png">

### 5. Sử dụng `WHERE` với toán tử `LIKE`:

Truy vấn các nhân viên có tên kết thúc là '`son`':
```
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son';
```

Kết quả:

<img src = "https://i.imgur.com/b9PsZWA.png">

### 6. Sử dụng `WHERE` với toán tử `IN`:

`value IN (value1, value2,...)`

Lọc ra những nhân viên có `officeCode` có giá trị là 1 và 3.
```
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 3);
```
Kết quả:

<img src = "https://i.imgur.com/DU0YwSD.png">

### 7. Sử dụng `WHERE` với `IS NULL`

`value IS NULL`

Lọc những nhân viên mà cột `reportTo` có giá trị `NULL`:
```
SELECT 
	lastName,
    firstName,
    reportsTo
FROM 
	employees
WHERE
	reportsTo IS NULL;
```
Kết quả:

<img src = "https://i.imgur.com/x58yLaq.png">

### 8. Sử dụng `WHERE` với toán tử so sánh

|Toán tử|Ý nghĩa|
|-|-|
|=|Bằng. Có thể sử dụng với hầu hết các loại dữ liệu|
|<> hoặc !=|Không bằng|
|<|Nhỏ hơn. Thường sử dụng với các loại dữ liệu số và ngày, thời gian|
|>|Lớn hơn |
|<=|Nhở hơn hoặc bằng|
|>=|Lớn hơn hoặc bằng|

Ta sẽ lọc các nhân viên mà `jobtitle` không phải "*Sales Rep*":
```
SELECT
    lastname,
    firstname,
    jobTitle
FROM
    employees
WHERE
    jobTitle <> 'Sales Rep';
```
Kết quả:

<img src = "https://i.imgur.com/HqgEH4i.png">


