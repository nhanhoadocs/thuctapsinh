# Hướng dẫn update Version Wordpress trên CentOS-7

## Chuẩn bị lab
- Một server cài đặt sẵn CentOS-7
- Server có thể kết nối internet
- Đã cài đặt Wordpress phiên bản 5.3.2 trên LAMP
- Đường dẫn thư mục gốc của trang wordpress trong bài viết này là `/var/www/html/`. Các bạn có thể đổi cho phù hợp với tình huống của mình.

### Thông tin server lab
<img src="https://i.imgur.com/0cyl7QM.png">

## Yêu cầu
- Update phiên bản Wordpress lên 5.4 (hoặc phiên bản mới nhất)
- Dữ liệu trang Wordpress sau khi update còn nguyên vẹn

**Link tải các phiên bản của Wordpress**: https://wordpress.org/download/releases/


## Thực hiện
### 1. Kiểm tra phiên bản hiện tại của wordpress trên server của bạn
- Sử dụng lệnh kiểm tra trên server
    ```
    grep wp_version /var/www/html/wp-includes/version.php
    ``` 

    <img src="https://i.imgur.com/PVYvCUM.png">

    **Lưu ý** : Đường dẫn thư mục gốc trang wordpress của bạn

- Hoặc trên trang admin wordpress của bạn. Chọn mục 1 - **Dashboard** -> 2 - **Home** -> Xem phần At a Glance sẽ thấy phiên bản hiện tại của trang WP của bạn. Như hình dưới đây là 5.3.2

    <img src="https://i.imgur.com/WC1dSlr.png">

- **Phiên bản hiện tại của trang Wordpress là** : `5.3.2`

**Tham khảo**: [Hướng dẫn cài đặt Wordpress trên CentOS-7](https://github.com/danghai1996/thuctapsinh/blob/master/HaiDD/WebServer/wordpressWithLAMP/3-installWordPress.md)

- Tạo 1 bài viết trên trang wordpress để lát ta kiểm tra lại sự bảo toàn dữ liệu.

    <img src="https://i.imgur.com/zjlgU4w.png">

### 2. Backup dữ liệu 
Việc backups dữ liệu là cần thiết để tránh tình trạng mất dữ liệu khi có lỗi xảy ra trong quá trình update wordpress.

Backup toàn bộ thư mục trang wordpress :
```
# Tạo thư mục backup
mkdir /root/wpbackup

# Copy toàn bộ file và thư mục của trang wordpress
cp -Rvf /var/www/html/* /root/wpbackup/
```

### 3. Tải phiên bản mới của WP
- Tải về server phiên bản update bạn muốn của WP. Ở đây, ta tải về tại thư mục `/root/`

    Link các phiên bản: https://wordpress.org/download/releases/

    Tải về phiên bản `5.4`. Nếu chưa cài đặt `wget`, có thể bằng lệnh `yum -y install wget`
    ```
    wget https://wordpress.org/wordpress-5.4.tar.gz
    ```

- Giải nén
    ```
    tar xvfz wordpress-5.4.tar.gz
    ```

- Ta sẽ thấy thư mục wordpress được tạo
    
    <img src="https://i.imgur.com/zscpxC2.png">

### 4. Xóa 2 thư mục `wp-admin` và `wp-includes`
Xóa 2 thư mục `wp-admin` và `wp-includes` trong thư mục gốc của trang wordpress
```
rm -rf /var/www/html/wp-admin
rm -rf /var/www/html/wp-includes
```

### 5. Copy 2 thư mục `wp-admin` và `wp-includes`
Copy 2 thư mục `wp-admin` và `wp-includes` từ thư mục `/wordpess` mới giải nén vào thư mục gốc của trang wordpress
```
mv -f /root/wordpress/wp-admin /var/www/html/

mv -f /root/wordpress/wp-includes /var/www/html/
```

### 6. Sao chép các tệp mới từ thư mục của phiên bản mới tới thư mục gốc của trang wordpress của bạn
```
mv -f /root/wordpress/* /var/www/html/
```

### 7. Truy cập site admin của trang wordpress
- Truy cập bằng đường dẫn
    ```
    <địa_chỉ_ip_server>/wp-admin
    ```

    Trong bài này là `10.10.34.161/wp-admin`. Ta sẽ thấy thông báo update 

    <img src="https://i.imgur.com/KRlvAaT.png">

    Chọn **Update WordPress Database**

- Sau khi update thành công. Sẽ xuất hiện thông báo thành công
    <img src="https://i.imgur.com/rJPwRZV.png">

    Chọn **Continue**


### 8. Kiểm tra lại
- Sau khi đăng nhập vào site admin ta sẽ thấy phiên thông tin phiên bản của WP

    <img src="https://i.imgur.com/zym3z8W.png">

- Trên server:
    <img src="https://i.imgur.com/7qg6AaV.png">

- Kiểm tra các bài viết ta tạo. Các bài viết ta đã tạo vẫn còn và nguyên vẹn.
    <img src="https://i.imgur.com/mbMXlxZ.png">

Wordpress của ta đã update lên phiên bản 5.4 thành công và không bị mất dữ liệu.