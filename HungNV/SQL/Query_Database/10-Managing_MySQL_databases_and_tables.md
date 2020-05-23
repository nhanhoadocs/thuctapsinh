# 10. Managing MySQL databases and tables

### 1. Selecting a MySQL database

Để chọn một cơ sở dữ liệu cụ thể để làm việc, hãy đưa ra câu lệnh `USE` như sau:

```
USE database_name;
```

Sau từ khóa `USE` là tên cơ sở dữ liệu muốn chọn. 

![Imgur](https://i.imgur.com/0rCJWhl.png)

Thông báo trả về như này là cơ sở dữ liệu có tồn tại. 

### 2. Managing databases (Quản lý cơ sở dữ liệu)

###### 1. Create databases 

Trước khi muốn thao tác với cơ sở dữ liệu, ta cần tạo một cơ sở dữ liệu. Một cơ sở dữ liệu là một thùng chứa dữ liệu. Nó lưu trữ danh bạ, nhà cung cấp, khách hàng hoặc bất kỳ loại dữ liệu nào bạn có thể nghĩ đến.

Để tạo cơ sở dữ liệu thực hiện theo cú pháp sau đây: 
```
Create Database [IF NOT EXISTS] database_name; 
```

`if not exists` ngăn cản ta tạo 1 cở sở dữ liệu có tên trùng lặp với cơ sở dữ liệu đã tồn tại. 

Sau khi thực hiện câu lệnh, MySQL trả về một thông báo để thông báo liệu cơ sở dữ liệu mới đã được tạo thành công hay chưa.

###### 2. Displaying Databases

Để hiển thị tất cả các cơ sở dữ liệu đang tồn tại, ta sử dụng câu lệnh sau: 
```
SHOW DATABASES;
```

###### 3. Removing Databases

Xóa cơ sở dữ liệu có nghĩa là xóa tất cả các bảng có trong cơ sở dữ liệu và cơ sở dữ liệu vĩnh viễn.

Để xóa 1 cơ sở dữ liệu, ta thực hiện như sau: 

```
DROP DATABASE [IF EXISTS] database_name;
```

### 3. MySQL storage engines (Công cụ lưu trữ Mysql)

Mysql cung cấp các công cụ lưu trữ cho bảng của nó như sau: 

- MyISAM
- InnoDB
- MERGE
- MEMORY (HEAP)
- ARCHIVE
- CSV
- FEDERATED

Mỗi công cụ lưu trữ có ưu điểm và nhược điểm riêng. Điều cốt yếu là phải hiểu từng tính năng của công cụ lưu trữ và chọn một tính năng phù hợp nhất cho các bảng của bạn để tối đa hóa hiệu suất của cơ sở dữ liệu. 

- **`MyISAM`** : 

Các bảng MyISAM được tối ưu hóa cho nén và tốc độ. Các bảng MyISAM cũng có thể di động giữa các nền tảng và hệ điều hành.  

Kích thước của bảng MyISAM có thể lên tới 256TB, rất lớn.    

Các bảng MyISAM có thể được nén thành các bảng chỉ đọc để tiết kiệm không gian.

The MyISAM tables are not transaction-safe

Trước MySQL phiên bản 5.5, MyISAM là công cụ lưu trữ mặc định khi bạn tạo bảng mà không chỉ định rõ ràng công cụ lưu trữ. Từ phiên bản 5.5, MySQL sử dụng InnoDB làm công cụ lưu trữ mặc định. 

- **`InnoDB`** : 

Các bảng InnoDB hỗ trợ đầy đủ các giao dịch và tuân thủ ACID, tối ưu cho hiệu suất. 

Bảng InnoDB hỗ trợ các khóa ngoại , cam kết, khôi phục, thao tác cuộn tiến.

Kích thước của bảng InnoDB có thể lên tới 64TB.

Giống như MyISAM, các bảng InnoDB có thể di động giữa các nền tảng và hệ điều hành khác nhau

- **`MERGE`** :

Bảng MERGE là một bảng ảo kết hợp nhiều bảng MyISAM có cấu trúc tương tự như một bảng. Công cụ lưu trữ MERGE còn được gọi là công cụ `MRG_MyISAM`.

MySQL chỉ cho phép bạn thực hiện các hoạt động `SELECT`, `DELETE`, `UPDATE` và `INSERT` trên các bảng `MERGE`.


- **`Memory`** : 

Các bảng `memory` được lưu trữ trong bộ nhớ và sử dụng các chỉ mục băm để chúng nhanh hơn các bảng MyISAM. Tuổi thọ của dữ liệu của các bảng bộ nhớ phụ thuộc vào thời gian hoạt động của máy chủ cơ sở dữ liệu. Công cụ lưu trữ bộ nhớ trước đây được gọi là HEAP. 

- **`ARCHIVE`** : 

Công cụ lưu trữ lưu trữ cho phép bạn lưu trữ một số lượng lớn các bản ghi, nhằm mục đích lưu trữ, thành một định dạng nén để tiết kiệm dung lượng đĩa. Công cụ lưu trữ lưu trữ nén một bản ghi khi nó được chèn và giải nén nó bằng thư viện zlib khi nó được đọc.

Các bảng `ARCHIVE` chỉ cho phép các câu lệnh `INSERT` và `SELECT` . Các bảng `ARCHIVE` không hỗ trợ các chỉ mục, do đó cần phải quét toàn bộ bảng để đọc các hàng. 

- **`CSV`** :

Công cụ lưu trữ CSV lưu trữ dữ liệu ở định dạng tệp giá trị được phân tách bằng dấu phẩy (CSV). Bảng CSV mang đến một cách thuận tiện để di chuyển dữ liệu vào các ứng dụng không phải là SQL như phần mềm bảng tính.

Bảng CSV không hỗ trợ kiểu dữ liệu NULL. Ngoài ra, thao tác đọc yêu cầu quét toàn bộ bảng.

### 4. CREATE TABLE 

`CREATE TABLE ` cho phép ta tạo 1 bảng mới trong Mysql. 

**Cú pháp:** 
```
CREATE TABLE [IF NOT EXISTS] table_name(
   column_1_definition,
   column_2_definition,
   ...,
   table_constraints
) ENGINE=storage_engine;
```
Ta có thể tùy ý chỉ định công cụ lưu trữ cho bảng trong mệnh đề `ENGINE`. Bạn có thể sử dụng bất kỳ công cụ lưu trữ nào như `InnoDB` và `MyISAM`. Nếu bạn không khai báo rõ ràng một công cụ lưu trữ, MySQL sẽ sử dụng `InnoDB` theo mặc định.

- Cú pháp định nghĩa cho 1 cột :    

```
column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] column_constraint;
```

`column_name` chỉ định tên của cột. Mỗi cột có một kiểu dữ liệu cụ thể và kích thước tùy chọn, vd: VARCHAR(255) 

Ràng buộc NOT NULL đảm bảo rằng cột sẽ không chứa NULL. Bên cạnh ràng buộc NOT NULL, một cột có thể có các ràng buộc bổ sung như CHECK và UNIQUE.

Chỉ định `DEFAULT` một giá trị mặc định cho cột.

`AUTO_INCREMENT` chỉ ra rằng giá trị của cột được tăng lên một cách tự động mỗi khi một hàng mới được chèn vào bảng. Mỗi bảng có tối đa một cột `AUTO_INCREMENT`

Sau danh sách cột, bạn có thể xác định các ràng buộc bảng như `UNIQUE`, `CHECK`, `KEY PRIMARY` và `FOREIGN KEY`.

Nếu muốn đặt 1 cột hoặc 1 nhóm cột làm khóa chính, ta sử dụng cú pháp sau: 

```
PRIMARY KEY (col1,col2,...)
```

### 5. Mysql Sequence

**Creating MySQL sequence**

Để tự động tạo một chuỗi trong MySQL, bạn đặt thuộc tính `AUTO_INCREMENT` thành một cột, thường là cột khóa chính.

Các quy tắc sau được áp dụng khi bạn sử dụng thuộc tính `AUTO_INCREMENT`:

- Mỗi bảng chỉ có một cột `AUTO_INCREMENT` có kiểu dữ liệu thường là số nguyên

- Cột `AUTO_INCREMENT` phải được lập chỉ mục, có nghĩa là cột này có thể là `PRIMARY KEY` or `UNIQUE` index. 

- Cột `AUTO_INCREMENT` phải có ràng buộc `NOT NULL`. Khi bạn đặt thuộc tính `AUTO_INCREMENT` thành một cột, MySQL sẽ tự động thêm ràng buộc `NOT NULL` vào cột. 


Nếu công cụ lưu trữ của bảng là InnoDB, nó sẽ không sử dụng lại số thứ tự đã xóa. Nên nếu đã xóa các hàng có số thứ tự trước thì khi thêm hàng mới, cột `AUTO_INCREMENT` sẽ sử dụng số thứ tự tiếp theo để gán. 

### 6. ALTER TABLE

Câu lệnh `ALTER TABLE` được sử dụng để thêm, xóa hoặc sửa đổi các cột trong bảng hiện có. 

Câu lệnh `ALTER TABLE` cũng được sử dụng để thêm và xóa các ràng buộc khác nhau trên một bảng hiện có. 

**ADD Column** 

Để thêm một cột trong bảng, hãy sử dụng cú pháp sau : 
```
ALTER TABLE table_name
ADD column_name datatype;
```
Ví dụ: SQL sau đây thêm cột "Email" vào bảng "customers"

```
ALTER TABLE customers
ADD Email varchar(255);
```

![Imgur](https://i.imgur.com/7kYSU6g.png)

ta thấy cột email đã được thêm vào bảng `customers`. 

Để thêm 2 hoặc nhiều cột vào 1 bảng, ta sử dụng cú pháp như sau: 

```
ALTER TABLE table
ADD [COLUMN] column_name_1 column_1_definition [FIRST|AFTER existing_column],
ADD [COLUMN] column_name_2 column_2_definition [FIRST|AFTER existing_column],
...;
```

**Drop Column** 

Để xóa 1 cột trong bảng, hãy sử dụng cú pháp sau: 

```
ALTER TABLE table_name
DROP COLUMN column_name;
```
Ví dụ: SQL sau đây xóa 1 cột "Email" trong bảng "customers" 

```
ALTER TABLE customers
DROP COLUMN Email;
```

![Imgur](https://i.imgur.com/3i1THFN.png)

Cột email đã bị xóa khỏi bảng `customers`

Để xóa cùng lúc nhiều cột trong 1 bảng, ta sử dụng cú pháp sau: 

```
ALTER TABLE table_name
DROP COLUMN column_name_1,
DROP COLUMN column_name_2,
...;
```

Nếu xóa 1 cột là khóa ngoại thì phải bỏ ràng buộc trước khi xóa. 

**MODIFY COLUMN**

Để thay đổi kiểu dữ liệu của một cột trong bảng, hãy sử dụng cú pháp sau :

```
ALTER TABLE table_name
MODIFY column_name datatype;
```


**Rename a column in a table**

Đê thay đổi tên của 1 cột trong bảng, hãy sử dụng cú pháp sau: 

```
ALTER   TABLE  table_name
     CHANGE   COLUMN  original_name new_name column_definition
    [ FIRST  |  AFTER  column_name];
```

**Rename table**

Để thay đổi tên của 1 bảng, hãy sử dụng cú pháp sau: 

```
ALTER TABLE table_name
RENAME TO new_table_name;
```

### 7. Drop Table 

Câu lệnh `Drop Table` để xóa 1 bảng hiện có trong cơ sở dữ liệu. 

Để xóa toàn bộ bảng bao gồm tất cả các hàng của nó, hãy dùng lệnh `Drop table` theo sau là `table_name`. `Drop table` khác với xóa tất cả các bản ghi trong bảng (Delete table). Xóa tất cả các bản ghi trong bảng để lại bảng bao gồm thông tin cột và ràng buộc. Việc bỏ bảng sẽ loại bỏ định nghĩa bảng cũng như tất cả các hàng của nó.

**Cú pháp**

```
DROP TABLE table_name;
```

**Lưu ý:**

Việc xóa bảng thất bại nếu các bảng khác phụ thuộc vào bảng bị loại bỏ 

Nếu một khóa chính tồn tại, nó bị loại bỏ. Người dùng không cần bỏ khóa chính trước khi xóa bảng. 

Nếu khóa chính của bảng được tham chiếu bởi một ràng buộc thuộc về bảng khác, thì bảng không bị loại bỏ và một lỗi sẽ được báo. 

### 8. Temporary Table

Các bảng tạm thời có thể rất hữu ích trong một số trường hợp để giữ dữ liệu tạm thời. Điều quan trọng nhất cần biết đối với các bảng tạm thời là chúng sẽ bị xóa khi phiên khách hiện tại kết thúc. 

Bảng tạm thời được tạo bằng cách sử dụng câu lệnh `CREATE TEMPORARY TABLE`.

Một bảng tạm thời sẽ bị xóa nếu kết nối tới cơ sở dữ liệu chấm dứt, còn nếu muốn xóa bảng trong khi đàn làm việc, ta có thể sử dụng câu lệnh `Drop table`

Cú pháp tạo 1 bảng tạm thời trong MySQL: 

```
 CREATE   TEMPORARY   TABLE  table_name(
   column_1_definition,
   column_2_definition,
   ...,
   table_constraints
);
```

1 bảng tạm thời có thể trùng tên với bảng chính nhưng không nên đặt như vậy bởi vì có thể dẫn đến nhầm lẫn. 

### 9. TRUNCATE TABLE

Sử dụng để xóa tất cả dữ liệu trong 1 bảng nhanh chóng.

câu lệnh `TRUNCATE TABLE` cũng giống như câu lệnh `DELETE TABLE`, nhưng cách hoạt động của chúng khác nhau: 

Câu lệnh `TRUNCATE TABLE` loại bỏ cả bảng và tạo lại bảng mới còn `DELETE TABLE` xóa dữ liệu của từng cột trong 1 bảng. 

Cú pháp cơ bản của lệnh `TRUNCATE TABLE`: 

```
TRUNCATE [TABLE] table_name;
```

Dữ liệu khi sử dụng `DELETE` có thể khôi phục còn dữ liệu khi sử dụng `TRUNCATE` thì không. 

