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

Ta thấy câu query trả về 3 cột

![](../images/sqli-labs/Less-3/8.png)

![](../images/sqli-labs/Less-3/9.png)

Ta có thể thao giống less-1