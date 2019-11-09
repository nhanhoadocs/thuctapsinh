# Less 49

Đề bài vẫn cho phép truyền vào params là `sort`

![](../images/sqli-labs/Less-49/01.png)

Thử truyền vào một số params

![](../images/sqli-labs/Less-49/02.png)

![](../images/sqli-labs/Less-49/03.png)

Truyền vào một số giá trị có thể gây ra lỗi

![](../images/sqli-labs/Less-49/04.png)

![](../images/sqli-labs/Less-49/05.png)

![](../images/sqli-labs/Less-49/06.png)

Như vậy ta thấy ở bài này lỗi ko hiển thị lên màn hình nên ta tìm cách khác để injection

![](../images/sqli-labs/Less-49/06.png)

Ta thấy có thể injection bằng cách time based

![](../images/sqli-labs/Less-49/07.png)

