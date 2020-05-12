# Setup TIG (Telegraf, InfluxDB and Grafana) on Ubuntu 18.04 LTS

## Giới thiệu
Trong tất cả các công cụ giám sát hiện đại hiện có thì có lẽ **TIG(Telegraf, InfluxDB and Grafana)** stack là một trong nhưng công cụ được sử dụng phổ biến nhất.

TIG có thể được sử dụng để theo dõi một bảng rộng các nguồn dữ liệu khác nhau: từ các hệ điều hành (thông số về hiệu suất của Linux hay Window), đến database (như MongoDB hay MySQL. Khả năng của nó là vô tận)

## Nguyên tắc hoạt động
- Telegraf là agent chịu trách nhiệm thu tập thập và tổng hợp dữ liệu, như việc sử dụng CPU hiện tại, ....

- InfluxDB là nơi chứa dữ liệu và hiển thị nó cho Grafana. Đây là giải pháp điều khiển hiện đại.

# Thực hiện cài đặt
## I. Cài đặt InfluxDB
### 1. Cài đặt InfluxDB
[Xem các bước cài đặt InfluxDB tại đây](.\1-installInfuxDB_Ubuntu.md).

### 2. Tạo tài khoản quản trị InfluxDB
Truy cập Influx CLI và tạo tài khoản `admin` với mật khẩu `admin`
```
influx

> CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES
> SHOW USERS
```

<img src="https://i.imgur.com/5Yd5vys.png">

### 3. Kích hoạt xác thực HTTP cho InfluxDB
- Sửa file cấu hình
    ```
    vi /etc/influxdb/influxdb.conf
    ```
    Tìm đến mục `[http]`. Uncomment và sửa dòng `auth-enabled = false` thành `auth-enabled = true`

    <img src="https://i.imgur.com/Wn6890Q.png">


## II. Cài đặt Telegraf
Telegraf là một agent thu thập các số liệu liên quan đến một nhóm rộng các mục tiêu khác nhau.

Nó cũng có thể được sử dụng như một công cụ để xử lý, tổng hợp, phân tách hoặc nhóm dữ liệu.

### 1. Cài đặt Telegraf
1. Cài đặt Telegraf
    ```
    apt install telegraf -y
    ```

2. Khởi động dịch vụ và cấu hình khởi động cùng hệ thống :
    ```
    systemctl start telegraf
    systemctl enable telegraf
    ```

3. Kiểm tra trạng thái dịch vụ
    ```
    systemctl status telegraf
    ```

    <img src="https://i.imgur.com/nn4XFXn.png">

Tuy nhiên, ngay cả khi **Telegraf** đang chạy thì nó cũng không đảm bảo rằng nó gửi dữ liệu chính xác tới **InfluxDB**.

- Để xác minh điều đó, ta sử dụng lệnh
    ```
    journalctl -f -u telegraf.service
    ```

    <img src="https://i.imgur.com/ME3cIEp.png">

### 2. Tạo databases và tài khoản trong InfluxDB cho Telegraf
```
influx

> CREATE DATABASE telegraf
> CREATE USER telegraf WITH PASSWORD 'telegraf' WITH ALL PRIVILEGES
> SHOW USERS
```

<img src="https://i.imgur.com/iM2WHVP.png">

### 3. Cấu hình xác thực HTTP cho Telegraf
Bây giờ tài khoản người dùng được tạo cho Telegraf, chúng tôi sẽ đảm bảo rằng nó sử dụng nó để ghi dữ liệu.

File cấu hình của Telegraf : `/etc/telegraf/telegraf.conf`

Backup file cấu hình:
```
cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.bak
```

Mở file cấu hình để chỉnh sửa
```
vi /etc/telegraf/telegraf.conf
```

Sửa các dòng sau: username và password ta đã tạo ở bước trên
```conf
urls = ["http://127.0.0.1:8086"]

## HTTP Basic Auth
  username = "telegraf"
  password = "telegraf"
```
<img src="https://i.imgur.com/HDdw1Ww.png">

<img src="https://i.imgur.com/ty7ro0k.png">

Khởi động lại dịch vụ Telegraf và InfluxDB
```
systemctl restart influxdb
systemctl restart telegraf
```

Kiểm tra lại để đảm bảo không có bất kì lỗi nào khi khởi động lại dịch vụ
```
journalctl -f -u telegraf.service
```
<img src="https://i.imgur.com/JintnzH.png">

## III. Cài đặt Grafana
### 1. Cài đặt Grafana-server
[Xem hướng dẫn cài đặt Grafana-server.](.\2-installGrafana_Ubuntu.md)

### 2. Thêm InfluxDB làm nguồn dữ liệu (datasource) cho Grafana
- Trên giao diện, ta chọn **Configuration** -> **Data Sources** -> **Add data source**

    <img src="https://i.imgur.com/4SJ2Jvu.png">

- Tìm đến phần InfluxDB -> Chọn **Select**

    <img src="https://i.imgur.com/6UaPG7n.png">

- Điền thông tin database

    <img src="https://i.imgur.com/BHD5AFE.png">

    - 1 : Tên InfluxDB
    - 2 : Đường dẫn truy cập InfluxDB. Tại đây, ta cài cùng trên 1 server nên là localhost
    - 3 : Xác thực
    - 4 : Tài khoản xác thực. Nhập tài khoản `admin` của InfluxDB và mật khẩu
    - 5 : Database sẽ lấy. Ta dùng `telegraf`. User và password của `telefraf`

- Sau khi điền xong, ta chọn **Save & Test**

    <img src="https://i.imgur.com/DypzLox.png">

- Sau khi thành công, ta sẽ thấy thông báo như sau:
    
    <img src="https://i.imgur.com/ttRapfh.png">

    **Lưu ý:** Nếu gặp lỗi **502 Bad Gateway**. Hãy xem lại trường URL. Để ý cả phương thức `http` và `https`

### 3. Import Grafana dashboard
