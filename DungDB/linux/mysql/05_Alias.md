# Mysql alias

## Sử dụng AS

https://freetuts.net/su-dung-as-alias-trong-mysql-338.html

Việc sử dụng AS (Alias) trong MySQL khi viết câu truy vấn giúp câu SQL ngắn gọn hơn rất nhiều. Trường hợp tên field bị trùng nhau thì chúng ta phải sử dụng AS để đặt một cái tên định danh mới cho các field. Riêng với Table thì nếu dùng AS thì ở WHERE và SELECT có thể lấy tên của  AS thay vì lấy tên gốc của table. Nếu alias có dấu cách thì đặt ở trong dấu ngoặc đơn ' '

# Có 2 loại: alias columm và alias table

## Alias columm 

Cú pháp:

    SELECT column_name AS alias_name
    FROM table_name;

Truy vấn sau đây chọn tên và họ của nhân viên. Nó sử dụng hàm `CONCAT_WS ()` để ghép tên và họ thành tên đầy đủ.

    select concat_ws(',', lastName, firstName) as 'Full Name' from employees;

![Imgur](https://i.imgur.com/KYsEcmS.png)

## Alias table

Cú pháp

    SELECT column_name(s)
    FROM table_name AS alias_name;

Alias table thường được sử dụng trong câu lệnh có chứa `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`.

Đặt employese Alias table là e.

![Imgur](https://i.imgur.com/xSBpZwI.png)

Sử dụng bảng employese. Truy vấn danh sách nhân viên sắp xếp theo firstName:

![Imgur](https://i.imgur.com/4IK3xT3.png)

Ví dụ khác:

    SELECT o.OrderID, o.OrderDate, c.CustomerName
    FROM Customers AS c, Orders AS o
    WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

là cách viết ngắn gọn cho 

    SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
    FROM Customers, Orders
    WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;