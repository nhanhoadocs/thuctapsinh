# 14. MySQL Import, Export 

### 1. Import 

Trước khi nhập tệp, bạn cần chuẩn bị như sau:

- Một bảng cơ sở dữ liệu mà dữ liệu từ tệp sẽ được nhập vào.
- Tệp CSV có dữ liệu khớp với số cột của bảng và loại dữ liệu trong mỗi cột.
- Tài khoản, kết nối với máy chủ cơ sở dữ liệu MySQL, có các đặc quyền FILE và INSERT.

Tạo 1 bảng có các cột như sau: 

```
CREATE TABLE discounts (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    expired_date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) NULL,
    PRIMARY KEY (id)
);
``` 

Ta có nội dung file CSV như sau: 

![Imgur](https://i.imgur.com/eaf4eh1.png)

Câu lệnh sau nhập dữ liệu từ `c:/tmp/discounts.csv`

```
LOAD DATA INFILE 'c:/tmp/discounts.csv' 
INTO TABLE discounts 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

hoặc có thể nhập dữ liệu bằng MySql Workbench

Chọn file CSV cần nhập vào. 

![Imgur](https://i.imgur.com/eTQ5eHy.png)

![Imgur](https://i.imgur.com/ls0f6hQ.png)

Kiểm tra lại dữ liệu nhập vào. 

![Imgur](https://i.imgur.com/PDjPW9C.png)

`Next` -> `Next` -> `Finish`

![Imgur](https://i.imgur.com/QT4MycS.png)

Dữ liệu sau khi được nhập vào. 

![Imgur](https://i.imgur.com/FpHCSw4.png)

### 2. Export

Trước khi xuất dữ liệu, ta cần đảm bảo rằng:

- Quá trình xử lý máy chủ MySQL có quyền truy cập ghi vào thư mục đích chứa tệp CSV đích.
- Tệp CSV đích không được tồn tại từ trước đó với tên giống hệt.

Sử dụng câu lệnh Select như sau: 

```
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled';
```

Câu lệnh sau sử dụng để Export cơ sở dữ liệu. 

```
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled' 
INTO OUTFILE 'C:/tmp/cancelled_orders.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';
```

Hoặc ta có thể sử dụng MySQL Workbench 

Sử dụng câu lệnh sau để truy vấn cơ sở dữ liệu: 

```
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled';
```

Click vào Export file. 

![Imgur](https://i.imgur.com/hHKi8Ep.png)

Đặt tên cho file. 

![Imgur](https://i.imgur.com/npqK3NM.png)

