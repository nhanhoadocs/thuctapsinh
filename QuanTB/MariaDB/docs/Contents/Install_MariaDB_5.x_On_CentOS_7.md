# Install MariaDB-5.x on CentOS-7



### Cập nhật OS, cài đặt repository và các gói bổ trợ

```
$ sudo yum update -y

$ sudo yum install -y epel-release

$ sudo yum install -y yum-utils wget git byobu
```




## Thêm repository chính thức của MariaDB-5.x và cập nhật lại OS
Để thêm repository chính thức của MariaDB-5.x ta chạy lệnh sau:

```
$ sudo tee /etc/yum.repos.d/MariaDB-5.x.repo<<EOF
# MariaDB 5.5 CentOS repository list - created 2019-11-29 09:05 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/5.5/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

$ sudo yum update -y
```




### Cài đặt MariaDB-5.x
Thực hiện cài đặt MariaDB-5.x

```
$ yum install -y MariaDB-server MariaDB-client
```




### Khởi động MariaDB và bật MariaDB khởi động cùng hệ thống

```
$ sudo systemctl enable mysql
$ sudo systemctl start mysql
```

Kiểm tra trạng thái và phiên bản của MariaDB

```
$ sudo systemctl status mysql
$ mysql -V
```

Ta có kết quả như sau:

```
$ sudo systemctl status mysql
● mysql.service - LSB: start and stop MariaDB
   Loaded: loaded (/etc/rc.d/init.d/mysql; bad; vendor preset: disabled)
   Active: active (running) since Fri 2019-11-29 04:35:45 EST; 6s ago
     Docs: man:systemd-sysv-generator(8)
  Process: 1841 ExecStart=/etc/rc.d/init.d/mysql start (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/mysql.service
           ├─1847 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --pid-file=/var/lib/mysql/CentOS-7-1908.pid
           └─1946 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --user=mysql --log-error=/var/lib/mysql/CentOS-7-...

Nov 29 04:35:42 CentOS-7-1908 systemd[1]: Starting LSB: start and stop MariaDB...
Nov 29 04:35:42 CentOS-7-1908 mysql[1841]: Starting MariaDB.191129 04:35:42 mysqld_safe Logging to '/var/lib/mysql/CentOS-7-1908.err'.
Nov 29 04:35:42 CentOS-7-1908 mysql[1841]: 191129 04:35:42 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
Nov 29 04:35:44 CentOS-7-1908 mysql[1841]: . SUCCESS!
Nov 29 04:35:45 CentOS-7-1908 systemd[1]: Started LSB: start and stop MariaDB.
$ mysql -V
mysql  Ver 15.1 Distrib 5.5.66-MariaDB, for Linux (x86_64) using readline 5.1
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
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] Y
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


Cleaning up...
```

Trong đó:
- Tại dòng `Enter current password for root (enter for none): ` yêu cầu ta nhập mật khẩu của tài khoản `root` (Tài khoản `root` trong quản trị cơ sở dữ liệu, không phải tài khoản `root` hệ thống), ở đây ta ấn `Enter` để bỏ qua vì mặc định trong MariaDB-5.x tài khoản `root` không có mật khẩu.

- Tại dòng `Set root password? [Y/n] ` cho phép ta đặt mật khẩu cho user `root`. Để đặt mật khẩu ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `New password: ` và `Re-enter new password: ` ta lần lượt nhập mật khẩu mới và xác nhận mật khẩu.

- Tại dòng `Remove anonymous users? [Y/n] ` cho phép ta xóa tài khoản `anonymous`, `anonymous` là tài khoản mặc định ngay từ khi cài đặt MariaDB. Để xóa `anonymous` user ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Disallow root login remotely? [Y/n]` cho phép ta vô hiệu hóa tính năng đăng nhập từ xa đối với tài khoản `root`. Để vô hiệu hóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Remove test database and access to it? [Y/n]` cho phép ta xóa cơ sở dữ liệu `test`, một cơ sở dữ liệu được tạo mặc định ngay từ khi cài đặt MariaDB. Để xóa ta ấn `Y` và `n` để bỏ qua.

- Tại dòng `Reload privilege tables now? [Y/n]` ta ấn `Y` để Reload privilege nhằm áp dụng các cấu hình ta vừa đặt ở trên.

Cuối cùng ta đăng nhập bằng tài khoản `root` và thực hiện thử truy vấn SQL đơn giản để kiểm tra.

Để đăng nhập ta thực hiện lệnh `mysql -u root -p`, khi được hỏi mật khẩu ta cần nhập mật khẩu đã được cấu hình ở bước trên, kết quả sẽ như sau:

```
$ mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 5.5.66-MariaDB MariaDB Server

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
3 rows in set (0.01 sec)

MariaDB [(none)]> 
```




### Thiết lập cho phép đăng nhập MariaDB từ xa
Khi có nhu cầu đăng nhập và sử dụng MariaDB trên các hệ thống khác như các công cụ quản trị database khác hoặc đăng nhập từ xa, ta cần cấu hình cấp quyền truy cập cho tài khoản `root`, ta cần thực hiện các lệnh sau để cấp quyền và áp dụng cấu hình:

```
MariaDB [mysql]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

MariaDB [mysql]> FLUSH PRIVILEGES;
```

Kết quả sẽ như sau:

```
MariaDB [mysql]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
Query OK, 0 rows affected (0.00 sec)

MariaDB [mysql]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

MariaDB [mysql]> 
```