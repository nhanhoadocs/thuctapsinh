# Install MariaDB on CentOS 7  
## **Contents** 
**I.** [Cài đặt MariaDB](#I)  

1. [Cài đặt mặc định](#1)  

2. [Cài đặt qua Repo](#2)  

   a. [Thêm Repo vào server](#a)  
   b. [Cài đặt MariaDB 10.0.30](#b) 

3. [Các lệnh quản lý](#3)

4. [File cấu hình](#4)

5. [Thiết lập bảo mật cho user database](#5) 



## Mô hình 

<img src ="../../../images/25 bai linux/mariadb.png">  


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
     # yum install mariadb-server
   ``` 
- Sau khi hoàn tất cài đặt, sử dụng lệnh `systemctl start` để khởi động dịch vụ MariaDB:
   ```sh
     # systemctl start mariadb
   ``` 
- Nếu muốn để MariaDB khởi động cùng hệ điều hành, sử dụng lệnh:  
   ```sh
     # systemctl enable mariadb
   ``` 
- `systemctl` không hiển thị kết quả của các lệnh quản lý dịch vụ nên để chắc chắn dịch vụ hoạt động nên kiểm tra trạng thái hoạt động của MariaDB trên CentOS 7 bằng lệnh:  
   ```sh
     # systemctl status mysql
   ``` 

<a name ="2"></a>

### 2. Cài đặt qua repo
<a name ="a"></a>
> ### Tại sao phải thêm repo vào server? Cách thêm repo.  
- Repository mặc định trên CentOS 7 cung cấp một bộ cài MariaDB, muốn dùng bản mới hơn thì phải thêm repo của MariaDB vào.  
- Cách thêm repo:  
   - Tìm kiếm các phiên bản khác của MariaDB tại [***đây***](https://downloads.mariadb.org/mariadb/+releases/). Ở đây mình dùng MariaDB phiên bản 10.0.30  
   - Thêm repo bằng câu lệnh:  
      ```sh
        # vi /etc/yum.repos.d/mariadb.repo
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
    **Giải thích:**   
   `name` = tên của kho lưu trữ  
   `baseurl` = đường dẫn tới kho lưu trữ   
   `gpg` là viết tắt của GNU Private Guard, là một loại chữ kí số giúp bảo vệ quyền riêng tư. Nếu đặt giá trị gpgcheck =1 thì nó sẽ xác thực gói bằng cách  kiểm tra chữ ký GPG. Đặt gpgcheck=0 để bỏ qua xác thực hoặc trong trường hợp gói không được đăng ký.  
   `gpgcheck` = cài đặt bato mật(1=có,0=không)    
   `enable` = trạng thái của kho lưu trữ(1=bật,0=tắt)  
   `gpgkey` = đường dẫn của file key(nếu có)
    - Lưu lại và kiểm tra phiên bản của MariaDB-Server sau khi thêm repo mới:  
      ```sh
        # yum info mariadb-server
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
    - Gỡ cài đặt phiên bản MariaDB trước, sử dụng lệnh:  
      ```sh
      yum erase mysql
      ```
      hoặc  
      ```sh
      yum remove mysql
      ```
      Và [gỡ các gói liên quan](http://networkstip.blogspot.com/2018/12/completely-remove-mariadb-or-mysql-from.html)  

      ```sh
        # rm -rf /var/lib/mysql/
        # rm /etc/my.cnf
      ``` 
  <a name ="b"></b>
    - Cài đặt **`MariaDB 10.0.30`**    
      ```sh
        # yum install -y mariadb-server
      ``` 
   - Khởi động dịch vụ MariaDB  
      ```sh
        # systemctl start mariadb
      ```
   - Kiểm tra lại version  
      ```sh
        # yum list installed | grep mariadb
      ```
   - Kiểm tra trạng thái dịch vụ

      ```sh
      systemctl status mysql
      ```

<a name ="3"></a>  

### 3. Các dòng lệnh quản lý  
- Kiểm tra user, group  
   ```sh
     # cat /etc/passwd | grep mysql
   mysql:x:27:27:MariaDB Server:/var/lib/mysql:/sbin/nologin
   ```
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
     # netstat -plnt | grep mysql
  tcp6       0      0 :::3306                 :::*                    LISTEN      3679/mysqld
   ``` 
Theo mặc định, `MariaDB` sử dụng cổng mặc định là cổng 3306.

<a name ="4"></a>
### 4. File cấu hình  
- Tập tin cấu hình gốc:  
   ```sh
   /etc/my.cnf
   ``` 
- Log files  
   ```sh
   /var/log/mariadb
   ``` 
   ```sh
   log_error = /var/log/mariadb/mariadb.log
   ```
- Network settings  
    - Trên máy chủ, MariaDB được mặc định chạy cổng 3306 và có thể thay đổi được.
    - Cổng trên máy client báo cho máy client cổng kết nối theo mặc định(thường thì cổng trên server và client sẽ giống nhau nhưng cũng có thể thay đổi khác nhau tùy chúng ta cấu hình).  
    - Thường sẽ không tìm thấy cấu hình cổng trong tệp cấu hình do cổng đang được chạy mặc định là cổng 3306. Để thay đổi cổng, bạn thêm vào file cấu hình các câu lệnh sau:  
      ```sh
      [client]
      port = [cong ban muon sua]

      [mysqld]
      port = [cong ban muon sua]
      ```
   - Bằng cách liên kết với localhost máy chủ đảm bảo không ai có thể kết nối với nó từ bên ngoài máy cục bộ. Nếu muốn truy cập từ xa đến máy chủ MariaDB, bạn có thể đặt địa chỉ IP liên kết(bind-address) là IP Public của bạn(tìm google với từ khóa `what is my ip` để xem [địa chỉ IP Public](https://bkaii.com.vn/tin-nganh-2/132-khai-niem-co-ban-ve-ip-ip-public-va-ip-private)). Nếu không nhìn thấy `bind-address` , bạn nên thêm vào `mysqld` để giúp kiểm soát quyền truy cập vào máy chủ. Ví dụ: 

      ```sh
      [mysqld]
      bind-address = 127.0.0.1
      ```
- Thư mục chứa `database` là: `/var/lib/mysql`

[Tham khảo](https://support.rackspace.com/how-to/configure-mariadb-server-on-centos/)
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



  
## TÀI LIỆU THAM KHẢO  
- [https://www.digitalocean.com/](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7)  
- [huong-dan-cai-dat-mariadb-tren-centos-7/](https://bigvn.net/huong-dan-cai-dat-mariadb-tren-centos-7/#tao-user-database-va-database)  
- [quản lý database bằng giao diện web.](https://www.thuysys.com/server-vps/web-server/phpmyadmin-huong-dan-quan-tri-co-du-lieu-co-ban.html)  
- [https://www.oreilly.com/](https://www.oreilly.com/library/view/learning-mysql-and/9781449362898/ch04.html) 
- [mysql-insert-query](https://www.tutorialspoint.com/mysql/mysql-insert-query) 
- [configure-mariadb-server-on-centos/](https://support.rackspace.com/how-to/configure-mariadb-server-on-centos/)
- https://www.codehub.vn/Cac-khai-niem-duoc-chuyen-gia-su-dung-trong-Network