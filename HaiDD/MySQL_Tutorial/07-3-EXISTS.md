# S7.3 - EXISTS

Trong bài này, ta sẽ học cách sử dụng toán tử `EXISTS` và khi nào nên sử dụng nó để cải thiện hiệu năng của các truy vấn.

## 1. Giới thiệu về `EXISTS`
`EXISTS` là toán tử Boolean trả về đúng hoặc sai. `EXISTS` thường được sử dụng để kiểm tra sự tồn tại của các hàng được trả về từ subquery

### Cấu trúc câu truy vấn
```sql
SELECT 
    select_list
FROM
    a_table
WHERE
    [NOT] EXISTS(subquery);
```

Nếu subquery trả về ít nhất một hàng, toán tử `EXISTS` trả về **True**, ngược lại nó trả về **False**

Ngoài ra, toán tử `EXISTS` chấm dứt quá trình xử lí ngay lập tức khi tìm thấy 1 hàng khớp, nó giúp cải thiện hiệu suất của truy vấn.

Toán tử `NOT` phủ định toán tử `EXISTS`. Nói cách khác, `NOT EXISTS` trả về **True** nếu truy vấn con không trả về hàng nào, ngược lại nó trả về **False**.

## 2. Ví dụ
### 2.1. Ví dụ về `SELECT EXISTS`
Xem mối quan hệ 2 bảng `customers` và `orders`

<img src="https://i.imgur.com/MTGbMci.png">

Sử dụng toán tử `EXISTS` để tìm khách hàng có ít nhất một đơn hàng:
```sql
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS(SELECT 
                1
            FROM
                orders
            WHERE
                orders.customernumber 
                = customers.customernumber);
```

<img src="https://i.imgur.com/NBNru1B.png">

Trong ví dụ này, đối với mỗi hàng trong bảng `customers`, truy vấn sẽ kiểm tra số khách hàng trong bảng `orders`. Nếu `customerNumber` xuất hiện trong bảng `customers` tồn tại trong bảng `order`, truy subquery trả về hàng khớp đầu tiên. Do đó, toán tử `EXISTS` trả về **True** và dừng kiểm tra bảng `orders`. Mặt khác, subquery không trả về hàng nào và toán tử `EXISTS` trả về **False**

Ví dụ sau sử dụng toán tử `NOT EXISTS` để tìm các khách hàng không có bất kì đơn hàng nào:
```sql
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    NOT EXISTS( 
            SELECT 
                1
            FROM
                orders
            WHERE
                orders.customernumber = customers.customernumber
    );
```

<img src="https://i.imgur.com/JmS7B6R.png">

### 2.2. Ví dụ về `UPDATE EXISTS`
Giả sử bạn phải cập nhật các tiện ích mở rộng trên điện thoại của các nhân viên làm việc tại văn phòng San Francisco.

- Truy vấn dưới đây tìm ra những nhân viên làm việc tại văn phòng San Francisco:
    ```sql
    SELECT 
        employeenumber, 
        firstname, 
        lastname, 
        extension
    FROM
        employees
    WHERE
        EXISTS( 
            SELECT 
                1
            FROM
                offices
            WHERE
                city = 'San Francisco' AND 
                offices.officeCode = employees.officeCode
        );
    ```

<img src="https://i.imgur.com/NsyoM50.png">

- Truy vấn sau, thêm số `1` vào phần mở rộng điện thoại của nhân viên làm việc tại văn phòng ở San Francisco
    ```sql
    UPDATE employees 
    SET 
        extension = CONCAT(extension, '1')
    WHERE
        EXISTS( 
            SELECT 
                1
            FROM
                offices
            WHERE
                city = 'San Francisco'
                AND offices.officeCode = employees.officeCode
        );
    ```

    **Cách hoạt động:**
    - Đầu tiên, toán tử `EXISTS` trong mệnh đề `WHERE` chỉ nhận các nhân viên làm việc tại văn phòng San Francisco
    - Sau đó, hàm `CONCAT()` nối phần mở rộng điện thoại với `1`

### 2.3. Ví dụ về `INSERT EXISTS`
Giả sử bạn muốn lưu trữ những khách hàng không có đơn đặt hàng trong một bảng riêng biệt. Để làm điều này, bạn sử dụng các bước sau:

1. Đầu tiên, tạo một bảng mới để lưu trữ khách hàng bằng cách sao chép cấu trúc từ bảng khách hàng:
    ```sql
    CREATE TABLE customers_archive 
    LIKE customers;
    ```

2. Thêm khách hàng không có bất kì đơn hàng nào vào bảng `customers_archive` bằng cách sử dụng `INSERT`
    ```sql
    INSERT INTO customers_archive
    SELECT * 
    FROM customers
    WHERE NOT EXISTS( 
        SELECT 1
        FROM
            orders
        WHERE
            orders.customernumber = customers.customernumber
    );
    ```

3. Query data từ bảng `customers_archive` để kiểm tra lại:
    ```sql
    SELECT * FROM customers_archive;
    ```

    <img src="https://i.imgur.com/M1yJxo8.png">

### 2.4. Ví dụ về `DELETE EXISTS`
Một việc cuối cùng trong việc lưu trữ dữ liệu khách hàng là xóa các khách hàng tồn tại trong bảng `customers_archive` từ bảng `customers`.

Để làm việc đó, ta sử dụng toán tử `EXISTS` trong mệnh đề `WHERE` của câu lệnh `DELETE` như sau:
```sql
DELETE FROM customers
WHERE EXISTS( 
    SELECT 
        1
    FROM
        customers_archive a
    
    WHERE
        a.customernumber = customers.customerNumber);
```