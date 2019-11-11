# Less 31

Đề bài cho phép truyền ID vào URL

![](../images/sqli-labs/Less-31/01.png)

Thử truyền giá trị

![](../images/sqli-labs/Less-31/02.png)

Truyền vào một số giá trị có thể gây ra lỗi

![](../images/sqli-labs/Less-31/03.png)

Ta thấy ở đây có lỗi hiển thị lên màn hình

Tôi tiếp tục thử

![](../images/sqli-labs/Less-31/04.png)

Ta có thể show các thông tin trong DB bằng cách cho hiển thị lỗi lên màn hình

![](../images/sqli-labs/Less-31/11.png)

Tôi thấy ở đây có cả trang login

![](../images/sqli-labs/Less-31/06.png)

Tôi thử truyền ID vào đây

![](../images/sqli-labs/Less-31/07.png)

Khi tôi tìm cách để xem có thể injection được không thì thấy nó chuyển sang trang khác

![](../images/sqli-labs/Less-31/08.png)

Tôi tiếp tục thử

```
http://192.168.84.233/sqli-labs/Less-31/?id=1") and sleep(5) --+
```

![](../images/sqli-labs/Less-31/09.png)

Ta thấy ở đây dù sang màn khác ta thấy nó vẫn lấy thông tin từ URL truyền vào câu query. Như vậy ta có thể khai thác các thông tin sử dụng time based

```
http://192.168.84.233/sqli-labs/Less-31/?id=1") and if(substr((select @@version),1,1)='5',sleep(10),false) --+
```

![](../images/sqli-labs/Less-31/10.png)