# ADVANCED TECHNIQUES

## MySQL Natural Sorting
Trong phần này ta sẽ tìm hiểu về một số kỹ thuật sắp xếp tự nhiên trong MySQL bằng cách sử dụng mệnh đề `ORDER BY`.



### Thiết lập bảng mẫu
Ta tạo một bảng mới có tên `items`:

```SQL
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_no VARCHAR(255) NOT NULL
);
```

Tiếp theo ta chèn một số dữ liệu vào bảng:

```SQL
INSERT INTO items(item_no)
VALUES ('1'),
       ('1C'),
       ('10Z'),
       ('2A'),
       ('2'),
       ('3C'),
       ('20D');
```

`SELECT` và sắp xếp dữ liệu theo `item_no`:

```SQL
SELECT 
    item_no
FROM
    items
ORDER BY item_no;
```

Kết quả:

```
item_no|
-------|
1      |
10Z    |
1C     |
2      |
20D    |
2A     |
3C     |
```

Kết quả này không phải là những gì chúng ta mong đợi, Kết quả chún ta mong đợi sẽ phải như sau:

```
item_no|
-------|
1      |
1C     |
2      |
2A     |
3C     |
10Z    |
20D    |
```

Đây được gọi là phân loại tự nhiên, nhưng MySQL không cung cấp bất kỳ cú pháp hoặc chức năng nào để sắp xếp tự nhiên.

Để  giải quyết vấn đề này ta chia `item_no` thành 2 cột `prefix` và `suffix` cột `prefix` lưu trữ số của `item_no` và `suffix` chứa phần chứ cái. sau đó ta có thể thực hiện truy vấn sau để sắp sếp tự nhiên:

```
SELECT 
    CONCAT(prefix, suffix)
FROM
    items
ORDER BY 
    prefix , suffix;
```

Phương pháp này có nhược điểm là phải chia dữ liệu  thành 2 cột riêng. Ngoài ra ta có thể sử dụng phương pháp dưới đây:

```SQL
SELECT 
    item_no
FROM
    items
ORDER BY CAST(item_no AS UNSIGNED) , item_no;
```