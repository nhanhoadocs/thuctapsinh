# Install MariaDB-10.x on Ubuntu-18.04



### Cập nhật OS, cài đặt repository và các gói bổ trợ

```
$ sudo apt-get update
$ sudo apt-get install -y apt-utils wget git byobu
```




### Thêm repository chính thức của MariaDB-10.x và cập nhật lại OS

Thêm repository chính thức của MariaDB-10.x và cập nhật lại hệ thống

```
$ sudo apt-get install -y software-properties-common

$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

$ sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.its.dal.ca/mariadb/repo/10.4/ubuntu bionic main'

$ sudo apt-get -y update
```




### Cài đặt MariaDB-10.x
Thực hiện cài đặt MariaDB-10.x

```
$ sudo apt install -y mariadb-server
```




### Khởi động MariaDB và bật MariaDB khởi động cùng hệ thống
Khởi động MariaDB và cho phép MariaDB khởi động cùng hệ thống

```
$ sudo systemctl enable mariadb
$ sudo systemctl start  mariadb
```

Kiểm tra trạng thái và phiên bản của MariaDB

```
$ sudo systemctl status  mariadb
● mariadb.service - MariaDB 10.4.10 database server
   Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
  Drop-In: /etc/systemd/system/mariadb.service.d
           └─migrated-from-my.cnf-settings.conf
   Active: active (running) since Sun 2019-12-01 06:31:19 UTC; 8min ago
     Docs: man:mysqld(8)
           https://mariadb.com/kb/en/library/systemd/
 Main PID: 15827 (mysqld)
   Status: "Taking your SQL requests now..."
    Tasks: 31 (limit: 1081)
   CGroup: /system.slice/mariadb.service
           └─15827 /usr/sbin/mysqld

Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: mysql
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: performance_schema
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: Phase 6/7: Checking and upgrading tables
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: Processing databases
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: information_schema
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: performance_schema
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: Phase 7/7: Running 'FLUSH PRIVILEGES'
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[15870]: OK
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[16027]: Checking for insecure root accounts.
Dec 01 06:31:27 ubuntu_18043 /etc/mysql/debian-start[16031]: Triggering myisam-recover for all MyISAM tables and aria-recover for all Aria tables
$ mariadb -V
mariadb  Ver 15.1 Distrib 10.4.10-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2
```




### Mở firewall cho phép kết nối MariaDB từ xa

```
$ sudo firewall-cmd --add-service=mysql --permanent
$ sudo firewall-cmd --reload
```




### Thiết lập bảo mật lần đầu cho MariaDB
Sau khi cài đặt ta cần thiết lập bảo mật cho MariaDB nhằm giúp MariaDB an toàn hơn, Để thiệt lập bảo mật cho MariaDB ta chạy lệnh `mysql_secure_installation`, một lệnh được tích hợp sẵn để thực hiện các cài đặt bảo mật.

Sau khi thực hiện lệnh kết quả sẽ tương tự như dưới đây:

```
$ sudo mysql_secure_installation 

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] Y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] Y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] Y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] Y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

Trong đó:
- Tại dòng `Enter current password for root (enter for none): ` yêu cầu ta nhập mật khẩu của tài khoản `root` (Tài khoản `root` trong quản trị cơ sở dữ liệu, không phải tài khoản `root` hệ thống), ở đây ta ấn `Enter` để bỏ qua vì mặc định trong MariaDB-10.x tài khoản `root` không có mật khẩu.

- Tại dòng `Switch to unix_socket authentication [Y/n] ` ta ấn `Y` để chuyển phước thức xác thực sang `unix_socket` và `n` để bỏ qua.

- Tại dòng `Set root password? [Y/n] ` cho phép ta đặt mật khẩu cho user `root`. Để đặt mật khẩu ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `New password: ` và `Re-enter new password: ` ta lần lượt nhập mật khẩu mới và xác nhận mật khẩu.

- Tại dòng `Remove anonymous users? [Y/n] ` cho phép ta xóa tài khoản `anonymous`, `anonymous` là tài khoản mặc định ngay từ khi cài đặt MariaDB. Để xóa `anonymous` user ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Disallow root login remotely? [Y/n]` cho phép ta vô hiệu hóa tính năng đăng nhập từ xa đối với tài khoản `root`. Để vô hiệu hóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Remove test database and access to it? [Y/n]` cho phép ta xóa cơ sở dữ liệu `test`, một cơ sở dữ liệu được tạo mặc định ngay từ khi cài đặt MariaDB. Để xóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Reload privilege tables now? [Y/n]` ta ấn `Y` để Reload privilege nhằm áp dụng các cấu hình ta vừa đặt ở trên.

Cuối cùng ta đăng nhập bằng tài khoản `root` và thực hiện thử truy vấn SQL đơn giản để kiểm tra.

Để đăng nhập ta thực hiện lệnh `mariadb -u root -p`, khi được hỏi mật khẩu ta cần nhập mật khẩu đã được cấu hình ở bước trên, kết quả sẽ như sau:

```
$ mariadb -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 57
Server version: 10.4.10-MariaDB-1:10.4.10+maria~bionic-log mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

Tiếp theo ở dấu nhắc lệnh của MariaDB ta có thể thực hiện các truy vấn SQL để kiểm tra nó có hoạt động không:

```
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.002 sec)

MariaDB [(none)]> select host, user from mysql.user;
+-----------+-------+
| Host      | User  |
+-----------+-------+
| %         | root  |
| localhost | mysql |
| localhost | root  |
+-----------+-------+
3 rows in set (0.003 sec)

MariaDB [(none)]> 
```




### Thiết lập cho phép đăng nhập MariaDB từ xa
Khi có nhu cầu đăng nhập và sử dụng MariaDB trên các hệ thống khác như các công cụ quản trị database hoặc đăng nhập từ xa, ta cần cấu hình để cấp quyền truy cập cho tài khoản mà ta muốn đăng nhập. Để thực hiện ta cần truy cập vào MariaDB và chạy các lệnh sau:

```
MariaDB [(none)]> CREATE USER 'root'@'%' IDENTIFIED BY 'P@ssw0rd';

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

MariaDB [(none)]> FLUSH PRIVILEGES;
```

Kết quả sẽ như sau:

```
MariaDB [(none)]> CREATE USER 'root'@'%' IDENTIFIED BY 'P@ssw0rd';
Query OK, 0 rows affected (0.003 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> 
```