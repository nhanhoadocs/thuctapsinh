# Sample data

## Login to InfluxDB
```
influx -username <user_name> -password <password>
```
OUTPUT sẽ tương tự như sau:
```
Connected to http://localhost:8086 version 1.8.0
InfluxDB shell version: 1.8.0
```

## Create a database
Sau khi đăng nhập vào InfluxDB ta có thể tạo 1 database như sau
```
CREATE DATABASE <tên_database>
```

Tạo 1 database để làm ví dụ
```sql
CREATE DATABASE NOAA_water_database
```

## Download và ghi dữ liệu mẫu vào InfluxDB
Từ giao diện CLI của máy

- Tải dữ liệu mẫu về
    ```
    curl https://s3.amazonaws.com/noaa.water-database/NOAA_data.txt -o NOAA_data.txt
    ```

- Import dữ liệu vào InfluxDB bằng câu lệnh
    ```
    influx -username admin -password admin -import -path=NOAA_data.txt -precision=s -database=NOAA_water_database
    ```

    Với `-username` và `-password` là tài khoản và mật khẩu đăng nhập InfluxDB

    OUTPUT
    ```
    2020/05/12 08:32:42 Processed 1 commands
    2020/05/12 08:32:42 Processed 76290 inserts
    2020/05/12 08:32:42 Failed 0 inserts
    ```

## Kiểm tra query
Truy cập database với đối số `-precision`. `rfc3339` yêu cầu InfluxDB trả về dấu thời gian ở định dạng `RFC3339` `(YYYY-MM-DDTHH: MM: SS.nnnnnnnnnZ)`.
```
influx -precision rfc3339 -database NOAA_water_database -username admin -password admin
```


Sử dụng database vừa tạo
```sql
> use NOAA_water_database
Using database NOAA_water_database
```

Show all 5 measurements:
```sql
> show MEASUREMENTS
name: measurements
name
----
average_temperature
h2o_feet
h2o_pH
h2o_quality
h2o_temperature
```

Thử đếm số giá trị không null của `water_level` trong `h2o_feet`
```sql
> SELECT COUNT("water_level") FROM h2o_feet
name: h2o_feet
time                 count
----                 -----
1970-01-01T00:00:00Z 15258
```

Chọn 5 bản ghi đầu tiên trong `h2o_feet`
```sql
> select * from h2o_feet limit 5

name: h2o_feet
time                 level description    location     water_level
----                 -----------------    --------     -----------
2019-08-17T00:00:00Z below 3 feet         santa_monica 2.064
2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
2019-08-17T00:06:00Z below 3 feet         santa_monica 2.116
2019-08-17T00:06:00Z between 6 and 9 feet coyote_creek 8.005
2019-08-17T00:12:00Z below 3 feet         santa_monica 2.028
```

Show `TAG KEY`
```sql
show tag keys
```

## Nguồn dữ liệu và các lưu ý khi sử dụng
Dữ liệu mẫu là dữ liệu có sẵn công khai từ Trung tâm Quản lý Đại dương và Khí quyển Quốc gia (NOAA) cho các Sản phẩm và Dịch vụ Hải dương học Hoạt động.