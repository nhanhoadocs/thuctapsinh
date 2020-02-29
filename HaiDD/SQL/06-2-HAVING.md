# S6.2 - `HAVING`

## Chức năng
Mệnh đề MySQL `HAVING` để chỉ định điều kiện lọc cho các nhóm hàng hoặc tổng hợp.

## Cú pháp
```sql
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
```

**Lưu ý:** mệnh đề `HAVING` áp dụng điều kiện lọc cho từng nhóm hàng, trong khi mệnh đề `WHERE` áp dụng điều kiện lọc cho từng hàng riêng lẻ.

## Thứ tự đánh giá trong SQL
<img src="https://i.imgur.com/lu0SVwx.png">

## Ví dụ
Sử dụng bảng `orderdetails`

<img src="https://i.imgur.com/OOiUc7H.png">

- Sử dụng `GROUP BY` để lấy số thứ tự, số lượng mặt hàng được bán cho mỗi đơn hàng và tổng doanh số cho mỗi sản phẩm từ bảng `orderdetails`

    ```sql
    SELECT 
        ordernumber,
        SUM(quantityOrdered) AS itemsCount,
        SUM(priceeach*quantityOrdered) AS total
    FROM
        orderdetails
    GROUP BY ordernumber;
    ```

    <img src="https://i.imgur.com/PfUQqAe.png">

- Bây giờ ta có thể tìm các đơn hàng có tổng doanh số lớn hơn 1000 bằng cách sử dụng `HAVING`
    ```sql
    SELECT 
        ordernumber,
        SUM(quantityOrdered) AS itemsCount,
        SUM(priceeach*quantityOrdered) AS total
    FROM
        orderdetails
    GROUP BY 
        ordernumber
    HAVING 
        total > 1000;
    ```

    **Kết quả:**

    <img src="https://i.imgur.com/o70dGfj.png">

- Bạn có thể xây dựng một điều kiện phức tạp trong mệnh đề `HAVING` bằng các toán tử logic như `OR` và `AND`

    Tìm các đơn hàng có tổng số tiền lớn hơn 1000 và chứa hơn 600 mặt hàng
    ```sql
    SELECT 
        ordernumber,
        SUM(quantityOrdered) AS itemsCount,
        SUM(priceeach*quantityOrdered) AS total
    FROM
        orderdetails
    GROUP BY ordernumber
    HAVING 
        total > 1000 AND 
        itemsCount > 600;
    ```

    **Kết quả**

    <img src="https://i.imgur.com/3ungjgA.png">

- Giả sử bạn muốn tìm tất cả các đơn đặt hàng ở trạng thái giao hàng và có tổng số tiền lớn hơn 1500, bạn có thể `JOIN` bảng `orderdetails` với bảng `orders` bằng cách sử dụng mệnh đề `INNER JOIN` và áp dụng một điều kiện trên cột `status` và `total` như trong truy vấn sau
    ```sql
    SELECT 
        a.ordernumber, 
        status, 
        SUM(priceeach*quantityOrdered) total
    FROM
        orderdetails a
    INNER JOIN orders b 
        ON b.ordernumber = a.ordernumber
    GROUP BY  
        ordernumber, 
        status
    HAVING 
        status = 'Shipped' AND 
        total > 1500;
    ```

    **Kết quả:**

    <img src="https://i.imgur.com/jFme8ki.png">

    