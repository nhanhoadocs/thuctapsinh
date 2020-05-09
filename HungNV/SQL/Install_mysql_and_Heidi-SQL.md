# Cài đặt mariadb và sử dụng Hedi sql để truy cập và chỉnh sửa cơ sở dữ liệu 

#### 1. Cài đặt mariadb 10X : 

 + **Thêm kho lưu trữ của mariadb** 
```
tee /etc/yum.repos.d/MariaDB.repo<<EOF
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1 
EOF
```
- **Cập nhật bộ đệm**
```
yum makecache fast
```

- **Gỡ cài đặt các phiên bản mariadb trước**
```
yum erase mysql
rm -rf /var/lib/mysql
rm /etc/my.cnf
```

- **Tiến hành cài đặt mariadb**
```
yum -y install MariaDB-server
```

- **Khởi động lại dịch vụ mariadb**
```
systemctl start mariadb
```

- **Kiểm tra trạng thái mariadb**
```
systemctl status mariadb
```

- **Đăng nhập và kiểm tra phiên bản**
```
[root@SQL ~]# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 27
Server version: 10.4.11-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

- **Tạo user và pass để đăng nhập từ xa**. 

Ở đây tạo user `viethung` với mật khẩu `0123`

```
MariaDB [(none)]> create user viethung;
Query OK, 0 rows affected (0.00 sec)
```
```
MariaDB [(none)]> grant all privileges on *.* to "viethung"@"%" identified by "0123";
Query OK, 0 rows affected (0.00 sec)
```

#### 2. Sử dụng HeidiSQL để kết nối tới mariadb 

B1: Cài đặt HeidiSQl

B2: Tạo 1 session để kết nối tới mariadb

![Imgur](https://i.imgur.com/G033mEA.png)

B3: Chọn Network type là `MySQL (TCP/IP)`, điền địa chỉ ip của Mariadb server, điền user và password đã tạo ở trên. 

![Imgur](https://i.imgur.com/51adKaJ.png)

B4: Chọn `Yes` để tiếp tục. 

![Imgur](https://i.imgur.com/fo9XwO1.png)

Kết quả sau khi kết nối sẽ như này, bây giờ ta có thể thao tác với mariadb thông qua trình điều khiển này. 

![Imgur](https://i.imgur.com/EMjGuuq.png)



