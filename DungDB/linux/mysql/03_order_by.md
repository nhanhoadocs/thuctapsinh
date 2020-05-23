# MySQL ORDER BY

Khi sử dụng câu lệnh SELECT để truy vấn dữ liệu từ một bảng, tập kết quả sẽ không được sắp xếp. Nó có nghĩa là các hàng trong tập kết quả có thể được sắp xếp theo bất kỳ thứ tự nào.
Để sắp xếp tập kết quả, bạn thêm mệnh đề `ORDER BY` vào câu lệnh SELECT
Cú pháp:

    SELECT 
    select_list
    FROM 
    table_name
    ORDER BY 
    column1 [ASC|DESC], 
    column2 [ASC|DESC],
    ...;

ASC là viết tắt của tăng dần và DESC là viết tắt của giảm dần. Bạn sử dụng ASC để sắp xếp tập kết quả theo thứ tự tăng dần và DESC để sắp xếp tập kết quả theo thứ tự giảm dần.

Mệnh đề ORDER BY này sắp xếp kết quả được đặt theo thứ tự tăng dần:

    ORDER BY column1 ASC;

Và mệnh đề ORDER BY này sắp xếp kết quả được đặt theo thứ tự giảm dần:

    ORDER BY column1 DESC;

Theo mặc định, mệnh đề ORDER BY sử dụng ASC

    select * from customers order by customerName asc;

![Imgur](https://i.imgur.com/zHC4CRb.png)

    select * from customers order by customerNumber DESC;

![Imgur](https://i.imgur.com/KQEVUrd.png)

    SELECT
        contactLastname,
        contactFirstname
    FROM
        customers
    ORDER BY
        contactLastname DESC,
        contactFirstname ASC;

![Imgur](https://i.imgur.com/vSNytXq.png)

Sắp xếp kết quả của một phép tính:

Sử dụng bảng orderdetails

![Imgur](https://i.imgur.com/Ey0iDxq.png)

Sắp xếp dựa trên phép tính quantityOrdered * priceEach

    SELECT 
        orderNumber, 
        orderlinenumber, 
        quantityOrdered * priceEach
    FROM
        orderdetails
    ORDER BY 
    quantityOrdered * priceEach DESC;

![Imgur](https://i.imgur.com/9utUeIf.png)

Để kết quả truy vấn dễ đọc hơn, ta có thể gán cột quantityOrdered * priceEach bằng tên khác ngắn hơn, sử dụng AS:

    SELECT 
        orderNumber, 
        orderlinenumber, 
        quantityOrdered * priceEach as total
    FROM
        orderdetails
    ORDER BY 
    total DESC;

![Imgur](https://i.imgur.com/x0VOdc6.png)

Sử dụng FIELD()

Sử dụng bảng orders

![Imgur](https://i.imgur.com/2rGXyuA.png)

Sắp xếp đơn hàng theo thứ tự trạng thái như sau:

In Process

On Hold

Canceled

Resolved

Disputed

Shipped

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

![Imgur](https://i.imgur.com/ck4TVLZ.png)