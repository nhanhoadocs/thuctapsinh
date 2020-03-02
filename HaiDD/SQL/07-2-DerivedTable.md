# S7.2 - DERIVED TABLE

**Derived Table** : Bảng dẫn xuất

Trong bài này, ta sẽ tìm hiểu bảng dẫn xuất trong MySQL và cách sử dụng nó để đơn giản hóa các truy vấn phức tạp.

## 1. Giới thiệu về Derived Table
Derived Table là bảng ảo được trả về từ câu lệnh `SELECT`. Một bảng dẫn xuất tương tự 1 bảng tạm thời, nhưng sử dụng bảng dẫn xuất trong câu lệnh `SELECT` đơn giản hơn nhiều so với bảng tạm thời vì nó không yêu cầu các bước tạo bảng tạm thời.

Thuật ngữ bảng dẫn xuất và truy vấn con thường được sử dụng thay thế cho nhau. Khi một truy vấn con độc lập được sử dụng trong mệnh đề `FROM` của câu lệnh `SELECT`. Nó được gọi là bảng dẫn xuất.

Hình dưới đây minh họa một truy vấn sử dụng bảng dẫn xuất:

<img src="https://i.imgur.com/5HRpeVX.png">

**Lưu ý:** truy vấn con độc lập là truy vấn con có thể thực thi độc lập với câu lệnh chứa nó

Không giống với subquery, bảng dẫn xuất phải có bí danh (alias) để bạn có thể tham chiếu tên của nó sau này trong truy vấn.

Ví dụ sử dụng bảng dẫn xuất:
```sql
SELECT 
    column_list
FROM
    (SELECT 
        column_list
    FROM
        table_1) derived_table_name;
WHERE derived_table_name.c1 > 0;
```

## 2. Ví dụ 
Truy vấn sau đây nhận được 5 sản phẩm hàng đầu theo doanh thu bán hàng trong năm 2003 từ các bảng `orders` và bảng `orderdetails` trong cơ sở dữ liệu mẫu:

<img src="https://i.imgur.com/qLO4bhY.png">

```sql
SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;
```

<img src="https://i.imgur.com/f9RKbp4.png">

Bạn có thể sử dụng kết quả của truy vấn này dưới dạng bảng dẫn xuất và nối nó với bảng `products` như sau:

<img src="https://i.imgur.com/yoiNqNN.png">

```sql
SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);
```

<img src="https://i.imgur.com/HrLGXDx.png">

Trong ví dụ:

1. Truy vấn con được thực thi để tạo tập kết quả hoặc bảng dẫn xuất
2. Sau đó, truy vấn bên ngoài được thực thi đã join với bảng dẫn xuất `top5products2003` với bảng `products` sử dụng cột `productCode`