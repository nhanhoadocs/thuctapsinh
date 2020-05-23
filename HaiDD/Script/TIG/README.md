# Hướng dẫn sử dụng Script cài đặt TIG stack (all in one)

## Chuẩn bị và yêu cầu
- Máy chủ cài đặt Ubuntu 18.04
- Có kết nối Internet
- Đăng nhập hệ thống với quyền `root`

## Thực hiện
### 1. Tải scritp
- Cài `wget` nếu chưa có:
    ```
    apt-get install -y wget
    ```

- Tải về thư mục `/opt/`
    ```
    wget -P /opt/ https://raw.githubusercontent.com/danghai1996/thuctapsinh/master/HaiDD/Script/TIG/install_TIG_on_Ubuntu18.sh
    ```

Vị trí file sau khi tải: `/opt/install_TIG_on_Ubuntu18.sh`

### 2. Phân quyền
Cấp quyền thực thi:
```
chmod +x /opt/install_TIG_on_Ubuntu18.sh
```

### 3. Thực hiện chạy script
```
bash /opt/install_TIG_on_Ubuntu18.sh
```

Sau khi script thực hiện xong. Ta sẽ nhận được thông báo về thông tin database và tài khoản InfluxDB.

- Tài khoản admin Influx: 
    - username: `admin`
    - password: `admin`

- Database: `telegraf`
    - username: `telegraf`
    - username: `telegraf`