# Sử dụng một số lệnh cơ bản

## Tạo và phân quyền cho user

Truy cập influxdb

```
[root@localhost ~]# influx
Connected to http://localhost:8086 version 1.7.6
InfluxDB shell version: 1.7.6
Enter an InfluxQL query
> 
```

Tạo user

```
create user "username" with password "your-pass" with all privileges
```

Như vậy user này có tất cả các quyền trong influxdb. Sau đó ta phải enable xác thực trong influxdb

```
sed -i 's/# auth-enabled = false/auth-enabled = true/g' /etc/influxdb/influxdb.conf
```

Restart lại influxdb

```
systemctl restart influxdb
```

## Thao tác với DB

Việc thao tác với DB sử dụng ngôn ngữ truy vấn cũng gần giống với ngôn ngữ truy vấn của MySQL.

Tạo database

```
create databases name-DB
```

Để show tất cả các database

```
show databases
```

Để làm việc với một database 

```
use database
```

Để xóa một database

```
drop database name-DB
```

## Ghi dữ liệu insert

Để ghi dữ liệu thì trước hết ta cần phải đang làm việc với DB. Nếu chưa ta sử dụng lệnh `use name-DB`

Sử dụng lệnh `insert` để thực hiện việc ghi dữ liệu vào DB.

```
insert measurement,tagkey1=value1,tagkey2=value2 fieldkey1=value3
```

Ta có thể coi measurement là một bảng như trong MySQL.

VD: Nếu bạn muốn ghi thông tin vào trong bảng có tên `info`

```
insert info,host=server1 ram=12,cpu=3
```

Như ví dụ trên ta có thể thấy chỉ có một tag-key là `host` và có 2 field-key `ram` và `cpu`. Ta có thể kiểm tra dữ liệu đã được ghi vào chưa

```
 select * from info
name: info
time                cpu host    ram
----                --- ----    ---
1560247400905360702 3   server1 12
```

Khi ta thực hiện insert dữ liệu vào thì sẽ có thêm một cột là timestamp. Timestamp sẽ tự động được ghi vào nó tính theo thời gian tại thời điểm hiện tại. Bạn cũng có thể chỉ ra giá trị này bằng các thêm vào sau cùng

```
insert info,host=server2 ram=12,cpu=10 1560247400000000000
```

Và ta có thể thấy

```
select * from info
name: info
time                cpu host    ram
----                --- ----    ---
1560247400000000000 10  server2 12
1560247400905360702 3   server1 12
```

## Sử dụng show

Lệnh `show` được sử dụng để show các tag, field, database, measurement, ...

**Để show series**

```
show series on DB
```

Hoặc nếu bạn đang làm việc với DB là bạn muốn show series trên DB đó bạn chỉ cần dùng lệnh

```
show series
```

**Show retention policy**

Để show retention policy trên một database ta dùng lệnh

```
show retention policies on DB
```

Nếu bạn đang làm việc trên DB bạn chỉ cần dùng lệnh

```
show retention policies
```

**Show tag key**

```
show tag keys on name-DB
```

**Show tag value**

```
show tag values on name-DB with key = "name-tag-value"
```

**Show measurement**

```
show measurements on name-DB
```

**Show field key**

```
show field keys on name-DB
```

## Create và drop

**Create database**

Để tạo một database mà không chỉ ra retention policy

```
create database name-DB
```

Tạo một database có chỉ ra retention policy

```
create database "data1" with duration 10d replication 1 share duration 1d name "ten_days"
```

**Delete database**

```
drop database "name-DB"
```

**Delete series**

```
drop series from "measerement-name" where "tag-key" = "tag-value"
```

Drop tất cả series từ measurement `ab`

```
drop series from "ab"
```

Drop tất cả các series có tag key map với một tag value được chỉ ra

```
drop series from "ab" where "host"="host1"
```

Như ví dụ trên thì ta sẽ thực hiện xóa các series trong measurement `ab` mà có tag key `host=host1`

Nếu bạn muốn xóa tất cả các series trong DB thì bạn có thể bỏ qua `from`

```
drop series where "host"="host1"
```

Ta cũng có thể sử dụng `delete` để xóa các series. Với việc sử dụng `delete` thì nó ko xóa các series from index. Và nó cho phép sử dụng time interval khi dùng `where`.

```
delete from "ad" where time < '2019-06-01'
```

Như ví dụ trên sẽ tiến hành xóa những series có thời gian trước `01/06/2019` từ measurement `ad`

**Create retention policy**

```
create retention policy "name-rp" on "name-DB" duration <duration> replication <relication>
```

Ta cũng có thể tạo một `default` retention policy

```
create retention policy "one_day_only" ON "NOAA_water_database" duration 23h60m replication 1 default
```

**Chỉnh sửa retention policy**

Ví dụ bạn tạo ra một retention policy 

```
CREATE RETENTION POLICY "what_is_time" ON "NOAA_water_database" DURATION 2d REPLICATION 1
```

Nhưng một sau một thời gian bạn muốn đổi `duration` thành `3 tuần`và đặt nó thành `default`

```
CREATE RETENTION POLICY "what_is_time" ON "NOAA_water_database" DURATION 3w REPLICATION 1 DEFAULT
```

**Xóa một retention policy**

```
drop retention policy "name-retention-policy" on "name-DB"
```

## Query data select

```
select <field_key>[,<field_key>,<tag_key>] from <measurement_name>[,<measurement_name>]
```

Ta coi measurement trong influxdb thì việc sử dụng `select` giống như với sử dụng select để query dữ liệu trong MySQL.

```
> SELECT "level description","location","water_level" FROM "h2o_feet"

name: h2o_feet
--------------
time                   level description      location       water_level
2015-08-18T00:00:00Z   below 3 feet           santa_monica   2.064
2015-08-18T00:00:00Z   between 6 and 9 feet   coyote_creek   8.12
[...]
2015-09-18T21:36:00Z   between 3 and 6 feet   santa_monica   5.066
2015-09-18T21:42:00Z   between 3 and 6 feet   santa_monica   4.938
```

Ta cũng có thể select các giá trị từ nhiều `measurement` cùng một lúc

```
SELECT * FROM "h2o_feet","h2o_pH"
```

**where**

Ta có thể kết hợp `select` với `where` để chỉ lấy những giá trị phù hợp

```
SELECT * FROM "h2o_feet" WHERE "water_level" > 8

name: h2o_feet
--------------
time                   level description      location       water_level
2015-08-18T00:00:00Z   between 6 and 9 feet   coyote_creek   8.12
2015-08-18T00:06:00Z   between 6 and 9 feet   coyote_creek   8.005
[...]
2015-09-18T00:12:00Z   between 6 and 9 feet   coyote_creek   8.189
2015-09-18T00:18:00Z   between 6 and 9 feet   coyote_creek   8.084
```

Select dữ liệu bằng cách chỉ ra timestamp

```
SELECT * FROM "h2o_feet" WHERE time > now() - 7d
```

**Group by**

```
group by "tag-key"
```

Với `group by` được sử dụng để query dữ liệu theo từng bộ tag được chỉ ra trong `group by`

`group by *` nhóm kết quả trả về theo tất cả các tag 

`group by "tag-key"` nhóm kết quả theo tag được chỉ ra

Bạn cũng có thể chỉ ra nhiều `tag-key` trong `group by`

Ví dụ

```
SELECT MEAN("water_level") FROM "h2o_feet" GROUP BY "location"

name: h2o_feet
tags: location=coyote_creek
time			               mean
----			               ----
1970-01-01T00:00:00Z	 5.359342451341401


name: h2o_feet
tags: location=santa_monica
time			               mean
----			               ----
1970-01-01T00:00:00Z	 3.530863470081006
```

Nếu bạn sử dụng kết hợp cả `where` và `group by` thì `where` phải được đặt trước `group by`

Sử dụng `group by` time intervals

```
SELECT COUNT("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2015-08-18T00:00:00Z' AND time <= '2015-08-18T00:30:00Z' GROUP BY time(12m)

name: h2o_feet
--------------
time                   count
2015-08-18T00:00:00Z   2
2015-08-18T00:12:00Z   2
2015-08-18T00:24:00Z   2
```

Như ví dụ trên ta sẽ nhóm kết quả thành cứ mỗi 12 phút sẽ thành 1 nhóm. Nếu muốn sử dụng `group by time()` thì bạn phải sử dụng thêm các function. Như ví dụ trên ta sử dụng function `count`

**INTO**

`into` sẽ cho phép query của bạn được lưu vào một measuremant.

```
select * into "name-measurement-new" from "name-measure" where ...
```

**order by time desc**

Bình thường khi dữ liệu được ghi vào nó sẽ được ghi xuống dưới cùng. Như vậy khi bạn query thì dữ liệu mới nhất sẽ hiển thị ở dưới cùng. Nếu muốn hiển thị dữ liệu mới nhất trên đầu thì bạn sử dụng thêm `order by time desc` vào cuối cùng câu truy vấn

```
SELECT "water_level" FROM "h2o_feet" WHERE "location" = 'santa_monica' ORDER BY time DESC
```

**limit**

Sử dụng `limit` để chỉ chi phép hiển thị ra số point khi query

```
SELECT "water_level","location" FROM "h2o_feet" LIMIT 3

name: h2o_feet
time                   water_level   location
----                   -----------   --------
2015-08-18T00:00:00Z   8.12          coyote_creek
2015-08-18T00:00:00Z   2.064         santa_monica
2015-08-18T00:06:00Z   8.005         coyote_creek
```

Như ví dụ trên chỉ cho phép nó hiển thị ra 3 point

**slimit**

sử dụng `slimit N` để chỉ hiện ra các các point trong số  `N series` trong measurements mà bạn chỉ ra 

```
SELECT "water_level" FROM "h2o_feet" GROUP BY * SLIMIT 1

name: h2o_feet
tags: location=coyote_creek
time                   water_level
----                   -----
2015-08-18T00:00:00Z   8.12
2015-08-18T00:06:00Z   8.005
2015-08-18T00:12:00Z   7.887
[...]
2015-09-18T16:12:00Z   3.402
2015-09-18T16:18:00Z   3.314
2015-09-18T16:24:00Z   3.235
```

Như ví dụ trên chỉ thực hiện để hiển thị các point trong một `tag`

**limit và slimit**

Limit số point và series sẽ return

```
SELECT "water_level" FROM "h2o_feet" GROUP BY * LIMIT 3 SLIMIT 1

name: h2o_feet
tags: location=coyote_creek
time                   water_level
----                   -----------
2015-08-18T00:00:00Z   8.12
2015-08-18T00:06:00Z   8.005
2015-08-18T00:12:00Z   7.887
```

Như ví dụ trên chỉ hiển thị 3 point từ 1 series.

**Time Zone**

Nếu muốn chỉ rõ timezone bạn có thể thêm trường `tz('timezone')

Nếu muốn truy vấn sử dụng timezone ở Việt Nam

```
SELECT "water_level" FROM "h2o_feet" WHERE "location" = 'santa_monica' AND time >= '2015-08-18T00:00:00Z' AND time <= '2015-08-18T00:18:00Z' tz('Asia/Ho_Chi_Minh')
```

**Relative time**

Nếu bạn muốn lấy thời điểm hiện tại làm mốc thời gian. Sau đó sử dụng thêm các phép toán `+` và `-` để thực hiện các phép query theo mốc thời gian.

```
SELECT "water_level" FROM "h2o_feet" WHERE time > now() - 1h
```

## Function

Trong influxdb có khá nhiều function được dùng để xử lý trong các query. Ví dụ có một số function hay sử dụng như:

`count()` được sử dụng để đếm số vulue trong một tag hoặc filed

`mean()` dùng để tính giá trị trung bình

`sum()` dùng để tính tổng

`first()`, `last()`, `max()`, `min()`, `abs()` ...

Vd sử dụng funciton count()

```
> select count(*) from disk
name: disk
time count_read count_write
---- ---------- -----------
0    31853      31853
```

Nếu muốn xem thêm các function khác tham khảo [tại đây](https://docs.influxdata.com/influxdb/v1.7/query_language/functions/)

