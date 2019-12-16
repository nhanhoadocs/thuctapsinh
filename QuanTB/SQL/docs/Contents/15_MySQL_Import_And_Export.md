# MYSQL IMPORT AND EXPORT



## Import CSV File Into MySQL Table
Lệnh `LOAD DATA INFILE` cho phép ta load dữ liệu vào bảng từ một file.

Trước khi nhập dữ liệu, ta cần chuẩn bị như sau:

- Một bảng cơ sở dữ liệu mà dữ liệu từ tệp sẽ được nhập vào.
Tệp CSV có dữ liệu khớp với số cột của bảng và loại dữ liệu trong mỗi cột.
Tài khoản, kết nối với máy chủ cơ sở dữ liệu MySQL, có các đặc quyền `FILE` và `INSERT`.

Đầu tiên ta tạo cơ sở dữ liệu với cấu trúc như sau:

```
CREATE TABLE discounts (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    expired_date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) NULL,
    PRIMARY KEY (id)
);
```

Tiếp theo một file `csv` như sau:

<img src="https://i.imgur.com/sbeeDzz.png">

Sau đó ta dùng lệnh sau để nhập dữ liệu vào từ file:

```SQL
LOAD DATA INFILE '/home/user/discounts.csv' 
INTO TABLE discounts 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

Trong đó:
- `FIELD TERMINATED BY` chỉ định các trường kết thúc
- `ENCLOSED BY` chỉ định ký tự bao quanh các trường
- `LINES TERMINATED BY` chỉ định ký tự ngăn cách giữa các dòng.
- Dòng đầu tiên của file csv là tên các trường vì vậy `IGNORE 1 ROWS` để bỏ qua dòng đầu tiên.

Cuối cùng ta select dữ liệu ra:

```SQL
SELECT * FROM discounts;
```

Kết quả:

<img src="https://i.imgur.com/wzTjVQ9.png">

### Nhập dữ liệu từ máy khách vào máy chủ từ xa

Ta có thể nhập dữ liệu từ client (máy tính cục bộ) đến một máy chủ cơ sở dữ liệu MySQL từ xa bằng cách sử dụng mệnh đề `LOAD DATA INFILE`.

Ví dụ:

```SQL
LOAD DATA LOCAL INFILE  '/root/tmp/discounts.csv'
INTO TABLE discounts
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```



## MySQL Export Table to CSV
Để export dữ liệu ra file csv đầu tiên ta cần xác định dữ liệu cần export và có thể select dữ liệu ra, sau đây là select dữ liệu từ bảng `orders` và có trạng thái đơn hàng bị hủy.

```SQL
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled';
```

Kết quả:

<img src="https://i.imgur.com/fqL4P4d.png">

Sau đó ta export dữ liệu ra file csv bằng lệnh sau:

```SQL
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled' 
INTO OUTFILE '/var/lib/mysql-files/cancelled_orders.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';
```

Thực hiện câu lệnh, một file đc tạo ra tại `/var/lib/mysql-files/cancelled_orders.csv`, nội dung sẽ như sau:

<img src="https://i.imgur.com/TLlmov8.png">

Sẽ dễ hiểu hơn nếu ta xuất file kèm theo tiêu đề cột, để làm như vậy ta thực hiện với `UNION` như sau:

```SQL
(SELECT 'Order Number','Order Date','Status')
UNION 
(SELECT orderNumber,orderDate, status
FROM orders
INTO OUTFILE '/var/lib/mysql-files/cancelled_orders.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"'
LINES TERMINATED BY '\r\n');
```