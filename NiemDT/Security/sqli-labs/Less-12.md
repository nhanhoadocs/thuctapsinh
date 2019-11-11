# Less 12

Ta thấy một khung đăng nhập

![](../images/sqli-labs/Less-12/01.png)

Thử đăng nhập

![](../images/sqli-labs/Less-12/02.png)

Sau nhiều lần thử tôi nhập vào

![](../images/sqli-labs/Less-12/03.png)

Thì lỗi hiển thị ra màn hình như sau:

![](../images/sqli-labs/Less-12/04.png)

Ta có thể nhận định câu query có thể là 

```
select * from table where user=("$user") and password=("$passwd") limit 0,1
```

Tôi có thể thử lại xem nhận định liệu có đúng

![](../images/sqli-labs/Less-12/05.png)

Kết quả tôi đã pass qua được màn đăng nhập

![](../images/sqli-labs/Less-12/06.png)

Như vậy có thể phần so sánh điều kiện của tôi có thể đúng. Dựa vào đây tôi có thể khai thác thông tin như [Less-11](Less-11.md)