# 1. Truy vấn Select 
Dùng để lấy dữ liệu trong các bảng của MYSQL.

Cú pháp 
```
SELECT truong1, truong2,...truongN FROM ten_bang
```
ví dụ hiển thị tất cả  dữ liệu trong bang1

![](../images/MYSQL/screenshot_21.png)

# 2. Mệnh đề where
Dùng để thêm điều kiện vào cho câu lệnh

Cú pháp 
```
SELECT truong1, truong2,...truongN FROM ten_bang
[WHERE dieuKien1 [AND [OR]] dieuKien2.....
```
![](../images/MYSQL/screenshot_13.png)

- Đằng trước có thể là `select` hoặc một lệnh khác như  `delete` hay `update`
- Có thể xác định bất kỳ điều kiện nào khi sử dụng mệnh đề where

# 3. Truy vấn update
Dùng để sywar đổi dữ liệu trong bảng của mysql 

Cú pháp
```
UPDATE ten_bang SET truong1=giaTri_moi_1, truong2=giaTri_moi_2
[MenhDe WHERE];
```
![](../images/MYSQL/screenshot_15.png)

# 4. Truy vấn delete
Dùng để xóa bảng; xóa dữ liệu trong bảng chỉ định;....

Cú pháp
```
DELETE FROM ten_bang [Menhde WHERE]
```
![](../images/MYSQL/screenshot_14.png)

# 5. Mệnh đề like
Like thường được sử dụng kết hợp với các mệnh đề khác. Hay được dùng chung với WHERE và được thay thế cho dấu bằng. Có thể dùng ký tự `%` để tìm kiếm giống như `*` trong linux.

# 6. Mệnh đề order by
Dùng để sắp xếp các kết quả trả về sau khi truy vấn 

Cú pháp
```
SELECT truong1, truong2,...truongN FROM ten_bang
ORDER BY truong1, [truong2...] [ASC [DESC]]
```
Với thì thứ tự sẽ được sắp xếp theo 2 loại là ASC (tăng dần) và DESC(giảm dần).

# 7. Sử dụng join
Được sử dụng để lấy dữ liệu từ nhiều bảng và ghép chúng lại với nhau
```
SELECT a.mssv, a.ten, b.hocphi
    FROM sinhvienk60 a RIGHT JOIN hocphik60 b
    where a.ten = b.ten;
```

# 8. Sử dụng Alter 
Dùng để sửa dữ liệu của bảng 

Cú pháp 
```
ALTER TABLE tên-bảng DROP tên-trường
```
![](../images/MYSQL/screenshot_25.png)
# 9. Sử dụng in
Dùng để thay thế cho lệnh or khi viết điều kiện where trong lệnh

Ví dụ muốn chọn những bạn có điểm thi bằng 8.5 9 và 9.5 thay vì viết 3 or thì ta sử dụng in 
```
SELECT * FROM sinhvienk58 
    WHERE diemthi IN ( 8.50, 9.00, 9.50 );
```

# 10. Dùng between
Dùng để chỉ ra khoảng ở dữ của 2 số 
```
select * from tên-bảng
where diemthi BETWEEN 8 and 10;
```
# 11. Dùng insert 
Dùng để chèn dữ liệu vào trong bảng mà ta Muốn 
```
INSERT INTO ten_bang ( `truong1`, `truong2`,...`truongN` )
                       VALUES
                       ( 'giatri1', 'giatri2',...'giatriN' );
```
