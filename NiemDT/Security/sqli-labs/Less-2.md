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

Tiếp tục thử để xác định số cột trả về của câu query

![](../images/sqli-labs/Less-2/l27.png)

![](../images/sqli-labs/Less-2/l28.png)

Kết quả trả về của 1 câu query gồm 3 cột. Câu query có thể sẽ là:

```
select id,name, passwd from table where id=$ID limit 0,1
```

Show được DB hiện tại đang thao tác

![](../images/sqli-labs/Less-2/l29.png)

Show được các table trong một DB

![](../images/sqli-labs/Less-2/l30.png)

![](../images/sqli-labs/Less-2/l32.png)

Thao tác được giống với ở less-1