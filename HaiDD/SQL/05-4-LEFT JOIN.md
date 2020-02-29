# S5.4 - LEFT JOIN

Trong bài viết này, ta sẽ tìm hiểu cách sử dụng mệnh đề `LEFT JOIN` để lấy dữ liệu từ nhiều bảng dựa trên các điều kiện.

## Cú pháp cơ bản
```
SELECT 
    select_list
FROM
    t1
LEFT JOIN t2 ON 
    join_condition;
```

- `t1` là bảng bên trái
- `t2` là bảng bên phải

## Cách hoạt động
`LEFT JOIN` sẽ lấy dữ liệu từ bảng bên trái (`t1`). Nó sẽ khớp với từng hàng từ bảng bên trái (`t1`) với mỗi hàng của bảng bên phải (`t2`) dựa trên điều kiện `join_condition`.

Nếu các hàng từ 2 bảng thỏa mãn điều kiện, thì sẽ tạo thành 1 hàng mới gồm các cột của 2 bảng này. 

Trong trường hợp hàng từ bảng bên trái (`t1`) không khớp với bất kì hàng nào trong bảng bên phải(`t2`). `LEFT JOIN` vẫn kết hợp các cột từ các hàng từ 2 bảng thành 1 hàng mới. Tuy nhiên, nó sẽ để giá trị `NULL` cho tất cả các cột của hàng bên phải.

Nói cách khác, `LEFT JOIN` trả về tất cả các hàng từ bảng bên trái(`t1`) bất kể bảng bên phải(`t2`) có 1 hàng nào phù hợp hay không. Nếu không có kết quả khớp, các cột của hàng từ bảng bên phải(`t2`) sẽ có giá trị `NULL`.

Sơ đồ Venn minh họa cách hoạt động của `LEFT JOIN`
<img src = "https://i.imgur.com/vDWk5m6.png">

## Ví dụ về cách sử dụng
### 1. `LEFT JOIN` với 2 bảng
Ta sử dụng 2 bảng `customers` và `orders`

<img src= "https://i.imgur.com/8dneoPw.png">

Theo sơ đồ thì mỗi `customers` có thể có nhiều `orders`, còn mỗi `orders` chỉ từ 1 `customers`.

Truy vấn lấy ra tất cả các khách hàng và đơn hàng của họ.
```
SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;
```
Ta có thể sử dụng cách đặt bí danh bảng:
```
SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;
```
Kết quả:

<img src = "https://i.imgur.com/DD5Igl0.png">

Do 2 cột `customerNumber` của 2 bảng giống nhau nên ta có thể sử dụng `USING` như sau:
```
SELECT
    customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers
LEFT JOIN orders USING (customerNumber);
```

### 2. `LEFT JOIN` với `IS NULL`
Tìm những khách hàng không có đơn hàng.
```
SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;
```
Kết quả:

<img src = "https://i.imgur.com/xZFx6ce.png">

### 3. `LEFT JOIN` với 3 bảng
Sử dụng 3 bảng `employees`, `customers`, và `payments`:
<img src  ="https://i.imgur.com/IPLbBPC.png">

Truy vấn ra danh sách tất cả các nhân viên và các khách hàng mà họ phụ trách.
```
SELECT 
    e.lastName, 
    e.firstName, 
    c.customerName, 
    p.checkNumber, 
    p.amount
FROM
    employees e
LEFT JOIN customers c ON 
    e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p ON 
    p.customerNumber = c.customerNumber
ORDER BY 
    customerName, 
    checkNumber;
```
Kết quả:

<img src = "https://i.imgur.com/wgUJknP.png">

- `LEFT JOIN` thứ nhất trả về tất cả các nhân viên và khách hàng của họ quản lí hoặc trả về giá trị `NULL` nếu không quản lí khách hàng nào.
- `LEFT JOIN` thứ hai trả về tất cả các khoản thanh toán của mỗi khách hàng được đại diện bởi nhân viên nào đó hoặc trả về `NULL` nếu  khách hàng không có khoản thanh toán nào.

### 4. `LEFT JOIN` với 2 mệnh đề `WHERE` và `ON`
**Sử dụng mệnh đề `WHERE`:**

Truy vấn dữ liệu trong bảng `orders` và `orderDetails` trả về đơn hàng chi tiết đơn hàng của số đơn hàng '*10123*'
```
SELECT 
    o.orderNumber, 
    o.customerNumber, 
    od.productCode
FROM
    orders o
LEFT JOIN orderdetails od
    USING (orderNumber)
WHERE
    orderNumber = 10123;
```
<img src = "https://i.imgur.com/hLXdFfz.png">


**Nếu ta sử dụng mệnh đề `ON`:**
```
SELECT 
    o.orderNumber, 
    o.customerNumber, 
    od.productCode
FROM
    orders o
LEFT JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber AND 
       o.orderNumber = 10123;
```
<img src = "https://i.imgur.com/86nDPsJ.png">

Ở đây sẽ trả về tất cả đơn hàng nhưng chỉ có đơn hàng có `orderNumber` = 10123 là có chi tiết đơn hàng.


