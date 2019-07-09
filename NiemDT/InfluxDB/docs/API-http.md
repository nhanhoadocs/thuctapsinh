# Sử dụng HTTP API 

Để có thể truy cập được bằng http ta cần cho phép truy cập http trong file config của influxdb bằng cách chạy lệnh sau

```
sed -i 's/# enabled = true/enabled = true/g' /etc/influxdb/influxdb.conf
sed -i 's/# auth-enabled = false/auth-enabled = true/g' /etc/influxdb/influxdb.conf
```

Sau đó tiến restart lại influxdb

```
systemctl restart influxdb
```

Để sử dụng api http ta sử dụng command `curl` để thực hiện. Các ví dụ bên dưới đây máy cài influxdb ở trên một máy có địa chỉ `10.10.10.161` và thực hiện `curl` trên một máy khác. Http sẽ sử dụng port mặc định là `8086`

**/debug/requests**

Được sử dụng để hiển thị các client đang thực hiện write và query đến influxdb

```
[root@grafana ~]# curl http://10.10.10.161:8086/debug/requests?seconds=60
{
"admin:10.10.10.168": {"writes":41,"queries":0}
}
```

Như ví dụ trên user `admin` ở đang thực hiện write 41 lần và query 0 lần trong vòng 1 phút gần nhất.

**/ping**

Được sử dụng để check trạng thái của influxdb của bạn 

```
[root@grafana ~]# curl -sl -I  http://10.10.10.161:8086/ping
HTTP/1.1 204 No Content
Content-Type: application/json
Request-Id: 4a458b9c-8ced-11e9-8847-0050569342ff
X-Influxdb-Build: OSS
X-Influxdb-Version: 1.7.6
X-Request-Id: 4a458b9c-8ced-11e9-8847-0050569342ff
Date: Wed, 12 Jun 2019 08:37:19 GMT
```

**/query**

Với query ta có thể dùng để quản lý database

Với `/query` ta có thể thực hiên `get` và `post`

Với `get` được sử dụng với những query bắt đầu với `select` và `show`

`post` được sử dụng với với những query bắt đầu với `alter`, `create`, `delete`, `drop`, `grant`, `kill`, `revoke`.

Ví dụ sử dụng query với `select`

```
curl -u admin:Admin123@ -G 'http://10.10.10.161:8086/query?db=mydb' --data-urlencode 'q=SELECT * FROM "mymeas"'

{"results":[{"statement_id":0,"series":[{"name":"mymeas","columns":["time","myfield","mytag1","mytag2"],"values":[["2017-03-01T00:16:18Z",33.1,null,null],["2017-03-01T00:17:18Z",12.4,"12","14"]]}]}]}
```

Với `admin:Admin123@` là username và password để login vào influxdb.

Để `create` một database

```
curl -u admin:Admin123@ -XPOST 'http://10.10.10.161:8086/query' --data-urlencode 'q=create database namedata'
```

Với các query bắt đầu với `alter`, `delete`, `drop`, `grant`, `kill`, `revoke` ta thực hiện tương tự như `create`

**/write**

Được sử dụng để write dữ liệu vào database

```
curl -u admin:Admin123@ -i -XPOST 'http://10.10.10.161:8086/write?db=mydb' --data-binary 'ram,cot3=4,host=server18 value=18'
```

Như ví dụ trên ta thực hiện write dữ liệu vào database `mydb` và measurement `ram`

