# Câu lệnh `WHERE`

`WHERE` lọc dữ liệu dựa trên các `field` và `tag` hoặc `/timestamp`

## Cú pháp
```sql
SELECT_clause FROM_clause WHERE <conditional_expression> [(AND|OR) <conditional_expression> [...]]
```

Mệnh đề `WHERE` hỗ trợ điều kiện cho `field`, `tag` và `timestamp`.

**Chú ý:** InfluxDB không hỗ trợ `OR` để xác định nhiều mốc thời gian

## Fields
```sql
field_key <operator> ['string' | boolean | float | integer]
```

Mệnh đề `WHERE` hỗ trợ so sánh `string`, `boolean`, `float` và `interger`

**Các operator hỗ trợ**
|Operator|Meaning|
|---|---|
|`=`|bằng|
|`<>`|Không bằng|
|`!=`|Không bằng|
|`>`|Lớn hơn|
|`<`|Nhỏ hơn|
|`>=`|Lớn hơn hoặc bằng|
|`<=`|Nhỏ hơn hoặc bằng|

Các hỗ trợ khác: phép tính số học, biểu thức chính quy

## Tags
```sql
tag_key <operator> ['tag_value']
```
Giá trị `tag` trích dẫn trong mệnh đề `WHERE`. Các truy vấn có giá trị tag hoặc giá trị tag được trích dẫn kép sé không được trả về bất kỳ dữ liệu nào. Trong hầu hết các trường hợp, nó sẽ không trả về lỗi.

**Các operator hỗ trợ**
|Operator|Meaning|
|-----|----|
|`=`|bằng|
|`<>`|Không bằng|
|`!=`|Không bằng|

Các hỗ trợ khác: Biểu thức chính quy

## Timestamps
Trong hầu hết các câu truy vấn `SELECT`, range mặc định là từ `1677-09-21 00:12:43.145224194` và `2262-04-11T23:47:16.854775806Z` UTC.

Đối với các câu lệnh `SELECT` với mệnh đề `GROUP BY time()`, phạm vi thời gian mặc định là từ `1677-09-21 00: 12: 43.145224194 UTC` và `now()`.

## Ví dụ
### Lấy dữ liệu từ key là field cụ thể
Lấy dữ liệu từ measurement với `field values` của `water_level` lớn hơn 8

```sql
SELECT * FROM "h2o_feet" WHERE "water_level" > 8
```
OUTPUT
```sql
name: h2o_feet
time                 level description    location     water_level
----                 -----------------    --------     -----------
2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
2019-08-17T00:06:00Z between 6 and 9 feet coyote_creek 8.005
[...]
2019-09-17T00:12:00Z between 6 and 9 feet coyote_creek 8.189
2019-09-17T00:18:00Z between 6 and 9 feet coyote_creek 8.084
```

### Lấy dữ liệu có trường chuỗi cụ thể
Lấy dữ liệu mà `level drecrition` có giá trị là `below 3 feet` từ `h2o_feet`. InfluxQL yêu cầu các trích dẫn đơn xung quanh các giá trị trường chuỗi trong mệnh đề `WHERE`.

```sql
SELECT * FROM "h2o_feet" WHERE "level description" = 'below 3 feet'
```
OUTPUT
```sql
name: h2o_feet
time                 level description location     water_level
----                 ----------------- --------     -----------
2019-08-17T00:00:00Z below 3 feet      santa_monica 2.064
2019-08-17T00:06:00Z below 3 feet      santa_monica 2.116
[...]
2019-09-17T14:06:00Z below 3 feet      santa_monica 2.999
2019-09-17T14:36:00Z below 3 feet      santa_monica 2.907
```

### Chọn dữ liệu có giá trị khóa trường cụ thể và thực hiện số học cơ bản
Truy vấn trả về dữ liệu từ phép đo `h2o_feet` với các giá trị trường của `water_level` cộng với 2 giá trị lớn hơn 11.9.
```sql
SELECT * FROM "h2o_feet" WHERE "water_level" + 2 > 11.9
```
OUTPUT
```sql
name: h2o_feet
time                 level description         location     water_level
----                 -----------------         --------     -----------
2019-08-28T07:06:00Z at or greater than 9 feet coyote_creek 9.902
2019-08-28T07:12:00Z at or greater than 9 feet coyote_creek 9.938
2019-08-28T07:18:00Z at or greater than 9 feet coyote_creek 9.957
2019-08-28T07:24:00Z at or greater than 9 feet coyote_creek 9.964
2019-08-28T07:30:00Z at or greater than 9 feet coyote_creek 9.954
2019-08-28T07:36:00Z at or greater than 9 feet coyote_creek 9.941
2019-08-28T07:42:00Z at or greater than 9 feet coyote_creek 9.925
2019-08-28T07:48:00Z at or greater than 9 feet coyote_creek 9.902
2019-09-01T23:30:00Z at or greater than 9 feet coyote_creek 9.902
```

## Một số lỗi thường gặp khi sử dụng `WHERE`
### Mệnh đề `WHERE` trả về không có dữ liệu
Trong hầu hết các trường hợp, vấn đề này là kết quả của việc thiếu dấu ngoặc đơn xung quanh giá trị thẻ hoặc giá trị trường chuỗi.

Ví dụ: 2 truy vấn đầu tiên dưới đây sẽ không trả về dữ liệu do thiếu dấu `''` hoặc sử dụng `""`
```sql
> SELECT "water_level" FROM "h2o_feet" WHERE "location" = santa_monica

> SELECT "water_level" FROM "h2o_feet" WHERE "location" = "santa_monica"

> SELECT "water_level" FROM "h2o_feet" WHERE "location" = 'santa_monica' limit 2
name: h2o_feet
time                 water_level
----                 -----------
2019-08-17T00:00:00Z 2.064
2019-08-17T00:06:00Z 2.116
[...]
2019-09-17T21:36:00Z 5.066
2019-09-17T21:42:00Z 4.938
```