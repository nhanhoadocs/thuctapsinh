# S6.1 - `GROUP BY`

Trong bài này, ta sẽ học cách sử dụng `GROUP BY` để nhóm các hàng thành các nhóm con dựa trên các giá trị của cột hay biểu thức.

## Chức năng
`GROUP BY` nhóm một tập hợp các hàng với nhau theo các giá trị của cột hoặc biểu thức. `GROUP BY` trả về một hàng cho mỗi nhóm. Nói cách khác, nó làm giảm số lượng hàng trong tập kết quả

## Cú pháp
```sql
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;
```

Mệnh đề `GROUP BY` phải xuất hiện sau mệnh đề `FROM` và `WHERE`. Theo sau các từ khóa `GROUP BY` là danh sách các cột hoặc biểu thức được phân tách bằng dấu phẩy mà bạn muốn sử dụng làm tiêu chí cho các hàng nhóm.

## Thứ tự đánh giá của SQL

<img src="https://i.imgur.com/e9DNEE0.png">

## Ví dụ
### 1. `GROUP BY` đơn giản
Ta sử dụng bảng `orders` 

<img src="https://i.imgur.com/o4i0zSz.png">

Ta muốn nhóm các giá trị của trạng thái đơn hàng (`status`) thành các nhóm con.

```sql
SELECT status
FROM 
    orders
GROUP BY status;
```

**Kết quả:**

<img src="https://i.imgur.com/kexDk87.png">

Ta thấy `GROUP BY` trả về các trạng thái có trong bảng. Nó làm việc giống `DISTINCT` trong câu truy vấn sau:
```sql
SELECT DISTINCT
    status
FROM
    orders;
```

### 2. `GROUP BY` với các hàm tổng hợp
Các hàm tổng hợp cho phép bạn thực hiện tính toán một tập hợp các hàng và trả về một giá trị duy nhất.

`GROUP BY` thường được sử dụng với hàm tổng hợp để tính toán và trả về giá trị duy nhất cho các nhóm con.

Ví dụ, ta muốn lấy số lượng đơn hàng ở mỗi trạng thái, ta sử dụng `COUTN` với `GROUP BY`  như sau:
```sql
SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;
```

**Kết quả:**

<img src="https://i.imgur.com/oxy6tfS.png">

Ví dụ khác, ta xem 2 bảng `orders` và `orderdetails`

<img src="https://i.imgur.com/866AS8W.png">

Bây giờ ta muốn tính toán tổng tiền của mỗi trạng thái đơn hàng. Ta làm như sau:
```sql
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

**Kết quả:**

<img src="https://i.imgur.com/pQGUqh2.png">

### 3. `GROUP BY` với giá trị biểu thức
Ngoài các cột, bạn có thể nhóm các hàng theo biểu thức. Các truy vấn sau đây có được tổng doanh số cho mỗi năm.
```sql
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);
```

**Kết quả:**

<img src="https://i.imgur.com/CZaHQRX.png">

`YEAR(orderDate)` dùng để trích xuất dữ liệu năm từ `orderDate` để truy vấn dữ liệu theo năm.

