# Hướng dẫn sử dụng Script cài đặt Wordpress với LEMP trên Ubuntu 18.04

## Yêu cầu:
- Máy cài đặt Ubuntu 18.04
- Có thể kết nối Internet
- Đăng nhập vào hệ thống với quyền `root`


## Thực hiện
### 1. Cài gói hỗ trợ
- Đăng nhập với quyền root
- Cài đặt `wget` để sử dụng tải file script về máy:
    ```
    apt -y install wget
    ```

### 2. Tải script và cấp quyền thực thi
- Tải scripts
    ```
    wget https://gist.githubusercontent.com/danghai1996/ed5b4c1bf5993296601090b264fcd211/raw/6939e3972399a22d8ba93ac21c6cc49e4d3da681/wplempubuntu18.sh
    ```

- Cấp quyền thực thi
    ```
    chmod 755 wplempubuntu18.sh
    ```

### 3. Thực hiện chạy script
- Chạy script
    ```
    bash wplempubuntu18.sh
    ```

- Script sẽ tự động cài đặt.

- Khi đến bước Tạo DB và user cho trang Wordpress của bạn như hình dưới đây

    <img src="https://i.imgur.com/f9mJADL.png">

    - `MariaDB Host` : Nơi đặt cơ sở dữ liệu. Enter nếu đặt ngay trên máy localhost
    - `New Database Name` : Đặt tên Database cho trang WP
    - `New MariaDB User` : User quản lí DB cho trang WP
    - `Password` : Mật khẩu của user ở trên

- Script tiếp tục chạy. Đến phần Cấu hình Nginx sử dụng PHP. Bạn nhập tên máy chủ của bạn. Bạn có thể đặt tùy thích. Như ở ví dụ dưới đây là `dangdohai.com`

    <img src="https://i.imgur.com/J47PSSH.png">

- Script sẽ thực hiện việc cài đặt còn lại.

### 4. Kết quả
- Sau khi hoàn thành, bạn sẽ thấy thông báo tương tự sau:

    <img src="https://i.imgur.com/n6YQESk.png">

- Dùng trình duyệt truy cập địa chỉ IP của máy bạn cài đặt WP và thiết lập trang WP của bạn
    
    <img src="https://i.imgur.com/BtG6rFK.png">
