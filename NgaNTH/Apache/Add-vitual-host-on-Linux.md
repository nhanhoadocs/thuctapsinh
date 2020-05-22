### Tạo các website trên VPS  
Thông thường, để truy cập vào một trang web thì ta sẽ gõ trên url tên domain hoặc địa chỉ IP của website đó nhưng với việc sử dụng Apache web server ta có thể dùng một địa chỉ IP mà vẫn truy cập được đến các trang web khác nhau bằng cách tạo ra các virtual host.  

**Tạo một virtual host**  

Đầu tiên tôi sẽ tạo một virtual host có tên là `hongnga.com`.  
- Trong `/var/www` ta tạo 1 thư mục có tên là `hongnga.com`. Trong `hongnga.com` có thư mục con là `public_html`. Thư mục `public_html` sẽ chứa các tệp html là source code của website. Tôi sẽ tạo một tệp `index.html` và ghi một mã html đơn giản vào đó.    
```
#mkdir -p /var/www/hongnga.com/public_html
#vi /var/www/hongnga.com/public_html/index.html
<h1>This is demo website hongnga.com</h`>   
```  
Sau đó lưu file và thoát.  

- Trong thư mục `etc/httpd/conf.d/` ta tạo một tệp có tên là `vhost.conf`. Tệp này để cấu hình các virtual host. Tôi sẽ cấu hình cho vitual host `hongnga.com` với nội dung như bên dưới.  
```
# vi /etc/httpd/conf.d/vhost.conf  
<VirtualHost *:80>
   DocumentRoot /var/www/hongnga.com/public_html
   ServerName www.hongnga.com
   ServerAdmin webmaster@hongnga.com
   ErrorLog logs/hongnga.com-error_log
   CustomLog logs/hongnga.com-access_log combined
</VirtualHost>
```  
Lưu file cấu hình và thoát.  

- Tiếp theo ta sẽ chỉnh sửa file hosts trong `/etc/hosts` bằng cách khai báo địa chỉ IP của máy và domain name. 
```
vi /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.152.134 hongnga.com
```  
Lưu thay đổi file.  
- Khởi động lại dịch vụ httpd  
```
# systemctl restart httpd
# service httpd reload
```  
- Mở trình duyệt web và gõ vào url tên domain. Kết quả hiển thị ra một trang web như bên dưới là bạn đã thành công  
<img src="https://i.imgur.com/18gnZrR.png">  

**Tạo virtual host thứ 2**   
Tương tự như cách làm phía trên ta cũng tạo một thư mục `hongnga2.com` làm virtual host thứ 2. Trong tệp `hongnga2.com/public_html/index.html` sẽ chứa nội dung đơn giản như sau:  
```
Day la website cua hongnga2.com  
```  
Cấu hình cho virtual host `hongnga2.com` trong file cấu hình `etc/httpd/conf.d/vhost.conf`  
```
<VirtualHost *:80>
   DocumentRoot /var/www/hongnga.com/public_html
   ServerName www.hongnga.com
   ServerAdmin webmaster@hongnga.com
   ErrorLog logs/hongnga.com-error_log
   CustomLog logs/hongnga.com-access_log combined
</VirtualHost>

#for hongnga2.com
<VirtualHost *:80>
   DocumentRoot /var/www/hongnga2.com/public_html
   ServerName www.hongnga2.com
   ServerAdmin webmaster@hongnga2.com
   ErrorLog logs/hongnga2.com-error_log
   CustomLog logs/hongnga2.com-access_log combined
</VirtualHost>
```  
- Tiếp tục khai báo trong `/etc/hosts` domain name thứ 2 ứng với địa chỉ IP máy.   
```
vi /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.152.134 hongnga.com
192.168.152.134 hongnga2.com
```  
Lưu file và thoát.  
Tiếp tục gõ tên domain lên trình duyệt và xem kết quả.  

<img src="https://i.imgur.com/51LA0qJ.png">