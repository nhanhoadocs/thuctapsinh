- VirtualHost là một cấu hình trong Apache cho phép nhiều domain cùng chạy trên một máy chủ.  
## Tạo tên miền trên Apache CentOS 7  
> ### 1.Tạo cấu trúc thư mục  
- Thư mục gốc là thư mục lưu trữ các tệp trang web(source code) cho một tên miền. Có thể đặt thư mục gốc ở bất kỳ vị trí nào.  

Ví dụ, đặt thư mục gốc trong thư mục /var, ta có:  
/var/www/  
├── example.com  
│   └── public_html  
├── example-1.com  
│   └── public_html  
├── example-2.com  
│   └── index.html    

`public_html` là thư mục lưu trữ các tệp trang web tên miền.  
`index.html` là tệp chứa soure code.  
- Tạo thư mục gốc cho tên miền **"thuyhien.com"**
Câu lệnh:  
```sh
[root@hiennt ~]# mkdir -p /var/www/thuyhien.com/public_html
```  

> ### 2.Tạo và chỉnh sửa một file `index.html`  
- Tạo file `index.html` chứa soure code của thuyhien.com và chỉnh sửa nội dung hiển thị khi truy cập vào thuyhien.com
```sh  
[root@hiennt ~]# vim /var/www/thuyhien.com/public_html/index.html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>thuyhien.com</title>
  </head>
  <body>
    <h1>Day la bai test - thuyhien.com!</h1>
  </body>
</html>
```
> ### 3.Thay đổi quyền sở hữu và truy cập thư mục gốc 
```sh
[root@hiennt ~]# chown -R apache:apache /var/www/thuyhien.com/public_html
```  
và  
```sh
[root@hiennt ~]# chmod -R 755 /var/www
```  
> ### 4.Tạo và chỉnh sửa tập tin máy chủ ảo 
- Tạo file `thuyhien.com.conf` chứa tập tin máy chủ ảo: `/etc/httpd/conf.d/thuyhien.com.conf`  
   \- Nếu truy cập bằng domain thì nội dung file sẽ là:
```sh
<VirtualHost *:80>

    ServerName thuyhien.com
    ServerAlias www.thuyhien.com
    ServerAdmin webmaster@thuyhien.com
    DocumentRoot "/var/www/thuyhien.com/public_html"
    ErrorLog "/var/log/httpd/thuyhien.com-error_log"
    CustomLog "/var/log/httpd/thuyhien.com-access_log" combined
    <Directory "/var/www/thuyhien.com/public_html">
       DirectoryIndex index.html
       Options FollowSymLinks
       AllowOverride All
       Require all granted
    </Directory>
</VirtualHost>
```  
   \- Nếu truy cập bằng địa chỉ ip và cổng thì nội dung file sẽ là: 
  ```sh
   Listen 8081
<VirtualHost *:8081>

    ServerName 192.168.136.129
    ServerAlias www.thuyhien3.com
    ServerAdmin webmaster@thuyhien3.com
    DocumentRoot "/var/www/thuyhien3.com/"
    ErrorLog "/var/log/httpd/thuyhien3.com-error_log"
    CustomLog "/var/log/httpd/thuyhien3.com-access_log" combined
    <Directory "/var/www/thuyhien3.com/">
       DirectoryIndex index.html
       Options FollowSymLinks
       AllowOverride All
       Require all granted
    </Directory>
</VirtualHost>
  ```  
> ### 5. Tắt firewalld và selinux
Vì mặc định `httpd` chạy port 80, firewall trên CentOS 7 mặc định chặn tất cả truy cập đến port đó trên server nên phải tắt firewall để có thể truy cập dịch vụ.  
Câu lệnh:  
- Kiểm tra trạng thái firewalld:  
```sh
systemctl status firewalld
```  
  
  \- Nếu firewalld đang ở trạng thái active thì tắt firewalld bằng lệnh:  
```sh
systemctl stop firewalld
```  
- Kiểm tra trạng thái của selinux:  
```sh
sestatus
```  
   \- Nếu seliux đang ở trạng thái `enable` thì chuyển selinux sang trạng thái `disable` bằng lệnh:  
  ```sh 
    # vi /etc/selinux/config  
  ```  
> ### 6. Chỉnh sửa file `/etc/hosts`
- Nếu truy cập bằng tên miền phải chỉnh sửa file hosts trong thư mục /etc để có thể phân giải địa chỉ sang tên miền.  
Ví dụ: phân giải địa chỉ ip 192.168.136.129 sang tên miền thuyhien.com  
```sh
# vi /etc/hosts
```
rồi thêm dòng dưới vào nội dung của file  
```
192.168.136.129 thuyhien.com
```  
- Nếu truy cập bằng địa chỉ IP và cổng thì không cần.



> ### 7. Khởi động lại dịch vụ 
- Khởi động lại `httpd`  
```sh
systemctl restart httpd
```

- Khởi động lại `apache`
```sh
apachectl start
```  

> ### 8. Kiểm tra truy cập
Mở trình duyệt web(Google Chorm, Firefox,..) rồi gõ địa chỉ IP(192.168.136.129) hoặc tên miền(thuyhien.com) không báo lỗi và có hiển thị ra nội dung như bạn muốn.  

<p align=center><img src ="../images/25 bai linux/thuyhien.com.png"></p>

## TÀI LIỆU THAM KHẢO  
- [https://hocvps.com/](https://hocvps.com/add-website-tren-vps-apache-centos/)  
- [https://httpd.apache.org/](https://httpd.apache.org/docs/2.4/vhosts/examples.html)

