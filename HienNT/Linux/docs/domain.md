- VirtualHost là một cấu hình trong Apache cho phép nhiều domain cùng chạy trên một máy chủ.  
## Tạo tên miền trên Apache CentOS 7  
> ### 1.Tạo cấu trúc thư mục  
- Thư mục gốc là thư mục lưu trữ các tệp trang web cho một tên miền. Có thể đặt thư mục gốc ở bất kỳ vị trí nào.  

Ví dụ, đặt thư mục gốc trong thư mục /var, ta có:  
/var/www/  
├── example.com  
│   └── public_html  
├── example-1.com  
│   └── public_html  
├── example-2.com  
│   └── public_html    

`public_html` là thư mục lưu trữ các tệp trang web tên miền.  
Câu lệnh:  
```sh
[root@hiennt ~]# mkdir -p /var/www/thuyhien.com/public_html
```  

> ### 2.Tạo và chỉnh sửa một file `index.html`  

```sh  
[root@hiennt ~]# vim /var/www/thuyhien.com/public_html/index.html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>thuyhien.com</title>
  </head>
  <body>
    <h1>Success! thuyhien.com home page!</h1>
  </body>
</html>
```
> ### 3.Thay đổi thư mục gốc của tài liệu miền  
```sh
[root@hiennt ~]# chown -R nobody:nobody /var/www/thuyhien.com/public_html
```  
và  
```sh
[root@hiennt ~]# chmod -R 755 /var/www
```  
> ### 4.Tạo và chỉnh sửa tập tin máy chủ ảo  
<VirtualHost *:80>

    ServerName www.thuyhien.com
    ServerAlias thuyhien.com
    DocumentRoot /var/www/thuyhien.com/public_html
    ErrorLog /var/www/thuyhien.com/error.log
    CustomLog /var/www/thuyhien.com/requests.log combined
</VirtualHost>


