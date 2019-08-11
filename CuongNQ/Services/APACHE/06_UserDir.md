# Cấu hình tính năng UserDir
- Là hình thức tạo ra website riêng cho từng user đăng nhập .
### **Cấu hình**
- **B1 :** Chỉnh sửa file cấu hình `userdir.conf` :
    ```
    # vi /etc/httpd/conf.d/userdir.conf
    ```
    - Tại dòng `17` , thêm dấu `#` vào đầu dòng để bật tính năng `userdir` :
        
        <img src=https://i.imgur.com/WhoMEVs.png>

    - Tại dòng `24` , bỏ dấu `#` ở đầu dòng :

        <img src=https://i.imgur.com/YsqGiDy.png>

- **B2 :** Tạo thư mục lưu nội dung cho từng web và cấp quyền cho chúng :
    ```
    # mkdir /home/cuongnq/public_html
    # mkdir /home/hungnq/public_html
    ```
    ```
    chown cuongnq:cuongnq /home/cuongnq/public_html
    chmod 755 /home/cuongnq/public_html
    chmod 711 /home/cuongnq/
    ```
    ```
    chown hungnq:hungnq /home/hungnq/public_html
    chmod 755 /home/hungnq/public_html
    chmod 711 /home/hungnq/
    ```
- **B3 :** Tạo file `index.html` cho từng web :
    ```
    # vi /home/cuongnq/public_html/index.html
    <h1>This is Website for cuongnq</h1>
    ```
    ```
    # vi /home/hungnq/public_html/index.html
    <h1>This is Website for hungnq</h1>
    ```
- **B4 :** Cài đặt **SELinux** cho Apache homedir ( `httpd_enable_homedirs` ) :
    ```
    # setsebool -P httpd_enable_homedirs true
    ```
- **B5 :** Khởi động lại dịch vụ `httpd` :
    ```
    # systemctl restart httpd
    ```
- **B6 :** Trên Client truy cập website của từng user :
    ```
    http://<ip_web_server>/~cuongnq
    ```
    <img src=https://i.imgur.com/1znXJCP.png>

    ```
    http://<ip_web_server>/~hungnq
    ```
    <img src=https://i.imgur.com/aBYxjQX.png>