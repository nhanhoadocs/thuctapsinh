# S5.5 - RIGHT JOIN

Giống với `LEFT JOIN`, ngoại trừ việc đảo ngược các bảng được sử dụng.

## Cú pháp cơ bản
```
SELECT 
    select_last
FROM t1
RIGHT JOIN t2 ON 
    join_condition;
```
Trong đó:
- `t1` là bảng bên trái
- `t2` là bảng bên phải

## Cách hoạt động
`RIGHT JOIN` sẽ bắt đầu chọn dữ liệu từ bảng bên phải (`t2`). Nó sẽ khớp từng hàng từ bảng bên phải với mỗi hàng từ bảng bên trái. Nếu thỏa mãn điều kiện thì nó sẽ kết hợp các cột thành 1 hàng mới.

Nếu 1 hàng từ bảng bên phải không có 1 hàng phù hợp từ bảng bên trái, nó sẽ kết hợp các cột của các hàng từ bảng bên phải với các giá trị NULL thành 1 hàng mới.

Nói cách khác, `RIGHT JOIN` trả về tất cả các hàng từ bảng bên phải bất kể bảng bên trái có hàng phù hợp hay không.

## Ví dụ về cách sử dụng
Chúng ta sẽ sử dụng 2 bảng `employees` và `customers` 
<img src = "https://i.imgur.com/qdWqvM4.png">

Cột `salesRepEmployeeNumber` trong bảng `customers` liên kết với cột `employeeNumber` của bảng `employees`.

Một `employees` có thể phụ trách 0 hay nhiều `customers`. Mỗi `customers` được chăm sóc bởi 0 hoặc 1 `employees`.

Nếu giá trị trong cột `salesRepEmployeeNumber` là NULL, điều đó có nghĩa là khách hàng không có bất kỳ đại diện bán hàng nào.

### 1. `RIGHT JOIN` đơn giản
Truy vấn ra mã nhân viên và mã khách hàng tương ứng.
```
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
    employeeNumber;
```
<img src = "https://i.imgur.com/3w51072.png">


### 2. `RIGHT JOIN` với `IS NULL`
Truy vấn ra các nhân viên không phụ trách bất kí khách hàng nào.
```
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
    salesRepEmployeeNumber = employeeNumber
WHERE customerNumber IS NULL
ORDER BY employeeNumber;
```
<img src = "https://i.imgur.com/Xv6FwI6.png">
