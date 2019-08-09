# Virtual host 
## Khái niệm   

Virtual host là một định nghĩa chỉ chức năng nhúng nhiều tên miền vào một địa chỉ IP của một Server.
## Cài đặt và cấu hình Virtual host trên Apache 

Trước khi cấu hình Virtual host ta cần tắt firewall và selinux với lệnh sau:
```
systemctl stop firewall
```
Tắt tạm thời selinux:
```
setenforce 0
```
Để tắt vĩnh viễn selinux ta sửa file sau:
```
vi /etc/selinux/config
```
Thay đổi giá trị SELINUX=disabled

![](../imagess/screen14.png)

### 1. Tạo cấu trúc thư mục

Mặc dù bạn có thể tạo các thư mục ở bất cứ đâu, theo quy ước chung, các thư mục cho mỗi trang web được đặt trong /var/wwwthư mục và bắt đầu với một thư mục được đặt tên theo URL của trang web.  

Để tạo các thư mục cho example.com các lệnh là:
```
mkdir -p /var/www/example.com/public_html
mkdir -p /var/www/example2.com/public_html
```
Cấp quyền truy cập cho các file trên :
```
chmod -R 755 /var/www  
```
Tạo một tệp thử nghiệm với tên index.html trong tài liệu gốc của trang web:
```
sudo vi /var/www/example.com/public_html/index.html 
```
```
<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success! The example.com virtual host is working!</h1>
  </body>
</html

```
Lưu và thoát tệp.  

Copy file vừa cấu hình sang directory của website thứ 2 và chỉnh sửa file index.html :

```
cp /var/www/example.com/public_html/index.html /var/www/example2.com/public_html/index.html
```  
```
html>
  <head>
    <title>Welcome to Example2.com!</title>
  </head>
  <body>
    <h1>Success! The example2.com virtual host is working!</h1>
  </body>
</html
```   


### 2. Tạo các File Virtual Host mới

Đầu tiên ta sẽ tạo các thư mục để lưu file. Thư mục sites-available lưu trữ tất cả các file server block, còn thư mục sites-enabled sẽ lưu đường dẫn đến server block cần kích hoạt. Tạo hai thư mục đó với lệnh:

```
sudo mkdir /etc/httpd/sites-available
sudo mkdir /etc/httpd/sites-enabled
```  
Tiếp theo ta sẽ chỉ cho Apache tìm kiếm các file server block trong thư mục sites-enabled.
```
sudo vi /etc/httpd/conf/httpd.conf
```
Thêm vào dòng sau vào cuối file 
```
IncludeOptional sites-enabled/*.conf
```
### 3. Tạo File Virtual host đầu tiên 

### a. Chạy một số trang web dựa trên tên trên một địa chỉ IP

Mô hình như sau:

![](../imagess/screen11.png)

Tạo và cấu hình file example.com.conf ta dùng lệnh :
```
vi /etc/httpd/sites-available/example.com.conf
```
```
<VirtualHost *:80>

    ServerName www.phungngoc.com
    ServerAlias phungngoc.com
    DocumentRoot /var/www/example.com/public_html

</VirtualHost>
```

Làm tương tự với web 2:
```
cp /etc/httpd/sites-available/example.com.conf /etc/httpd/sites-available/example2.com.conf 
```
```
vi /etc/httpd/conf.d/example2.com.conf 
```
File cấu hình:
```
<VirtualHost *:80>

    ServerName www.phungngoc2.com
    ServerAlias phungngoc2.com
    DocumentRoot /var/www/example2.com/public_html

</VirtualHost>
```

![](../images/2019-06-18_14-59.png)

### 4. Kích hoạt các File Virtual Host mới

Sau khi tạo các file server block, ta cần kích hoạt chúng bằng cách tạo đường dẫn cho chúng từ thư mục sites-enabled cho chúng: 
```
sudo ln -s /etc/httpd/sites-available/example.com.conf /etc/httpd/sites-enabled/example.com.conf
sudo ln -s /etc/httpd/sites-available/example2.com.conf /etc/httpd/sites-enabled/example2.com.conf
```
Khởi động lại Apache:
```
sudo apachectl restart
```
4. Thiết lập file Local Host  

Ta cần cấu hình file hosts ở một máy client để có thể truy cập vào web server :
```
sudo vi /etc/hosts
```
![](../imagess/screen7.png)

Sau đó ta kiểm tra bằng cách nhập địa chỉ 2 website vào browser trong máy client :

![](../imagess/screen12.png)

![](../imagess/screen13.png)

### b. Chạy các trang web khác nhau trên các cổng khác nhau.

Mô hình như sau :

![](../imagess/screen8.png)

Đầu tiên ta cần thêm port listening server.  
Ta cấu hình lại file httpd.conf để đổi port :
```
vi /etc/httpd/conf/httpd.conf 
```

Thêm dòng sau vào file cấu hình để web server lắng nghe bằng port 8080.

![](../imagess/screen0.png)

Ta cần restart apache để file cấu hình cập nhật thay đổi.
```
 sudo apachectl restart
```

Kiểm tra port listening trên server ta thực hiên lệnh:
```
netstat -pnltu
```

![](../imagess/screen-1.png)

Có nhiều tên miền sẽ đến cùng một IP và cũng muốn phục vụ nhiều cổng, ta cấu hình file example.com.conf va file example2.com.conf :

```
vi /etc/httpd/sites-available/example.com.conf
vi /etc/httpd/sites-available/example2.com.conf
```
![](../imagess/screen2.png)

![](../imagess/screen3.png)

Ta cần restart httpd để cập nhật file cấu hình:
```
sytemctl restart httpd 
```
Cuối cùng ta kiểm tra bằng cách nhập địa chỉ ip với port tương ứng vào trình duyệt :

![](../imagess/screen5.png)

![](../imagess/screen4.png)

### c. Chạy các trang web khác nhau trên các địa chỉ ip khác nhau 

Mô hình như sau :

![](../imagess/screen9.png)

Để chạy các trang web khác nhau trên các địa chỉ ip khác nhau ta vào file cấu hình :
```
vi /etc/httpd/sites-available/example.com.conf
vi /etc/httpd/sites-available/example2.com.conf
```

![](../imagess/screen2.png)

![](../imagess/screen10.png)

Ta kiểm tra bằng cách nhập địa chỉ ip vào trình duyệt :

![](../imagess/screen5.png)

![](../imagess/screen6.png)

