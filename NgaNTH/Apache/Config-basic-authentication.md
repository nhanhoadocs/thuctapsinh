### Cấu hình basic authentication  
Khi truy cập vào một website có thể bạn sẽ gặp trường hợp yêu cầu quyền truy cập bằng cách gõ tên user và password. Nguyên nhân là trên web server đã cấu hình authentication. Bây giờ chúng ta sẽ tìm hiểu về basic authentication bằng việc cài đặt và cấu hình trên CentOS7.  
- Trên mô hình lab ta tiến hành cài web server  
```
yum install -y http
```
- Chỉnh sửa nội dung trang web  
```
vi /var/www/html/index.html  
<h1>This is demo website</h1>  
```  
- Khởi động dịch vụ httpd 
```
systemctl start httpd
systemctl enable httpd
```  
- Cấu hình `firewall` để các máy client có thể truy cập  
```
firewall-cmd --zone=public --permanent --add service=httpd  
firewall-cmd --reload
```  
- Khai báo user và password bằng cách tạo tài khoản.
```
htpasswd -c /etc/httpd/conf/pwfile admin
New password:
Re-type new password:
Adding password for user admin
```
Trong đó:   
`-c`: tùy chọn tạo 1 file mới chứa thông tin user (file /etc/httpd/conf/pwfile)
`admin`: tên tài khoản user  

- Tạo file cấu hình `auth.basic.conf` trong `/etc/httpd/conf.d/`  
```
vi /etc/httpd/conf.d/auth.basic.conf  
<Directory /var/www/html/>
AuthType Basic
AuthName "Basic Authentication"
AuthUserFile /etc/httpd/conf/pwfile
Require valid-user
</Directory>
```    
- Khởi động lại dịch vụ http  
```
systemctl restart httpd  
```  
- Mở trình duyệt web và gõ địa chỉ IP của máy chủ Web server. Một yêu cầu xác thực sẽ hiển thị lên  

<img src="https://i.imgur.com/nBQ58qx.png">  

- Sau khi gõ tên user và mật khẩu thì website sẽ hiển thị  

<img src="https://i.imgur.com/oe4coUp.png">




