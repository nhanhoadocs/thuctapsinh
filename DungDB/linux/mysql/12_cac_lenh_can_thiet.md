# Các lệnh sử dụng trong mysql làm việc với database, table., cột hàng, quản lý users

Đăng nhập MySQL bạn dùng lệnh: 

    mysql -u root -p

Thư mục chứa database

Trên CentOS, toàn bộ file raw database được lưu trong thư mục `/var/lib/mysql`

## 1. Các lệnh phổ biến nhất

`SELECT` - extracts data from a database

`UPDATE` - updates data in a database

`DELETE` - deletes data from a database

`INSERT INTO` - inserts new data into a database

`CREATE DATABASE` - creates a new database

`ALTER DATABASE` - modifies a database

`CREATE TABLE table_name` - creates a new table

`ALTER TABLE table_name`- modifies a table

`DROP TABLE table_name` - deletes a table

`DESC table_name` - show table

`TRUNCATE TABLE table_name` - Xóa data của table nhưng không xóa table

`ALTER TABLE table_name change old_column_name new_column_name datatype`; - Thay đổi tên cột trong bảng

`CREATE INDEX` - creates an index (search key)

`DROP INDEX` - deletes an index

Ví dụ: 
```SQL
    create database test;

    show databases;

    use test;

    CREATE TABLE test_table (
    ID int,
    ho varchar(255),
    ten varchar(255),
    dia_chi varchar(255)
    );

    show tables;

    desc test_table;

    alter table test_table add email varchar(255);

    alter table test_table drop column email;

    alter table test_table modify column ten varchar(25);

    desc test_table;

    alter table test_table add ngay_sinh date;

    alter table test_table modify column ngay_sinh year;
```


## 2. Quản lý tài khoản và phân quyền

Hiển thị toàn bộ users:

    mysql SELECT * FROM mysql.user;

Tạo user 

    CREATE USER 'admin'@'%' IDENTIFIED BY 'password';

    CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';

Gán quyền

    GRANT ALL PRIVILEGES ON testdbwp.* TO admin@localhost IDENTIFIED BY 'password';

    GRANT ALL PRIVILEGES ON *.* TO 'dung'@'%' IDENTIFIED BY 'password';

Xóa null user:

    mysql DELETE FROM mysql.user WHERE user = ' ';

Xóa tất cả user mà không phải root:

    mysql DELETE FROM mysql.user WHERE NOT (host="localhost" AND user="root");

Đổi tên tài khoản root (giúp bảo mật):

    mysql UPDATE mysql.user SET user="mydbadmin" WHERE user="root";

Gán full quyền cho một user mới:

    mysql GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'mypass' WITH GRANT OPTION;

Phân quyền chi tiết cho một user mới:

    mysql GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON mydatabase.* TO 'username'@'localhost' IDENTIFIED BY 'mypass';

Gán full quyền cho một user mới trên một database nhất định:

    mysql GRANT ALL PRIVILEGES ON mydatabase.* TO 'username'@'localhost' IDENTIFIED BY 'mypass' WITH GRANT OPTION;

Thay đổi mật khẩu user:

    mysql UPDATE mysql.user SET password=PASSWORD("newpass") WHERE User='username';

Xóa user:

    mysql DELETE FROM mysql.user WHERE user="username";

Cuối cùng reload user

    mysql FLUSH PRIVILEGES;
    mysql exit;

## 3. Các thao tác database

Hiển thị toàn bộ databases:

    mysql SHOW DATABASES;

Tạo database:

    mysql CREATE DATABASE mydatabase;

Sử dụng một database:

    mysql USE mydatabase;

Xóa một database:

    mysql DROP DATABASE mydatabase;

Tối ưu database:

All Databases:

    $ sudo mysqlcheck -o --all-databases -u root -p

Single Database:

    $ sudo mysqlcheck -o db_schema_name -u root -p

## 4. Các thao tác table

Tất cả các thao tác bên dưới bạn phải lựa chọn trước database bằng cách dùng lệnh: mysql USE mydatabase;

Hiển thị toàn bộ table:

    mysql SHOW TABLES;

Hiển thị dữ liệu của table:

    mysql SELECT * FROM tablename;

Đổi tên table:

    mysql RENAME TABLE first TO second;

hoặc

    mysql ALTER TABLE mytable rename as mynewtable;

Xóa table:

    mysql DROP TABLE mytable;

## 5. Các thao tác cột và hàng

Tất cả các thao tác bên dưới bạn phải lựa chọn trước database bằng cách dùng lệnh: mysql USE mydatabase;

Hiển thị các column trong table:

    mysql DESC mytable;

hoặc
    mysql SHOW COLUMNS FROM mytable;

Đổi tên column:

    mysql UPDATE mytable SET mycolumn="newinfo" WHERE mycolumn="oldinfo";

Select dữ liệu:

    mysql SELECT * FROM mytable WHERE mycolumn='mydata' ORDER BY mycolumn2;

Insert dữ liệu vào table:

    mysql INSERT INTO mytable VALUES('column1data','column2data','column3data','column4data','column5data','column6data','column7data','column8data','column9data');

Xóa dữ liệu trong table:

    mysql DELETE FROM mytable WHERE mycolumn="mydata";

Cập nhật dữ liệu trong table:

    mysql UPDATE mytable SET column1="mydata" WHERE column2="mydata";

## 6. Các thao tác sao lưu và phục hồi

Sao lưu toàn bộ database bằng lệnh (chú ý không có khoảng trắng giữa -p và mật khẩu):

    mysqldump -u root -pmypass --all-databases  alldatabases.sql

Sao lưu một database bất kỳ:

    mysqldump -u username -pmypass databasename  database.sql

Khôi phục toàn bộ database bằng lệnh:

    mysql -u username -pmypass  alldatabases.sql (no space in between -p and mypass)

Khôi phục một database bất kỳ:

    mysql -u username -pmypass databasename  database.sql

Chỉ sao lưu cấu trúc database:

    mysqldump --no-data --databases databasename  structurebackup.sql

Chỉ sao lưu cấu trúc nhiều database:

    mysqldump --no-data --databases databasename1 databasename2 databasename3  structurebackup.sql

Sao lưu một số table nhất định:

    mysqldump --add-drop-table -u username -pmypass databasename table_1 table_2  databasebackup.sql



