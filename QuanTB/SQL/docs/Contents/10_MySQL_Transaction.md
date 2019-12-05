# MYSQL TRANSACTION



## Transaction
Transaction là một tiến trình xử lý có xác định điểm đầu và điểm cuối, tiến trình được thực thi một cách tuần tự theo nguyên tắc hoặc tất cả đều thành công hoặc một operation thất bại thì toàn bộ tiến trình thất bại. Nếu việc thực thi một operation nào đó bị fail đồng nghĩa với việc dữ liệu phải `rollback` về trạng thái ban đầu.

Sử dụng:
- Để bắt đầu một transaction ta sử dụng mệnh đề `START TRANSACTION`. ngoài ra `BEGIN` và `BEGIN WORK` là các bí danh của transaction.

- Để xác nhận một thay đổi vĩnh viễn ta sử dụng mệnh đề `COMMIT`

- Để phục hồi transaction hiện tại ta sử dụng `ROLLBACK`

- Để kích hoạt hoặc vô hiệu `autocommit` ta sử dụng lệnh `SET autocommit`

Theo mặc định MySQL sẽ bật `autocommit`, Để sửa đổi ta thực hiện như dưới đây:

Để bật `autocommit`:

```SQL
SET autocommit = 1;

-- Hoặc

SET autocommit = ON;
```

Để tắt `autocommit`:

```SQL
SET autocommit = 0

-- Hoặc

SET autocommit = OFF
```

Dưới đây là kịch bản sử dụng transaction:

```SQL
-- 1. start a new transaction
START TRANSACTION;
 
-- 2. Get the latest order number
SELECT 
    @orderNumber:=MAX(orderNUmber)+1
FROM
    orders;
 
-- 3. insert a new order for customer 145
INSERT INTO orders(orderNumber,
                   orderDate,
                   requiredDate,
                   shippedDate,
                   status,
                   customerNumber)
VALUES(@orderNumber,
       '2005-05-31',
       '2005-06-10',
       '2005-06-11',
       'In Process',
        145);
        
-- 4. Insert order line items
INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantityOrdered,
                         priceEach,
                         orderLineNumber)
VALUES(@orderNumber,'S18_1749', 30, '136', 1),
      (@orderNumber,'S18_2248', 50, '55.09', 2); 
      
-- 5. commit changes    
COMMIT;
```

trước khi `COMMIT` thì dữ liệu thực tế vẫn chưa được ghi vĩnh viến vào cơ sở dữ liệu, và ta có thể sử dụng `ROLLBACK` để hoàn tác các thay đổi về trạng thái ban đầu.

### Chú ý
- Khi ta chưa `COMMIT` dữ liệu thì thực tế ta chỉ có select dữ liệu đó ra ở phiên (session) hiện tại, nếu ta đăng nhập một phiên khác và kiểm tra thì sẽ thấy dữ liệu hoàn toàn chưa được thay đổi.



## Table locking

Table locking là một cơ chế cho phép một phiên khách có thể lock một bảng nhằm ngăn các phiên khác truy cập vào cùng một bảng trong một khoảng thời gian cụ thể.

Một phiên chỉ có thể lock table và giải phóng các table lock của chính phiên đó tạo ra và không thể lock và giải phóng các table lock của các phiên khác.

<img src="https://i.imgur.com/SDsp0IU.png">


Để lock một bảng ta sử dụng cú pháp sau:

```SQL
LOCK TABLES table_name [READ | WRITE]
```

Ngoài ra ta có thể lock nhiều bảng bằng cú pháp sau:

```SQL
LOCK TABLES table_name1 [READ | WRITE], 
            table_name2 [READ | WRITE],
             ... ;
```

Dể unlock một bảng ta sử dụng cú pháp sau:

```SQL
UNLOCK TABLES table_name [READ | WRITE]
```

Ngoài ra ta có thể unlock nhiều bảng bằng cú pháp sau:

```SQL
UNLOCK TABLES table_name1 [READ | WRITE], 
            table_name2 [READ | WRITE],
             ... ;
```

Để kiểm tra trạng thái hoạt động ta sử dụng:

```SQL
SHOW PROCESSLIST;
```

### Chú ý
Khi ta lock 1 bảng vơi `READ`:
    - Ta vẫn có thể `SELECT` dữ liệu từ phiên khác
    - Ta không thể `INSERT` dữ liệu vào bảng ở phiên hiện tại, nó sẽ sinh ra thông báo lỗi
    - Khi ta `INSERT` dữ liệu từ các phiên khác nó sẽ được đưa vào trạng thái chờ cho đên khi lock hiện tại được giải phóng

Khi ta lock bảng với `WRITE`:
    - Ta có thể select dữ liệu từ bảng ở phiên hiện tại
    - Ta có thể chèn dữ liệu vào bảng ở phiên hiện tại
    - Khi ta select dữ liệu ở phiên khác nó được đưa vào trạng thái chờ
    - Khi ta insert dữ liệu ở phiên khác nó được đưa vào trạng thái chờ

Sự khác biệt giữa khóa `READ` và `WRITE`:
    - Khóa `READ` được chia sẽ khả năng đọc dữ liệu nhưng găn chặn các phiên khác ghi dữ liệu
    - Khóa `WRITE` là một khóa độc quyền, nó ngăn chặn tất cả các phiên khác đọc và ghi dữ liệu và bảng