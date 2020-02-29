# S1 - Getting Started With MySQL

Phần này giúp bạn bắt đầu với MySQL. Ta sẽ cài đặt MySQL Database Server, tải xuống cơ sở dữ liệu mẫu và tải tài liệu vào MySQL Server để thực hành.

Sử dụng MySQL Workbench để thực hành truy vấn dữ liệu.

## Cài đặt MySQL Databases Server
Ta cài đặt MariaDB hoặc MySQL.
Có thể tham khảo tài liệu dưới đây:
1. [MariaDB Server](https://github.com/danghai1996/Linux/blob/master/DatabaseServer/MariaDB.md)
2. [MySQL Server](https://github.com/danghai1996/Linux/blob/master/DatabaseServer/MySQL.md)


## Tải MySQL sample database
Ta sẽ tải Database sample từ [link](http://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip).

File tải về sẽ là file nén ZIP nên ta sẽ phải giải nén sau đó import vào server.

Tải về database sample
```
[root@localhost ~]# wget http://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip
```

Giải nén và import:
```
[root@localhost ~]# unzip mysqlsampledatabase.zip
Archive:  mysqlsampledatabase.zip
  inflating: mysqlsampledatabase.sql
[root@localhost ~]# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.11-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> source /root/mysqlsampledatabase.sql
```

Kiểm tra database:
```
MariaDB [classicmodels]> show tables;
+-------------------------+
| Tables_in_classicmodels |
+-------------------------+
| customers               |
| employees               |
| offices                 |
| orderdetails            |
| orders                  |
| payments                |
| productlines            |
| products                |
+-------------------------+
8 rows in set (0.000 sec)
```

## Lược đồ cơ bản về Database Sample
Tên Database: `classicmodels`

Mô hình:

<img src = "https://i.imgur.com/mNOro37.png">

- `customers`: lưu trữ dữ liệu của khách hàng.
- `products`: lưu trữ một danh sách các mô hình quy mô xe.
- `productLines`: lưu trữ danh sách các danh mục dòng sản phẩm.
- `orders`: cửa hàng đặt hàng bán bởi khách hàng.
- `orderdetails`: lưu trữ các chi tiết đơn hàng cho mỗi đơn hàng.
- `payments`: lưu trữ các khoản thanh toán được thực hiện bởi khách hàng dựa trên tài khoản của họ.
- `employees`: lưu trữ tất cả thông tin của nhân viên cũng như cấu trúc tổ chức như ai báo cáo cho ai.
- `offices`: lưu trữ dữ liệu văn phòng bán hàng.

Bạn có thể tải về sơ đồ ER của database tại [đây](
http://www.mysqltutorial.org/wp-content/uploads/2018/04/MySQL-Sample-Database-Diagram-PDF-A4.pdf).