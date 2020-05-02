# S7.1 - SUBQUERY

Trong bài này, ta sẽ tìm hiểu cách sử dụng subquery để viết các truy vấn phức tạp và giải thích khái niệm ý tưởng subquery.

Subquery là 1 truy vấn được lồng trong 1 truy vấn khác, chẳng hạn như `SELECT`, `INSERT`, `UPDATE`, `DELETE`. Ngoài ra, một subquery có thể được lồng bên trong một subquery khác.

### Ví dụ
Ví dụ dưới đây trả về các nhân viên làm việc tại các văn phòng ở USA:
```sql
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

<img src="https://i.imgur.com/lkhpa5x.png">

Trong ví dụ, ta thấy:
- subquery trả về tất cả các mã văn phòng của các văn phòng tại USA.
- Truy vấn ngoài chọn họ và tên của nhân viên làm việc trong văn phòng có mã văn phòng nằm trong tập kết quả được trả về từ subquery

<img src="https://i.imgur.com/qqxLgOU.png">

Khi truy vấn được thực thi, truy vấn con chạy trước và trả về tập kết quả. Sau đó, tập kết quả này được sử dụng làm đầu vào cho truy vấn bên ngoài.

## 1. Subquery trong mệnh đề `WHERE`
Ta sử dụng bảng `payments`:

<img src="https://i.imgur.com/BTtkVLy.png">

### 1.1. Subquery với các toán tử so sánh
- Ví dụ: Truy vấn sau trả về kết quả khách hàng có khoản thanh toán tối đa
    ```sql
    SELECT 
        customerNumber, 
        checkNumber,
        amount
    FROM
        payments
    WHERE
        amount = (SELECT MAX(amount) FROM payments);
    ```

    <img src="https://i.imgur.com/zKRxTkQ.png">

### 1.2. Subquery với các toán tử `IN` `NOT IN`
Nếu truy vấn con trả về nhiều hơn một giá trị, bạn có thể sử dụng các toán tử khác như toán tử `IN` hoặc `NOT IN` trong mệnh đề `WHERE`.

Xem bảng `customers` và `orders` sau:

<img src="https://i.imgur.com/isZyQX7.png">

Ví dụ dưới đây, ta sử dụng subquery `NOT IN` để tìm những khách hàng chưa đặt hàng như sau:
```sql
SELECT customerName
FROM 
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
                                customerNumber
                            FROM
                                orders);
```

<img src="https://i.imgur.com/Fjht6YE.png">

## 2. Subquery trong mệnh đề FROM
- Khi sử dụng subquery với mệnh đề FROM, kết quả trả về được sử dụng như là 1 bảng tạm thời. Bảng này được gọi là bảng dẫn xuất hoặc subquery cụ thể.

- Truy vấn dưới đây tìm số lượng mặt hàng tối đa, tối thiểu và trung bình trong các đơn đặt hàng
    ```sql
    SELECT 
        MAX(items),
        MIN(items),
        FLOOR(AVG(items))
    FROM 
        (SELECT
            orderNumber, COUNT(orderNumber) AS items
        FROM
            orderdetails
        GROUP BY 
            orderNumber
        ) AS lineitems;
    ```

    <img src="https://i.imgur.com/AA9uJaL.png">

    `FLOOR()` được sử dụng để xóa các số thập phân sau dấu phẩy.

    