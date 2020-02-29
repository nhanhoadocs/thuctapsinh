# S4.2 - `SELECT  DISTINCT`

## Chức năng
`DISTINCT`  dùng để loại bỏ các hàng trùng lặp trong tập kết quả truy vấn.

## Cú pháp cơ bản
```
SELECT DISTINCT
    select_list
FROM
    table_name;
```

## Cách sử dụng
Ta sẽ sử dụng bảng `employees` để thử truy vấn.

<img src = "https://i.imgur.com/KWTyRMo.png">

Trước tiên, ta sẽ thử truy vấn không có `DISTINCT`:
```
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
```
Kết quả:

<img src = "https://i.imgur.com/CWpiRkQ.png">

-> Có những tên trùng nhau

Bây giờ ta sẽ thêm `DISTINCT`:
```
SELECT DISTINCT
    lastname
FROM
    employees
ORDER BY 
    lastname;
```
Kết quả:

<img src = "https://i.imgur.com/WOZfiS2.png">

-> Mỗi tên chỉ xuất hiện một lần. Không có trùng lặp.

## Chú ý:
- Các toán tử `AND`, `OR`, `NOT`, `BETWEEN`, ... đều sử dụng như bình thường.
- Các giá `NULL` thì coi như cùng một giá trị.