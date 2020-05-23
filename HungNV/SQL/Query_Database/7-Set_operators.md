# Set operators

### 1. UNION and UNION ALL

UNION sử dụng để kết hợp tập kết quả của 2 hoặc nhiều câu lệnh select. 

- Mỗi `select` trong UNION phải có cùng số cột  
- Các cột cũng phải có kiểu dữ liệu tương tự  
- Các cột trong mỗi câu lệnh select cũng phải thwo cùng 1 thứ tự. 

**Cú pháp:**
```
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```
union chỉ cho phép các giá trị riêng biệt, để cho phép các giá trị trùng lặp ta sử dụng union all :

**Cú pháp:**
```
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
```

ví dụ : Để truy vấn `firstname` từ bảng `employees` và bảng `customers` không trả về kết quả trùng lặp :

![Imgur](https://i.imgur.com/doUP4QQ.png)

![Imgur](https://i.imgur.com/j1xFdMs.png)

Nếu sử dụng `onion all` thì sẽ trả về cả kết quả trùng lặp như sau: 

![Imgur](https://i.imgur.com/HCku1yE.png)

![Imgur](https://i.imgur.com/axnxyrs.png)

Truy vấn sau trả về các thành phố của Đức (Chỉ các giá trị riêng biệt) từ bảng `customers` và bảng `offices`

![Imgur](https://i.imgur.com/8sdT4za.png)

![Imgur](https://i.imgur.com/JI5xSXU.png)

hoặc khi sử dụng `UNION ALL` trả về các thành phố của Mỹ :

![Imgur](https://i.imgur.com/QcNeUHT.png)

![Imgur](https://i.imgur.com/oSe9JRK.png)

### 2. INTERSECT
INTERSECT không được hỗ trợ trong MYSQL nên ta không tìm hiểu kỹ về intersect. 

Mệnh đề `INTERSECT` trong SQL được sử dụng để kết hợp hai câu lệnh `SELECT` nhưng tập dữ liệu được trả về bởi câu lệnh `INTERSECT` sẽ là giao điểm của tập dữ liệu của hai câu lệnh `SELECT`. Nói một cách đơn giản, câu lệnh `INTERSECT` sẽ chỉ trả về những hàng sẽ chung cho cả hai câu lệnh `SELECT`. 

Để sử dụng toán tử `INTERSECT` cho hai truy vấn, bạn làm theo các quy tắc sau:

- Thứ tự và số lượng cột trong danh sách chọn của các truy vấn phải giống nhau.  
- Các kiểu dữ liệu của các cột tương ứng phải tương thích.

### 3. MINUS

Cũng giống như INTERSECT, MINUS cũng không được hỗ trợ trong MYSQL. 

