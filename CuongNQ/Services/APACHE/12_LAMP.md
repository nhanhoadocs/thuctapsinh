# LAMP Stack
## **1) Technology Stack**
- Một chương trình hoàn thiện không chỉ có code , mà còn phải có nền tảng hệ điều hành và những phần mềm đi kèm ( web server , cơ sở dữ liệu ) . Người ta gom những thứ này lại với nhau , tạo thành **Technology Stack** .
- **Technology Stack** - còn gọi là **Solution Stack** , là một tập hợp những phần mềm/công nghệ phối hợp chung với nhau , tạo thành một nền tảng để ứng dụng có thể hoạt động được .

    <img src=https://i.imgur.com/YZkH6UD.png>

- Cấu tạo của 1 **Stack** :
    - **OS**
    - **Web Server**
    - **Database Server**
    - **Back-end Programming Language**

## **2) Một số loại Stack**
### **2.1) LAMP Stack**
- Đây là **stack** thông dụng nhất , được hầu hết các website sử dụng . 

    <img src=https://i.imgur.com/yWLoBmL.jpg>

- **LAMP Stack** bao gồm :
    - `Linux` - OS
    - `Apache` - Web Server
    - `MySQL/MariaDB` - Database Server
    - `PHP/Python/Perl` - Back-end Programming Language
- Tất cả đều là Open Source , không mất phí bản quyền .
### **2.2) WISA Stack**
- **WISA Stack** này được nhiều công ty, tổ chức sử dụng .
- **WISA Stack** bao gồm :
    - `Windows` - OS
    - `IIS` - Web Server
    - `SQL Server` - Database Server
    - `ASP.NET` - Back-end Programming Language
- Ưu điểm của stack này là tốc độ phát triển ứng dụng và khả năng bảo trì : `C#` là một ngôn ngữ khá mạnh mẽ , `ASP.NET` làm việc rất tốt với `SQL Server`, có nhiều tool hỗ trợ tận răng cho người dùng .
- Tuy vậy, sử dụng hàng của Microsoft thì chi phí bản quyền ( mua Visual Studio để code , bản quyền Window , SQL Server ) khá cao , do đó các công ty nhỏ thường không sử dụng .
### **2.3) MEAN Stack**
- Là **stack** khá nổi bật trong vài năm trở lại đây .

    <img src=https://i.imgur.com/p72wzGP.png>

- **MEAN Stack** bao gồm :
    - `MongoDB`
    - `Express`
    - `AngularJS`
    - `NodeJS`
- **Stack** này không hoàn toàn đúng chuẩn **stack** vì nó không bao gồm hệ điều hành .
- Cũng như **LAMP Stack** , toàn bộ các thành phần của **MEAN Stack** đều là Open Source .
- Toàn bộ các thành phần của **MEAN** đều sử dụng ngôn ngữ **Java Script** => có thể xây dựng toàn bộ một hệ thống chỉ bằng một ngôn ngữ duy nhất , chạy ở cả **front-end** và **back-end** , tiết kiệm thời gian và chi phí .
## **3) Cài đặt LAMP Stack ( Linux , Apache , MariaDB , PHP )**
### **3.1) Cài đặt Apache ( `2.4.6` )**
- **B1 :** Cài đặt `httpd` qua `yum` :
    ```
    # yum install -y httpd
    ```
- **B2 :** Khởi động và cấu hình startup cho dịch vụ :
    ```
    # systemctl start httpd
    # systemctl enable httpd
    ```
- **B3 :** Cấu hình **firewalld** cho phép dịch vụ `http` :
    ```
    # firewall-cmd --zone=public --permanent --add-service=http
    # firewall-cmd --reload
    ```
- **B4 :** Kiểm tra phiên bản **Apache** đã cài đặt :
    ```
    # httpd -v
    ```
    <img src=https://i.imgur.com/uBUwAId.png>
- **B5 :** Kiểm tra dịch vụ **Apache** đã lắng nghe port `80` hay chưa :
    ```
    # netstat -natp | grep httpd
    ```
    <img src=https://i.imgur.com/yYWsE3x.png>
- **B6 :** : Truy cập vào Web Server thông qua client :
    ```
    http://<ip_web_server>
    ```
    <img src=https://i.imgur.com/CJNjqC2.png>
### **3.2) Cài đặt MariaDB ( `10.4.6` )**
- **B1 :** Khởi tạo thông tin repository **MariaDB** để chương trình `yum` biết nguồn tải cài đặt **MariaDB** :
    ```
    # vi /etc/yum.repos.d/MariaDB.repo
    ```
    - Thêm vào nội dung sau :
        ```
        [mariadb]
        name = MariaDB
        baseurl = http://yum.mariadb.org/10.4.6/centos7-amd64
        gpgkey=http://yum.mariadb.org/RPM-GPG-KEY-MariaDB
        gpgcheck=1
        ```
- **B2 :** Cập nhật lại thông tin các repository :
    ```
    # yum repolist
    ```
- **B3 :** Cài đặt **MariaDB** :
    ```
    # yum install MariaDB-server MariaDB-client MariaDB-devel -y
    ```
- **B4 :** Khởi động và cấu hình startup cho dịch vụ :
    ```
    # systemctl start mariadb.service
    # systemctl enable mariadb.service
    ```
- **B5 :** Kiểm tra phiên bản **MariaDB** :
    ```
    # mariadbd -V
    ```
    <img src=https://i.imgur.com/rbBVlrK.png>
- **B6 :** Kiểm tra xem tiến trình **MariaDB** có chạy không :
    ```
    # ps aux | grep -v "grep" | grep mysql
    ```
    <img src=https://i.imgur.com/6U2yxRR.png>
- **B7 :** Kiểm tra xem dịch vụ có listen port `3306` không :
    ```
    # ss -lntp | grep "3306"
    ```
    <img src=https://i.imgur.com/CTpG5WZ.png>
### **3.3) Cài đặt PHP ( `7.3` )**
- **B1 :** Cài đặt repo **EPEL** :
    ```
    # yum install -y epel-release.noarch
    ```
- **B2 :** Cài đặt gói `yum-utils`
    ```
    # yum install -y yum-utils
    ```
- **B3 :** Cài repository của **REMI** :
    ```
    # wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    ```
- **B4 :** Cài đặt repo **REMI `7`** :
    ```
    # rpm -Uvh remi-release-7.rpm
    ```
- **B4 :** Kích hoạt repo **REMI `7`** sử dụng cho **PHP `7.3`** :
    ```
    # yum-config-manager --disable remi-php54
    # yum-config-manager --enable remi-php73
    ```
- **B5 :** Tiến hành cài đặt **PHP `7.3`** cùng 1 số module hỗ trợ :
    ```
    # yum install php
    ```
- **B6 :** Kiểm tra phiên bản **PHP** trên CentOS :
    ```
    # php -v
    ```
    <img src=https://i.imgur.com/Mx9K5fc.png>
- **B7 :** Tạo file `info.php` để test dịch vụ :
    ```
    # vi /var/www/html/info.php
    ```
    - Thêm vào nội dung sau :
        ```
        <?php
        phpinfo();
        ?>
- **B8 :** Khởi động lại dịch vụ **Apache** :
    ```
    # systemctl restart httpd
    ```
- **B9 :** Truy cập vào Web Server thông qua client :
    ```
    http://192.168.5.40/info.php
    ```
    <img src=https://i.imgur.com/BV4dEdU.png>