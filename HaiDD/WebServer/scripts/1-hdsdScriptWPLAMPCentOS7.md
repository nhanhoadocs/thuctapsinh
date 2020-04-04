# Hướng dẫn sử dụng Script cài đặt Wordpress với LAMP trên CentOS-7

## Yêu cầu:
- Máy cài đặt CentOS-7
- Có thể kết nối Internet
- Đăng nhập vào hệ thống với quyền `root`


## Thực hiện
### 1. Cài gói hỗ trợ
- Đăng nhập với quyền root
- Cài đặt `wget` để sử dụng tải file script về máy:
    ```
    yum -y install wget
    ```

### 2. Tải script và cấp quyền thực thi
- Tải scripts
    ```
    wget https://gist.githubusercontent.com/danghai1996/4af659bdd217493ea764f3e9b22abf5e/raw/fe045dcbdbed68181d80edf9dce4bc976dea34cc/wplampcentos7.sh
    ```

- Cấp quyền thực thi
    ```
    chmod 755 wplampcentos7.sh
    ```

### 3. Thực hiện chạy script
- Chạy script
    ```
    bash wplampcentos7.sh
    ```

- Script sẽ tự động cài đặt.

- Khi đến bước Tạo DB và user cho trang Wordpress của bạn như hình dưới đây

    <img src="https://i.imgur.com/f9mJADL.png">

    - `MariaDB Host` : Nơi đặt cơ sở dữ liệu. Enter nếu đặt ngay trên máy localhost
    - `New Database Name` : Đặt tên Database cho trang WP
    - `New MariaDB User` : User quản lí DB cho trang WP
    - `Password` : Mật khẩu của user ở trên

- Script sẽ tự động cài đặt các phần còn lại.

### 4. Kết quả
- Sau khi hoàn thành, bạn sẽ thấy thông báo tương tự sau:

    <img src="https://i.imgur.com/n6YQESk.png">

- Dùng trình duyệt truy cập địa chỉ IP của máy bạn cài đặt WP và thiết lập trang WP của bạn
    
    <img src="https://i.imgur.com/BtG6rFK.png">
