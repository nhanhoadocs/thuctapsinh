# S3 - Sorting Data

## Chức năng
Dùng để sắp xếp các dữ liệu được trả về từ truy vấn `SELECT`.

## Cú pháp
```
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
```
Trong đó: 
- `ASC`: (ascending) là sắp xếp tăng dần
- `DESC`: (descending) là sắp xếp giảm dần


## Thứ tự đánh giá của SQL
<img src ="https://i.imgur.com/NPKtwpT.png">

`ORDER BY` luôn được đánh giá sau `FROM` và `SELECT`.

## Ví dụ
Sử dụng bảng `customers`

<img src = "https://i.imgur.com/3KHeatZ.png">


### 1. Sắp xếp dữ liệu theo 1 cột
Sắp xếp `customers` theo giá trị tăng dần từ cột `contactLastName`
```
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname;
```
Kết quả:

<img src = "https://i.imgur.com/d4D4dxt.png">

### 2. Sắp xếp dữ liệu theo nhiều cột
Sắp xếp các `customers` theo giảm dần của `contactLastname` và tăng dần của `contactFirstname`. Ta sử dụng `DESC` và `ASC`:

```
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC,
    contactFirstname ASC;
```

Kết quả:

<img src = "https://i.imgur.com/i8ND5EU.png">

### 3. Sắp xếp kết quả của một phép tính
Sử dụng bảng `orderdetails` 

<img src = "https://i.imgur.com/XvbPT6O.png">

Sắp xếp dựa trên phép tính `quantityOrdered` * `priceEach`
```
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
```
Kết quả:

<img src = "https://i.imgur.com/Y6ZUp18.png">

Để kết quả truy vấn dễ đọc hơn, ta có thể gán cột `quantityOrdered * priceEach` bằng tên khác ngắn hơn, sử dụng `AS`:
```
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;
```
Kết quả:

<img src ="https://i.imgur.com/nYHB4me.png">

### 4. Sắp xếp tùy chỉnh
Sử dụng `FIELD()`. 

Ta sử dụng bảng `order`:

<img src = "https://i.imgur.com/KGBzomu.png">

Bạn muốn sắp xếp đơn hàng theo thứ tự trạng thái như sau:
- In Process
- On Hold
- Canceled
- Resolved
- Disputed
- Shipped

```
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

Kết quả:

<img src ="https://i.imgur.com/AKYreHi.png">
