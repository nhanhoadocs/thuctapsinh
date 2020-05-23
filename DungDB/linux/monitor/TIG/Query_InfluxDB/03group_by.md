# GROUP BY

## GROUP BY tags

`GROUP BY <tag>` truy vấn kết quả bởi một tag cụ thể do user chỉ định

Cú pháp:

    SELECT_clause FROM_clause [WHERE_clause] GROUP BY [* | <tag_key>[,<tag_key]]

| operator | Ý nghĩa |
|----------| --------|
|`GROUP BY *`| kết quả với tất cả tags|
|`GROUP BY <tag_key>`| kết quả với một tag cụ thể|
|`GROUP BY <tag_key>,<tag_key>`| kết quả với hơn một tag. Không sắp xếp theo thứ tự |

Chú ý: Nếu câu truy vấn có `WHERE` thì `GROUP BY` phải đứng sau `WHERE`

Ví dụ:

Nhóm kết quả truy vấn với 1 tag

```sql
> select last("water_level") from "h2o_feet" group by "location"
name: h2o_feet
tags: location=coyote_creek
time                 last
----                 ----
2019-09-17T16:24:00Z 3.235

name: h2o_feet
tags: location=santa_monica
time                 last
----                 ----
2019-09-17T21:42:00Z 4.938
```

Nhóm kết quả truy vấn với nhiều hơn 1 tag

```sql
> SELECT MEAN("index") FROM "h2o_quality" GROUP BY location,randtag

name: h2o_quality
tags: location=coyote_creek, randtag=1
time                  mean
----                  ----
1970-01-01T00:00:00Z  50.69033760186263

name: h2o_quality
tags: location=coyote_creek, randtag=2
time                   mean
----                   ----
1970-01-01T00:00:00Z   49.661867544220485

name: h2o_quality
tags: location=coyote_creek, randtag=3
time                   mean
----                   ----
1970-01-01T00:00:00Z   49.360939907550076

name: h2o_quality
tags: location=santa_monica, randtag=1
time                   mean
----                   ----
1970-01-01T00:00:00Z   49.132712456344585

name: h2o_quality
tags: location=santa_monica, randtag=2
time                   mean
----                   ----
1970-01-01T00:00:00Z   50.2937984496124

name: h2o_quality
tags: location=santa_monica, randtag=3
time                   mean
----                   ----
1970-01-01T00:00:00Z   49.99919903884662
```

