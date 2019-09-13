## Less-1

Ta thấy ở đây là error based

![](../images/sqli-labs/Less-1-5/l11.png)

Yêu cầu truyền vào một ID

![](../images/sqli-labs/Less-1-5/l12.png)

Đây là lỗi error based nên thử truyền vào các id khác nhau

![](../images/sqli-labs/Less-1-5/l13.png)

![](../images/sqli-labs/Less-1-5/l14.png)

Dự đoán câu query để hiển thị name và password là:

```
select name, password from table where id = $ID
```
Tiếp tục thử ta thấy đã xuất hiện lỗi

![](../images/sqli-labs/Less-1-5/l15.png)

Dự đoán câu query lúc này sẽ là

```
select name, password from table where id = '$ID' limit 0,1
```

Tiếp tục thử tiếp

![](../images/sqli-labs/Less-1-5/l16.png)

Ta thấy vẫn lỗi vì câu query lúc này nó đang thực thi là

```
select name, password from table where id = '1'' limit 0,1
```

Thử comment những gì phía sau `'1'` lại để câu truy vấn chỉ còn:

```
select name, password from table where id = '1'
```

![](../images/sqli-labs/Less-1-5/l17.png)

Nhận định cấu truy vấn có thể đúng
