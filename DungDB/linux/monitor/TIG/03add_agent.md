# Thêm Agent để giám sát

https://portal.influxdata.com/downloads/

Click vào **Telegraf Time-Series Data Collector**

Có hướng dẫn tải và cài trên các máy cần monitor với các OS khác nhau.

Backup file `telegraf.conf`

    cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.bak

Sửa file `/etc/telegraf/telegraf.conf` (Trên Linux)

Sửa file `C:\Program Files\telegraf\telegraf.conf` (Trên Windows Tải về, giải nén, copy vào đây và sửa. Sửa xong chạy file `telegraf.exe`)

    nano /etc/telegraf/telegraf.conf

Sửa các dòng:
```
urls = ["http://gõ ip máy monitor:8086"]

database = "telegraf"

username = "telegraf"

password = "P@ssw0rd"
```

**Lưu ý:** Nên tạo cho mỗi host một database khác nhau để dễ quản lý

Các dòng bên dưới sửa tùy theo mục đích sử dụng

Restart dịch vụ

    systemctl restart telegraf

Vào site grafana `http://<ip-grafana-server>:3000`

Create Dashboard > Add query > FROM > `+` thêm host và add host

![Imgur](https://i.imgur.com/r9qCwRZ.png)

Add dashboard Jitsi: Import 11969