# Install MariaDB-10.x on CentOS-8



### Cập nhật OS, cài đặt repository và các gói bổ trợ

```
$ sudo dnf update -y

$ sudo dnf install -y epel-release

$ sudo dnf install -y dnf-utils wget git byobu
```




### Thêm repository chính thức của MariaDB-10.x và cập nhật lại OS

```
$ sudo tee /etc/yum.repos.d/MariaDB-10.x.repo<<EOF
# MariaDB 10.4 CentOS repository list - created 2019-11-30 18:18 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos8-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

$ sudo dnf update -y
```




### Cài đặt MariaDB-10.x
Thực hiện cài đặt MariaDB-10.x

```
$ sudo dnf install boost-program-options
$ sudo dnf --disablerepo=AppStream install -y MariaDB-server MariaDB-client
```




### Khởi động MariaDB và bật MariaDB khởi động cùng hệ thống
Khởi động MariaDB và cho phép MariaDB khởi động cùng hệ thống

```
$ sudo systemctl enable mariadb
$ sudo systemctl start mariadb
```

Kiểm tra trạng thái và phiên bản của MariaDB

```
$ sudo systemctl status mariadb
$ mysql -V
```

Ta có kết quả như sau:

```
$ sudo systemctl status mariadb
● mariadb.service - MariaDB 10.4.10 database server
   Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/mariadb.service.d
           └─migrated-from-my.cnf-settings.conf
   Active: active (running) since Sat 2019-11-30 13:23:39 EST; 12s ago
     Docs: man:mysqld(8)
           https://mariadb.com/kb/en/library/systemd/
  Process: 11063 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
  Process: 11021 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`/usr/bin/galera_recovery`; [ $? -eq 0 ]   && systemctl set-environment>
  Process: 11019 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
 Main PID: 11032 (mysqld)
   Status: "Taking your SQL requests now..."
    Tasks: 30 (limit: 4924)
   Memory: 109.3M
   CGroup: /system.slice/mariadb.service
           └─11032 /usr/sbin/mysqld

Nov 30 13:23:38 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:38 0 [Note] InnoDB: 10.4.10 started; log sequence number 139827; transaction id 21
Nov 30 13:23:38 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:38 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
Nov 30 13:23:38 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:38 0 [Note] Plugin 'FEEDBACK' is disabled.
Nov 30 13:23:38 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:38 0 [Note] InnoDB: Buffer pool(s) load completed at 191130 13:23:38
Nov 30 13:23:38 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:38 0 [Note] Server socket created on IP: '::'.
Nov 30 13:23:39 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:39 0 [Note] Reading of all Master_info entries succeeded
Nov 30 13:23:39 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:39 0 [Note] Added new Master_info '' to hash table
Nov 30 13:23:39 CentOS-8-1905 mysqld[11032]: 2019-11-30 13:23:39 0 [Note] /usr/sbin/mysqld: ready for connections.
Nov 30 13:23:39 CentOS-8-1905 mysqld[11032]: Version: '10.4.10-MariaDB'  socket: '/var/lib/mysql/mysql.sock'  port: 3306  MariaDB Server
Nov 30 13:23:39 CentOS-8-1905 systemd[1]: Started MariaDB 10.4.10 database server.
$  mariadb -V
mariadb  Ver 15.1 Distrib 10.4.10-MariaDB, for Linux (x86_64) using readline 5.1
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
Your MariaDB connection id is 20
Server version: 10.4.10-MariaDB MariaDB Server

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
3 rows in set (0.003 sec)

MariaDB [(none)]> select user, host from mysql.user;
+-------+-----------+
| User  | Host      |
+-------+-----------+
| mysql | localhost |
| root  | localhost |
+-------+-----------+
2 rows in set (0.003 sec)

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
Query OK, 0 rows affected (0.004 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> 
```