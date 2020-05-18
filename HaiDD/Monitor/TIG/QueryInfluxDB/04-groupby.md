# Mệnh đề `GROUP BY`

Mệnh đề `GROUP BY` trong Influx sẽ nhóm truy vấn kết quả theo `tag` mà người dùng chỉ định hoặc khoảng thời gian.

## `GROUP BY <tag>`
### Cú pháp
```sql
SELECT_clause FROM_clause [WHERE_clause] GROUP BY [* | <tag_key>[,<tag_key]]
```

- `GROUP BY *` : Nhóm kết quả theo tất cả các tag
- `GROUP BY <tag_key>` : Nhóm kết quả theo 1 tag cụ thể
- `GROUP BY <tag_key>,<tag_key>` : Nhóm kết quả theo nhiều tag cụ thể. Thứ tự của các tag không quan trọng.

**Lưu ý:** Nếu truy vấn bao gồm `WHERE`, mệnh đề `GROUP BY` phải xuất hiện sau mệnh đề `WHERE`.

### Ví dụ
**`GROUP BY` với một tag**

Truy vấn tính `water_level` trung bình cho từng giá trị của tag `location` trong phép đo `h2o_feet`.
```sql
> SELECT MEAN("water_level") FROM "h2o_feet" GROUP BY "location"
name: h2o_feet
tags: location=coyote_creek
time mean
---- ----
0    5.3591424203039155

name: h2o_feet
tags: location=santa_monica
time mean
---- ----
0    3.5307120942458807
```

**`GROUP BY` với nhiều tag**

Truy vấn tính chỉ số trung bình cho mỗi kết hợp của tag `location` và `randtag` trong phép đo `h2o_quality`. Phân tách giữa các tag bằng dấu phẩy.
```sql
> SELECT MEAN("index") FROM "h2o_quality" GROUP BY location,randtag
name: h2o_quality
tags: location=coyote_creek, randtag=1
time mean
---- ----
0    50.69033760186263

name: h2o_quality
tags: location=coyote_creek, randtag=2
time mean
---- ----
0    49.661867544220485

name: h2o_quality
tags: location=coyote_creek, randtag=3
time mean
---- ----
0    49.360939907550076

name: h2o_quality
tags: location=santa_monica, randtag=1
time mean
---- ----
0    49.132712456344585

name: h2o_quality
tags: location=santa_monica, randtag=2
time mean
---- ----
0    50.2937984496124

name: h2o_quality
tags: location=santa_monica, randtag=3
time mean
---- ----
0    49.99919903884662
```

**`GROUP BY` tất cả các tag**

Truy vấn tính giá trị trung bình cho trường `index` với sự kết hợp tất cả các tag
```sql
> SELECT MEAN("index") FROM "h2o_quality" GROUP BY *
name: h2o_quality
tags: location=coyote_creek, randtag=1
time mean
---- ----
0    50.69033760186263

name: h2o_quality
tags: location=coyote_creek, randtag=2
time mean
---- ----
0    49.661867544220485

name: h2o_quality
tags: location=coyote_creek, randtag=3
time mean
---- ----
0    49.360939907550076

name: h2o_quality
tags: location=santa_monica, randtag=1
time mean
---- ----
0    49.132712456344585

name: h2o_quality
tags: location=santa_monica, randtag=2
time mean
---- ----
0    50.2937984496124

name: h2o_quality
tags: location=santa_monica, randtag=3
time mean
---- ----
0    49.99919903884662
```

## GROUP BY time intervals
### Cú pháp cơ bản
```sql
SELECT <function>(<field_key>) FROM_clause WHERE <time_range> GROUP BY time(<time_interval>),[tag_key] [fill(<fill_option>)]
```

`time(time_interval)` : `time_interval` trong mệnh đề `GROUP BY time` là một khoảng thời gian bằng chữ.([duration literal](https://docs.influxdata.com/influxdb/v1.8/query_language/spec/#durations)). Nó xác định cách mà InfluxDB nhóm các kết quả theo thgian.

`time(time_interval)` : Nó thay đổi giá trị được khai báo trogn các khoảng thời gian không có dữ liệu. `GROUP BY time interval` và `fill` để lọc thêm thông tin.

**Phủ sóng - Coverage**

Các truy vấn cơ bản theo nhóm thời gian dữa trên `time_interval` và thời gian đặt trước trên InfluxDB để xác định dữ liệu thô được bao gồm trong mỗi khoảng thời gian và timestamp được trả về bởi câu truy vấn.

### Ví dụ
Ví dụ đơn giản
```sql
> SELECT "water_level","location" FROM "h2o_feet" WHERE time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-18T00:30:00Z'
name: h2o_feet
time                 water_level location
----                 ----------- --------
2019-08-18T00:00:00Z 8.504       coyote_creek
2019-08-18T00:00:00Z 2.352       santa_monica
2019-08-18T00:06:00Z 8.419       coyote_creek
2019-08-18T00:06:00Z 2.379       santa_monica
2019-08-18T00:12:00Z 8.32        coyote_creek
2019-08-18T00:12:00Z 2.343       santa_monica
2019-08-18T00:18:00Z 8.225       coyote_creek
2019-08-18T00:18:00Z 2.329       santa_monica
2019-08-18T00:24:00Z 8.13        coyote_creek
2019-08-18T00:24:00Z 2.264       santa_monica
2019-08-18T00:30:00Z 8.012       coyote_creek
2019-08-18T00:30:00Z 2.267       santa_monica
```

Truy vấn số lượng `water_level` với tag `location = coyote_creek` thành các khoảng thời gian 12 phút
```sql
> SELECT COUNT("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-18T00:30:00Z' GROUP BY time(12m)
name: h2o_feet
time                 count
----                 -----
2019-08-18T00:00:00Z 2
2019-08-18T00:12:00Z 2
2019-08-18T00:24:00Z 2
```

Truy vấn trong khoảng 12 phút và với `tag key`
```sql
> SELECT COUNT("water_level") FROM "h2o_feet" WHERE time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-18T00:30:00Z' GROUP BY time(12m),"location"
name: h2o_feet
tags: location=coyote_creek
time                 count
----                 -----
2019-08-18T00:00:00Z 2
2019-08-18T00:12:00Z 2
2019-08-18T00:24:00Z 2

name: h2o_feet
tags: location=santa_monica
time                 count
----                 -----
2019-08-18T00:00:00Z 2
2019-08-18T00:12:00Z 2
2019-08-18T00:24:00Z 2
```

## Cú pháp GROUP BY time() nâng cap
### Cú pháp
```sql
SELECT <function>(<field_key>) FROM_clause WHERE <time_range> GROUP BY time(<time_interval>,<offset_interval>),[tag_key] [fill(<fill_option>)]
```

### Ví dụ
```sql
> SELECT "water_level" FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-18T00:54:00Z'
name: h2o_feet
time                 water_level
----                 -----------
2019-08-18T00:00:00Z 8.504
2019-08-18T00:06:00Z 8.419
2019-08-18T00:12:00Z 8.32
2019-08-18T00:18:00Z 8.225
2019-08-18T00:24:00Z 8.13
2019-08-18T00:30:00Z 8.012
2019-08-18T00:36:00Z 7.894
2019-08-18T00:42:00Z 7.772
2019-08-18T00:48:00Z 7.638
2019-08-18T00:54:00Z 7.51
```

Truy vấn nhóm thành các khoảng thời gian 18 phút và chuyển các ranh giới thời gian đặt về phía trước 6 phút.
```sql
> SELECT MEAN("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:06:00Z' AND time <= '2019-08-18T00:54:00Z' GROUP BY time(18m,6m)
name: h2o_feet
time                 mean
----                 ----
2019-08-18T00:06:00Z 8.321333333333333
2019-08-18T00:24:00Z 8.012
2019-08-18T00:42:00Z 7.640000000000001
```

Truy vấn như trên nhưng không đặt ranh giới thời gian đặt trước
```sql
> SELECT MEAN("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:06:00Z' AND time <= '2019-08-18T00:54:00Z' GROUP BY time(18m)
name: h2o_feet
time                 mean
----                 ----
2019-08-18T00:00:00Z 8.3695
2019-08-18T00:18:00Z 8.122333333333334
2019-08-18T00:36:00Z 7.768000000000001
2019-08-18T00:54:00Z 7.51
```

**Lưu ý:** `offset_interval` buộc ranh giới thời gian thứ 4 nằm ngoài thời gian phạm vi thời gian. Kết quả truy vấn không trả về kết quả nào cho khoảng thời gian cuối cùng đó.