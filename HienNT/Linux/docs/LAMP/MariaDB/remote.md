# Quản lý database bằng MySQL Workbench  
## **Contents**  
[Mô hình](\a1)  
[Chuẩn bị](\a2)  
[Nội dung](\a3)  
  - [Kiểm tra user database trên máy ảo](\a4)  
  - [Kết nối từ MySQL Workbench](\a5)

<a name = "a1"></a>
## Mô hình  

<img src ="..\..\..\images\25 bai linux\mysql workbench.png">  

<a name = "a2"></a>

## Chuẩn bị  
- 1 máy thật có cài MySQL Workbench  
- 1 máy ảo trên máy thật:  
  - Cài hệ điều hành CentOS 7  
  - Có kết nối Internet.  
  - Cài MariaDB Server  
  - Có user database dùng để truy cập từ xa vào  
- Các thông số phần cứng trên máy ảo:  
  - CPU: Intel(R) Pentium(R) CPU  N3540  @ 2.16GHz
  - RAM: 1GB  
  - Ổ đĩa: 20GB     

<a name ="a3"></a> 

## Nội dung  

<a name ="a4"></a>

### 1. Kiểm tra user database trên máy ảo  
- Kiểm tra kết nối bằng lệnh ping và telnet: 
  - Kết nối thành công khi máy thật và máy ảo có thể ping thông được với nhau  
  - Nếu không thể ping được, kiểm tra lại trạng thái của firewalld, selinux trên máy ảo và firewall trên máy thật.Nếu tường lửa đang hoạt động thì tạm thời tắt tường lửa đi rồi ping lại.
- Kiểm tra đăng nhập:   
  Đăng nhập vào user bạn muốn dùng để quản lý database  
  ```sh
  [root@thuyhien ~]# mysql -u test -p
  Enter password:
  ERROR 1045 (28000): Access denied for user 'test'@'localhost' (using password: YES)
  ```  
  Kết quả sẽ thông báo lỗi do user bạn dùng đăng nhập có phần hostname không phải là localhost.  

- Kiểm tra cổng kết nối:  
  ```sh
  [root@thuyhien ~]# netstat -plnt | grep mysql
  tcp        0      0 192.168.136.129:3306    0.0.0.0:*               LISTEN      2005\mysqld
  ```  
  Nếu kết quả hiển thị như trên nghĩa là cổng 3306(cổng mặc định của dịch vụ MySQL\MariaDB) đã được mở. Địa chỉ `192.168.136.129` là địa chỉ mạng của máy ảo. Lúc này mặc dù máy ảo và máy thật ping thông(cũng có thể telnet đến máy ảo từ cổng 3306) nhưng vẫn chưa đủ để có thể truy cập vào database từ máy client. Để cho phép máy client có thể truy cập vào database trên Server bạn vào chỉnh sửa file `\etc\my.cnf` và thêm dòng lệnh:  
  ```sh
  bind-address = 0.0.0.0
  ```  
  Sau đó `restart` lại dịch vụ `MariaDB`:
  ```sh
  [root@thuyhien ~]# systemctl restart mysql
  ```  
  Kiểm tra lại cổng, kết quả sẽ là:  
  ```sh
  tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      2378\mysqld
  ```  
- Kiểm tra đăng nhập lại, lúc này user đã có thể đăng nhập thành công  
  ```sh
  [root@thuyhien ~]# mysql -u test -p
  Enter password:
  Welcome to the MariaDB monitor.  Commands end with ; or \g.
  Your MariaDB connection id is 4
  Server version: 10.0.30-MariaDB MariaDB Server

  Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

  Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

  MariaDB [(none)]>
  ```  
- Kiểm tra user vừa đăng nhập đã có database chưa:  
  ```sh
  MariaDB [(none)]> show databases;
  +--------------------+
  | Database           |
  +--------------------+
  | information_schema |
  +--------------------+
  1 row in set (0.00 sec)
  ```  
  Kết quả như trên là user đã có database.  

<a name ="a5"></a>

### 2. Kết nối vào database trên máy ảo bằng MySQL Workbench  
Truy cập vào phần mềm `MySQL Workbench` trên máy thật của bạn. Ở mục hiển thị `MySQL Connection` chọn dấu **"+"** để thêm user kết nối. 

<img src ="..\..\..\images\25 bai linux\anh1.png">  

Sau đó nhập vào tên của kết nối, địa chỉ IP của server, cổng dùng để kết nối với server, user dùng để kết nối và password của user.  
   
<img src ="..\..\..\images\25 bai linux\anh2.png">

Cuối cùng bấm `OK` để hoàn thành kết nối.  

Giao diện khi kết nối thành công  

<img src ="..\..\..\images\25 bai linux\anh3.png">  
