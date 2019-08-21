# Cấu hình Virtual Hosts trên Apache
## **1) Định nghĩa**
- Tạo **Virtual host** trên Apache cho phép thêm nhiều domain và chạy nhiều Web trên 1 Server .
- Có 3 dạng **Virtual Host** :
    - **IP-based** : mỗi website gán với 1 IP ảo
    - **Port-based** : mỗi Website gán vào 1 port của IP
    - **Name-based** : nhiều tên miền chạy trên 1 địa chỉ IP
## **2) Cấu hình**
### **2.1) Port-based**
- **B1 :** Thêm các port `LISTEN` khác nhau cho các IP :
    - Chỉnh sửa file `httpd.conf` :
        ```
        # vi /etc/httpd/conf/httpd.conf
        set nu
        ```
        - Tìm tới dòng `42` và thêm các port mở thêm ( số lượng port `LISTEN` bằng với số website ) :
            
            <img src=https://i.imgur.com/AszzPhU.png>

    - Khởi động lại dịch vụ `httpd` :
        ```
        # systemctl restart httpd
        ```
- **B2 :** Thêm dữ liệu cho các trang web :
    - Tạo thư mục riêng cho các website :
        ```
        # mkdir /var/www/html/web1
        # mkdir /var/www/html/web2
        # mkdir /var/www/html/web3
        ```
    - Tạo nội dung file `index.html` cho các website :
        ```
        # vi /var/www/html/web1/index.html
        <h1>Welcome to Web1</h1>
        ```
        ```
        # vi /var/www/html/web2/index.html
        <h1>Welcome to Web2</h1>
        ```
        ```
        # vi /var/www/html/web3/index.html
        <h1>Day la trang web thu 3</h1>
        ```
- **B3 :** Cấp quyền cho các thư mục vừa tạo :
    ```
    # chown -R apache:apache /var/www/html/
    # chmod -R 755 /var/www/html
    ```
- **B4 :** Cấu hình **Virtual host** :
    - Tạo các file `.conf` cho từng **virtual host** :
        ```
        # vi /etc/httpd/conf.d/web1.conf
        <VirtualHost *:80>
            ServerName web1.com
            ServerAlias www.web1.com
            DocumentRoot /var/www/html/web1
            ErrorLog /var/www/html/web1/error.log
            CustomLog /var/www/html/web1/access.log combined
        </VirtualHost>
        ```
        ```
        # vi /etc/httpd/conf.d/web2.conf
        <VirtualHost *:8080>
            ServerName web2.com
            ServerAlias www.web2.com
            DocumentRoot /var/www/html/web2
            ErrorLog /var/www/html/web2/error.log
            CustomLog /var/www/html/web2/access.log combined
        </VirtualHost>
        ```
        ```
        # vi /etc/httpd/conf.d/web3.conf
        <VirtualHost *:9000>
            ServerName web3.com
            ServerAlias www.web3.com
            DocumentRoot /var/www/html/web3
            ErrorLog /var/www/html/web3/error.log
            CustomLog /var/www/html/web3/access.log combined
        </VirtualHost>
        ```
        - Trong đó :
            - `ServerName` : tên của website dùng để gõ trên trình duyệt
            - `ServerAlias` : tên gọi khác của website ( thường cấu hình `www` hoặc `non www`)
            - `DocumentRoot` : đường dẫn đến thư mục source code
            - `ErrorLog` : thư mục chứa file log lỗi
            - `CustomLog` : thư mục chứa file log truy cập
- **B5 :** Trên máy Client , vào trình duyệt gõ IP của website :
    - `http://172.16.0.5:80`

        <img src=https://i.imgur.com/nKJ8qXI.png>
    
    - `http://172.16.0.5:8080`

        <img src=https://i.imgur.com/93e1m8X.png>

    - `http://172.16.0.5:9000`

        <img src=https://i.imgur.com/WYwHHuk.png>