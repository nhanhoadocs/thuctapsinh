# 13. MySQL constraints

### 1. NOT NULL 

Cú pháp xác định một ràng buộc `NOT NULL` như sau:

```
column_name data_type NOT NULL;
```

Một cột chỉ có thể chứa một ràng buộc `NOT NULL` chỉ định quy tắc rằng cột không được chứa bất kỳ giá trị nào `NULL`. Nói cách khác, nếu bạn cập nhật hoặc chèn `NULL` vào một cột `NOT NULL`, MySQL sẽ báo lỗi. 

Câu lệnh `CREATE TABLE` sau đây tạo bảng có tên là `tasks`:

```
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);
```

khi tạo bảng với ràng buộc not null, các trường không được để trống. 

ví dụ ta nhập dữ liệu với ngày bắt đầu là NULL: 

```
INSERT INTO tasks(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', null,'2017-02-02');
```

lập tức hệ thống sẽ báo lỗi. 

![Imgur](https://i.imgur.com/prx0muT.png)


Để sửa ngày kết thúc thành not null: 

```
ALTER TABLE tasks 
change
end_date 
    end_date DATE not NULL;
```

![Imgur](https://i.imgur.com/4d7Ukdi.png)

hoặc đổi lại ngày kết thúc thành null : 

```
ALTER TABLE tasks 
modify
    end_date DATE NULL;  
```

![Imgur](https://i.imgur.com/Ax1FNkL.png)

### 2. Primary Key

Khóa chính tuân theo các quy tắc sau:

- Khóa chính phải chứa các giá trị duy nhất. Nếu khóa chính bao gồm nhiều cột, sự kết hợp các giá trị trong các cột này phải là duy nhất

- Một cột khóa chính không thể có giá trị `NULL`. Mọi nỗ lực chèn hoặc cập nhật `NULL` vào các cột khóa chính sẽ dẫn đến lỗi. Lưu ý rằng MySQL ngầm thêm một ràng buộc `NOT NULL` cho các cột khóa chính. 

- Một bảng có thể chỉ có một khóa chính.

Ví Dụ: 

Xác định ràng buộc PRIMARY KEY trong CREATE TABLE.

Nếu khóa chính có một cột

```
CREATE TABLE table_name(
    primary_key_column datatype PRIMARY KEY,
    ...
);
```

Khi khóa chính có nhiều hơn một cột
```
CREATE TABLE table_name(
    primary_key_column1 datatype,
    primary_key_column2 datatype,
    ...,
    PRIMARY KEY(column_list)
);
```

tạo một bảng có tên users, khóa chính là cột user_id:

```
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);
```

Câu lệnh này tạo bảng vai trò có ràng buộc `PRIMARY KEY` làm ràng buộc bảng:

```
CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);
```
Trong trường hợp khóa chính bao gồm nhiều cột, bạn phải chỉ định chúng ở cuối câu lệnh CREATE TABLE.

tạo bảng `user_roles` có khóa chính gồm hai cột: `user_id` và `role_id`. Nó định nghĩa ràng buộc `PRIMARY KEY` là ràng buộc bảng. 

```
CREATE TABLE user_roles(
   user_id INT,
   role_id INT,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) 
       REFERENCES users(user_id),
   FOREIGN KEY(role_id) 
       REFERENCES roles(role_id)
);
```

Nếu một bảng vì một số lý do không có khóa chính, ta có thể sử dụng câu lệnh ALTER TABLE để thêm khóa chính vào bảng như sau:

```
ALTER TABLE table_name
ADD PRIMARY KEY(column_list);
```

Nếu thêm khóa chính vào bảng đã có dữ liệu. Dữ liệu trong (các) cột, sẽ được bao gồm trong khóa chính, phải là duy nhất và không phải là NULL

**Xóa khóa chính** :

Để xóa khóa chính thì chúng ta sử dụng lệnh ALTER TABLE kết hợp với DROP, ví dụ:

```
ALTER TABLE (column_list) DROP PRIMARY KEY;
```

### 3. Foreign Key

Khóa ngoại là một khóa được sử dụng để liên kết hai bảng với nhau.

Foreign Key là một trường (hoặc tập hợp các trường) trong một bảng đề cập đến KEY PRIMARY trong một bảng khác.

Bảng chứa khóa ngoại được gọi là bảng con và bảng chứa khóa chính được gọi là bảng tham chiếu hoặc bảng cha. 

Ràng buộc FOREIGN KEY được sử dụng để ngăn chặn các hành động phá hủy liên kết giữa các bảng.

Để xác định ràng buộc khóa ngoại, sử dụng cú pháp sau: 

```
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]
```

**Xóa ràng buộc**

Để xóa 1 ràng buộc khóa ngoại, ta sử dụng : 

```
ALTER TABLE table_name 
DROP FOREIGN KEY constraint_name;
```

- Đầu tiên, chỉ định tên của bảng mà bạn muốn xóa khóa ngoại sau từ khóa `ALTER TABLE`
- Thứ hai, chỉ định tên ràng buộc sau từ khóa `DROP FOREIGN KEY`. 

Để có được tên ràng buộc được tạo của bảng, bạn sử dụng câu lệnh `SHOW CREATE TABLE`

```
SHOW CREATE TABLE table_name;
```
Đây là đầu ra của lệnh: 

![Imgur](https://i.imgur.com/qpSdOPE.png)

**Vô hiêu hóa kiểm tra khóa ngoại**

Ta sử dụng lệnh sau: 

```
SET foreign_key_checks = 0;
```

Để bật lại : 

```
SET foreign_key_checks = 1;
```

### 4. UNIQUE Constraint

Đôi khi, ta muốn đảm bảo các giá trị trong một cột hoặc một nhóm các cột là duy nhất. Ví dụ: địa chỉ email của người dùng trong bảng users hoặc số điện thoại của khách hàng trong bảng customers phải là duy nhất. Để thực thi quy tắc này, bạn sử dụng một ràng buộc `UNIQUE`

Một ràng buộc UNIQUE có thể là ràng buộc cột hoặc ràng buộc bảng.

Để xác định ràng buộc UNIQUE cho một cột khi bạn tạo bảng , sử dụng cú pháp sau:

```
CREATE TABLE table_name(
    ...,
    column_name data_type UNIQUE,
    ...
);  
```

hoặc để xác định ràng buộc `UNIQUE` cho 2 hoặc nhiều cột khi tạo bảng, ta sử dụng cú pháp sau: 

```
CREATE TABLE table_name(
   ...
   column_name1 column_definition,
   column_name2 column_definition,
   ...,
   UNIQUE(column_name1,column_name2)
);
```

### 5. CHECK constraint

Ràng buộc `CHECK` được sử dụng để giới hạn phạm vi giá trị có thể được đặt trong một cột

Nếu bạn xác định ràng buộc `CHECK` trên một cột duy nhất, nó chỉ cho phép một số giá trị nhất định cho cột này

Nếu bạn xác định ràng buộc `CHECK` trên bảng, nó có thể giới hạn các giá trị trong các cột nhất định dựa trên các giá trị trong các cột khác trong hàng.


ví dụ sau tạo ra một ràng buộc `CHECK` trên cột "Tuổi" khi bảng "Người" được tạo. Ràng buộc `CHECK` đảm bảo rằng độ tuổi của một người phải từ 18 tuổi trở lên:

```
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
```


Để cho phép đặt tên ràng buộc `CHECK` và để xác định ràng buộc `CHECK` trên nhiều cột, hãy sử dụng cú pháp SQL sau:

```
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
```

Nếu muốn thêm ràng buộc check khi  bảng đã được tạo, sử dụng cú pháp sau: 

```
ALTER TABLE Persons
ADD CHECK (Age>=18);
```

Để xóa 1 ràng buộc Check, tham khảo ví dụ sau :

```
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;
```

