# S4.4 - `LIKE`

## Chức năng
LIKE dùng để truy vấn dữ liệu dựa trên một mô hình cụ thể.

## Cú pháp cơ bản
Toán tử `LIKE` là toán tử logic kiểm tra xem một chuỗi có chứa một mẫu đã chỉ định hay không. 

Đây là cú pháp của toán tử `LIKE`:
```
expression LIKE pattern ESCAPE escape_character
```

MySQL cung cấp 2 ký tự đại diện để xây dựng mẫu:
- `%` : phù hợp với bất kỳ chuỗi và ký tự
Ví dụ: s% -> sun, six, salt, ...
- `_` : phù hợp với bất kỳ kí tự đơn
Ví dụ: s_n -> sin, sun, son, ... 

Nếu dữ liệu bạn cần có chứa "`%`" hay "`_`" thì bạn cần dùng "`\`" để chỉ định kí tự thoát. Nếu bạn không chỉ định rõ ràng ký tự thoát, ký tự dấu gạch chéo ngược "`\`" là ký tự thoát mặc định.

Ví dụ: 
```
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';
```
<img src ="https://i.imgur.com/DhBZqr3.png">

Hoặc bạn có thể chỉ định một ký tự thoát khác, ví dụ: `$` bằng cách sử dụng mệnh đề `ESCAPE`:
```
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';
```
<img src = "https://i.imgur.com/zX0Jczd.png">