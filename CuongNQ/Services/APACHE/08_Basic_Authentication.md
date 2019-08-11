# Cấu hình Basic Authentication
- **B1 :** Cài đặt dịch vụ `httpd` :
    ```
    # yum -y install httpd
    ```
- **B2 :** Chỉnh sửa nội dung trang web ( file `index.html` ) :
    ```
    # vi /var/www/html/index.html
    <h1>Day la trang chu cua Cong ty Nhan Hoa</h1>
    ```
- **B3 :** Khởi động dịch vụ `httpd` :
    ```
    # systemctl start httpd
    # systemctl enable httpd
    ```
- **B4 :** Cấu hình **Firewalld** cho phép dịch vụ `http` ( để các máy Client có thể truy cập ) :
    ```
    # firewall-cmd --zone=public --permanent --add-service=http
    # firewall-cmd --reload
    ```
- **B5 :** Tạo user truy nhập `httpd` bằng lệnh `htpasswd` :
    ```
    # htpasswd -c /etc/httpd/conf/pwfile admin
    New password :
    Re-type new password :
    ```
    - **Options** :
        - `-c` : tùy chọn tạo 1 file mới chứa thông tin user ( file `/etc/httpd/conf/pwfile` )
        - `admin` : tên user
- **B6 :** Tạo file cấu hình `auth_basic.conf`
    ```
    # vi /etc/httpd/conf.d/auth_basic.conf
    ```
    ```
    <Directory /var/www/html/>
	AuthType Basic
	AuthName "Basic Authentication"
	AuthUserFile /etc/httpd/conf/pwfile
	Require valid-user
    </Directory>
    ```
- **B7 :** Khởi động lại dịch vụ `httpd` :
    ```
    # systemctl restart httpd
    ```
- **B8 :** Trên Client truy cập vào Web Server **Apache** trên trình duyệt :
    ```
    http://<ip_web_server>
    ```
    <img src=https://i.imgur.com/HX8YSqf.png>

    - Nhập user và password vừa tạo , sẽ truy cập được trang web :

        <img src=https://i.imgur.com/X6FfN8E.png>