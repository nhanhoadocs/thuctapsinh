# 4. Joining tables

### 1. Alias Mysql

Có 2 loại bí danh trong mysql là bí danh cột và bí danh bảng. 

Cách sử dụng alias trong mysql như sau: 

```
SELECT 
   [column_1 | expression] AS descriptive_name
FROM table_name;
```
đằng sau as là bí danh, nếu bí danh chứa khoảng trắng thì ta phải sử dụng trích dẫn như sau: 

```
SELECT 
   [column_1 | expression] AS `descriptive name`
FROM 
   table_name;
```

Truy vẫn sau sẽ hiển thị đầy đủ tên của nhân viên. 

![Imgur](https://i.imgur.com/jZZ9DCU.png)

![Imgur](https://i.imgur.com/fkKccak.png)

Nếu không đặt bí danh thì kết quả tên cột sẽ dài và khá khó hiểu, để giải quyết điều này, ta có thể sử dụng bí danh để đặt cho đầu ra cột : 

![Imgur](https://i.imgur.com/lYSSXLG.png)

![Imgur](https://i.imgur.com/B8JaxkH.png)

Ta muốn xem các đơn hàng có tổng số tiền lớn hơn 60000, ta sử dụng bí danh và mệnh đề having : 

![Imgur](https://i.imgur.com/UGjqvQc.png)

![Imgur](https://i.imgur.com/St1trdV.png)


### 2. Inner Join

Trả về các bản ghi có giá trị khớp với cả 2 bảng: 

![Imgur](https://i.imgur.com/jX0rrTx.png)

**Cú pháp:** 
```
SELECT
    select_list
FROM t1
INNER JOIN t2 ON join_condition1
INNER JOIN t3 ON join_condition2
...;
```

Ta có 2 bảng liên kết như sau: 

![Imgur](https://i.imgur.com/uPUJ5RR.png)

Ví dụ ta muốn xem `orderNumber`, status và tổng số tiền của đơn hàng, ta làm như sau : 

![Imgur](https://i.imgur.com/RefF0o8.png)

![Imgur](https://i.imgur.com/LY5PrV2.png)


Tương tự như thế, để truy vấn dữ liệu từ 3 bảng

![Imgur](https://i.imgur.com/ZZa3yEu.png)

Truy vấn sau sẽ trả về cột `orderNumber`; cột `productName`, `productLine` chứa dữ liệu của bảng `products`; Cột `quantityOrdered` chứa dữ liệu của bảng `orderdetails`; cột `orderDate` và `status` chứa dữ liệu từ bảng `orders`. 

![Imgur](https://i.imgur.com/aMbMJaA.png)

hoặc ta cũng có thể sử dụng using sẽ rút ngắn được truy vấn, nó cũng sẽ cho ra kết quả tương tự :

![Imgur](https://i.imgur.com/o8Qzhny.png)

![Imgur](https://i.imgur.com/2E1sqfj.png)


Truy vấn dữ liệu từ 4 bảng : 

Ví dụ ta muốn truy vấn dữ liệu từ 4 bảng products, orderdetails, orders, customers ta làm như sau: 

![Imgur](https://i.imgur.com/LsB4Fzj.png)

![Imgur](https://i.imgur.com/utb98en.png).

### 3. Left Join

Trả về các bản ghi từ bảng bên trái và các bản ghi khớp từ bảng bên phải:

![Imgur](https://i.imgur.com/7tesflI.png)

**Cú pháp:**
```
SELECT 
    select_list
FROM
    t1
LEFT JOIN t2 ON 
    join_condition;
```

- Ta có 2 bảng có liên kết như sau  :

![Imgur](https://i.imgur.com/hwWsa1v.png)

Truy vấn sau đây trả về kết quả là tất cả khách hàng và đơn đặt hàng của họ.  Nếu một khách hàng không có đơn hàng, các giá trị trong cột `orderNumber` và `status` là `NULL`.

![Imgur](https://i.imgur.com/yt6VGH4.png)

![Imgur](https://i.imgur.com/94ChQGi.png)

- `Left Join` cũng có thể được sử dụng để tìm các hàng chứa giá trị `NULL`.

Ví dụ ta muốn tìm 1 khách hàng không có đơn hàng, ta sử dụng như sau : 

![Imgur](https://i.imgur.com/J5zcI0U.png)

![Imgur](https://i.imgur.com/c4OGihL.png)


- Sử dụng `Left Join` để truy vấn dữ liệu từ 3 bảng :

![Imgur](https://i.imgur.com/W5Q103A.png)


![Imgur](https://i.imgur.com/mkSKyxw.png)

![Imgur](https://i.imgur.com/1wr87x3.png)

Đầu tiên `LEFT JOIN` trả về tất cả nhân viên và khách hàng đại diện cho mỗi nhân viên hoặc `NULL` nếu nhân viên không phụ trách bất kỳ khách hàng nào.

`LEFT JOIN` thứ hai trả về tất cả các khoản thanh toán của mỗi khách hàng được đại diện bởi nhân viên nào đó hoặc trả về NULL nếu khách hàng không có khoản thanh toán nào.

- `Left Join` sử dụng mệnh đề `Where` và `On`. 

Ví dụ: Sử dụng `LEFT JOIN` mệnh đề để truy vấn dữ liệu từ các bảng `orders` và `orderDetails`. Truy vấn trả về đơn hàng và chi tiết đơn hàng có số thứ tự 10123.

![Imgur](https://i.imgur.com/5OCAah8.png)

![Imgur](https://i.imgur.com/v08zjrV.png)

Khi sử dụng `ON`, truy vấn trả về đơn hàng và chi tiết đơn hàng có số `orderNumber` là 10123. Những `orderNumber` không phải 10123 và không thuộc bảng `orders` sẽ hiển thị giá trị null. 

![Imgur](https://i.imgur.com/pRfYtfD.png)

![Imgur](https://i.imgur.com/qYSSj3g.png)

### 4. Right Join

`Right Join` sẽ trả về các bản ghi từ bảng bên phải và các bản ghi khớp từ bảng bên trái. 

![Imgur](https://i.imgur.com/hAR6Z8P.png)

**Cú pháp:**

```
SELECT 
    select_last
FROM t1
RIGHT JOIN t2 ON 
    join_condition;
```
hoặc 

```
SELECT 
    select_last
FROM t1
RIGHT JOIN t2 USING(column_name);
```
Ta sẽ sử dụng bảng `customers` và `employees` từ cơ sở dữ liệu mẫu. 

![Imgur](https://i.imgur.com/pmR33n3.png)


Ví dụ ta sử dụng `Right Join` với truy vấn như sau : 

![Imgur](https://i.imgur.com/3rf61jk.png)

![Imgur](https://i.imgur.com/UyxLix7.png)

Cột `customerNumber` thuộc bảng `customers`, nằm bên trái nên những giá trị không nằm trong giá trị chung thì sẽ hiển thị là `NULL`. 

- Hoặc ta cũng có thể sử dụng `Right Join` để hiển thị những nhân viên không phụ trách bất kỳ khách hàng nào.  

![Imgur](https://i.imgur.com/Kwfq06u.png)

![Imgur](https://i.imgur.com/gEAJ0ST.png)


### 5. Cross Join 

Nếu bảng đầu tiên có n hàng và bảng thứ hai có m hàng, Cross Join sẽ dẫn đến số hàng nxm

Chuẩn bị 1 số bảng để tìm hiểu cách `CROSS JOIN` hoạt động.

Ta tạo 1 cơ sở dữ liệu mẫu để test:
Tạo 1 database mới `salesdb`:
```
CREATE DATABASE IF NOT EXISTS salesdb;
```

Tạo 1 vài bảng sau:
```
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2 )
);
 
CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);
 
CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL(13 , 2 ) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id , store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
```
3 bảng như sau:
- products(id, product_name, price) : thông tin về sản phẩm
- stores(id, store_name) : thông tin các cửa hàng bán sản phẩm
- sales(product_id, store_id, quantity, sales_date) : các sản phẩm được bán trong một cửa hàng cụ thể theo số lượng và ngày.

Nhập 1 vài dữ liệu cho các bảng:
```
INSERT INTO products(product_name, price)
VALUES('iPhone', 699),
      ('iPad',599),
      ('Macbook Pro',1299);
 
INSERT INTO stores(store_name)
VALUES('North'),
      ('South');
 
INSERT INTO sales(store_id,product_id,quantity,sales_date)
VALUES(1,1,20,'2017-01-02'),
      (1,2,15,'2017-01-05'),
      (1,3,25,'2017-01-05'),
      (2,1,30,'2017-01-02'),
      (2,2,35,'2017-01-05');
```
Ví dụ khi ta sử dụng cross Join nó sẽ nhân số hàng ở cột `store_name` với số hàng ở cột `product_name` với nhau.

![Imgur](https://i.imgur.com/SmAqqqQ.png)

![Imgur](https://i.imgur.com/ggudNTO.png)

### 6. Self Join 

`SELF JOIN` trong SQL được sử dụng để thực hiện phép Join trên cùng một bảng bằng cách nối một bảng với chính nó, coi như đó là hai bảng và thay tên tạm thời ít nhất một bảng.

