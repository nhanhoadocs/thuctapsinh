# S2 - Querying Data


## Chức năng
`SELECT` : được sử dụng để truy vấn dữ liệu từ một hoặc nhiều bảng.

## Cú pháp cơ bản
```
SELECT select_list
FROM table_name;
```

## Thứ tự đánh giá của SQL
<img src = "https://i.imgur.com/sIqesKh.png">

Tức là SQL sẽ xét `FROM` trước rồi đến `SELECT`

## Ví dụ
Ta sẽ sử dụng bảng `employees` để ví dụ về sử dụng `SELECT`:
<img src = "https://i.imgur.com/KWTyRMo.png">

<img src = "https://i.imgur.com/RjeusXU.png">

### 1. Lấy dữ liệu từ 1 cột:
Lấy dữ liệu từ cột `email`
```
SELECT email
FROM employees;
```

**Kết quả**

<img src = "https://i.imgur.com/ylhGyyH.png">


### 2. Lấy dữ liệu từ nhiều cột
Lấy dữ liệu từ 3 cột `lastname`, `firstname`, `jobtitle`
```
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees;
```
**Kết quả**

<img src = "https://i.imgur.com/c5TAbO6.png">

### 3. Lấy tất cả dữ liệu của bảng:
```
SELECT *
FROM employees;
```

**Kết quả**

<img src = "https://i.imgur.com/RjeusXU.png">


### **Chú ý**
Sử dụng SELECT * không nên được sử dụng bừa bãi vì một số lý do sau:
- Nó trả về dữ liệu từ tất cả các cột mà có thể ta không dùng đến.
- Khi chỉ định rõ tên cột sẽ dễ dàng quản lý hơn.
- Khi một bảng có sự thay đổi thì tập kết quả trả về sẽ thay đổi và có thể dẫn đến những lỗi xử lý.
- Có thể bị tiết lộ những thông tin nhạy cảm cho người dùng trái phép.