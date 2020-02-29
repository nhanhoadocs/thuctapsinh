# S5.6 - CROSS JOIN

## Cú pháp cơ bản
```
SELECT * FROM t1
CROSS JOIN t2;
```

## Cách hoạt động
`CROSS JOIN` sẽ kết hợp tất cả các hàng từ 2 bảng lại, trong đó, mỗi hàng là sự kết hợp của trong bảng đầu tiên với hàng trong bảng thứ 2. Nếu mỗi bảng có `n` và `m` hàng tương ứng, tập kết quả sẽ có `n x m` hàng.

`CROSS JOIN` không sử dụng mệnh đề `ON` và `USING`.

Trong trường hợp bảng t1 và t2 có quan hệ với nhau, `CROSS JOIN` làm việc giống như là `INNER JOIN`.
```
SELECT * FROM t1
CROSS JOIN t2
WHERE t1.id = t2.id;
```

## Ví dụ về cách sử dụng
Chuẩn bị 1 số bảng để tìm hiểu cách `CROSS JOIN` hoạt động.

Cài đặt 1 số bảng để test:
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

Bảng stores:

<img src = "https://i.imgur.com/71Mcl3t.png">

Bảng products:

<img src = "https://i.imgur.com/o5PA6T3.png">

`CROSS JOIN` 2 bảng stores và products:
```
SELECT 
    store_name,
    product_name
FROM
    stores CROSS JOIN products;
```

<img src = "https://i.imgur.com/fgjdfJC.png">


