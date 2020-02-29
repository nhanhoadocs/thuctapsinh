# S5.7 - Self Join

## Cơ bản về Self Join
MySQL Self Join sẽ thêm 1 bảng vào chính nó sử dụng `INNER JOIN` và `LEFT JOIN`.

Self Join được sử dụng để truy vấn dữ liệu phân cấp hoặc để so sánh một hàng với các hàng khác trong cùng 1 bảng.

**Lưu ý:** Để thực hiện Self Join, bạn phải sử dụng bí danh bảng để quá trình thực hiện không bị lỗi do lặp lại tên bảng 2 lần trong 1 truy vấn.

## Ví dụ về cách sử dụng
Sử dụng bảng `employees`:

<img src = "https://i.imgur.com/KWTyRMo.png">

Bảng này lưu trữ không chỉ dữ liệu nhân viên mà còn có id của người quản lí nhân viên đó, được xác định bởi cột `reportsTo`.

### 1. Self Join sử dụng `INNER JOIN`
```
SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
```
<img src = "https://i.imgur.com/3TYVvlE.png">

Đầu ra kết quả chỉ cho ra những nhân viên có người quản lí.

### 2. Self Join sử dụng `LEFT JOIN`
Để ra được cả nhân viên không có quản lí. Ta sử dụng `LEFT JOIN`
```
SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
```
<img src = "https://i.imgur.com/bPPoWTy.png">


3. Self Join dùng để so sánh các hàng với nhau

Hiển thị danh sách khách hàng định vị trong cùng thành phố bằng cách self join bảng `customers` với chính nó.
```
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;
```
<img src = "https://i.imgur.com/njtw7LM.png">

