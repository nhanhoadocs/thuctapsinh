# S4.5 - `LIMIT`

## Chức năng
Dùng để hạn chế số lượng kết quả trả về bởi một truy vấn.

## Cú pháp cơ bản
```
SELECT 
    select_list
FROM
    table_name
LIMIT [offset,] row_count;
```

- `offset` : phần bù của hàng đầu tiên trả về. offset của cột đầu tiên là 0.
- `row_count` : số lượng hàng tối đa trả về

Hình ảnh minh họa:

<img src = "https://i.imgur.com/D7GGCSv.png">

Khi bạn sử dụng mệnh đề LIMIT với một đối số, MySQL sẽ sử dụng đối số này để xác định số lượng hàng tối đa để trả về từ hàng đầu tiên của tập kết quả.

## Thứ tự đánh giá của SQL
<img src = "https://i.imgur.com/Y9pY3lU.png">

## Cách sử dụng
Ta sử dụng bảng `customers` để thực hiện.

<img src = "https://i.imgur.com/O0o4sZq.png">

1. Lấy một số lượng nhất định có giá trị cao nhất hoặc thấp nhất
Lấy ra 5 khách hàng có mức tín dụng cao nhất
```
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;
```
Kết quả:

<img src = "https://i.imgur.com/wm4XomD.png">

2. Phân trang
Khi bạn hiển thị dữ liệu trên các ứng dụng, bạn thường muốn chia các hàng thành các trang, trong đó mỗi trang chứa một số hàng nhất định như 5, 10 hoặc 20.

Để tính số lượng trang, bạn lấy tổng số hàng chia cho số lượng hàng trên mỗi trang. Để tìm nạp các hàng của một trang cụ thể, bạn có thể sử dụng mệnh đề LIMIT.

`COUNT(*)` để lấy tổng số hàng từ bảng `customers`:
```
SELECT COUNT(*) FROM customers;
```
<img src = "https://i.imgur.com/UDR0cck.png">

Giả sử mỗi trang có 10 hàng, để hiển thị 122 khách hàng, bạn có 13 trang. Trang thứ 13 cuối cùng chỉ chứa hai hàng.

Truy vấn này sử dụng mệnh đề LIMIT để lấy các hàng của trang 1 chứa 10 khách hàng đầu tiên được sắp xếp theo tên khách hàng:
```
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;
```
<img src = "https://i.imgur.com/PfHXAuF.png">

Truy vấn này sử dụng mệnh đề LIMIT để lấy các hàng của trang thứ hai bao gồm hàng 11 - 20:
```
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;
```
<img src = "https://i.imgur.com/pmIivFj.png">

3. Lấy giá trị cao nhất, thấp nhất thứ n:
```
SELECT select_list
FROM table_name
ORDER BY sort_expression
LIMIT n-1, 1;
```

Ví dụ: Lấy giá trị cao thứ 3 tín dụng:
```
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 2,1;
```
<img src = "https://i.imgur.com/SETbfof.png">

Kiểm tra lại danh sách đầy đủ:
```
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC;
```
<img src = "https://i.imgur.com/LxKVWU8.png">