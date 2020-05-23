# Constraint SQL (Ràng buộc), Auto_increment,

Constraint là những quy tắc được áp dụng trên các cột dữ liệu, trên bảng. Được sử dụng để kiểm tra tính hợp lệ của dữ liệu vào, đảm bảo tính chính xác, tính toàn vẹn của dữ liệu.

- NOT NULL: Sử dụng để đảm bảo dữ liệu của cột không được nhận giá trị NULL
DEFAULT	Gán giá trị mặc định trong trường hợp dữ liệu của cột không được nhập vào hay không được xác định.
- UNIQUE: Sử dụng để đảm bảo dữ liệu của cột là duy nhất, không trùng lặp giá trị trên cùng 1 cột.
- PRIMARY KEY (Khóa chính):	Dùng để thiết lập khóa chính trên bảng, xác định giá trị trên tập các cột làm khóa chính phải là duy nhất, không được trùng lặp. Việc khai báo ràng buộc khóa chính yêu cầu các cột phải NOT NULL.
- FOREIGN KEY (Khóa ngoại):	Dùng để thiết lập khóa ngoại trên bảng, tham chiếu đến bảng khác thông qua giá trị của cột được liên kết. Giá trị của cột được liên kết phải là duy nhất trong bảng kia.
- CHECK:	Bảo đảm tất cả giá trị trong cột thỏa mãn điều kiện nào đó. Đây là hình thức sử dụng phổ biến để kiểm tra tính hợp lệ của dữ liệu (validate data)

Một số lưu ý đối với ràng buộc CHECK:

- Không thể định nghĩa trong VIEW
- Các điều kiện thiết lập phải tham chiếu đến cột trong cùng 1 bảng dùng để khai báo ràng buộc, không thể tham chiếu tới các cột ở bảng khác. Trường hợp muốn tham chiếu đến bảng khác thì có thể dùng Function để trích xuất dữ liệu.
- Không thể sử dụng subquery (truy vấn con) trong định nghĩa điều kiện
- Chúng ta có thể khai báo ràng buộc trong câu lệnh CREATE TABLE (tạo mới bảng) hoặc ALTER TABLE (Sửa đổi bảng)

https://viblo.asia/p/rang-buoc-constraint-trong-sql-eW65GAnJZDO

Ví dụ: 

**NOT NULLL**

Tạo, Sửa:

```sql
    CREATE TABLE Persons (
        ID int NOT NULL,
        LastName varchar(255) NOT NULL,
        FirstName varchar(255) NOT NULL,
        Age int
    );

    alter table test_table modify Age int not null;
```

**UNIQUE**

Tạo:

```sql
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
```
Dùng với ALTER TABLE
Tạo
```sql
ALTER TABLE Persons
ADD UNIQUE (ID);
```
Đặt tên ràng buộc UNIQUE
```sql
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);
```

Xóa:
```sql
ALTER TABLE Persons
DROP INDEX UC_Person;
```
**PRIMARY KEY**

Tạo:

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);
```


Đặt tên cho khóa lúc tạo
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
```

Dùng với ALTER TABLE

Tạo:
```sql
ALTER TABLE Persons
ADD PRIMARY KEY (ID);
```
Đặt tên khóa chính:
```sql
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
```
Xóa khóa chính:
```sql
ALTER TABLE Persons
DROP PRIMARY KEY;
```


**FOREIGN KEY**

Tạo khóa ngoại lúc tạo bảng:

```sql
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
```

Đặt tên khóa ngoại:
```sql
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(ID)
);
```

Sử dụng với ALTER TABLE

Tạo khóa ngoại:
```sql
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(ID);
```

Đặt tên
```sql
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(ID);
```

Xóa khóa ngoại

```sql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;
```
**CHECK**

Quan sát câu lệnh SQL sau sẽ tạo ràng buộc CHECK trên cột Age ngay khi bảng Persons được tạo ra. Ràng buộc CHECK đảm bảo rằng bạn sẽ không thể có bất kỳ người nào dưới 18 tuổi.

```SQL
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
```
Đặt tên ràng buộc CHECK
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
```
Dùng với ALTER TABLE

Tạo:
```sql
ALTER TABLE Persons
ADD CHECK (Age>=18);
```

Đặt tên:
```sql
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');
```
Xóa:
```sql
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;
```
**DEFAULT**
Thêm ràng buộc mặc định, nếu không nhập tên thành phố thì sẽ hiển thị thành phố mặc định là Sandnes
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);
```
Dùng với ALTER TABLE
Tạo:
```sql
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';
```
Xóa:
```sql
ALTER TABLE Persons
ALTER City DROP DEFAULT;
```

**INDEX**

Ràng buộc INDEX để người dùng truy vấn nhanh hơn

Tạo INDEX syntax

```
CREATE INDEX index_name
ON table_name (column1, column2, ...);
```
Tạo UNIQUE INDEX syntax
```
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
```
Ví dụ:
```sql
CREATE INDEX idx_lastname
ON Persons (LastName);
```

```sql
CREATE INDEX idx_pname
ON Persons (LastName, FirstName);
```
Xóa INDEX
```sql
ALTER TABLE table_name
DROP INDEX index_name;
```

### AUTO INCREMENT Field

AUTO_INCREMENT nói nôm na có nghĩa là tăng tự động, có nghĩa là nếu bạn thiết lập một field nào đó là tăng tự động thì khi bạn thêm record mới bạn không cần phải truyền data cho nó và nó sẽ tự lấy giá trị lớn nhất tăng lên 1. Tuy nhiên không phải lúc nào nó cũng lấy giá trị lớn nhất mà sẽ tuân theo những tính chất sau đây:

- AUTO_INCREMENT chỉ thiết lập được cho kiểu INT và mỗi bảng chỉ có một field duy nhất, nghĩa là nếu bạn thiết lập 2 fields là AUTO_INCREMENT thì sẽ bị lỗi ngay.
Khi bạn thêm dữ liệu nếu bạn có truyền data thì nó sẽ lấy data đó thay vì tăng tự động, ngược lại nó sẽ lấy giá trị lớn nhất hiện tại và tăng lên 1(giá trị lớn nhất này lưu trong config của table chứ không phải là id lớn nhất trong các records).
- Khi bạn xóa một record thì sẽ bị khuyết mất một giá trị, lúc này nếu bạn thêm thì nó sẽ không lấp vào vị trí này mà nó tuân theo quy luật trên.
- Giả sử giá trị 120 là lớn nhất, bạn xóa đi 120 thì lúc này lớn nhất là 119. Lúc này nếu ban thêm mới thì nó sẽ lấy 121 chứ không phải là 120 vì giá trị lớn nhất nó lưu trong config của table.
- Thông thường ta sử dụng AUTO_INCREMENT cho Primary Key khi viết ứng dụng website
- Mặc định AUTO_INCREMENT sẽ có giá trị đầu tiên là 1

Để tạo AUTO_INCREMENT thì ta thêm từ khóa AUTO_INCREMENT đằng sau field muốn tạo trong lệnh tạo bảng (Create Table). Thông thường chúng ta dùng cho khóa chính nên trong các ví dụ dưới đây tôi sử dụng cho field ID.

```sql
CREATE TABLE Users(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR (50) NOT NULL UNIQUE
);
```

Thay đổi giá trị Auto_increment

```sql
ALTER TABLE Users AUTO_INCREMENT = 1000
```

