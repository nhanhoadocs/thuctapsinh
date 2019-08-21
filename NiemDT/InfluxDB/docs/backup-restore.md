# Backup và restore DB 

Để có thể backup được dự liệu trong influxdb trước tiên ta cần cho phép backup trong file config. Nếu bạn chỉ muốn đứng tại máy cài influxdb để thực hiện backup thì ta cần thực lệnh sau

```
sed -i 's/# bind-address = "127.0.0.1:8088"/bind-address = "127.0.0.1:8088"/g' /etc/influxdb/influxdb.conf
```

Nếu muốn đứng từ một máy khác để thực hiện backup thì ta thực hiện lệnh sau. Thực hiện như thế này thì cần lưu ý đến chính sách để bảo mật cho DB

```
sed -i 's/# bind-address = "127.0.0.1:8088"/bind-address = "0.0.0.0:8088"/g' /etc/influxdb/influxdb.conf
```

Sau đó tiến hành restart lại influxdb

```
systemctl restart influxdb
```

Để thực hiện backup được ta cần mở port `8088`

Để thực hiện backup với db `mydb` ra file `filebackup1`

```
influxd backup -portable -database mydb -host 127.0.0.1:8088 filebackup1
```

Nếu khi muốn restore lại DB thì ta thực hiện lệnh sau

```
influxd restore -portable filebackup1
```

Nếu chỉ muốn backup ra một DB

```
influxd restore -portable -db name-db  filebackup1
```

Nếu muốn backup một DB ra một DB mới

```
influxd restore -portable -db name-db -newdb name-db-new  filebackup1
```