## 1.Tìm hiểu về MySQL:  
MySQL là hệ quản trị cơ sở dữ liệu quan hệ (RDBMS) mã nguồn mở phổ biến nhất ,thường được dùng cho các doanh nghiệp vừa và nhỏ .Được phát triển , hỗ trợ bởi MySQL AB , một công ti của Thụy Điển. 
Đặc tính :  
- Là hệ quản trị CSDL quan hệ (RDBMS- Relational Database Management System )  
- Hoạt động theo mô hình clietn/server , làm database server cho các client kết nối đến .  
- Hỗ trợ SQL tiêu chuẩn.  
- Chạy trên nhiều platform : Mac OS , Windows , Linux ,...  

MySQL có rất nhiều ưu điểm :
- Tốc độ: MySQL rất nhanh. Những nhà phát triển cho rằng MySQL là cơ sở dữ liệu nhanh nhất mà bạn có thể có.  
- Dễ sử dụng: MySQL tuy có tính năng cao nhưng thực sự là một hệ thống cơ sở dữ liệu rất đơn giản và ít phức tạp khi cài đặt và quản trị hơn các hệ thống lớn .  
-  Giá thành: MySQL là miễn phí cho hầu hết các việc sử dụng trong một tổ chức.  
-  Hỗ trợ ngôn ngữ truy vấn: MySQL hiểu SQL, là ngôn ngữ của sự chọn lựa cho tất cả các hệ thống cơ sở dữ liệu hiện đại. Bạn cũng có thể truy cập MySQL bằng cách sử dụng các ứng dụng mà hỗ trợ ODBC (Open Database Connectivity -một giao thức giao tiếp cơ sở dữ liệu được phát triển bởi Microsoft).  
- Năng lực: Nhiều client có thể truy cập đến server trong cùng một thời gian. Các client có thể sử dụng nhiều cơ sở dữ liệu một cách đồng thời. Bạn có thể truy cập MySQL tương tác với sử dụng một vài giao diện để bạn có thể đưa vào các truy vấn và xem các kết quả: các dòng yêu cầu của khách hàng, các trình duyệt Web…   
- Kết nối và bảo mật: MySQL được nối mạng một cách đầy đủ, các cơ sở dữ liệu có thể được truy cập từ bất kỳ nơi nào trên Internet do đó bạn có thể chia sẽ dữ liệu của bạn với bất kỳ ai, bất kỳ nơi nào. Nhưng MySQL kiểm soát quyền truy cập cho nên người mà không nên nhìn thấy dữ liệu của bạn thì không thể nhìn được.  

-  Sự hỗ trợ: Bạn có thể tìm thấy các tài nguyên có sẵn mà MySQL hỗ trợ. Cộng đồng MySQL rất có trách nhiệm. Khi lỗi được phát hiện, các nhà phát triển sẽ đưa ra cách khắc phục trong vài ngày, thậm chí có khi trong vài giờ và cách khắc phục đó sẽ ngay lập tức có sẵn trên Internet.  

## 2. MariaDB :  
 - MariaDB là cơ sở dữ liệu mã nguồn mở đang được thịnh hành . Hỗ trợ hầu hết các hệ điều hành thông dụng như Linux , Window ,MacOS.
 - MariaDB được tao ra trong năm 2009 bởi các tác giả sáng lập ra MySQL. Sau khi Oracle mua lại MySQL thông qua việc mua Sun Microsystems thì MySQL bị thương mại hóa và giới hạn tính năng của các phiên bản miễn phí . Sau đó MariaDB ra đời với sự kế thừa từ MySQL và bổ sung thêm nhiều tính năng mới qua các phiên bản .  
  
  - Ưu điểm :  
    - Là mã nguồn mở (miễn phí thật sự ):  
  MariaDB và Mysql đều có 2 phiên bản thương mại và cộng đồng . Hiện tại MySQL được bảo trì và phát triển bằng đội ngũ của Oracle và không chịu nhiều tác động bởi cộng đồng , kể từ phiên bản 5.7 , các lịch sử commit cho thấy mySQL được phát triển bởi các thành viên đến từ oracle , và các vấn đề ( lỗi , cải thiện hiệu suất, ...) đều không đem ra thảo luận giữa cộng đồng một cách rõ ràng , một số module là mã nguồn đóng .  
  Trái ngược MySQL , MariaDB hoàn toàn là mã nguồn mở được vận hành bởi cộng đồng thực sự (MariaDB Foundation) , đứng đằng sau là công ty Monty Program , mặc dù cũng có bản thương mại nhưng không ảnh hưởng đến phiên bản mã nguồn mở .      
     - Được bảo trì bởi người tạo ra MySQL:  
  Sau khi bị Oracle mua lại , một số thành viên chủ lực của MySQL đã ra đi , trong đó bao gồm những người tạo ra MySQL.  

    - Hoàn toàn tương thích với MySQL :  
  MariaDB có hệ thống hoàn toàn tương thích với MySQL từ phiên bản 5.1 -> 5.5.  
    - Nhiều Engine lưu trữ hơn :  
  Khi sử dụng MariaDB , chúng ta có thêm nhiều sự lựa chọn cho store engine nhờ đó dễ dàng phát triển sản phẩm lớn .   


## 3.Các lệnh MySQL cơ bản :  
- Các câu lênh với  DATABASE:
```
    show databases;  -  Hiển thị tất cả database trong mysql server  
    create database {database name} ; - tạo mới một database  
    use {database name} ; - chọn một database để làm việc  
    drop database {database name}  - xóa một database  
```

- Các câu lệnh với table :  
Lưu ý các câu lênh đưới đây chỉ thực thi sau khi chọn một database để làm việc bằng lệnh use :  
```
show tables;  - Hiển thị tất cả các table trong database hiện thời  

show table from {database name} ; nếu như bạn đang ở database này mà muốn xem các table ở một database khác thì dùng lệnh này. hoặc nếu bạn chưa dùng lệnh use để chọn database thì cũng có thể dùng lệnh này để bỏ qua bước use  

create table {table name} ( {column1} int (2), {column2} varchar(50) ) ; để tạo một table với 2 cột. Trong đó có một cột kiểu int 2 chữ số, và một cột kiểu varchar 50 ký tự.  

insert into {table name} ({column1}, {column2}) values ({value1} , {value2} );  thêm một hàng dữ liệu vào trong bảng
select * from {table name}; lấy dữ liệu từ table  

update {table name} set [cột muốn sửa]=[giá trị mới] where  [điều kiện];  sửa dữ liệu trong table  

select count(*) from {table name}; đếm số dòng dữ liệu trong table  

delete from {table name} where [điều kiện]; xóa một hoặc một số dòng dữ liệu.  

desc {table name}; xem cấu trúc một table  

drop {table name}; xóa một table  

alter {table name/database name}  
add/drop/alter column_name datatype
```

## 4. Cài đặt Mariadb:  
- Lệnh cài đặt :  

```
yum install mariadb-server
```
- Khởi chạy mariadb :  
```
systemctl start mariadb
```
- Kiểm tra mariadb đã chạy :  
```
systemctl status mariadb
```
- Để mariadb chạy khi system khởi động dùng lệnh sau :  
```
systemctl enable mariadb
```
- Sau khi cài xong cần có những cài đặt bảo mật :
```
mysql_secure_installation
```

<img src="https://i.imgur.com/gCSGNaz.png">    

- Ban đầu khi mới cài đặt ta chưa có password root của database nên ta nhấn enter .  

<img src="https://i.imgur.com/qv6M3SR.png">  
- Sau đó ta có thế set password cho database .Sau khi set password là một vài default setting cho bảo mật , sau khi thiết lập hết ta nhập y để xác nhận refresh quyền .  

```
Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n]
``` 


## 5.Cài đặt Remote access MariaDB:
- Tại sql server :
```
firewall-cmd --permanent --add-service=mysql && firewall-cmd --reload
```
- Sau đó ta truy cập vào mariadb và cấp quyền cho user :  

```
GRANT ALL PRIVILEGES ON *.* TO 'username'@'IP_Client' IDENTIFIED BY 'my-new-password' WITH GRANT OPTION;
  ```  

  - Tại máy client muốn remote vào mariadb :  
  ```
  mysql -u user -h database_server_ip -p
  ```  

  ## 6. Quyền user trong MySQL :  
  - Trước tiên ta tạo một user mới :
```
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

- Gán quyền cho user :
```
GRANT ALL PRIVILEGES ON database.table TO 'user'@'IP_Client';
```


Ta có thể gán kí tự (*)  nếu ta muốn user truy cập được tất cả databases/tables:  

```	
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost';
```
hoặc   
```
	
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
```  

- Các quyền của MySQL : 

  - ALL PRIVILEGES – grants all privileges to the MySQL user
  -  CREATE – allows the user to create databases and tables
  -  DROP - allows the user to drop databases and tables
  - DELETE - allows the user to delete rows from specific MySQL table
  - INSERT - allows the user to insert rows into specific MySQL table
  - SELECT – allows the user to read the database
  - UPDATE - allows the user to update table rows   


 Để các thay đổi trong quyền được áp dụng ta phải dùng lệnh sau :

```
FLUSH PRIVILEGES;
```

Kiểm tra quyền đã được cấp chưa bằng lệnh : 
``` 
SHOW GRANTS FOR 'user'@'localhost'
 ```  


Thay đổi tên và ip gắn với user
 ```  
RENAME USER u1@localhost TO u1@4.4.4.5;
```
- Thu hồi quyền đã cấp cho user 
```
REVOKE [permission type] ON [database name].[table name] FROM ‘user’@‘localhost’;
```
Ví dụ, để thu hồi toàn bộ các quyền cho một user :
```
REVOKE ALL PRIVILEGES ON *.* FROM 'user'@'localhost';
```

- Xóa user:
```
DROP USER ‘non-root’@‘localhost’;
```

