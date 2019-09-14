## Less-1

Ta thấy ở đây là error based

![](../images/sqli-labs/Less-1/l11.png)

Yêu cầu truyền vào một ID

![](../images/sqli-labs/Less-1/l12.png)

Đây là lỗi error based nên thử truyền vào các id khác nhau

![](../images/sqli-labs/Less-1/l13.png)

![](../images/sqli-labs/Less-1/l14.png)

Dự đoán câu query để hiển thị name và password là:

```
select name, password from table where id = $ID
```
Tiếp tục thử ta thấy đã xuất hiện lỗi

![](../images/sqli-labs/Less-1/l15.png)

Dự đoán câu query lúc này sẽ là

```
select name, password from table where id = '$ID' limit 0,1
```

Tiếp tục thử tiếp

![](../images/sqli-labs/Less-1/l16.png)

Ta thấy vẫn lỗi vì câu query lúc này nó đang thực thi là

```
select name, password from table where id = '1'' limit 0,1
```

Thử comment những gì phía sau `'1'` lại để câu truy vấn chỉ còn:

```
select name, password from table where id = '1'
```

![](../images/sqli-labs/Less-1/l17.png)

Dựa vào đây ta có thể show toàn bộ user và password trong table đó bằng cách tăng dần số giá trị ở trong `limit`

![](../images/sqli-labs/Less-1/l18.png)

![](../images/sqli-labs/Less-1/l19.png)

Tận dụng việc này ta có thể show tìm kiếm một số thông tin

Đọc file /etc/passwd

![](../images/sqli-labs/Less-1/l114.png)

Show database hiện tại

![](../images/sqli-labs/Less-1/l112.png)

Show user đang thao tác với database

![](../images/sqli-labs/Less-1/l113.png)

Show table trong DB 

![](../images/sqli-labs/Less-1/l116.png)

![](../images/sqli-labs/Less-1/l117.png)

Ta cũng có thể show các cột trong các bảng

![](../images/sqli-labs/Less-1/l118.png)

![](../images/sqli-labs/Less-1/l119.png)

![](../images/sqli-labs/Less-1/l120.png)

Show thông tin ở các bảng khác

![](../images/sqli-labs/Less-1/l121.png)

![](../images/sqli-labs/Less-1/l122.png)

Ta có thể up một đoạn code PHP lên server

![](../images/sqli-labs/Less-1/l123.png)

Bây giờ ta có thể thao tác trên chính server đó

![](../images/sqli-labs/Less-1/l123.png)

![](../images/sqli-labs/Less-1/l124.png)