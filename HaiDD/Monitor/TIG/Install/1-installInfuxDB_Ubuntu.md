# Install InfluxDB 1.8 on Ubuntu

## I. Cài đặt InfluxDB
1. Thêm Influxdata key :
    ```
    wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
    ```

2. Thêm repositorty Influxdata và update lại các thay đổi :
    ```
    source /etc/lsb-release

    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list

    apt update -y
    ```

3. Cài đặt gói influxdb :
    ```
    apt install influxdb -y
    ```

4. Khởi động dịch vụ và cấu hình khởi động cùng hệ thống :
    ```
    systemctl start influxdb
    systemctl enable influxdb
    ```

5. Kiểm tra trạng thái dịch vụ
    ```
    systemctl status influxdb
    ```

    <img src="https://i.imgur.com/Fp8CI0K.png">

6. Kiểm tra port đang mở của influxd:
    ```
    netstat -plntu | grep influxd
    ```
    <img src="https://i.imgur.com/ojNrOSm.png">

    InfluxDB mặc định sẽ sử dụng 2 port: 8088 và 8086

7. Kiểm tra version hiện tại của Influx :
    ```
    influx -version
    ```
    <img src="https://i.imgur.com/teZ3Jsk.png">

## II. Cấu hình InfluxDB
Một số file quan trọng:
- File cấu hình InfluxDB : `/etc/influxdb/influxdb.conf`
- File dịch vụ hệ thống : `/lib/systemd/system/influxdb.service`

1. Chỉnh sửa file cấu hình
    ```
    vi /etc/influxdb/influxdb.conf
    ```

2. Sửa các phần sau trong thẻ `[http]`
    ```conf
    [http]
    # Determines whether HTTP endpoint is enabled.
    enabled = true

    # Determines whether the Flux query endpoint is enabled.
    flux-enabled = true

    # The bind address used by the HTTP service.
    bind-address = ":8086"

    # Determines whether HTTP request logging is enabled.
    log-enabled = true
    ```

    <img src="https://i.imgur.com/OoGEHY0.png">

3. Kiểm tra
    ```
    root@ubuntu18:~# influx
    Connected to http://localhost:8086 version 1.8.0
    InfluxDB shell version: 1.8.0
    > show databases
    name: databases
    name
    ----
    _internal
    >
    ```

    <img src="https://i.imgur.com/9RMdCZ9.png">

4. Kiểm tra request HTTP
    ```
    curl -G http://localhost:8086/query --data-urlencode "q=SHOW DATABASES"
    ```
    OUTPUT
    ```json
    {"results":[{"statement_id":0,"series":[{"name":"databases","columns":["name"],"values":[["_internal"]]}]}]}
    ```

    <img src="https://i.imgur.com/f2lDqIZ.png">

## III. Một số câu lệnh sử dụng trong CLI của InfluxDB
1. Đăng nhập với tài khoản
    ```
    influx -username <tên_tài_khoản> -password <mật_khẩu>
    ```

2. Hiển thị các tài khoản 
    ```
    > show users
    ```

3. Hiển thị các databases
    ```
    > show databases
    ```

4. Hiển thị các measurements trong databases:
    ```
    > show MEASUREMENTS
    ```