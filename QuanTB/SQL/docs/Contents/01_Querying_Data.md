# QUERYING DATA



## SELECT

### Chức năng

Dùng để đọc dữ liệu từ một hoặc nhiều bảng.

### Cú pháp

```SQL
SELECT select_list
FROM table_name;

SELECT * FROM table_name;
```

### Ví dụ

```SQL
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees;
```

### Chú ý

- Sử dụng `SELECT *` không nên được sử dụng bừa bãi vì một số lý do sau:
	- Nó trả về dữ liệu từ tất cả các cột mà có thể ta không dùng đến.
	- Khi chỉ định rõ tên cột sẽ dễ dàng quản lý hơn.
	- Khi một bảng có sự thay đổi thì tập kết quả trả về sẽ thay đổi và có thể dẫn đến những lỗi xử lý.
	- Có thể bị tiết lộ những thông tin nhạy cảm cho người dùng trái phép.