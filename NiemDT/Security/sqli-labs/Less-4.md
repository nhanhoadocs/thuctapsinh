# Less 4

![](../images/sqli-labs/Less-4/1.png)

Câu query có thể là

```
select user, passwd from table where id=("$id") limit 0,1
```

Dưa vào đây ta có thể khai thác được giống với [Less-1](sqli-labs/Less-1.md)