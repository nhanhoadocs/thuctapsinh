Các lệnh giúp sử dụng MYSQL
# Mục lục 
I. [Thao tác với database](#a)

II. [Thao tác với với user](#b)

III. [Thao tác với table](#c)

Iv. [Thao tác với cột và hàng](#d)

<a name="a">

# I. Thao tác với Database</a>
## 1. Tạo một database
```
CREATE database tên-database;
```
![](../images/MYSQL/screenshot_9.png)

và ta có thể kiểm tra lại các database 
```
show databases;
```

## 2. Xóa một database
```
DROP database tên-database;
```
![](../images/MYSQL/screenshot_10.png)

## 3. Để làm việc với một cơ sở dữ liệu
```
USE tên-database;
```
![](../images/MYSQL/screenshot_11.png)




<a name="b">

# II. Thao tác với user </a>
## 1. Tạo ra một user 
```
create user 'user-name'@'IP' identified by 'password';
```
![](../images/MYSQL/screenshot_6.png)
## 2. Hiển thị toàn bộ user 
```
mysql> SELECT * FROM mysql.user;
```
![](../images/MYSQL/screenshot_12.png)
## 3. Xóa một user 
```
mysql> DELETE FROM mysql.user WHERE user = ' ';
```
![](../images/MYSQL/screenshot_13.png)
## 4.Xóa tất cả user mà không phải root
```
mysql> DELETE FROM mysql.user WHERE NOT (host="localhost" AND user="root");
```
![](../images/MYSQL/screenshot_14.png)
## 5. Đổi tên tài khoản root
```
mysql> UPDATE mysql.user SET user="mydbadmin" WHERE user="root";
```
![](../images/MYSQL/screenshot_15.png)
## 6. Gán quyền cho một user
```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost'
```
![](../images/MYSQL/screenshot_7.png)
## 7. Đổi mật khẩu cho một user 
```
mysql> UPDATE mysql.user SET password=PASSWORD("newpass") WHERE User='username';
```
![](../images/MYSQL/screenshot_16.png)

<a name="c">

# III. Các thao tác với table </a>
Trong một trường thì có kiểu dữ liệu sẽ được phân ra thì một số kiểu của trường là: 
- Kiểu số : int; float;...
- date time: yyyy-mm-dd : ngày tháng năm ; HH:MM:SS (giờ phút giây)
- Kiểu chuỗi: char; varchar
## 1. Tạo bảng table 
```
CREATE TABLES name(trường trong bảng );
```
![](../images/MYSQL/screenshot_17.png)
## 2. Hiển thị tất cả các bảng
```
show tables;
```
![](../images/MYSQL/screenshot_20.png)
## 3. Đổi tên bảng 
```
rename table (tên bảng 1) to (tên bảng 2);
```
![](../images/MYSQL/screenshot_18.png)
## 4. Xóa bảng 
```
drop table (tên bảng);
```
![](../images/MYSQL/screenshot_19.png)
## 5. Hiển thị dữ liệu trong bảng 
```
SELECT * FROM tablename;
```
![](../images/MYSQL/screenshot_21.png)

<a name="d">

# IV. Thao tác với cột và hàng </a>
## 1. Hiển thị các cột trong bảng 
```
mysql> DESC mytable;
hoặc
mysql> SHOW COLUMNS FROM mytable;
```
![](../images/MYSQL/screenshot_22.png)
## 2. Thêm cột cho bảng 
```
alter table tablename add column varchar(40) first;
```
![](../images/MYSQL/screenshot_24.png)
ta kiểm tra lại bằng `show tables`

![](../images/MYSQL/screenshot_23.png)

Xóa một cột tương tự thêm thay `add` bằng `drop`

## 3.Thay đôi tên của cột 
```
alter table sinhvien change columnold columnnew (thuộc tính của trường);
```
![](../images/MYSQL/screenshot_25.png)

Giải thích đọc bảng 
- filed : tên cột 
- Type : Kiểu của trường
- NULL : có được để giá trị null không
- key : có là key chính hay không
- default : mặc định của cột là 

# link tham khảo 

https://freetuts.net/hoc-mysql/mysql-can-ban