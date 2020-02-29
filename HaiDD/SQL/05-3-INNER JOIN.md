# S5.3 - `INNER JOIN`

Trong bài viết này, ta sẽ tìm hiểu cách sử dụng mệnh đề `INNER JOIN` để lấy dữ liệu từ nhiều bảng dựa trên các điều kiện.

## Chức năng
`INNER JOIN` khớp từng hàng trong 1 bảng với mỗi hàng trong bảng khác và cho phép bạn truy vấn các hàng có chứa các cột chung từ 2 bảng.

## Cú pháp cơ bản
```
SELECT
    select_list
FROM t1
INNER JOIN t2 ON join_condition1
INNER JOIN t3 ON join_condition2
...;
```

Trong đó:
- Bảng chính là `t1`
- Bảng chỉ định sẽ được nối với bảng chính: `t2`, `t3`, ...
- Điều kiện nối xác định quy tắc khớp các hàng của bảng chính với các bảng chỉ định.

Sơ đồ Venn minh họa cách hoạt động của `INNER JOIN`:

<img src = "https://i.imgur.com/2tLh5xM.png">

## Ví dụ về cách sử dụng
### 1. Sử dụng `INNER JOIN` cơ bản
Ta sử dụng 2 bảng `products` và `productlines`:

<img src ="https://i.imgur.com/5NK3aOy.png">

Theo sơ đồ, ta thấy bảng `products` có cột `productLine` tham chiếu giá trị của cột `productLine` của bảng `productlines`. Cột `productLine` trong bảng `products` được gọi là khóa ngoại.

**Yêu cầu**: 
- Lấy `productCode` và `productName` từ bảng `products`
- Lấy `textDescription` của dòng sản phẩm từ bảng `productlines`

Để làm điều này, ta sẽ lấy dữ liệu cả 2 bảng bằng cách khớp các hàng dựa trên các giá trị trong cột `productline` bẳng mệnh đề `INNER JOIN`:
```
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
```
Kết quả:

<img src = "https://i.imgur.com/a9FIgfM.png">

Vì các cột được nối của 2 bảng có cùng tên `productline` nên ta có thể sử dụng `USING` như sau:
```
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);
```

### 2. Sử dụng `INNER JOIN` với `GROUP BY`
Ta sử dụng 2 bảng `orders` và `orderdetails`

<img src = "https://i.imgur.com/egkouFP.png">

Truy vấn trả về số thứ tự, trạng thái đơn hàng và tổng doanh số từ 2 bảng `orders` và `orderdetails`:
```
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;
```
Kết quả:

<img src = "https://i.imgur.com/IEnyxb3.png">

Tương tự, ta có thể sử dụng với `USING`:
```
SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;
```

### 3. Sử dụng `INNER JOIN` 3 bảng
Ta sẽ dùng 3 bảng `products`, `orders`, `orderdetails`. Truy vấn ra danh sách đặt hàng kèm tên với giá sản phẩm,...

<img src = "https://i.imgur.com/LVkuQRz.png">

```
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;
```
Kết quả:

<img src = "https://i.imgur.com/BHRyHd5.png">

### 4. Sử dụng `INNER JOIN` với các toán tử khác
Ta sẽ truy vấn để tìm giá sản phẩm có mã `S10_1949` có giá thấp hơn giá đề xuất của nhà sản xuất (`msrp`).
```
SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1949';
```
Kết quả: 

<img src = "https://i.imgur.com/FvETN1R.png">
