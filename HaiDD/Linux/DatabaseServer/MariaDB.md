# MariaDB

## 1. MariaDB là gì?

MariaDB là một hệ quản trị cơ sở dữ liệu mã nguồn mở (DBMS) được xây dựng bởi một số tác giả sáng lập MySQL và hiện tại đang được đông đảo cộng đồng các nhà phát triển sử dụng.

MariaDB là một hệ thống quản lý cơ sở dữ liệu quan hệ mã nguồn mở , một sự thay thế tương thích cho công nghệ cơ sở dữ liệu MySQL được sử dụng rộng rãi.

MariaDB có sẵn để cài đặt trên Linux CentOS, Ubuntu và Window. MariaDB được phát triển nhằm thay thế công nghệ cơ sở dữ liệu MySQL, vì thế nó tương thích và cho một hiệu suất cao hơn so với MySQL.


## Ưu điểm
### Mã nguồn mở (hoàn toàn miễn phí thực sự)
MariaDB hay Mysql đều có 2 phiên bản: thương mại và cộng đồng.

Trái ngược với MySQL, MariaDB hoàn toàn mã nguồn mở được vận hành bởi cộng đồng thực sự (MariaDB Foundation), đứng đằng sau là công ty Monty Program, mặc dù cũng có bản thương mại nhưng không ảnh hưởng đến phiên bản mã nguồn mở.

### Được bảo trì bởi người tạo ra MySQL
Sau khi bị Oracle mua lại, một số thành viên chủ lực của MySQL đã ra đi, trong đó bao gồm những người tạo ra MySQL. Trong khi đó, MariaDB tiếp tục phát triển, đến bây giờ đã phát triển đến thế hệ 10.x. Do đó, tất cả những nhược điểm của MySQL đều được khắc phục ở MariaDB.

### Hoàn toàn tương thích với MySQL
Do “sinh cùng cha” nên MariaDB có hệ thống hoàn toàn tương thích như với MySQL từ phiên bản 5.1 -> 5.5. 

Do sự tương thích giữa MariaDB và MySQL nên trong hầu hết trường hợp chúng ta có thể xóa bỏ MySQL và cài đặt MariaDB để thay thế mà hệ thống vẫn hoạt động bình thường.
Trên MariaDB và MySQL có những điểm tương đồng trong:
- Data and table definition files (.frm) files
- Tất cả client APIs, protocols and structs
- Tất cả filenames, binaries, paths, ports, sockets,…
- Tất cả MySQL connectors (PHP, Perl, Python, Java, .NET, MyODBC, Ruby, MySQL C connector etc) đều hoạt động bình thường khi đổi qua MariaDB
- Gói mysql-client cũng hoạt động khi dùng với MariaDB

### Nhiều Engine lưu trữ hơn
Ngoài việc hỗ trợ các storage engines cơ bản như MyISAM, BLACKHOLE, CSV, MEMORY, ARCHIVE, and MERGE thì trên MariaDB còn bổ sung thêm các storage engines sau: Aria (được xem như một phiên bản cập nhật của MyISAM), XtraDB (thay thế cho InnoDB), FederatedX, OQGRAPH, SphinxSE, IBMDB2I, Spider, PBXT, ….
Ngoài ra trên MariaDB còn cải thiện hiệu năng và cung cấp thêm một số chức năng mới. Thông tin chi tiết tại [đây](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/).

### Kết hợp 2 thế giới SQL và NoSQL
Cả 2 loại cơ sở dữ liệu này đều có điểm lợi riêng, việc MariaDB cho phép kết nối sẽ tận dụng được lợi thế của 2 thế giới này: Dynamic Column và Cassandra Store Engine.

### Tối ưu tốc độ
Trong cùng một điều kiện như nhau thì MariaDB nhanh hơn MySQL từ 3-5% tốc độ.

### Các Website lớn đã sử dụng MariaDB
Một trong những website lớn nhất thế giới là Wikipedia đã chuyển từ MySQL qua MariaDB. Ngay cả Fullstack-Station cũng đang dùng MariaDB.

### Tài liệu hỗ trợ Tiếng Việt
[Knowledge Base tiếng Việt](https://mariadb.com/kb/vi/) , mặc dù bản dịch vẫn chưa phải quá tốt, tuy nhiên cho thấy sự tiếp cận cộng đồng là khá tốt.

## 2. Các phiên bản của MariaDB
Số phiên bản của MariaDB tuân theo phiên bản của MySQL đến phiên bản 5.5. Như vậy, MariaDB 5.5 cung cấp tất cả các tính năng MySQL 5.5. Có khoảng cách giữa các phiên bản MySQL từ 5.1 đến 5.5, trong khi MariaDB phát hành phiên bản 5.2 và 5.3.

Sau phiên bản 5.5, các nhà phát triển của MariaDB quyết định bắt đầu một nhánh số 10, nỗ lực để làm rõ rằng MariaDB 10.0 sẽ không nhập tất cả các tính năng từ MySQL 5.6. Tuy nhiên, chúng có thể được nhập vào trong các phiên bản trong tương lai. Vì các tính năng mới đã được phát triển trong MariaDB nên các nhà phát triển đã quyết định cần thay đổi mã số phiên bản chính.

Do đó, nếu Website của bạn đang dùng MySQL 5.1 -> 5.5 thì việc chuyển qua MariaDB là cực kì dễ dàng.

MariaDB có các phiên bản cho các hệ điều hành khác nhau: Windows, Linux,.. với các gói cài đặt tar, zip, MSI, rpm cho cả 32bit và 64bit. Hiện tại phiên bản chính thức mới nhất của MariaDB là 10.4 (Bản beta là 10.5).

## 3. Cài đặt
Khi cài đặt MariaDB từ kho lưu trữ mặc định của CentOS 7, mặc định version của MariaDB Server là 5.5.50 nhưng hiện tại version này đã cũ và không còn phù hợp để sử dụng. Bài viết này sẽ hướng dẫn bạn cách cài đặt MariaDB version 10.4.7 trên máy cài hệ điều hành CentOS7 từ ​​kho lưu trữ chính thức của MariaDB. Bằng cách này, bạn có thể lựa chọn phiên bản gói MariaDB mà bạn muốn sử dụng.

## **Cài đặt MariaDB phiên bản 10.4.11 Stable(11/12/2019)**

Tìm kiếm phiên bản 10.4.11 tại [đây](https://downloads.mariadb.org/mariadb/+releases/).

### Thêm Repo của MariaDB-10.4:
```
[root@localhost ~]# tee /etc/yum.repos.d/MariaDB.repo<<EOF
> [mariadb]
> name = MariaDB
> baseurl = http://yum.mariadb.org/10.4/centos7-amd64
> gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
> gpgcheck=1
> EOF

[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1

[root@localhost ~]#
```

**Giải thích:**
- `name` – tên của kho lưu trữ
- `baseurl` – đường dẫn tới kho lưu trữ
- `gpg` – là viết tắt của GNU Private Guard, là một loại chữ kí số giúp bảo vệ quyền riêng tư. Nếu đặt giá trị gpgcheck =1 thì nó sẽ xác thực gói bằng cách kiểm tra chữ ký GPG. Đặt gpgcheck=0 để bỏ qua xác thực hoặc trong trường hợp gói không được đăng ký.
- `gpgcheck` – cài đặt bảo mật(1=có,0=không)
- `enable` – trạng thái của kho lưu trữ(1=bật,0=tắt)
- `gpgkey` – đường dẫn của file key(nếu có)

Hoặc có thể truy cập [link](https://downloads.mariadb.org/mariadb/repositories/), để MariaDB web tạo cho bạn nội dung Repo tương ứng với OS.

### Cập nhật lại thông tin file `MariaDB.repo` và install

```
[root@localhost ~]# yum makecache fast
[root@localhost ~]# yum install MariaDB-server Maria-client -y
```

### Khởi động lại dịch vụ MariaDB và bật nó chạy cùng OS
```
[root@localhost ~]# systemctl start mariadb
[root@localhost ~]# systemctl enable mariadb
Created symlink from /etc/systemd/system/mysql.service to /usr/lib/systemd/system/mariadb.service.
Created symlink from /etc/systemd/system/mysqld.service to /usr/lib/systemd/system/mariadb.service.
Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.
```

### Mở firewall 
```
[root@localhost ~]# firewall-cmd --add-service=mysql --permanent
[root@localhost ~]# firewall-cmd --reload
```

### Thiết lập cấu hình cơ bản cho MariaDB
```
[root@localhost ~]# mysql_secure_installation
```
Sau đó thiết lập một số thông tin cơ bản:
<img src = "https://i.imgur.com/B6PT84g.png">

Khởi động lại dịch vụ MariaDB
```
[root@localhost ~]# systemctl restart mariadb
```

### Đăng nhập và kiểm tra phiên bản MariaDB
```
[root@localhost ~]# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.11-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

hoặc

```
[root@localhost ~]# mysql -v
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.11-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Reading history-file /root/.mysql_history
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

Như vậy ta đã cài đặt xong MariaDB-10.4 trên CentOS-7

## 4. Một số thao tác sử dụng trong MariaDB
Truy cập vào DB:
```
[root@localhost ~]# mysql -u root
```

Đặt lại mật khẩu cho user:
```
MariaDB [(none)]> SET PASSWORD FOR 'user_name'@'hostname' = PASSWORD('newpass');
```

Kiểm tra các cổng lắng nghe của máy:
```
[root@localhost ~]# ss -lntp
```

Tạo và set quyền cho user `demo`:
```
MariaDB [(none)]> create user 'demo'@'%' identified by 'secret'; 
--> tạo user demo

MariaDB [(none)]> grant all on *.* to 'demo'@'%'; 
--> cấp quyền cho user demo trên tất cả database
```

Kiểm tra các user có trong database:
```
MariaDB [(none)]> select user,host,password from mysql.user;
```

Chọn database: `use <ten_database>`
```
MariaDB [(none)]> use testdb
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [testdb]>
```

Hiển thị các bảng trong database:`show databases;`
```
MariaDB [testdb]> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| sinhvien         |
+------------------+
1 row in set (0.000 sec)
```