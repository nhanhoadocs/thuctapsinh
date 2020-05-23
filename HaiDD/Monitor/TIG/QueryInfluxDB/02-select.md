# Câu lệnh `SELECT`

## **Cú pháp**
```sql
SELECT <field_key>[,<field_key>,<tag_key>] FROM <measurement_name>[,<measurement_name>]
```

## Mệnh đề `SELECT`
Mệnh đề SELECT hỗ trợ một số định dạng để chỉ định dữ liệu

|Mệnh đề|Ý nghĩa|
|-------------------|-------------------|
|`SELECT *`|Trả về tất cả các `fields` và `tags`|
|`SELECT "<field_key>"`|Trả về 1 `field` cụ thể|
|`SELECT "<field_key>","<field_key>"`|Trả về nhiều hơn 1 `field`|
|`SELECT "<field_key>","<tag_key>"`|Trả về 1 `field` và 1 `tag` cụ thể. Mệnh đề `SELECT` phải chỉ định ít nhất một `field` khi nó bao gồm `tag`|
|`SELECT "<field_key>"::field,"<tag_key>"::tag`|Trả về 1 `field` cụ thể. `::[field | tag]` là cú pháp chỉ định kiểu nhận dạng. Sử dụng cú pháp này để phân biệt giữa các `field key` và `tag key` có cùng tên.|

**Các tính năng được hỗ trợ:** Các phép toán số học, Hàm số, Phép toán cơ bản, Biểu thức chính quy

## Mệnh đề `FROM`
Mệnh đề `FROM` hỗ trợ một số định dạng chỉ định các `measurement(s)`:

|Mệnh đề|Ý nghĩa|
|-------|-------|
|`FROM <measurement_name>`|Trả về dữ liệu từ 1 measurement duy nhất|
|`FROM <measurement_name>,<measurement_name>`|Trả về dữ liệu từ nhiều measurement|
|`FROM <database_name>.<retention_policy_name>.<measurement_name>`|Trả về dữ liệu từ một measurement đủ điều kiện. Đủ điều kiện khi chỉ định database và chính sách duy trì của nó|
|`FROM <database_name>..<measurement_name>`|Trả về dữ liệu từ measurement do người dùng chỉ định và chính sách lưu giữ `DEFAULT`|

**Các tính năng được hỗ trợ:** Biểu thức chính quy

## Ví dụ
### Chọn tất cả các field từ một measurement
Chọn tất cả các filed và tag từ `h2o_feet`
```sql
SELECT * FROM "h2o_feet"
```
OUTPUT
```sql
name: h2o_feet
time                 level description    location     water_level
----                 -----------------    --------     -----------
2019-08-17T00:00:00Z below   3 feet       santa_monica 2.064
2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
[...]
2019-09-17T21:36:00Z between 3 and 6 feet santa_monica 5.066
2019-09-17T21:42:00Z between 3 and 6 feet santa_monica 4.938
```

### Chọn các tag và field cụ thể từ một measurement
Truy vấn chọn field `level description`, tag `location`, field `water_level` từ mesurement `h2o_feet`
```sql
SELECT "level description","location","water_level" FROM "h2o_feet"
```
OUTPUT
```sql
name: h2o_feet
time                 level description    location     water_level
----                 -----------------    --------     -----------
2019-08-17T00:00:00Z below 3 feet         santa_monica 2.064
2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
[...]
2019-09-17T21:36:00Z between 3 and 6 feet santa_monica 5.066
2019-09-17T21:42:00Z between 3 and 6 feet santa_monica 4.938
```

### Chọn các tag và field cụ thể từ một phép đo duy nhất và cung cấp loại định danh của chúng
```sql
SELECT "level description"::field,"location"::tag,"water_level"::field FROM "h2o_feet"
```
OUTPUT
```sql
name: h2o_feet
time                 level description    location     water_level
----                 -----------------    --------     -----------
2019-08-17T00:00:00Z below 3 feet         santa_monica 2.064
2019-08-17T00:00:00Z between 6 and 9 feet coyote_creek 8.12
[...]
2019-09-17T21:36:00Z between 3 and 6 feet santa_monica 5.066
2019-09-17T21:42:00Z between 3 and 6 feet santa_monica 4.938

```

### Chọn field và thực hiện phép toán số học
```sql
SELECT ("water_level" * 2) + 4 from "h2o_feet"
```
OUTPUT
```sql
name: h2o_feet
time                 water_level
----                 -----------
2019-08-17T00:00:00Z 20.24
2019-08-17T00:00:00Z 8.128
[...]
2019-09-17T21:36:00Z 14.132
2019-09-17T21:42:00Z 13.876
```