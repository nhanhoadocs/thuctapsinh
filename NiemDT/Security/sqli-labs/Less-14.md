# Less 14

Đề bài vẫn cho khung đăng nhập

![](../images/sqli-labs/Less-14/01.png)

Đăng nhập thử

![](../images/sqli-labs/Less-14/02.png)

Sau nhiều lần thử khi tôi nhập vào như sau

![](../images/sqli-labs/Less-14/03.png)

Tôi thấy có lỗi hiển thị ra màn hình như sau

![](../images/sqli-labs/Less-14/04.png)

Dựa vào đây tôi có thể phán đoán câu query như sau

```
select * from table where user="$user" and password="$passwd" limit 0,1
```

Dựa vào đây tôi có thể thử login

![](../images/sqli-labs/Less-14/05.png)

Tôi đã login thành công mà không cần đến username và password

![](../images/sqli-labs/Less-14/06.png)

Dựa vào đây tôi cũng có thể show các thông tin trong database như những bài trước và thực hiện thêm đoạn code PHP vào server

![](../images/sqli-labs/Less-14/07.png)