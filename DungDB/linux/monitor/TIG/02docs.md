# Docs

## Giới thiệu TIG stack

https://devopsz.com/monitoring-system-part-1/

## InfluxDB

Tài liệu:

https://docs.influxdata.com/influxdb/v1.8/

File cấu hình:

`/etc/influxdb/influxdb.conf`

https://docs.influxdata.com/influxdb/v1.8/administration/config/

https://docs.influxdata.com/influxdb/v1.8/administration/config/#configuration-overview

Query influxDB:

https://docs.influxdata.com/influxdb/v1.8/query_language/explore-data/

Kiểm tra log:

    journalctl -u influxdb.service

Logs:

https://docs.influxdata.com/influxdb/v1.8/administration/logs/

### Các lệnh cơ bản dùng với influxdb

https://docs.influxdata.com/influxdb/v1.8/introduction/get-started/

1. Đăng nhập với tài khoản
    
    influx -username <tên_tài_khoản> -password <mật_khẩu>
    
2. Hiển thị các tài khoản 
    
    > show users
    
3. Hiển thị các databases
    
    > show databases

4. Sử dụng DB

    >use <tên DB>
    
5. Hiển thị các measurements trong databases:
    
    > show MEASUREMENTS

## Telegraf

Tài liệu:

https://docs.influxdata.com/telegraf/v1.14/

File cấu hình: `/etc/telegraf/telegraf.conf`

## Grafana

Tài liệu:

https://grafana.com/docs/grafana/latest/

Thư mục `/etc/grafana/`

File cấu hình: `/etc/grafana/grafana.ini`

https://grafana.com/docs/grafana/latest/installation/configuration/

Sử dụng influxDB trong grafana: https://grafana.com/docs/grafana/latest/features/datasources/influxdb/

Template và biến: https://grafana.com/docs/grafana/latest/variables/templates-and-variables/

Thêm biến:

![Imgur](https://i.imgur.com/iByNzgl.png)

**Lưu ý:** Không thể sử dụng cảnh báo khi dùng biến. Phải chỉ định host cụ thể.
