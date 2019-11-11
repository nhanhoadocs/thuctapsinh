# Cấu hình Web cơ bản trên Apache
### **Mô hình thực tế**

<img src=https://i.imgur.com/lAOl1Oq.png>

### **Mô hình LAB**

| | **IP** | **Ethernet** |
|-|--------|--------------|
| **Web_Server** | `172.16.0.15` | `ens33` |
| **Client** | `172.16.0.10` | `ens33` |

### **Các bước triển khai**
- **B1 :** Chỉnh sửa file `httpd.conf` :
    ```
    # vi /etc/httpd/conf/httpd.conf
    :set nu
    ```
    <img src=https://i.imgur.com/Oeg88Bv.png>

    - Ở dòng `86` , sửa `localhost` thành tên domain :

        <img src=https://i.imgur.com/3TIoXKc.png>

    - Ở dòng `95` , sửa `www.example.com` thành tên domain , đồng thời bỏ dấu `#` ở đầu dòng :

        <img src=https://i.imgur.com/6aJFAbD.png>

    - Ở dòng `119` , chỉ định thư mục chính lưu nội dung trang web :

        <img src=https://i.imgur.com/kLaU4oA.png>

    - Ở dòng `151` , sửa `none` thành `All` :

        <img src=https://i.imgur.com/9efffSF.png>

    - Ở dòng `164` , chỉ định file `index.html` là nội dung chính của website :

        <img src=https://i.imgur.com/Ixysup5.png>

    - Lưu lại file và thoát .
- **B2 :** Chỉnh sửa nội dung trang web ( file `index.html` ) :
    ```
    # vi /var/www/html/index.html
    <h1>Day la trang chu cua Cong ty Nhan Hoa</h1>
    ```
    hoặc
    ```
    echo "<h1>Day la trang chu cua Cong ty Nhan Hoa</h1>" >> /var/www/html/index.html
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
- **B5 :** Truy cập trang web trên máy Windows 10 : vào trình duyệt web và gõ : `http:172.16.0.5`

    <img src=https://i.imgur.com/3fgZipj.png>



### **Cách disable Start page on Apache**
- Khi chưa tạo file `index.html` , khi truy cập địa chỉ của Web_Server , sẽ hiện ra State page :

    <img src=https://i.imgur.com/xyRnyAE.png>

- Nếu không muốn qua Start page , có thể xóa file `welcome.conf` để đến thẳng folder Web :
    ```
    # rm -f /etc/httpd/conf.d/welcome.conf
    # systemctl restart httpd
    ```
    <img src=https://i.imgur.com/ZwtRDAz.png>