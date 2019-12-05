# GETTING STARTED WITH MYSQL


## Cài đặt MySQL Database Server
Để cài đặt MySQL hoặc MariaDB (Một nhánh của MySQL) bạn có thể tham khảo tài liệu dưới đây:

- [MySQL Database Server](../../../MySQL/docs/README.md)
- [MariaDB Database Server](../../../MariaDB/docs/README.md)


## Settup sample database
Trong loạt tài liệu này chúng ta sẽ sử dụng một cơ sở dữ liệu làm cơ sở dữ liệu mẫu của MySQL để giúp ta làm việc với MySQL nhanh chóng và hiệu quả. Cơ sở dữ liệu `classicmodels` là mô hình cơ sở dữ liệu mẫu giúp ta tương tác. Nó chứa dữ liệu kinh doanh điển hình như khách hàng, sản phẩm, đơn đặt hàng, chi tiết đơn hàng, v.v.

### Download sample database
Đầu tiên bạn cần tải cơ sở dữ liệu mẫu này về [ở đây](http://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip)

Sau khi download về ta cần giải nén nó ra để có thể import vaò và sử dụng, bạn có thể sử dụng phần mềm giải nén nào tùy ý.

### Import sample database
Sau khi tải xuống và giải nén `sample database` và giải nén ta sẽ được một file `mysqlsampledatabase.sql`.

Sau đó ta cần đăng nhập vào Database Server bằng tài khoản `root` để import dữ liệu mẫu bằng lệnh sau:

```
$ mysql -u root -p
```

Tiếp theo ta sử dụng lệnh dưới đây để import sample database vào:

```SQL
mysql> source /tmp/mysqlsampledatabase.sql
```

Chú ý: Bạn cần thay `/tmp/mysqlsampledatabase.sql` thành đường dẫn file `mysqlsampledatabase.sql`

Sau đó ta chạy lệnh sau để kiểm tra lại database:

```SQL
mysql> show databases;
```

Kết quả sẽ tương tự như sau:

```
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

Trong đó `classicmodels` chính là cơ sở dữ liệu mà chúng ta vừa load vào.

### Lược đồ cơ sở dữ liệu mẫu của MySQL

Lược đồ cơ sở dữ liệu mẫu của MySQL bao gồm các bảng sau:

- Customers: lưu trữ dữ liệu của khách hàng.
- Products: lưu trữ một danh sách các mô hình quy mô xe.
- ProductLines: lưu trữ danh sách các danh mục dòng sản phẩm.
- Orders: cửa hàng đặt hàng bán bởi khách hàng.
- OrderDetails: lưu trữ các chi tiết đơn hàng cho mỗi đơn hàng.
- Payments: lưu trữ các khoản thanh toán được thực hiện bởi khách hàng dựa trên tài khoản của họ.
- Employees: lưu trữ tất cả thông tin của nhân viên cũng như cấu trúc tổ chức như ai báo cáo cho ai.
- Offices: lưu trữ dữ liệu văn phòng bán hàng.

Dưới đây là hành ảnh mô tả về lược đồ cơ sở dữ liệu:

<img src="http://www.mysqltutorial.org/wp-content/uploads/2009/12/MySQL-Sample-Database-Schema.png">


Bạn cũng có thể tải về lược đồ cơ sở dữ liệu mẫu [tại đây](http://www.mysqltutorial.org/wp-content/uploads/2018/04/MySQL-Sample-Database-Diagram-PDF-A4.pdf)