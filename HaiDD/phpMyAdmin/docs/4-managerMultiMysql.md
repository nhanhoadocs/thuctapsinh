# Quản lí nhiều MySQL Server từ 1 server phpMyAdmin

### Mô hình:

<img src="..\images\Screenshot_32.png">

**Thông số:**
||IP|Cài đặt|Hostname|
|-|-|-|-|
|phpMyAdmin|10.10.34.165/24|Cài đặt phpMyAdmin|phpmyadmin|
|MySQL1|10.10.34.161/24|Cài MariaDB|mysql1|
|MySQL2|10.10.34.164/24|Cài MariaDB|mysql2|

## Cấu hình 
1. Check timezone cũng như hostname các máy. Nếu chưa đồng bộ thì chỉnh lại.

    Đổi hostname các máy
    ```
    hostnamectl set-hostname <host_name>
    bash        # thực hiện việc đổi hoặc có thể reboot sau khi thay đổi
    ```
    
    Chỉnh sửa file `/etc/hosts` các máy tương tự như dưới đây.
    ```
    127.0.0.1   phpmyadmin
    10.10.34.165 phpmyadmin
    ```

2. Trên máy **phpMyAdmin**, ta cấu hình file `/etc/phpMyAdmin/config.inc.php`
    
    Để thêm kết nối tới server MySQL1, ta thêm đoạn sau:
    ```
    $i++; // MySQL1:
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    $cfg['Servers'][$i]['verbose'] = 'MySQL-1';
    $cfg['Servers'][$i]['host'] = '10.10.34.161';
    $cfg['Servers'][$i]['extension'] = 'mysqli';
    $cfg['Servers'][$i]['connect_type']  = 'tcp';
    $cfg['Servers'][$i]['AllowRoot']  = TRUE;
    ```

    MySQL2, tương tự
    ```
    $i++; // MySQL1:
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    $cfg['Servers'][$i]['verbose'] = 'MySQL-2';
    $cfg['Servers'][$i]['host'] = '10.10.34.164';
    $cfg['Servers'][$i]['extension'] = 'mysqli';
    $cfg['Servers'][$i]['connect_type']  = 'tcp';
    $cfg['Servers'][$i]['AllowRoot']  = TRUE;
    ```

3. Lưu lại file và restart httpd service
    ```
    systemctl restart httpd
    ```

4. Sử dụng trình duyệt, truy cập địa chỉ của server **phpMyAdmin**

    <img src="..\images\Screenshot_33.png">

    Ta sẽ thấy phần **Server Choice**. Tại đây, ta sẽ thấy các server SQL có thể kết nối đến

    <img src="..\images\Screenshot_34.png">

    Chọn server SQL rồi tiến hành đăng nhập bằng tài khoản MySQL

    <img src="..\images\Screenshot_35.png">

    Ta có thể thấy tên server SQL cũng như thông tin của nó như hình

    <img src="..\images\Screenshot_36.png">

5. Thử tạo bảng cũng như dữ liệu từ server SQL và kiểm tra trên server phpMyAdmin
    - Trên MySQL1, ta tạo 1 database tên là `mydb1`. Tạo 1 bảng `tbl_user` như dưới đây:
    ```
    MariaDB [(none)]> create database mydb1

    MariaDB [(none)]> use mydb1

    MariaDB [mydb1]> create table tbl_user (id int(6), username varchar(255), tel varchar(255));
    ```

    <img src="..\images\Screenshot_37.png">

    - Trên **phpMyAdmin**, ta reload lại trang rồi kiểm tra, ta thấy bảng `tbl_user` với các trường như trên server **MySQL1**

    <img src="..\images\Screenshot_38.png">

6. Thử tạo bản ghi từ **phpMyAdmin** và check trên **MySQL1**
    <img src="..\images\Screenshot_39.png">

    - Kiểm tra các bản ghi trên **MySQL1**
        ```
        MariaDB [mydb1]> select * from tbl_user;
        ```

        <img src="..\images\Screenshot_40.png">