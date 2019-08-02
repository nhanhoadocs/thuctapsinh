# Database và User Database 
## **Contents** 

1. [Tạo cấu trúc dữ liệu](#1.1)  

    a. [Tạo cơ sở dữ liệu](#1.1.1)  
    b. [Các thao tác với bảng trong database](#1.1.2)  
    c. [Các thao tác với cột trong database](#1.1.3)

2. [Tạo database user](#1.2)  

3. [Phân quyền cho user database](#1.3)  


## Mô hình 

<img src ="../../../images/25 bai linux/mariadb.png">  


## Chuẩn bị  
- 1 máy ảo cài hệ điều hành CentOS 7, có kết nối Internet.
- Các thông số phần cứng trên máy ảo:  
    - CPU: Intel(R) Pentium(R) CPU  N3540  @ 2.16GHz
   - RAM: 1GB
   - Ổ đĩa: 20GB  
- Tài khoản có thể đăng nhập vào hệ thống và có quyền sudo. Hướng dẫn dưới đây sử dụng tài khoản root.  

## Nội dung 
- Đăng nhập vào MariaDB Server:  
   ```sh
   mysql -u root -p
   ```
  hoặc  
   ```sh
   mysql -u root -p[password]  
   ``` 
> *Chú ý:* Nếu trong mật khẩu có chứa kí tự đặc biệt thì khi nhập pass cần để 1 dấu cách trước kí tự đấy.

<a name ="1.1"></a>  

### 1. Tạo cấu trúc(database,table)  
<a name ="1.1.1"></a>

- Cú pháp tạo database:  
   ```sh
   create database [database user]
   ``` 
    ***Ví dụ:*** Tạo 1 database có tên là `testdb`  
    **Câu lệnh:**  
   ```sh
   create database testdb;
   ``` 
   **Kết quả là:**  
   ```sh
    Query OK, 1 row affected (0.01 sec)
   ```
- Xem danh sách database hiện có:  
    
   ```sh
   show databases;
   ```

   **Kết quả là:**  
   ```sh
   +--------------------+
   | Database           |
   +--------------------+
   | information_schema |
   | mysql              |
   | performance_schema |
   +--------------------+
   3 rows in set (0.09 sec)
   ``` 
- Xem lại database đã tạo:  
   ```sh
   show create database testdb;
   ```
  **Kết quả là:**  
   ```sh
   +----------+-------------------------------------------------------------------+
   | Database | Create Database                                                   |
   +----------+-------------------------------------------------------------------+
   | testdb   | CREATE DATABASE `testdb` /*!40100 DEFAULT CHARACTER SET latin1 */ |
   +----------+-------------------------------------------------------------------+
   1 row in set (0.01 sec)
   ``` 
- Truy cập cơ sở dữ liệu mới được tạo để bắt đầu tạo bảng và các đối tượng cơ sở dữ liệu khác, sử dụng lệnh `use databasename`  
   ```sh
   use testdb;
   ``` 
<a name ="1.1.2"></a>

   - Tạo bảng:  

     ```sh  
     create  table [table name](trường trong bảng);
     ```  
      ***Ví dụ:*** tạo bảng có tên là `sinhvien` với các trường mssv,ho,ten,tuoi,diemthi trong database `testdb`: 
     ```sh
     use testdb;
     ```
     OUTPUT
     ```SH
     MariaDB [testdb]> create table sinhvien(
     -> mssv int not null auto_increment,
     -> ho varchar(255) not null,
     -> ten varchar(255) not null,
     -> tuoi int not null,
     -> diemthi float(4,2) not null,
     -> primary key (mssv)
     -> );
     Query OK, 0 rows affected (0.55 sec)
     ``` 
   - Hiển thị toàn bộ table bằng lệnh `show tables;`:  
     ```sh
     show tables;
     ```
     OUTPUT
     ```
     +------------------+
     | Tables_in_testdb |
     +------------------+
     | sinhvien         |
     +------------------+
     1 row in set (0.00 sec)
     ``` 
   - Hiển thị dữ liệu của bảng:  
   Cú pháp:  
      ```sh
      select * from [table_name];
      ``` 

     ***Ví dụ:***
      ```sh
      MariaDB [testdb]> select * from sinhvien;
      Empty set (0.07 sec)
      ``` 
   - Đổi tên bảng:  
   Cú pháp:  
      ```sh
      rename table first to second;
      ```
      ***Ví dụ:*** đổi tên bảng từ `sinhvien` thành `sinhvienhust`
      ```sh
      MariaDB [testdb]> rename table sinhvien to sinhvienhust;
      Query OK, 0 rows affected, 1 warning (0.11 sec)

      MariaDB [testdb]> show tables;
      +------------------+
      | Tables_in_testdb |
      +------------------+
      | sinhvienhust     |
      +------------------+
      1 row in set (0.00 sec)
      ``` 
   - Xem thông tin trên bảng vừa tạo:    
   Có thể dùng: `>desc ten_bang` hoặc `>show columns from ten_bang` hoặc 
      ```sh
      describe sinhvienhust;
      ```  
      OUTPUT
      ```
      +---------+--------------+------+-----+---------+----------------+
      | Field   | Type         | Null | Key | Default | Extra          |
      +---------+--------------+------+-----+---------+----------------+
      | mssv    | int(11)      | NO   | PRI | NULL    | auto_increment |
      | ho      | varchar(255) | NO   |     | NULL    |                |
      | ten     | varchar(255) | NO   |     | NULL    |                |
      | tuoi    | int(11)      | NO   |     | NULL    |                |
      | diemthi | float(4,2)   | NO   |     | NULL    |                |
      +---------+--------------+------+-----+---------+----------------+
      5 rows in set (0.05 sec)
      ``` 
      Giải thích:  
      `field:` tên cột  
      `type:` kiểu của trường dữ liệu   
      `null:` có được để giá trị trống không  
      `key:`  khóa, `primary key` là khóa chính - khóa tồn tại duy nhất không trùng lặp được dùng để xác định dữ liệu trong bảng CSDL.  
      `default:` giá trị mặc định của cột là: null - vô giá trị(không có giá trị mặc định) hoặc một giá trị mặc định nào đấy.  
      `extra auto_increment:` tự động thay đổi ID  
   - Xóa bảng:  
      ```sh
      drop table table_name 
      ``` 
   <a name ="1.1.3">

  - Thao tác với cột và hàng:  
     - Đổi tên cột:  
      ```sh
      alter table sinhvien change columnold columnnew (thuộc tính của trường);
      ```
    ***Ví dụ:*** 
      ```sh
      MariaDB [testdb]> alter table sinhvienhust change diemthi diem varchar(50);
      Query OK, 0 rows affected, 2 warnings (0.25 sec)
      Records: 0  Duplicates: 0  Warnings: 2
      ```
     - Thêm cột cho bảng: 

      ```sh
      alter table tablename add column_name kieu_truong;  
      ```
    ***Ví dụ:***  
      ```sh
       MariaDB [testdb]> alter table sinhvienhust add stt int;
       Query OK, 0 rows affected (0.15 sec)
       Records: 0  Duplicates: 0  Warnings: 0
      ``` 
     - Xóa cột trong bảng:  
      ```sh
      alter table tablename drop column column_name;
      ``` 
      - Chèn dữ liệu vào bảng:     
      Cú pháp:  
      ```sh  
      INSERT INTO TABLE_TEN (cot1, cot2, cot3,...cotN)  
      VALUES (giatri1, giatri2, giatri3,...giatriN);  
      ```  
      hoặc  
      ```sh
      INSERT INTO TABLE_TEN VALUES (giatri1,giatri2,giatri3,...giatriN);  
      ```
      ***Ví dụ 1:*** 
      ```sh
      MariaDB [testdb]> insert into sinhvienhust
      -> (stt,ho,ten,mssv,diem)
      -> values
      -> ("1", "Nguyen", "Hien", "12", "8");
      Query OK, 1 row affected, 1 warning (0.06 sec)
      ``` 
      ***Ví dụ 2:***  
      ```sh
      MariaDB [testdb]> insert into sinhvienhust(`stt`,`ho`,`ten`,`mssv`,`diem`) values('2','Phung','Ngoc','13','9');
      Query OK, 1 row affected, 1 warning (0.10 sec)
      ``` 
      - Cập nhật dữ liệu lên bảng:  
      Trong trường hợp bạn tạo một cột mới, muốn thêm dữ liệu vào cột để bổ sung với các dữ liệu đã có trước đó nhưng nếu dùng lệnh `insert` thì dữ liệu sẽ ghi tiếp xuống các hàng ở dưới. Khi đó bạn sẽ sử dụng câu lệnh `update`  
      Câu lệnh:  
         ```sh
         update ten_bang set ten_cot="du_lieu_moi" where ten_cot="du_lieu_ban_dau";
         ```  

         ***Ví dụ:***    
         ```sh  
         MariaDB [NhanHoa]> update SVTT
         -> set Gioitinh="Nam"
         -> where (Hoten = "DucNA") OR (Hoten="HungNV") OR (Hoten="CuongNQ") OR (Hoten="HuanTT") OR (Hoten="NiemDT") OR (Hoten="ThanhBC") OR (Hoten="ManhVQ") OR (Hoten="HungNT");
         Query OK, 8 rows affected (0.01 sec)
         Rows matched: 8  Changed: 8  Warnings: 0
         ```
         **Kết quả là:**  
         ```sh
         MariaDB [NhanHoa]> select * from SVTT;
         +---------+------+---------+-----+----------+----------+
         | Hoten   | MSSV | Mentor  | STT | MentorID | Gioitinh |
         +---------+------+---------+-----+----------+----------+
         | DucNA   |    1 | MinhNV  |   0 |        4 | Nam      |
         | HungNV  |    3 | ManhDV  |   0 |        2 | Nam      |
         | NgocPT  |    4 | DatPT   |   0 |        5 | NULL     |
         | OanhDT  |    5 | HuyTM   |   0 |        6 | NULL     | | CuongNQ |    6 | ThanhNB |   0 |        7 | Nam      |
         | HuanTT  |    7 | HuyTM   |   0 |        6 | Nam      |
         | NiemDT  |    8 | MinhNV  |   0 |        4 | Nam      |
         | ThanhBC |    9 | ManhDV  |   0 |        2 | Nam      |
         | ManhVQ  |   10 | CongTT  |   0 |     NULL | Nam      |
         | HungNT  |   11 | DatPT   |   0 |        5 | Nam      |
         | HienNT  |   12 | CanhDX  |   0 |        1 | NULL     |
         +---------+------+---------+-----+----------+----------+
         11 rows in set (0.00 sec)
         ```  
      - Lọc dữ liệu trong 1 bảng:
         ```sh
        SELECT column(s) FROM table WHERE column = value;
         ```  
        Các tùy chọn:  

        <img src ="../../../images/25 bai linux\filter.png">

        ***Ví dụ 1:*** Lọc các bạn có giới tính nữ:  

         <img src ="../../../images\25 bai linux\photo_2019-07-30_19-21-11.jpg">

         ***Ví dụ 2:*** Lọc các bạn giới tính không phải nữ  

         <img src ="../../../images\25 bai linux\photo_2019-07-30_19-23-07.jpg">

      - Xóa dữ liệu trong bảng:  
         ```sh
         delete from ten_bang where ten_cot="du_lieu_muon_xoa";  
         ``` 
         ***Ví dụ:***  
         ```sh
         MariaDB [testdb]> delete from sinhvienhust where stt="2";
         Query OK, 1 row affected (0.10 sec)

         MariaDB [testdb]> select * from sinhvienhust;
         +------+--------+------+------+------+------+
         | mssv | ho     | ten  | tuoi | diem | stt  |
         +------+--------+------+------+------+------+
         |   12 | Nguyen | Hien |    0 | 8    |    1 |
         +------+--------+------+------+------+------+
         1 row in set (0.00 sec)
         ``` 

- Thư mục chứa `database` là: `/var/lib/mysql`
- Thoát khỏi chương trình `MariaDB`, sử dụng `"Ctrl+C"`  


<a name ="1.2"></a>

### 2. User database  
- Cấu trúc lệnh tạo `user database:`  
   ```sh
   create user 'tên user'@'hostname';
   ```
  Trong đó: `hostname` chính là `localhost` của bạn. Nên để giá trị `**localhost**` ở phần `hostname` và không nên đổi thành cái khác trừ khi hiểu rõ mình đang làm gì.  

  ***Ví dụ:*** tạo user có tên là `havy`   
    ```sh
    MariaDB [(none)]> create user 'havy'@'localhost';
    ``` 
- Xem danh sách các user hiện có:  
   ```sh
   select user,host from mysql.user;
   ``` 
   **Kết quả là:**  
   ```sh
   +----------+-----------------+
   | user     | host            |
   +----------+-----------------+
   | root     | 127.0.0.1       |
   | root     | ::1             |
   | havy     | localhost       |
   | root     | localhost       |
   +----------+-----------------+
   5 rows in set (0.00 sec)
   ``` 
- Đặt mật khẩu cho user vừa tạo:  
   ```sh
   set password for 'tên user'@'hostname'= password("[mật khẩu user]");
   ``` 
   ***Ví dụ:*** đặt cho user `havy` password là `abc@123`  
   ```sh
   MariaDB [(none)]> set password for 'havy'@'localhost'= password("abc@123");
   Query OK, 0 rows affected (0.05 sec)
   ``` 
- Ngoài ra cũng có thể vừa tạo user vừa đặt password bằng câu lệnh:  
   ```sh
   create user 'user'@'hostname' identified by 'password';
   ```
   ***Ví dụ:*** tạo user `thuyhien` với password là `abc@123`   
   ```sh
   MariaDB [(none)]> create user 'thuyhien'@'192.168.136.129'  identified by 'abc@123';
   Query OK, 0 rows affected (0.11 sec)
   ```

<a name ="1.3"></a>

### 3. Phân quyền cho user database  
- Các quyền mà user database có thể được cấp để sử dụng database  
   - `ALL PRIVILEGES` - cấp cho user tất cả các đặc quyền.  
   - `CREATE` - user có quyền tạo CSDL và bảng.  
   - `DROP` - user xóa CSDL và bảng.  
   - `DELETE` - user được phép xóa các hàng khỏi một bảng cụ thể.  
   - `INSERT` - user được phép chèn các hàng vào bảng cụ thể.  
   - `SELECT` - user được phép đọc CSDL.  
   - `UPDATE` - user được phép cập nhật các hàng của bảng.  

- Để cấp các đặc quyền cụ thể cho user, sử dụng cú pháp:  
   ```sh
   GRANT [type of permission] ON [database name].[table name] TO 'databaseusername'@'localhost';
   ``` 
  ***Ví dụ:***  
  - Cấp tất cả đặc quyền cho một user qua một cơ sở dữ liệu cụ thể:  
     ```sh
     MariaDB [(none)]> grant all privileges on testdb. * to 'thuyhien'@192.168.136.129;
     Query OK, 0 rows affected (0.11 sec)
      ``` 
  - Cấp tất cả đặc quyền cho user qua một bảng cụ thể từ database:  
      ```sh
     MariaDB [(none)]> grant all privileges on testdb.sinhvienhust to 'thuyhien'@'192.168.136.129';

     Query OK, 0 rows affected (0.03 sec)
     ``` 
  - Cấp nhiều đặc quyền cho user qua một database cụ thể:  
     ```sh
     MariaDB [(none)]> grant SELECT, INSERT on testdb.* to 'thuyhien'@'192.168.136.129';
     Query OK, 0 rows affected (0.01 sec)
     ``` 
- Hiển thị các đặc quyền của user:  
   ```sh
   SHOW GRANTS FOR 'database_user'@'localhost';
   ``` 

   ```sh
   +-----------------------------------------------------------------------------------------------------------------------+
   | Grants for thuyhien@192.168.136.129                                                                                   |
  +-----------------------------------------------------------------------------------------------------------------------+
  | GRANT USAGE ON *.* TO 'thuyhien'@'192.168.136.129' IDENTIFIED BY PASSWORD '*FE1E37A7390CE06FF73D46CE034FE0C9A59A9681' |
  | GRANT ALL PRIVILEGES ON `testdb`.* TO 'thuyhien'@'192.168.136.129'                                                    |
  | GRANT ALL PRIVILEGES ON `testdb`.`sinhvienhust` TO 'thuyhien'@'192.168.136.129'                                       |
  +-----------------------------------------------------------------------------------------------------------------------+
  3 rows in set (0.00 sec)
   ``` 
- Thu hồi các đặc quyền từ user:  
Cú pháp giống hệt như khi cấp quyền, chỉ thay `GRANT` thành `REVOKE`  
   ```sh 
   REVOKE ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';
   ``` 
- Xóa user database hiện có:  
   ```sh
   DROP USER 'user'@'localhost'
   ``` 
Lệnh trên sẽ xóa tài khoản người dùng và các đặc quyền của nó.    



## TÀI LIỆU THAM KHẢO  
- [https://www.digitalocean.com/](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7)  
- [huong-dan-cai-dat-mariadb-tren-centos-7/](https://bigvn.net/huong-dan-cai-dat-mariadb-tren-centos-7/#tao-user-database-va-database)  
- [quản lý database bằng giao diện web.](https://www.thuysys.com/server-vps/web-server/phpmyadmin-huong-dan-quan-tri-co-du-lieu-co-ban.html)  
- [https://www.oreilly.com/](https://www.oreilly.com/library/view/learning-mysql-and/9781449362898/ch04.html) 
- [mysql-insert-query](https://www.tutorialspoint.com/mysql/mysql-insert-query) 
- [configure-mariadb-server-on-centos/](https://support.rackspace.com/how-to/configure-mariadb-server-on-centos/)
- [Lọc dữ liệu](https://www.techotopia.com/index.php/Using_WHERE_to_Filter_MySQL_Data)