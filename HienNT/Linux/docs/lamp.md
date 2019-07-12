
<p align=center><img src = "../images/25 bai linux/FMGHI1TJTCRJJZE.LARGE.jpg" width=140% ></p>

# Hướng dẫn cài đặt LAMP(Linux,Apache,MySQL,PHP) trên CentOS 7  
## Giới thiệu  
- `LAMP` là gói kết hợp giữa hệ điều hành và bộ phần mềm mã nguồn mở. Danh từ `LAMP` là từ viết tắt lấy từ những chữ cái đầu của **L**inux, **A**pache HTTP Server, **M**ySQL/ **M**ariaDB database, và **P**HP/**P**earl/**P**ython.  

## Các bước cài đặt  
**<h3>1.Cài đặt Apache</h3>**  

- Apache là nền tảng Web Server mã nguồn mở. Apache bao gồm đầy đủ các tính năng của máy chủ Web bao gồm CGI, SSL và các domain ảo.
- Các bước tiến hành:  
  \- Bước 1: Cài đặt gói `httpd` 
     ```sh
      yum istall -y httpd 
    ``` 

   > `httpd:` là dịch vụ web chính của máy chủ, khi httpd chết thì web bạn cũng chết theo, httpd tạo ra nhiều tiến trình PID(process id-số hiệu tiến trình) để phục vụ website của bạn, càng nhiều tiến trình thì càng tốn ram, khi bị DDOS(Distributed Denial of Service-tấn công từ chối truy cập) thì quá nhiều tiến trình httpd tạo ra có thể dẫn đến VPS treo. httpd thường được cài php vào để phục vụ mã nguồn php. Các lỗi không vào được web phần lớn liên quan đến dịch vụ này. 

  + option `-y`:   
  + Đường dẫn file cấu hình Apache:
    ```sh
      /etc/httpd/etc/httpd.conf
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
    [root@hiennt conf]# netstat -natp | grep httpd
    tcp6       0      0 :::80                   :::*                    LISTEN      13257/httpd
    [root@hiennt conf]#
    ```  
    ==> Đã lắng nghe được cổng 80  

    \- Tắt tường lửa trên máy cài Apache  
    ```sh
    [root@hiennt ~]# systemctl stop firewalld
    ```  
    - Truy cập vào địa chỉ IP của Server để kiểm tra  
    ```sh
     http://192.168.136.129
    ```
    Kết quả:  

    <p align=center><img src ="../images/25 bai linux/test apache.png"></p>  

    \- Nếu trong mạng có Firewall hoặc Router, mở port cho Apache Server trong trường hợp muốn truy cập thông qua remote.  
    Câu lệnh: 






## TÀI LIỆU THAM KHẢO  
- [http://minivps.vn/](http://minivps.vn/cac-dich-vu-co-ban-tren-vps.html)

