## Cài đặt MySQL

Chuẩn bị mô hình gồm 2 máy trong đó 1 máy để cài MySQL server và một máy dùng là máy client.

Mô hình như sau:

![](/CSDL/images/mysql/8.png)

**Cài MySQL server**

Download file từ trên mạng về:

`wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm`

![](/CSDL/images/mysql/1.png)

`rpm -ivh mysql-community-release-el7-5.noarch.rpm`

![](/CSDL/images/mysql/2.png)

`yum install mysql-server`

![](/CSDL/images/mysql/3.png)

`systemctl start mysqld`

Để thiết tài khoản cho user `root` ta chạy lệnh 

`mysql_secure_installation`

![](/CSDL/images/mysql/4.png)

Ở đây ta có thể đặt mật khẩu cho tài khoản `root` và một số các thông số khác

Cho phép truy cập vào MySQL từ máy ở xa.

`iptables -I INPUT -p tcp -m tcp --dport 3306 -j ACCEPT`

Đến đây ta đã cài xong MySQL server.

Ta có thể login vào với user root

![](/CSDL/images/mysql/5.png)

#### Tạo user và phân quyền cho user

Ta có thể tạo các user và phân quyền cho user đó để nó chỉ có các quyền nhất định với CSDL nhất định hay các bảng nhất định

Tạo user `create user 'user-name'@'IP' identified by 'password';`

Trong đó:

 * `IP` có thể là địa chỉ máy IP ở xa cho phép login vào hoặc là `localhost` nếu chỉ cho login vào tại chính máy local. Để `%` nếu cho phép tất cả các máy login vào.

![](/CSDL/images/mysql/6.1.png)

Như ví dụ trên user `niemdt` chỉ có thể login và từ máy ở xa có địa chỉ `192.168.122.56`

Sau khi tạo user xong ta cần phải cấp quyền cho user đó

Cấp quyền cho user `grant quyền on data-name.table-name to 'user-name'@'IP';`

Trong đó các quyền có thể gán cho user:

 * `ALL PRIVILEGES` tất cả các quyền
 * `CREATE` cho phép tạo bảng hoặc databases mới
 * `DROP` xóa bảng hoặc databases
 * `DELETE` xóa dữ liệu trong bảng
 * `INSERT` Thêm thông tin vào bảng
 * `SELECT` được dùng lệnh select để đọc dữ liệu
 * `UPDATE` update dữ liệu trong bảng
 * `GRANT OPTION` được thêm xóa user, quyền của user

Data và table nếu muốn áp dụng cho tất cả thì dùng dấu `*` để thay thế.

![](/CSDL/images/mysql/6.2.png)

Như ví dụ trên tôi để cho user `niemdt` có tất cả các quyền với đất cả các CSDL trên MySQL server.

Chạy lệnh `FLUSH PRIVILEGES` để áp dụng những gì vừa thiết lập.

![](/CSDL/images/mysql/6.3.png)

Một số lệnh với user:

* Xóa quyền của 1 user `REVOKE type_of_permission ON database_name.table_name FROM ‘username’@‘localhost’;`

* Show các quyền đang được áp dụng với user `show grants user-name;`

* Xóa user `DROP USER 'user-name'@'IP';`

* Xem các user trên mysql server `select host, user, password from mysql.user;`

* Xem các thuộc tính user `desc mysql.user;`

Như bên trên ta đã đề cập tới việc cho phép login vào từ một máy ở xa. Để làm được điều này ta cần phải cài đặt mysql client trên máy đó.

**Cài MySQL client**

Dùng lệnh `yum install mysql`

Sau khi cài xong ta có thể login vào MySQL bằng các user có quyền được login vào từ xa.

login remote ta sử dụng cú pháp `mysql -u user-name -p -h IP`

`IP` ở đây là IP của máy server.

![](/CSDL/images/mysql/7.png)

## Sử dụng MySQL

Tạo database `CREATE database tên-database;`

Xóa database `DROP database tên-database;`

Để làm việc với một CSDL `USE tên-database;`

### Tạo bảng

Tạo bảng 

CREATE TABLE table-name(các trường trong bảng);

VD:

create table bang1(
mssv INT NOT NULL AUTO_INCREMENT,
ho VARCHAR(50) NOT NULL,
ten VARCHAR(30) NOT NULL,
diemthi FLOAT(2,2),
PRIMARY KEY (mssv)
);

Trong đó: 
 
 * `NOT NULL` không được để trông giá trị
 * `AUTO_INCREMENT` tự động tăng (giống STT)
 * `PRIMARY KEY` khai báo khóa chính. Nếu khai báo nhiều khóa chính cùng lúc thì thay lại bằng câu `CONSTRAINT ma PRIMARY KEY (các trường)`

 * Thiết lập khóa ngoại `FOREIGN KEY (Masv) REFERENCES HSSV(Masv)`

Xóa bảng `DROP TABLE tên-bảng`

Ghi dữ liệu  

```
insert into tên-bangr ( truong1, truong2, ...)
Values (giá trị lần lượt theo các trường đã khai báo ở trên)
```

Chúng ta có một số kiểu dữ liệu sau:

**Kiểu số**

`INT` 

`FLOAT(n,m)`- số thực dấu chấm động

`DOUBLE(n,m)`

**Kiểu date time**

`DATE` YYYY-MM-DD. Ví dụ 2019-01-28.

`DATETIME` YYYY-MM-DD HH:MM:SS. Ví dụ 23h00 ngày 28-01-2019 được biểu diễn 2019-01-28 23:00:00

`TIME` HH:MM:SS

`YEAR(m)` m có thể là 2 hoặc 4. Mặc định là 4

**Kiểu chuỗi**

`CHAR(m)` độ dài cố định từ 1 đến 255 ký tự. Nếu 1 trường kiểu char có độ dài không bằng độ dài khai báo thì phần còn thiếu được thêm bằng ký tự trắng.

`VARCHAR(m)` độ dài có thể thay đổi.

`BLOB` hoặc `TEXT` độ dài tối đa 65535 ký tự. BLOB sử dụng lưu trữ dữ liệu nhị phân như các bức ảnh hoặc tập nhị phân khác. `BLOB` phân biệt chữ hoa chữ thường còn `TEXT` thì không.

**SELECT**

Kết hợp với các mệnh đề khác để truy xuất dữ liệu

`SELECT các trường FROM tên-bảng`

Các trường có thể để là `*` nếu muốn truy xuất tất cả các trường trong bảng.

**WHERE**

`SELECT * FROM tên-bảng WHERE điều kiện`

VD: `SELECT * FROM bang1 WHERE ten="niem";`

**LIKE** 

Like thường được sử dụng kết hợp với các mệnh đề khác. Hay được dùng chung với WHERE và được thay thế cho dấu bằng. Có thể dùng ký tự `%` để tìm kiếm giống như `*` trong linux.

**UPDATE**

Dùng để cập nhật dữ liệu của một hoặc nhiều trường

```
UPDATE tên-bảng SET truong1=gia-tri-moi, truong2=gia-tri-moi
WHERE
```

**DELETE**

`DELETE FROM tên-bảng WHERE `

Chú ý đến mệnh đề WHERE nếu ko có sẽ dẫn đến xóa cả bảng.

**ORDER BY**

Được sử dụng để sắp xếp kết quả hiển thị trả về

```
SELECT * FROM tên-bảng
ORDER BY truongn [ASC][DESC]
```

Có thể chọn kết quả trả về của bất kỳ trường nào
Sử dụng một trong hai khóa `ASC` để hiển thị kết quả theo thứ tự tăng dần hoặc `DESC` để hiển thị theo giá trị giảm dần.

**JOIN**

Được dùng để lấy dữ liệu cùng lúc từ nhiều bảng và ghép chúng lại với nhau.

VD

```
SELECT a.mssv, a.ten, b.hocphi
FROM bang1 a, bang2 b
WHERE a.ten=b.ten;
```
Kết quả sẽ trả về mã số sv và tên trong bảng 1 và học phí trong bảng 2 nếu tên trong bảng 1 và bảng 2 là trùng nhau.

**NULL**

Để so sánh một trường nào đó với giá trị NULL ta dùng lệnh

`truong1 IS NULL`
hoặc `truong1 IS NOT NULL`

**ALTER**

Lệnh này được dùng để thay đổi tên cho bảng hay bất kỳ trường nào cho bảng như thêm bớt sửa xóa.

VD: Xóa một trường `ALTER TABLE tên-bảng DROP tên-trường`

ADD thêm một trường sau trường nào đó `ALTER TABLE tên-bảng ADD ten CHAR(40) AFTER hocphi;`
Thêm cột tên sau cột học phí.

Định nghĩa một trường theo tên mới 

`ALTER TABLE tên-bảng CHANGE ten hoten CHAR(40);`    Thay trường tên bằng họ tên.

Một số lệnh để show thông tin trên Mysql server

 * select version()  phiên bản server
 * select database() tên database hiện tại
 * select user()     username hiện tại
 * show status       trạng thái server
 * show variables    các biến cấu hình server

**BETWEEN**

Thay vì dùng mệnh đề where như sau

```
select * from tên-bang
where diemthi >= 8 and diemthi <= 10;
```

Ta có thể sử dụng

```
select * from tên-bảng
where diemthi BETWEEN 8 and 10;
```

**view**

View cho phép ta xem các thông tin cần thiết từ các bảng

Tạo `VIEW`

```
CREATE view tên-view
AS
SELECT các trường
FROM các bảng
WHERE điều kiện;
```

**Tạo biến**

Sử dụng `Declare tên-biến kiểu-ký-tự` để khai báo một biến.

**Backup, restore database**

Để Backup dữ liệu ta lưu nó thành một file và khi cần ta có thể khôi phục lại file đó để thanh dữ liệu trong MySQL

Chuyển database thành một file

`mysqldump -u root -p tên-data > tên-file.sql`

Chuyển dữ liệu từ file vào mysql

`mysql -u root -p tên-data < tên-file`