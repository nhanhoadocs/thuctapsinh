# MYSQL GLOBALIZATION



## Character Set
Trong MySQL bộ ký tự mặc định là `latin1`.

### Chuyển đổi giữa các bộ ký tự khác nhau
MySQL cung cấp hai hàm cho phép bạn chuyển đổi các chuỗi giữa các bộ ký tự khác nhau: `CONVERT` và `CAST`

Cú pháp của `CONVERT` hàm như sau:

```SQL
CONVERT(expression USING character_set_name)
```

Hàm `CAST` cũng tương tự như `CONVERT`. Nó chuyển đổi một chuỗi thành một bộ ký tự khác:

```SQL
CAST(string AS character_type CHARACTER SET character_set_name)
```


### Đặt character set cho máy khách kết nối
Để định cấu hình character set cho kết nối máy khách, bạn có thể thực hiện một trong các cách sau:

đặt character set sau khi đã kết nối với máy chủ, ví dụ:

```SQL
SET NAMES 'utf8';
```

Ngoài ra nếu ứng dụng hỗ trợ tùy chọn `--default-character-set`, ta có thể sử dụng nó để đặt character set, ví dụ `mysql client` hỗ trợ `--default-character-set` và ta có thể thiết lập nó trong file cấu hình như sau:

```conf
[mysql]
default-character-set=utf8
```

Một số trình kết nối MySQL cho phép bạn đặt bộ ký tự, ví dụ: nếu bạn sử dụng PHP PDO, bạn có thể đặt bộ ký tự trong tên nguồn dữ liệu như sau:

```PHP
$dsn ="mysql:host=$host;dbname=$db;charset=utf8";
```

## Collation

Đối chiếu MySQL là một bộ quy tắc được sử dụng để so sánh các ký tự trong một bộ ký tự cụ thể. Mỗi ký tự được đặt trong MySQL có thể có nhiều đối chiếu và ít nhất có một đối chiếu mặc định.

MySQL cung cấp cho bạn `SHOW CHARACTER SET`  câu lệnh cho phép bạn có được các tập hợp mặc định của các bộ ký tự như sau:

<img src="https://i.imgur.com/NhUDMgz.png">


### Đặt collation trong cơ sở dữ lệu

Khi bạn tạo cơ sở dữ liệu, nếu bạn không chỉ định `character set` và `collation` của nó, MySQL sẽ sử dụng bộ ký tự mặc định và đối chiếu của máy chủ cho cơ sở dữ liệu.

Bạn có thể ghi đè cài đặt mặc định ở cấp cơ sở dữ liệu bằng cách sử dụng `CREATE DATABASE` hoặc `ALTER DATABASE` lệnh như sau:

```SQL
CREATE DATABASE database_name
CHARACTER SET character_set_name;
COLLATE collation_name
```

Hoặc

```SQL
ALTER DATABASE database_name
CHARACTER SET character_set_name
COLLATE collation_name;
```


### Đặt character và collation ở cấp độ table

Cơ sở dữ liệu có thể chứa các bảng có bộ ký tự và đối chiếu khác với bộ ký tự và đối chiếu của cơ sở dữ liệu mặc định.

Bạn có thể chỉ định bộ ký tự và đối chiếu mặc định cho bảng khi bạn tạo bảng bằng cách sử dụng `CREATE TABLE` câu lệnh hoặc khi bạn thay đổi cấu trúc của bảng bằng cách sử dụng `ALTER TABLE` câu lệnh:

```SQL
CREATE TABLE table_name(
   ...
)
CHARACTER SET character_set_name
COLLATE collation_name
```

Hoặc

```SQL
ALTER TABLE table_name(
  ...
)
CHARACTER SET character_set_name
COLLATE collation_name
```


### Đặt character set và collation ở cấp độ cột (column)
Một cột kiểu `CHAR`, `VARCHAR` hoặc `TEXT` có thể có bộ ký tự riêng của mình và đối chiếu đó là khác biệt so với các bộ ký tự mặc định và collation của bảng.

Bạn có thể chỉ định một bộ ký tự và đối chiếu cho cột theo định nghĩa của cột `CREATE TABLE` hoặc `ALTER TABLE` câu lệnh như sau:

```SQL
column_name [CHAR | VARCHAR | TEXT] (length)
CHARACTER SET character_set_name
COLLATE collation_name
```