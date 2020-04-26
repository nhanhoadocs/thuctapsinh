# Install InfluxDB 2.0 on Ubuntu

InfluxDB có thể được sử dụng trong nhiều lĩnh vực: DevOps, giám sát, IoT và thậm chí là an ninh mạng.

Trước đây, trong phiên bản 1.7.x, bạn đã có bốn thành phần khác nhau mà một bộ phận sẽ lắp ráp để tạo thành ngăn xếp TICK (Telegraf, InfluxDB, Chronograf và Kapacitor).

Trong phiên bản 2.0, InfluxDB trở thành một nền tảng duy nhất để truy vấn, trực quan hóa và thao tác dữ liệu.

## 1. Tải InfluxDB 2.0 từ website
Truy cập trang chủ InfluxDB : https://v2.docs.influxdata.com/v2.0/get-started/

<img src="https://i.imgur.com/hv7CXOu.png">

Chọn Linux, sau đó copy link tải theo đúng phiên bản Ubuntu của bạn. Ở đây, ta chọn `amd64`

- Tải phiên bản 2.0 beta
    ```
    wget https://dl.influxdata.com/influxdb/releases/influxdb_2.0.0-beta.9_linux_amd64.tar.gz
    ```

- Giải nén file cài đặt
    ```
    tar xvzf influxdb_2.0.0-beta.9_linux_amd64.tar.gz
    ```

## 2. Di chuyển các file giải nén
- Chuyển các file `influx` và `influxd` vào thư mục `/usr/local/bin/`
    ```
    cp /root/influxdb_2.0.0-beta.9_linux_amd64/{influx,influxd} /usr/local/bin/
    ```

- Kiểm tra lại:
    ```
    ls -l /usr/local/bin/
    ```
    <img src="https://i.imgur.com/umwNOXQ.png">

## 3. Tạo dịch vụ InfluxDB 2.0
- Tạo một user `influxdb` :
    ```
    useradd -rs /bin/false influxdb
    ```

- Tạo một file `influxdb2.service` trong thư mục ` /lib/systemd/system`
    ```
    vi /lib/systemd/system/influxdb2.service
    ```
    Thêm nội dung sau vào file:
    ```
    [Unit]
    Description=InfluxDB 2.0 service file.
    Documentation=https://v2.docs.influxdata.com/v2.0/get-started/
    After=network-online.target

    [Service]
    User=influxdb
    Group=influxdb
    ExecStart=/usr/local/bin/influxd 
    Restart=on-failure

    [Install]
    WantedBy=multi-user.target
    ```

- Khởi chạy dịch vụ:
    ```
    systemctl start influxdb2
    systemctl status influxdb2
    ```

- 