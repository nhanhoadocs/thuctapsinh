# S6.3 - ROLLUP

Cách sử dụng mệnh đề MySQL `ROLLUP` để tạo tổng phụ và tổng lớn.

## Tạo bảng mẫu
- Đoạn truy vấn dưới đây tạo ra bảng mới tên là `sales`, nó lưu trữ các giá trị đơn hàng được tóm tắt theo dòng sản phẩm và năm. Dữ liệu đến từ các bảng `products`, `orders` và `orderDetails` trong database mẫu
    ```sql
    CREATE TABLE sales
    SELECT
        productLine,
        YEAR(orderDate) orderYear,
        SUM(quantityOrdered * priceEach) orderValue
    FROM
        orderdetails
            INNER JOIN
        orders USING (orderNumber)
            INNER JOIN
        products USING (productCode)
    GROUP BY
        productLine ,
        YEAR(orderDate);
    ```

- Thử truy vấn kết quả bảng `sales` sau khi tạo
    ```sql
    SELECT * FROM sales;
    ```

    <img src="https://i.imgur.com/2my9CiL.png">

## Tổng quan về `ROLLUP`
Groupong set là tập hợp các cột mà bạn muốn nhóm.

- Query dưới đây tạo ra 1 Grouping set được biểu thị bởi `productline`
    ```sql
    SELECT 
        productline, 
        SUM(orderValue) totalOrderValue
    FROM
        sales
    GROUP BY 
        productline;
    ```

    <img src="https://i.imgur.com/fMIXqod.png">

- Query dưới đây tạo 1 Grouping set trống được kí hiệu là `()`
    ```sql
    SELECT 
        SUM(orderValue) totalOrderValue
    FROM
        sales;
    ```

    <img src="https://i.imgur.com/HD4pwdO.png">

- Nếu muốn tạo 2 hay nhiều Grouping set trong cùng 1 câu truy vấn, bạn có thể sử dụng toán tử `UNION ALL` như sau:
    ```sql
    SELECT 
        productline, 
        SUM(orderValue) totalOrderValue
    FROM
        sales
    GROUP BY 
        productline 
    UNION ALL
    SELECT 
        NULL, 
        SUM(orderValue) totalOrderValue
    FROM
        sales;
    ```

    <img src="https://i.imgur.com/zFVZTD3.png">

- `UNION ALL` yêu cầu các câu truy vấn phải có cùng số cột, ta thêm cột `NULL` để thỏa mãn yêu cầu này.

Những truy vấn này có thể tạo ra tổng giá trị đơn hàng theo dòng sản phẩm và cả tổng lớn. Tuy nhiên, nó có 1 số vấn đề sau:

1. Các câu truy vấn khá dài
2. Hiệu năng truy vấn có thể không tốt vì phải thực hiện bên trong 2 truy vấn riêng biệt và kết hợp các tập kết quả thành một.

Chính vì vậy, ta sẽ sử dụng `ROLLUP`.

### Cú pháp
- `ROLLUP` là phần mở rộng của mệnh đề `GROUP BY` với cú pháp sau:
    ```sql
    SELECT 
        select_list
    FROM
        table_name
    GROUP BY 
        c1, c2, c3, WITH ROLLUP;
    ```

- `ROLLUP` tạo ra nhiều Grouping set dựa trên các cột hoặc biểu thức được chỉ định trong mệnh đề `GROUP BY`

### Ví dụ với bảng ta vừa tạo ở trên
- Xem truy vấn sau:
    ```sql
    SELECT 
        productLine, 
        SUM(orderValue) totalOrderValue
    FROM
        sales
    GROUP BY 
        productline WITH ROLLUP;
    ```

    <img src="https://i.imgur.com/taGwuFU.png">

- `ROLLUP` tạo ra các tổng phụ và kèm với tổng chính giá trị các đơn hàng.

- Nếu bạn có nhiều hơn 1 cột được chỉ định trong mệnh đề `GROUP BY`, mệnh đề `ROLLUP` giả định một hệ thống phân cấp giữa các cột đầu vào.

### Ví dụ về phân cấp trong `ROLLUP`
- Ví dụ
    ```sql
    GROUP BY c1, c2, c3 WITH ROLLUP
    ```

- `ROLLUP` sẽ giả định có phân cấp sau
    ```sql
    c1 > c2 > c3
    ```

- Và nó sẽ tạo ra các nhóm sau
    ```sql
    (c1, c2, c3)
    (c1, c2)
    (c1)
    ()
    ```

- **Xem query dưới đây đối với database mẫu**
    ```sql
    SELECT 
        productLine, 
        orderYear,
        SUM(orderValue) totalOrderValue
    FROM
        sales
    GROUP BY 
        productline, 
        orderYear 
    WITH ROLLUP;
    ```

    <img src="https://i.imgur.com/rgxppDv.png">

- Ta thấy `ROLLUP` sẽ tạo các tổng khi thay đổi dòng sản phẩm và tổng chính khi đã hết các dòng sản phẩm.

- Hệ thống phân cấp trong trường hợp này là
    ```sql
    productLine > orderYear
    ```