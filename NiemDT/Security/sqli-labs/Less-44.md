# Less 44

Ta thấy khung đăng nhập

![](../images/sqli-labs/Less-44/01.png)

Thử tìm cách injection từ đây

![](../images/sqli-labs/Less-44/02.png)

![](../images/sqli-labs/Less-44/04.png)

Create 1 user mới

![](../images/sqli-labs/Less-44/05.png)

Đăng nhập với user vừa tạo

![](../images/sqli-labs/Less-44/06.png)

Đổi password cho 1 user mà không cần biết password hiện tại

![](../images/sqli-labs/Less-44/07.png)

Đăng nhập được với password vừa đổi

![](../images/sqli-labs/Less-44/08.png)

Ta có thể khai thác dữ liệu trong DB bằng cách sử dụng boolean based

```
1' or (ascii((substr(user(),1,1))) >> 6)=1 -- 
```

![](../images/sqli-labs/Less-44/09.png)