# THỰC HÀNH VỚI DATABASE  
### **Bài toán:**
1. Tạo 2 user để quản lý 1 database(1 user có thể truy cập từ xa vào database, 1 user dùng để đăng nhập trực tiếp trên server). Trong database vừa tạo, tạo 2 bảng: 1 bảng có tên là `mentor` gồm các trường: STT, Hoten, Namsinh; 1 bảng có tên `SVTT` gồm các trường: STT, Hoten, MSSV, Mentor.  

    <img src ="../../images/25 bai linux/baitoan.png">  

2. Với bảng SVTT vừa tạo thực hiện các thao tác: chèn dữ liệu vào bảng, xóa dữ liệu, thêm cột, thêm hàng, xóa cột và hàng. Xem dữ liệu của bảng trước và sau khi thực hiện các thao tác trên.  
### **Bài làm:**  
- Đăng nhập vào user root của MariaDB tạo thêm 2 user: 1 user có phần hostname là `%` để cho phép truy cập vào cơ sở dữ liệu từ xa; 1 user có hostname là `localhost` để thực hiện các câu lệnh trên giao diện dòng lệnh.  
   ```sh
   mysql -u root -p
   ```
   ```sh
   create user 'user1'@'%' identified by '123456';
   ```
   ```sh
   create user 'user2'@'localhost' identified by '123456';
   ``` 
> Tại sao phải tạo 2 user để quản lý database mà không trực tiếp sử dụng tài khoản root?  
  - Tài khoản root là tài khoản mặc định có sẵn, hostname của root là `@localhost` nên chỉ có thể sử dụng trực tiếp trên server, không sử dụng để truy cập từ xa nên muốn quản lý database từ xa phải tạo thêm 1 user khác có thể truy cập từ xa và quản lý database đó. Ngoài ra vì là tài khoản có quyền cao nhất quản lý rất nhiều database nhưng không phải lúc nào cũng nên đăng nhập vào root để quản lý database do đó ta nên chia database cho user khác quản lý như vậy sẽ hạn chế được việc dùng root và các database cũng sẽ dễ dàng được quản lý hơn.  

- Tạo database với tên `NhanHoa`  
  ```sh
  create database NhanHoa;
  ```  
- Kiểm tra các database hiện có:  
  ```sh
  show databases;
  ```  
- Cấp quyền cho các user vừa tạo:  
   ```sh
   grant all privileges on NhanHoa.* to 'user1'@'%';
   ```  
   ```sh
   grant all privileges on NhanHoa.* to 'user2'@'localhost';
   ```  
- Đăng nhập vào user2, nếu xuất hiện lỗi xem cách sửa [tại đây](remote.md)  
   ```sh
   [root@thuyhien ~]# mysql -u user2 -p
   ```  
- Vào database `NhanHoa` để tạo bảng  
  ```sh
  use NhanHoa;
  ```
  - Tạo bảng `Mentor`
  ```sh
  create table Mentor(
     ID int not null auto_increment,
     STT int not null,
     Hoten varchar(255) not null,
     Namsinh int not null,
     Primary key (ID)
     );
  ```  
     Kiểm tra các trường trong bảng:  
  ```sh
  describe Mentor;
  ```
  OUTPUT
  ```sh
  +---------+--------------+------+-----+---------+----------------+
  | Field   | Type         | Null | Key | Default | Extra          |
  +---------+--------------+------+-----+---------+----------------+
  | ID      | int(11)      | NO   | PRI | NULL    | auto_increment |
  | STT     | int(11)      | NO   |     | NULL    |                |
  | Hoten   | varchar(255) | NO   |     | NULL    |                |
  | Namsinh | int(11)      | NO   |     | NULL    |                |
  +---------+--------------+------+-----+---------+----------------+
  ```  
  Kiểm tra dữ liệu trong bảng:  
  ```sh
  select * from Mentor;
  ```  
  Chèn dữ liệu vào bảng `Mentor`  
  ```sh
   insert into Mentor
     values (1,1,'CanhDX',1992),
     (2,2,'ManhDV',1994),
     (3,3,'DuyDM',1992),
     (4,4,'MinhNV',1997),
     (5,5,'DatPT',1996),
     (6,6,'HuyTM',1992),
     (7,7,'ThanhNB',1996);
  ```  
  Sửa tên cột `ID` thành `MentorID`  
  ```sh
  alter table Mentor change ID MentorID;
  ```
- Tạo bảng `SVTT`  
  ```sh
  create table SVTT(
     STT int not null,
     Hoten varchar(255) not null,
     MSSV int not null auto_increment,
     Mentor varchar(255) not null,
     Primary key (MSSV)
     );
  ```  
  Kiểm tra các trường trong bảng `SVTT`  
  ```sh
   desc SVTT;
  ```  
  OUTPUT:  
  ```sh
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
  select * from SVTT;
  ```
  Chèn dữ liệu vào bảng `SVTT`   
  ```sh
   insert into SVTT
     values (1,'DucNA',1,'MinhNV'),
     (2,'HungHM',2,'DuyDM'),
     (3,'HungNV',3,'ManhDV'),
     (4,'NgocPT',4,'DatPT'),
     (5,'OanhDT',5,'HuyDM'),
     (6,'CuongNQ',6,'ThanhNB'),
     (7,'HuanTT',7,'HuyTM'),
     (8,'NiemDT',8,'MinhNV'),
     (9,'ThanhBC',9,'ManhDV'),
     (10,'ManhVQ',10,'CongTT'),
     (11,'HungNT',11,'DatPT'),
     (12,'HienNT',12,'CanhDX');
  ```  
- Xóa dữ liệu trong bảng `SVTT` và kiểm tra lại.
  ```sh
  delete from SVTT where Mentor="DuyDM";
  ```  
  Kết quả:
  ```sh
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
  alter table SVTT drop column STT;
  ```  
  Kết quả: 
  ```sh 
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
  alter table SVTT add column STT int(11) not null;
  ```
  Kết quả:
  ```sh
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
- Thêm cột `MentorID` vào bảng SVTT  
  ```sh
  alter table SVTT add column MentorID int(11) not null;
  ```  
- Cập nhật dữ liệu vào cột `MentorID`  
  ```sh
  update SVTT
  set Gioitinh="Nam"
  where (Hoten = "DucNA") OR (Hoten="HungNV") OR (Hoten="CuongNQ") OR (Hoten="HuanTT") OR (Hoten="NiemDT") OR (Hoten="ThanhBC") OR (Hoten="ManhVQ") OR (Hoten="HungNT");
  ```  
  Làm tương tự với giới tính nữ.
> Mối quan hệ giữa 2 bảng:  

### Giả sử ta có 2 bảng: 
- Bảng `SVTT` có `MSSV` là khóa chính

<img src ="../../images/25 bai linux/SVTT.png">  

- Bảng `Mentor` có khóa chính là `MentorID`

<img src ="../../images/25 bai linux/mentor.png">  

Trong cơ sở dữ liệu `NhanHoa`, bảng `Mentor` lưu trữ dữ liệu của các Mentor với cột khóa chính là `MentorID`; nó cũng lưu trữ dữ liệu các bạn thực tập trong bảng `SVTT`. Để liên kết 2 bảng này và xác định thông tin mentor với các bạn thực tập, một cột `MentorID` tương ứng phải được chèn vào bảng `SVTT` để tham chiếu ID của các mentor. Cột `MentorID` trong bảng `Mentor` lúc này sẽ đóng vai trò là khóa ngoại dùng để tham chiếu đến một cột cùng tên trong bảng `SVTT`.