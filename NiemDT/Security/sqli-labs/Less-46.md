# Less 46

Ta thấy đề bài cho phép truyền vào param `sort`

![](../images/sqli-labs/Less-46/01.png)

Tôi thử truyền vào một số giá trị

![](../images/sqli-labs/Less-46/02.png)

![](../images/sqli-labs/Less-46/03.png)

![](../images/sqli-labs/Less-46/04.png)

![](../images/sqli-labs/Less-46/05.png)

Ta thấy ở đây bảng output được sắp xếp theo cột được truyền vào. Gía trị được truyền vào được sử dụng cho `order by` để thực hiện cho việc sắp xếp.

Tôi thử truyền vào một số giá trị có thể gây ra lỗi thì thấy

![](../images/sqli-labs/Less-46/06.png)

Tôi thấy ở đây lỗi của SQL hiển thị lên trên màn hình. Dựa vào đây ta có thể show các thông tin của DB bằng cách khai thác thông qua error based.

```
http://192.168.84.233/sqli-labs/Less-46/?sort=1|| extractvalue(1,concat(0x7e,(select database())))--+
```

![](../images/sqli-labs/Less-46/07.png)

![](../images/sqli-labs/Less-46/08.png)

Hoặc ta có thể sử dụng time based để khai thác

![](../images/sqli-labs/Less-46/09.png)