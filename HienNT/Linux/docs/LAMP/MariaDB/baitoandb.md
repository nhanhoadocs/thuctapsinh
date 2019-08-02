# THỰC HÀNH VỚI DATABASE  
### **Bài toán:**
1. Tạo 2 user để quản lý 1 database(1 user có thể truy cập từ xa vào database, 1 user dùng để đăng nhập trực tiếp trên server). Trong database vừa tạo, tạo 2 bảng: 1 bảng có tên là `mentor` gồm các trường: STT, Hoten, Namsinh; 1 bảng có tên `SVTT` gồm các trường: STT, Hoten, MSSV, Mentor.  

    <img src ="../../../images/25 bai linux/baitoan.png">  

2. Với bảng SVTT vừa tạo thực hiện các thao tác: chèn dữ liệu vào bảng, xóa dữ liệu, thêm cột, thêm hàng, xóa cột và hàng, xóa dữ liệu theo điều kiện, truy vấn dữ liệu từ nhiều bảng. Xem dữ liệu của bảng trước và sau khi thực hiện các thao tác trên.  
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
     STT int not null,
     Hoten varchar(255) not null,
     Namsinh int not null,
     ID int not null auto_increment,
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
  | STT     | int(11)      | NO   |     | NULL    |                |
  | Hoten   | varchar(255) | NO   |     | NULL    |                |
  | Namsinh | int(11)      | NO   |     | NULL    |                |
  | ID      | int(11)      | NO   | PRI | NULL    | auto_increment |
  +---------+--------------+------+-----+---------+----------------+
  ```

  Kiểm tra dữ liệu trong bảng:  
  ```sh
  select * from Mentor;
  ```  
  OUTPUT  

  ```sh
  Empty set (0.00 sec)
  ```  
  
  Chèn dữ liệu vào bảng `Mentor`  
  ```sh
   insert into Mentor
     values (1,'CanhDX',1992,1),
     (2,'ManhDV',1994,2),
     (3,'DuyDM',1994,3),
     (4,'MinhNV',1997,4),
     (5,'DatPT',1996,5),
     (6,'HuyTM',1992,6),
     (7,'ThanhNB',1996,7);
  ```  

  Sửa tên cột `ID` thành `MentorID`  
  ```sh
  alter table Mentor change ID MentorID int(20);
  ```

- Tạo bảng `SVTT`  
  ```sh
  create table SVTT(
     STT int(10) not null,
     Hoten varchar(255) not null,
     MSSV int not null auto_increment,
     MentorID int(10) not null,
     Primary key (MentorID)
     );
  ```  
  Kiểm tra các trường trong bảng `SVTT`  
  ```sh
   desc SVTT;
  ```  
  OUTPUT:  
  ```sh
  +----------+--------------+------+-----+---------+-------+
  | Field    | Type         | Null | Key | Default | Extra |
  +----------+--------------+------+-----+---------+-------+
  | STT      | int(10)      | NO   |     | NULL    |       |
  | Hoten    | varchar(255) | NO   |     | NULL    |       |
  | MSSV     | int(11)      | NO   | PRI | NULL    |       |
  | MentorID | int(10)      | NO   |     | NULL    |       |
  +----------+--------------+------+-----+---------+-------+
  4 rows in set (0.00 sec)
  ```  

  Kiểm tra dữ liệu trong bảng `SVTT`
  ```sh
  select * from SVTT;
  ```  

  OUTPUT  

  ```sh
  Empty set (0.00 sec)
  ``` 

  Chèn dữ liệu vào bảng `SVTT`   
  ```sh
   insert into SVTT
     values (1,'DucNA',1,4),
     (2,'HungHM',2,3),
     (3,'HungNV',3,2),
     (4,'NgocPT',4,5),
     (5,'OanhDT',5,3),
     (6,'CuongNQ',6,7),
     (7,'HuanTT',7,6),
     (8,'NiemDT',8,4),
     (9,'ThanhBC',9,2),
     (10,'ManhVQ',10,0),
     (11,'HungNT',11,5),
     (12,'HienNT',12,1);
  ```  
  OUTPUT  
  ```sh
  +-----+---------+------+----------+
  | STT | Hoten   | MSSV | MentorID |
  +-----+---------+------+----------+
  |   1 | DucNA   |    1 |        4 |
  |   2 | HungHM  |    2 |        3 |
  |   3 | HungNV  |    3 |        2 |
  |   4 | NgocPT  |    4 |        5 |
  |   5 | OanhDT  |    5 |        3 |
  |   6 | CuongNQ |    6 |        7 |
  |   7 | HuanTT  |    7 |        6 |
  |   8 | NiemDT  |    8 |        4 |
  |   9 | ThanhBC |    9 |        2 |
  |  10 | ManhVQ  |   10 |        0 |
  |  11 | HungNT  |   11 |        5 |
  |  12 | HienNT  |   12 |        1 |
  +-----+---------+------+----------+
  12 rows in set (0.00 sec)
  ```

- Xóa dữ liệu trong bảng `SVTT` và kiểm tra lại.
  ```sh
  delete from SVTT where MentorID=0;
  ```  
  Kết quả:
  ```sh
  +-----+---------+------+----------+
  | STT | Hoten   | MSSV | MentorID |
  +-----+---------+------+----------+
  |   1 | DucNA   |    1 |        4 |
  |   2 | HungHM  |    2 |        3 |
  |   3 | HungNV  |    3 |        2 |
  |   4 | NgocPT  |    4 |        5 |
  |   5 | OanhDT  |    5 |        3 |
  |   6 | CuongNQ |    6 |        7 |
  |   7 | HuanTT  |    7 |        6 |
  |   8 | NiemDT  |    8 |        4 |
  |   9 | ThanhBC |    9 |        2 |
  |  11 | HungNT  |   11 |        5 |
  |  12 | HienNT  |   12 |        1 |
  +-----+---------+------+----------+
  11 rows in set (0.00 sec)
  ```  

- Xóa cột STT trong bảng SVTT và kiểm tra lại:  
  ```sh
  alter table SVTT drop column STT;
  ```  
  Kết quả: 
  ```sh 
  +---------+------+----------+
  | Hoten   | MSSV | MentorID |
  +---------+------+----------+
  | DucNA   |    1 |        4 |
  | HungHM  |    2 |        3 |
  | HungNV  |    3 |        2 |
  | NgocPT  |    4 |        5 |
  | OanhDT  |    5 |        3 |
  | CuongNQ |    6 |        7 |
  | HuanTT  |    7 |        6 |
  | NiemDT  |    8 |        4 |
  | ThanhBC |    9 |        2 |
  | HungNT  |   11 |        5 |
  | HienNT  |   12 |        1 |
  +---------+------+----------+
  11 rows in set (0.00 sec)
  ```  

- Thêm lại cột STT và kiểm tra lại:  
  ```sh
  alter table SVTT add column STT int(11) not null;
  ```
  Kết quả:
  ```sh
  +---------+------+----------+-----+
  | Hoten   | MSSV | MentorID | STT |
  +---------+------+----------+-----+
  | DucNA   |    1 |        4 |   0 |
  | HungHM  |    2 |        3 |   0 |
  | HungNV  |    3 |        2 |   0 |
  | NgocPT  |    4 |        5 |   0 |
  | OanhDT  |    5 |        3 |   0 | 
  | CuongNQ |    6 |        7 |   0 |
  | HuanTT  |    7 |        6 |   0 |
  | NiemDT  |    8 |        4 |   0 |
  | ThanhBC |    9 |        2 |   0 |
  | HungNT  |   11 |        5 |   0 |
  | HienNT  |   12 |        1 |   0 |
  +---------+------+----------+-----+
  11 rows in set (0.00 sec)
  ```

- Cập nhật dữ liệu vào cột `STT`  
  ```sh
  update SVTT 
  set STT=1 where (MSSV = 1);
  ```  
  Làm tương tự đến STT 12

- Thêm cột `Gioitinh` vào bảng:  
  ```sh
  alter table SVTT add column Gioitinh varchar(50) not null;
  ```  
- Cập nhật dữ liệu vào cột `Gioitinh`  
  ```sh
  update SVTT
       set Gioitinh="Nam"
       where (Hoten = "DucNA") OR (Hoten="HungNV") OR (Hoten="CuongNQ") OR (Hoten="HuanTT") OR (Hoten="NiemDT") OR (Hoten="ThanhBC") OR (Hoten="HungNT"); 
  ```
  ```sh
  update SVTT
     set Gioitinh="Nu"
     where (Gioitinh != "Nam");
  ```  
- Xóa dữ liệu theo điều kiện:  
  ```sh
  delete from SVTT where STT = 1 OR Hoten="HungHM";
  ```
  OUTPUT  
  ```sh
  +---------+------+----------+-----+----------+
  | Hoten   | MSSV | MentorID | STT | Gioitinh |
  +---------+------+----------+-----+----------+
  | HungNV  |    3 |        2 |   3 | Nam      |
  | NgocPT  |    4 |        5 |   4 | Nu       |
  | OanhDT  |    5 |        3 |   5 | Nu       |
  | CuongNQ |    6 |        7 |   6 | Nam      |
  | HuanTT  |    7 |        6 |   7 | Nam      |
  | NiemDT  |    8 |        4 |   8 | Nam      |
  | ThanhBC |    9 |        2 |   9 | Nam      |
  | HungNT  |   11 |        5 |  11 | Nam      |
  | HienNT  |   12 |        1 |  12 | Nu       |
  +---------+------+----------+-----+----------+
  9 rows in set (0.00 sec)
  ```  



> Mối quan hệ giữa 2 bảng:  

### Giả sử ta có 2 bảng: 
- Bảng `SVTT` có `MSSV` là khóa chính

<img src ="../../../images/25 bai linux/SVTT.png">  

- Bảng `Mentor` có khóa chính là `MentorID`

<img src ="../../../images/25 bai linux/mentor.png">  

Trong cơ sở dữ liệu `NhanHoa`, bảng `Mentor` lưu trữ dữ liệu của các Mentor với cột khóa chính là `MentorID`; nó cũng lưu trữ dữ liệu các bạn thực tập trong bảng `SVTT`. Để liên kết 2 bảng này và xác định thông tin mentor với các bạn thực tập, một cột `MentorID` tương ứng phải được chèn vào bảng `SVTT` để tham chiếu ID của các mentor. Cột `MentorID` trong bảng `Mentor` lúc này sẽ đóng vai trò là khóa ngoại dùng để tham chiếu đến một cột cùng tên trong bảng `SVTT`.