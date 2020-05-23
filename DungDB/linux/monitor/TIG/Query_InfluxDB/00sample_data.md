# Sample data 

Khởi động dịch vụ

    service influxdb start

    service influxdb enable

hoặc

    systemctl start influxdb

    systemctl enable influxdb

Truy cập InfluxDB

    influx -username ten_user -password password_user

Cách thoát

    exit

Tạo database

    > CREATE DATABASE ten_database

Tạo database mẫu làm ví dụ
```sql
    CREATE DATABASE NOAA_water_database
```
Hiển thị database

    > show databases

Hiển thị các user có sẵn

    > show users

Hiển thị các tag

    > show tag keys

Hiển thị các field

    > show field keys

## Download và import dữ liệu mẫu

    curl https://s3.amazonaws.com/noaa.water-database/NOAA_data.txt -o NOAA_data.txt

    influx -username admin -password admin -import -path=NOAA_data.txt -precision=s -database=NOAA_water_database

Output

    2020/05/18 08:51:09 Processed 1 commands
    2020/05/18 08:51:09 Processed 76290 inserts
    2020/05/18 08:51:09 Failed 0 inserts

## Test queries

Truy cập database với đối số `-precision`. `rfc3339` yêu cầu InfluxDB trả về dấu thời gian ở định dạng `RFC3339` `(YYYY-MM-DDTHH: MM: SS.nnnnnnnnnZ)`.

    influx -precision rfc3339 -database NOAA_water_database -username ten_user -password password_user

Sử dụng database vừa tạo

    > use NOAA_water_database
    Using database NOAA_water_database

Show all 5 measurements:

    > show MEASUREMENTS
    name: measurements
    name
    ----
    average_temperature
    h2o_feet
    h2o_pH
    h2o_quality
    h2o_temperature

Thử đếm số giá trị không null của `water_level` trong `h2o_feet`

    > SELECT COUNT("water_level") FROM h2o_feet
    name: h2o_feet
    time                 count
    ----                 -----
    1970-01-01T00:00:00Z 15258

Chọn 5 bản ghi đầu tiên trong `h2o_feet`

    >select * from h2o_feet limit 5
    name: h2o_feet
    time                 level description    location     water_level
    ----                 -----------------    --------     -----------
    2019-08-17T00:00:00Z below 3 feet         santa_monica 2.064
    2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
    2019-08-17T00:06:00Z below 3 feet         santa_monica 2.116
    2019-08-17T00:06:00Z between 6 and 9 feet coyote_creek 8.005
    2019-08-17T00:12:00Z below 3 feet         santa_monica 2.028

