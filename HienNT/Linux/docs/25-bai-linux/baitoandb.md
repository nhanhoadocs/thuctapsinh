# THỰC HÀNH VỚI DATABASE  
### **Bài toán:**
1. Tạo 2 user để quản lý 1 database(1 user có thể truy cập từ xa vào database, 1 user dùng để đăng nhập trực tiếp trên server). Trong database vừa tạo, tạo 2 bảng: 1 bảng có tên là `mentor` gồm các trường: STT, Hoten, Namsinh; 1 bảng có tên `SVTT` gồm các trường: STT, Hoten, MSSV, Mentor.  

    <img src ="../../images/25 bai linux/baitoan.png">  

2. Với bảng SVTT vừa tạo thực hiện các thao tác: chèn dữ liệu vào bảng, xóa dữ liệu, thêm cột, thêm hàng, xóa cột và hàng. Xem dữ liệu của bảng trước và sau khi thực hiện các thao tác trên.  
### **Bài làm:**  
- Đăng nhập vào user root của MariaDB tạo thêm 2 user: 1 user có phần hostname là `%` để cho phép truy cập vào cơ sở dữ liệu từ xa; 1 user có hostname là `localhost` để thực hiện các câu lệnh trên giao diện dòng lệnh.  
   ```sh
   [root@thuyhien ~]# mysql -u root -p
   Enter password:
   Welcome to the MariaDB monitor.  Commands end with ; or \g.
   Your MariaDB connection id is 32
   Server version: 10.0.30-MariaDB MariaDB Server

   Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

   MariaDB [(none)]> create user 'user1'@'%' identified by '123456';
   Query OK, 0 rows affected (0.06 sec)

   MariaDB [(none)]> create user 'user2'@'localhost' identified by '123456';
   Query OK, 0 rows affected (0.00 sec)

   MariaDB [(none)]>
   ```  
> Tại sao phải tạo 2 user để quản lý database mà không trực tiếp sử dụng tài khoản root?  
  - Tài khoản root là tài khoản mặc định có sẵn, hostname của root là `@localhost` nên chỉ có thể sử dụng trực tiếp trên server, không sử dụng để truy cập từ xa nên muốn quản lý database từ xa phải tạo thêm 1 user khác có thể truy cập từ xa và quản lý database đó. Ngoài ra vì là tài khoản có quyền cao nhất quản lý rất nhiều database nhưng không phải lúc nào cũng nên đăng nhập vào root để quản lý database do đó ta nên chia database cho user khác quản lý như vậy sẽ hạn chế được việc dùng root và các database cũng sẽ dễ dàng được quản lý hơn.  

- Tạo database với tên `NhanHoa`  
  ```sh
  MariaDB [(none)]> create database NhanHoa;
  Query OK, 1 row affected (0.00 sec)
  ```  
- Kiểm tra các database hiện có:  
  ```sh
  MariaDB [(none)]> show databases;
  +--------------------+
  | Database           |
  +--------------------+
  | NhanHoa            |
  | information_schema |
  | mentor             |
  | mysql              |
  | performance_schema |
  | thuctap            |
  | u1                 |
  | u2                 |
  | u3                 |
  +--------------------+
  9 rows in set (0.00 sec)

  MariaDB [(none)]>
  ```  
- Cấp quyền cho các user vừa tạo:  
   ```sh
   MariaDB [(none)]> grant all privileges on NhanHoa.* to 'user1'@'%';
   Query OK, 0 rows affected (0.00 sec)

   MariaDB [(none)]> grant all privileges on NhanHoa.* to 'user2'@'localhost';
   Query OK, 0 rows affected (0.00 sec)
   ```  
- Đăng nhập vào user2, nếu xuất hiện lỗi xem cách sửa [tại đây](remote.md)  
   ```sh
   [root@thuyhien ~]# mysql -u user2 -p
   Enter password:
   Welcome to the MariaDB monitor.  Commands end with ; or \g.
   Your MariaDB connection id is 3
   Server version: 10.0.30-MariaDB MariaDB Server

   Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

   Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

   MariaDB [(none)]>
   ```  
- Vào database `NhanHoa` để tạo bảng  
  ```sh
  MariaDB [(none)]> use NhanHoa;
  Database changed
  ```
  - Tạo bảng `Mentor`
  ```sh
  MariaDB [NhanHoa]> create table Mentor(
    -> ID int not null auto_increment,
    -> STT int not null,
    -> Hoten varchar(255) not null,
    -> Namsinh int not null,
    -> Primary key (ID)
    -> );
  Query OK, 0 rows affected (0.17 sec)
  ```  
     Kiểm tra các trường trong bảng:  
  ```sh
  MariaDB [NhanHoa]> describe Mentor;
  +---------+--------------+------+-----+---------+----------------+
  | Field   | Type         | Null | Key | Default | Extra          |
  +---------+--------------+------+-----+---------+----------------+
  | ID      | int(11)      | NO   | PRI | NULL    | auto_increment |
  | STT     | int(11)      | NO   |     | NULL    |                |
  | Hoten   | varchar(255) | NO   |     | NULL    |                |
  | Namsinh | int(11)      | NO   |     | NULL    |                |
  +---------+--------------+------+-----+---------+----------------+
  4 rows in set (0.00 sec)
  ```  
  Kiểm tra dữ liệu trong bảng:  
  ```sh
  MariaDB [NhanHoa]> select * from Mentor;
  Empty set (0.00 sec)
  ```  
  Chèn dữ liệu vào bảng `Mentor`  
  ```sh
  MariaDB [NhanHoa]> insert into Mentor
    -> values (1,1,'CanhDX',1992),
    -> (2,2,'ManhDV',1994),
    -> (3,3,'DuyDM',1992),
    -> (4,4,'MinhNV',1997),
    -> (5,5,'DatPT',1996),
    -> (6,6,'HuyTM',1992),
    -> (7,7,'ThanhNB',1996);
  Query OK, 7 rows affected (0.01 sec)
  Records: 7  Duplicates: 0  Warnings: 0
  ```  
- Tạo bảng `SVTT`  
  ```sh
  MariaDB [NhanHoa]> insert into SVTT
    -> \c
  MariaDB [NhanHoa]> create table SVTT(
    -> STT int not null,
    -> Hoten varchar(255) not null,
    -> MSSV int not null auto_increment,
    -> Mentor varchar(255) not null,
    -> Primary key (MSSV)
    -> );
  Query OK, 0 rows affected (0.05 sec)
  ```  
  Kiểm tra các trường trong bảng `SVTT`  
  ```sh
  MariaDB [NhanHoa]> desc SVTT;
  +--------+--------------+------+-----+---------+----------------+
  | Field  | Type         | Null | Key | Default | Extra          |
  +--------+--------------+------+-----+---------+----------------+
  | STT    | int(11)      | NO   |     | NULL    |                |
  | Hoten  | varchar(255) | NO   |     | NULL    |                |
  | MSSV   | int(11)      | NO   | PRI | NULL    | auto_increment |
  | Mentor | varchar(255) | NO   |     | NULL    |                |
  +--------+--------------+------+-----+---------+----------------+
  4 rows in set (0.00 sec)
  ```
  Kiểm tra dữ liệu trong bảng `SVTT`
  ```sh
  MariaDB [NhanHoa]> select * from SVTT;
  Empty set (0.00 sec)
  ```
  Chèn dữ liệu vào bảng `SVTT`   
  ```sh
  MariaDB [NhanHoa]> insert into SVTT
    -> values (1,'DucNA',1,'MinhNV'),
    -> (2,'HungHM',2,'DuyDM'),
    -> (3,'HungNV',3,'ManhDV'),
    -> (4,'NgocPT',4,'DatPT'),
    -> (5,'OanhDT',5,'HuyDM'),
    -> (6,'CuongNQ',6,'ThanhNB'),
    -> (7,'HuanTT',7,'HuyTM'),
    -> (8,'NiemDT',8,'MinhNV'),
    -> (9,'ThanhBC',9,'ManhDV'),
    -> (10,'ManhVQ',10,'CongTT'),
    -> (11,'HungNT',11,'DatPT'),
    -> (12,'HienNT',12,'CanhDX');
  Query OK, 12 rows affected (0.01 sec)
  Records: 12  Duplicates: 0  Warnings: 0
  ```  
- Xóa dữ liệu trong bảng `SVTT` và kiểm tra lại.
  ```sh
  MariaDB [NhanHoa]> delete from SVTT where Mentor="DuyDM";
  Query OK, 1 row affected (0.05 sec)

  MariaDB [NhanHoa]> select * from SVTT;
  +-----+---------+------+---------+
  | STT | Hoten   | MSSV | Mentor  |
  +-----+---------+------+---------+
  |   1 | DucNA   |    1 | MinhNV  |
  |   3 | HungNV  |    3 | ManhDV  |
  |   4 | NgocPT  |    4 | DatPT   |
  |   5 | OanhDT  |    5 | HuyDM   |
  |   6 | CuongNQ |    6 | ThanhNB |
  |   7 | HuanTT  |    7 | HuyTM   |
  |   8 | NiemDT  |    8 | MinhNV  |
  |   9 | ThanhBC |    9 | ManhDV  |
  |  10 | ManhVQ  |   10 | CongTT  |
  |  11 | HungNT  |   11 | DatPT   |
  |  12 | HienNT  |   12 | CanhDX  |
  +-----+---------+------+---------+
  11 rows in set (0.00 sec)
  ```  
- Xóa cột STT trong bảng SVTT và kiểm tra lại:  
  ```sh
  MariaDB [NhanHoa]> alter table SVTT drop column STT;
  Query OK, 0 rows affected (0.15 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  MariaDB [NhanHoa]> select * from SVTT;
  +---------+------+---------+
  | Hoten   | MSSV | Mentor  |
  +---------+------+---------+
  | DucNA   |    1 | MinhNV  |
  | HungNV  |    3 | ManhDV  |
  | NgocPT  |    4 | DatPT   |
  | OanhDT  |    5 | HuyDM   |
  | CuongNQ |    6 | ThanhNB |
  | HuanTT  |    7 | HuyTM   |
  | NiemDT  |    8 | MinhNV  |
  | ThanhBC |    9 | ManhDV  |
  | ManhVQ  |   10 | CongTT  |
  | HungNT  |   11 | DatPT   |
  | HienNT  |   12 | CanhDX  |
  +---------+------+---------+
  11 rows in set (0.00 sec)
  ```  
- Thêm lại cột STT và kiểm tra lại:  
  ```sh
  MariaDB [NhanHoa]> alter table SVTT add column STT int(11) not null;
  Query OK, 0 rows affected (0.07 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  MariaDB [NhanHoa]> select * from SVTT;
  +---------+------+---------+-----+
  | Hoten   | MSSV | Mentor  | STT |
  +---------+------+---------+-----+
  | DucNA   |    1 | MinhNV  |   0 |
  | HungNV  |    3 | ManhDV  |   0 |
  | NgocPT  |    4 | DatPT   |   0 |
  | OanhDT  |    5 | HuyDM   |   0 |
  | CuongNQ |    6 | ThanhNB |   0 |
  | HuanTT  |    7 | HuyTM   |   0 |
  | NiemDT  |    8 | MinhNV  |   0 |
  | ThanhBC |    9 | ManhDV  |   0 |
  | ManhVQ  |   10 | CongTT  |   0 |
  | HungNT  |   11 | DatPT   |   0 |
  | HienNT  |   12 | CanhDX  |   0 |
  +---------+------+---------+-----+
  11 rows in set (0.00 sec)
  ```  
> Mối quan hệ giữa 2 bảng:  

### Giả sử ta có 2 bảng: 
- Bảng `SVTT` có `MSSV` là khóa chính

<img src ="../../images/25 bai Linux/SVTT.png">  

- Bảng `Mentor` có khóa chính là `MentorID`

<img src ="../../images/25 bai Linux/mentor.png">  

Trong cơ sở dữ liệu `NhanHoa`, bảng `Mentor` lưu trữ dữ liệu của các Mentor với cột khóa chính là `MentorID`; nó cũng lưu trữ dữ liệu các bạn thực tập trong bảng `SVTT`. Để liên kết 2 bảng này và xác định thông tin mentor với các bạn thực tập, một cột `MentorID` tương ứng phải được chèn vào bảng `SVTT` để tham chiếu ID của các mentor. Cột `MentorID` trong bảng `Mentor` lúc này sẽ đóng vai trò là khóa ngoại dùng để tham chiếu đến một cột cùng tên trong bảng `SVTT`.