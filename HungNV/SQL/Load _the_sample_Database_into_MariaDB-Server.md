# Tải về cơ sở dữ liệu mẫu

Để thao tác với cơ sở dữ liệu 1 cách thuận tiện và nhanh chóng, ta có thể sử dụng cơ sở dữ liệu mẫu của MYSQLTUTORIAL : 

###### 1. Tải về file Zip cảu cơ sở dữ liệu mẫu. 

Link cơ sở dữ liệu mẫu [ở đây](https://www.mysqltutorial.org/mysql-sample-database.aspx)

Sử dụng wget để tải về file zip: 

```
wget https://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip
```

Sau khi tải về file zip có dạng như sau : 

```
[root@SQL ~]# ls
anaconda-ks.cfg  mysqlsampledatabase.zip
```

Sử dụng unzip để giải nén file : 

```
[root@SQL ~]# unzip mysqlsampledatabase.zip
Archive:  mysqlsampledatabase.zip
  inflating: mysqlsampledatabase.sql
```

File sau khi giải nén sẽ có đuôi là .sql
```
[root@SQL ~]# ls
anaconda-ks.cfg  mysqlsampledatabase.sql  mysqlsampledatabase.zip
```

Đăng nhập vào mariadb trên server và tạo 1 Database : 

```
MariaDB [(none)]> create database DB1;
Query OK, 1 row affected (0.000 sec)
```
```
MariaDB [(none)]> use DB1;
Database changed
```

Tải cơ sở dữ liệu mẫu vào mariadb : 
```
MariaDB [DB1]> source /root/mysqlsampledatabase.sql
```
Sau khi tải cơ sở dữ liệu mẫu sẽ có tên là `classicmodels`. 
```
MariaDB [classicmodels]> show databases;
+--------------------+
| Database           |
+--------------------+
| DB1                |
| classicmodels      |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
5 rows in set (0.000 sec)
```
Như vậy là ta đã tải lên cơ sở dữ liệu mẫu thành công. Bây giờ ta đã có thể thao tác với cơ sở dữ liệu mà không cần phải thiết kế 1 cơ sở dữ liệu mới. 

