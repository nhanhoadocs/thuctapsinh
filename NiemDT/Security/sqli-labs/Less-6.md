# Less 6

Đề bài yêu cầu nhập một id

![](../images/sqli-labs/Less-6/01.png)

Nhập thử một giá trị

![](../images/sqli-labs/Less-6/02.png)

Nhập thử các gía trị để xuất hiện lỗi

![](../images/sqli-labs/Less-6/03.png)

![](../images/sqli-labs/Less-6/04.png)

Ta thể dự đoán câu query sẽ là

```
select * from table where id="$ID" limit 0,1
```

Ta có thể pass qua cái này

![](../images/sqli-labs/Less-6/05.png)

Từ đây ta có thể khai thác tương tự như ở [Less-1](Less-1.md)