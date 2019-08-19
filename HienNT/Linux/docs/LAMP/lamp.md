
<p align=center><img src = "../../images/25 bai linux/FMGHI1TJTCRJJZE.LARGE.jpg" width=140% ></p>

# Hướng dẫn cài đặt LAMP(Linux,Apache,MySQL,PHP) trên CentOS 7  
## Giới thiệu  
- `LAMP` là gói kết hợp giữa hệ điều hành và bộ phần mềm mã nguồn mở. Danh từ `LAMP` là từ viết tắt lấy từ những chữ cái đầu của **L**inux, **A**pache HTTP Server, **M**ySQL/ **M**ariaDB database, và **P**HP/**P**earl/**P**ython.  

## Các bước cài đặt  
**<h3>1.Cài đặt Apache</h3>**  

- `Apache` là nền tảng Web Server mã nguồn mở. Apache bao gồm đầy đủ các tính năng của máy chủ Web bao gồm CGI, SSL và các domain ảo.
- Các bước tiến hành:  
  \- Bước 1: Cài đặt gói `httpd` 
     ```sh
      yum istall -y httpd 
    ``` 

   > `httpd:` là dịch vụ web chính của máy chủ, khi httpd chết thì web bạn cũng chết theo, httpd tạo ra nhiều PID(process id-số hiệu tiến trình) để phục vụ website của bạn, càng nhiều tiến trình thì càng tốn ram, khi bị DDOS(Distributed Denial of Service-tấn công từ chối truy cập) thì quá nhiều tiến trình httpd tạo ra có thể dẫn đến VPS treo. httpd thường được cài php vào để phục vụ mã nguồn php. Các lỗi không vào được web phần lớn liên quan đến dịch vụ này. 

  + option `-y`:  khi dùng lệnh `yum install` để cài đặt, bạn sẽ được hỏi để xác nhận là có cài đặt hay không, option `-y` sẽ tự động trả lời yes.
  + Đường dẫn file cấu hình Apache:

  
    ```sh
      /etc/httpd/conf/httpd.conf
    ```  
   \- Bước 2: Khởi động **web server Apache** và cấu hình **startup service** cho Apache.  
   ```sh
    [root@hiennt conf]# systemctl start httpd
    [root@hiennt conf]# systemctl enable httpd

    Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.  
    [root@hiennt conf]#
    ```

    \- Kiểm tra phiên bản Apache vừa cài đặt trên CentOS 7:  
    ```sh
    [root@hiennt conf]# httpd -v
    Server version: Apache/2.4.6 (CentOS)
    Server built:   Apr 24 2019 13:45:48
    [root@hiennt conf]#
    ```  
  
    \- Kiểm tra dịch vụ Apache đã lắng nghe cổng 80 chưa:  
    ```sh
    [root@hiennt conf]# netstat -nap | grep httpd
    tcp6       0      0 :::80                   :::*                    LISTEN      13257/httpd
    [root@hiennt conf]#
    ```  
    ==> Đã lắng nghe được cổng 80  

    \- Tắt tường lửa trên máy cài Apache  
    ```sh
    [root@hiennt ~]# systemctl stop firewalld
    ```  
    > #### Firewall, SELinux?
- `SELinux` là gì?    
SELinux(Security-Enhanced Linux) là một tính năng của Linux cung cấp cơ chế hỗ trợ các chính sách bảo mật, kiểm soát truy cập vào ứng dụng/file.   
- `Firewalld` là gì?  
Firewalld là một phần của hệ thống máy tính hoặc mạng được thiết kế để chặn truy cập trái phép trong khi cho phép liên lạc được ủy quyền. Nó là 1 thiết bị hoặc 1 bộ thiết bị được cấu hình để: cho phép, từ chối, mã hóa, giải mã hoặc ủy quyền tất cả lưu lượng máy tính(vào và ra) giữa các miền bảo mật khác nhau dựa trên 1 bộ quy tắc và tiêu chí.  
- Tại sao phải tắt Firewall, SELinux?  
`httpd` chạy port 80, firewalld trên CentOS 7 mặc định block port 80 trên server ==> tắt firewalld/mở port trên server để có thể truy cập dịch vụ web.
  
  \- Kiểm tra httpd có đang chạy hay không?  
  ```sh
  service httpd status  
  ```  
     - Nếu đang chạy thì chạy port bao nhiêu?  
     ```sh
     netstat -apn | grep httpd  
     ```
  \- Truy cập vào địa chỉ IP của Server để kiểm tra  
    ```sh
     http://192.168.136.129
    ```
    Kết quả:  

    <p align=center><img src ="../../images/25 bai linux/test apache.png"></p>  

    \- Nếu trong mạng có Firewall hoặc Router, mở port cho Apache Server trong trường hợp muốn truy cập thông qua remote.  
    Câu lệnh: 
    ```sh
    [root@hiennt ~]# firewall-cmd --permanent --add-service=http
    success
    [root@hiennt ~]# systemctl restart firewalld
    [root@hiennt ~]#
    ```  
- File cấu hình Apache    
  - File cấu hình Apache: /etc/httpd/conf/httpd.conf  
  - Thư mục chứa cấu hình phụ Apache: /etc/httpd/conf.d/  
  - Thư mục log Apache: /var/log/httpd/
  - Thư mục web mặc định: /var/www/html/  



**<h3>2.Cài đặt MySQL - MariaDB</h3>**  
`MariaDB` là một nhánh của cộng đồng phát triển hệ thống quản lý cơ sở dữ của hệ quản trị cơ sở dữ liệu quan hệ MySQL. Về cơ bản, nó sẽ tổ chức và cung cấp quyền truy cập vào các cơ sở dữ liệu nơi trang web cần lưu giữ thông tin.   

   \- Bước 1: Lấy ra và cài đặt gói phần mềm  
   ```sh 
   [root@hiennt ~]# yum install mariadb-server mariadb  
   ```  
   \- Sau khi cài xong, khởi động MariaDB với lệnh:  
   ```sh
   [root@hiennt ~]# systemctl start mariadb  
   ```  
   \- Đặt password cho MySQL:  
   ```sh
   [root@hiennt ~]# mysql_secure_installation  
   ```  
   \- Kích hoạt MariaDB bắt đầu khởi động:  
   ```sh
   [root@hiennt ~]# systemctl enable mariadb
   Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.  
   ```  

**<h3>3.Cài đặt PHP</h3>**  
- `PHP` là viết tắt của Hypertext Pre-processor là ngôn ngữ mã nguồn mở, dùng để phát triển Web, có thể được nhúng vào HTML; trước đó là Personal Home Pages - Trang chủ cá nhân.  
- Phiên bản PHP đi kèm với CentOS là mặc định khá cũ (PHP 5.4). Trong bài viết này sẽ là hướng dẫn cài đặt các phiên bản PHP mới hơn PHP 7.3 từ kho Remi.   
  - Cài đặt kho lưu trữ EPEL  
    ```sh
    yum install epel-release yum-utils  
    ```  
  - Cài đặt REMI Repo
    ```sh
    rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    ```
  - Kiểm tra các Repo nào đang được bật
    ```sh
    yum repolist
    ```  
  - Cài đặt `yum-utils` - tập hợp các chương trình hữu ích để quản lý các gói và gói yum. Nó có các công cụ cải thiện các tính năng mặc định của yum. 
    ```sh
    yum install yum-utils
    ```  
  - Sử dụng `yum-config-manager` kích hoạt kho lưu trữ Remi làm kho lưu trữ mặc định để cài đặt các phiên bản PHP khác nhau và cài đặt PHP như sau:
    ```sh
    yum-config-manager --enable remi-php73 
    ```  
  - Cài đặt PHP 7 với các mô-đun cần thiết bổ sung có thể mở rộng chức năng cốt lõi:
    ```sh  
    yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
    ```
  - Kiểm tra version PHP
    ```sh
    php -v
    ```  

    INPUT
    ```sh
    PHP 7.3.8 (cli) (built: Jul 30 2019 09:26:16) ( NTS )
    Copyright (c) 1997-2018 The PHP Group
    Zend Engine v3.3.8, Copyright (c) 1998-2018 Zend Technologies
    ```

- Để kiểm tra xác minh rằng hệ thống của bạn được cấu hình đúng cho PHP:
  - Tạo một tập lệnh PHP cơ bản có tên là `test.php`  
    ```sh
    touch /var/www/html/test.php
    ```  
  - Thêm mã PHP sau vào tệp:  
    ```sh
    <?php echo 'Test PHP';?>
    ```  
  - Dùng trình duyệt web của bạn truy cập theo mẫu  
    ```sh
    http: //YOUR_SERVER_IP/test.php
    ```
    Kết quả:  

    <img src ="../../images/25 bai linux/testphp.png">  
    




## TÀI LIỆU THAM KHẢO  
- [http://minivps.vn/](http://minivps.vn/cac-dich-vu-co-ban-tren-vps.html)

