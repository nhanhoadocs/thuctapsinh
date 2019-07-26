# Install MariaDB on CentOS 7  
## **Contents** 
I. [Cài đặt MariaDB](#I)  

1. [Cài đặt mặc định](#1)  

2. [Cài đặt qua Repo](#2)  

   a. [Thêm Repo vào server](#a)  
   b. [Cài đặt MariaDB 10.0.30](#b) 

3. [Các lệnh quản lý](#3)

4. [File cấu hình](#4)

5. [Thiết lập bảo mật cho user database](#5) 

II. [User Database và Database](#II) 

1. [Tạo cấu trúc dữ liệu](#1.1)  

    a. [Tạo cơ sở dữ liệu](#1.1.1)  
    b. [Các thao tác với bảng trong database](#1.1.2)  
    c. [Các thao tác với cột trong database](#1.1.3)

2. [Tạo database user](#1.2)  

3. [Phân quyền cho user database](#1.3)  

## Chuẩn bị  
- 1 máy ảo cài hệ điều hành CentOS 7, có kết nối Internet.
- Các thông số phần cứng trên máy ảo:  
    - CPU: Intel(R) Pentium(R) CPU  N3540  @ 2.16GHz
   - RAM: 1GB
   - Ổ đĩa: 20GB  
- Tài khoản có thể đăng nhập vào hệ thống và có quyền sudo. Hướng dẫn dưới đây sử dụng tài khoản root.  

<a name ="I"></a>  

## I. Cài đặt MariaDB

<a name ="1"></a>

### 1. Cài đặt mặc định
 
- Sử dụng `yum install` để cài đặt gói MariaDB - `mariadb-server`, nhập y khi được nhắc để xác nhận cài đặt:  
```sh
yum install mariadb-server
```  
- Sau khi hoàn tất cài đặt, sử dụng lệnh `systemctl start` để khởi động dịch vụ MariaDB:
```sh
[root@thuyhien ~]# systemctl start mariadb
```  
- Nếu muốn để MariaDB khởi động cùng hệ điều hành, sử dụng lệnh:  
```sh
 [root@thuyhien ~]# systemctl enable mariadb
```  
- `systemctl` không hiển thị kết quả của các lệnh quản lý dịch vụ nên để chắc chắn dịch vụ hoạt kđộng nên liểm tra trạng thái hoạt động của MariaDB trên CentOS 7 bằng lệnh:  
```sh
[root@thuyhien ~]# systemctl status mysql
```  

<a name ="2"></a>

### 2. Cài đặt qua repo
<a name ="a"></a>
> ### Tại sao phải thêm repo vào server. Cách thêm repo.  
- Repository mặc định trên CentOS 7 cung cấp một bộ cài MariaDB, muốn dùng bản mới hơn thì phải thêm repo của MariaDB vào.  
- Cách thêm repo:  
   - Tìm kiếm các phiên bản khác của MariaDB tại [***đây***](https://downloads.mariadb.org/mariadb/+releases/). Ở đây mình dùng MariaDB phiên bản 10.0.30  
   - Thêm repo bằng câu lệnh:  
   ```sh
   [root@thuyhien ~]# vi /etc/yum.repos.d/mariadb.repo
   ```  
   Sau đó thêm đoạn code bên dưới vào:  
   ```sh
   # mariadb.repo 10.0.30
   [mariadb]
   name=mariadb repo
   baseurl=https://yum.mariadb.org/10.0.30/centos7-amd64/
   gpgcheck=0
   enabled=1
    ```  
    - Lưu lại và kiểm tra phiên bản của MariaDB-Server sau khi thêm repo mới:  
    ```sh
    [root@thuyhien sbin]# yum info mariadb-server
    ```  
    Kết quả cho thấy **MariaDB 10.0.30** đã sẵn sàng:  
    ```sh
    Available Packages
    Name        : MariaDB-server
    Arch        : x86_64
    Version     : 10.0.30
    Release     : 1.el7.centos
    Size        : 55 M
    Repo        : mariadb
    Summary     : MariaDB: a very fast and robust SQL database server
    URL         : http://mariadb.org
    License     : GPLv2
    Description : MariaDB: a very fast and robust SQL database server
            :
            : It is GPL v2 licensed, which means you can use the it free of
            : charge under the conditions of the GNU General Public License
            : Version 2 (http://www.gnu.org/licenses/).
            :
            : MariaDB documentation can be found at https://mariadb.com/kb
            : MariaDB bug reports should be submitted through
            : https://jira.mariadb.org
    ```  
    - Gõ cài đặt phiên bản MariaDB trước, sử dụng lệnh:  
    ```sh
    yum erase mysql
    ```
    hoặc  
    ```sh
    yum remove mysql
    ```
    <a name ="b"></b>

    - Cài đặt **`MariaDB 10.0.30`**    
   ```sh
   [root@thuyhien ~]# yum install -y mariadb-server
   ```  
   - Khởi động dịch vụ MariaDB  
   ```sh
   [root@thuyhien ~]# systemctl start mariadb
   ```
   - Kiểm tra lại version và trạng thái dịch vụ  
   ```sh
   [root@thuyhien ~]# yum list installed | grep mariadb
   ```
   và 

   ```sh
   systemctl status mysql
   ```

<a name ="3"></a>  

### 3. Các dòng lệnh quản lý
- Khởi động dịch vụ
```sh
systemctl start mysql
```
- Cho phép tự động chạy khi khởi động(chạy cùng hệ thống)
```sh
systemctl enable mysql
```
- Dừng dịch vụ
```sh
systemctl stop mysql
```
- Kiểm tra trạng thái hoạt động của MariaDB
```sh
systemctl status mysql
```  
- Kiểm tra cổng mà Mariadb đang sử dụng  
```sh
[root@thuyhien ~]# netstat -plnt | grep mysql
tcp6       0      0 :::3306                 :::*                    LISTEN      3679/mysqld
```  
Theo mặc định, `MariaDB` sử dụng cổng mặc định là cổng 3306.

<a name ="4"></a>
### 4. File cấu hình  
- Tập tin cấu hình gốc:  
```sh
/etc/my.cnf
```  

<a name ="5"></a>

### 5. Thiết lập cấu hình bảo mật cơ bản cho dịch vụ MariaDB  
- Sau khi cài đặt, tài khoản root của MariaDB chưa có mật khẩu. Câu lệnh tạo mật khẩu và thiết lập thêm một số tùy chọn khác:  
```sh
mysql_secure_installation
```  
   - **Enter current password for root (enter for none):** nếu đã từng đặt mật khẩu thì bạn nhập mật khẩu hiện tại đang sử dụng, nếu là lần đầu tiên thì bạn có thể để trống. Enter để tới bước tiếp theo.  
   - **Remove anonymous users:** Xóa tài khoản vô danh, Bạn chon Y (Yes).
   + **Disallow root login remotely:** Tắt truy cập từ xa. Tùy bạn lựa chọn.
   + **Remove test database and access to it:** Xóa database có tên là "test". Nó chỉ dùng để test lúc ban đầu, bạn có thể xóa nó. Chon Y (Yes)  
   + **Reload privilege tables now:** reload lại các bảng liên quan đến quyền hạn.  

- Khởi động lại dịch vụ MariaDB:  
```sh
#systemctl restart mysql.service  
```
- Kiểm tra lại bằng câu lệnh:  
```sh
#mysql -u root -p
```  
<a name ="II"></a>

## II - Tạo Database và User Database  
- Đăng nhập vào MariaDB Server:  
```sh
#mysql -u root -p
``` 
hoặc  
```sh
#mysql -u root -p[password]  
```  
*Chú ý:* Nếu trong mật khẩu có chứa kí tự đặc biệt thì khi nhập pass cần để 1 dấu cách trước kí tự đấy.

<a name ="1.1"></a>  

### 1. Tạo cấu trúc(database,table)  
<a name ="1.1.1"></a>

- Cú pháp tạo database:  
```sh
>create database [database user]
```  
***Ví dụ:*** Tạo 1 database có tên là `testdb`  
- Câu lệnh:  
```sh
MariaDB [(none)]> create database testdb;
```  
**Kết quả là:**  
```sh
Query OK, 1 row affected (0.01 sec)
```  
- Xem danh sách database hiện có:  
```sh
MariaDB [(none)]> show databases;
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
MariaDB [(none)]> show create database testdb;
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
MariaDB [(none)]> use testdb;
```  
<a name ="1.1.2"></a>

   - Tạo bảng:  
   ```sh
   >create  table [table name](trường trong bảng)
   ```   
   *Ví dụ:* tạo bảng có tên là `sinhvien` với các trường mssv,ho,ten,tuoi,diemthi trong database `testdb`:  
   ```sh
   MariaDB [(none)]> use testdb;
   Database changed
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
   MariaDB [testdb]> show tables;
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
   >select * from [table_name];
   ```  

   *Ví dụ:*
   ```sh
   MariaDB [testdb]> select * from sinhvien;
   Empty set (0.07 sec)
   ```  
   - Đổi tên bảng:  
   Cú pháp:  
   ```sh
   >rename table first to second;
   ```
   *Ví dụ:* đổi tên bảng từ `sinhvien` thành `sinhvienhust`
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
   MariaDB [testdb]> describe sinhvienhust;
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
      `key:`  
      `default:`   
      `extra:`
   - Xóa bảng:  
   ```sh
   >drop table table_name 
   ```  
   <a name ="1.1.3">

  - Thao tác với cột và hàng:  
     - Đổi tên cột:  
   ```sh
   alter table sinhvien change columnold columnnew (thuộc tính của trường);
   ```
*Ví dụ:* 
```sh
   MariaDB [testdb]> alter table sinhvienhust change diemthi diem varchar(50);
   Query OK, 0 rows affected, 2 warnings (0.25 sec)
   Records: 0  Duplicates: 0  Warnings: 2
```
   - Thêm cột cho bảng: 


```sh
    alter table tablename add column_name kieu_truong;  
```
   Ví dụ:  
   ```sh
   MariaDB [testdb]> alter table sinhvienhust add stt int;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0
   ```  
   - Xóa cột trong bảng:  
   ```sh
     alter table tablename drop column_name kieu_truong;
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
   Ví dụ 1:  
   ```sh
   MariaDB [testdb]> insert into sinhvienhust
    -> (stt,ho,ten,mssv,diem)
    -> values
    -> ("1", "Nguyen", "Hien", "12", "8");
   Query OK, 1 row affected, 1 warning (0.06 sec)
   ```  
   Ví dụ 2:  
   ```sh
   MariaDB [testdb]> insert into sinhvienhust(`stt`,`ho`,`ten`,`mssv`,`diem`) values('2','Phung','Ngoc','13','9');
   Query OK, 1 row affected, 1 warning (0.10 sec)
   ```  
   - Xóa dữ liệu trong bảng:  
   ```sh
   >delete from ten_bang where ten_cot="du_lieu_muon_xoa";  
   ```  
   Ví dụ:  
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

### 2. Tạo user database  
- Cấu trúc lệnh:  
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
MariaDB [(none)]> select user,host from mysql.user;
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
Ví dụ đặt cho user `havy` password là `abc@123`  
```sh
MariaDB [(none)]> set password for 'havy'@'localhost'= password("abc@123");
Query OK, 0 rows affected (0.05 sec)
```  
- Ngoài ra cũng có thể vừa tạo user vừa đặt password bằng câu lệnh:  
```sh
create user 'user'@'hostname' identified by 'password';
```
Ví dụ: tạo user `thuyhien` với password là `abc@123`   
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
- Ví dụ:  
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