# Less 18

Ta thấy có khung đăng nhập

![](../images/sqli-labs/Less-18/01.png)

Tôi thử đăng nhập không đúng

![](../images/sqli-labs/Less-18/02.png)

Tôi thử nhập linh tinh xem có thể pass qua được màn đăng nhập như những bài trước hay không. Tôi thử nhiều cách nhưng không thể pass qua được.

Tôi sử dụng một tài khoản để đăng nhập

![](../images/sqli-labs/Less-18/03.png)

Khi đăng nhập thành công thì thấy in ra mà hình user agent của tôi

![](../images/sqli-labs/Less-18/04.png)

Tôi thấy trường này giống với trường `User-Agent` ở trong request header của 

![](../images/sqli-labs/Less-18/05.png)

Tôi thử sửa cái trường này trong request header

![](../images/sqli-labs/Less-18/06.png)

Thì tôi thấy đã hiển thị được nó lên màn hình

![](../images/sqli-labs/Less-18/07.png)

Tôi thử truyền vào một số giá trị đặc biệt ở đây

![](../images/sqli-labs/Less-18/08.png)

Vẫn thấy in kết quả 

![](../images/sqli-labs/Less-18/09.png)

Tiếp tục thử. Đến khi tôi truyền vào 

![](../images/sqli-labs/Less-18/10.png)

Thì tôi thấy

![](../images/sqli-labs/Less-18/11.png)

Tôi thấy ở đây có lỗi SQL hiển thị ra ngoài màn hình. Chứng tỏ rằng dữ liệu lấy ở `user-agent` được truyền vào một câu lệnh SQL. Câu lệnh ở đây có thể là câu lệnh `insert` hoặc `update` vì ta thấy sau giá trị của `user-agent` còn giá trị `IP` và `username`

Tận dụng đây ta có thể show các thông tin trong DB

Show tên DB

![](../images/sqli-labs/Less-18/13.png)

![](../images/sqli-labs/Less-18/12.png)

Show thông tin trong một bảng

![](../images/sqli-labs/Less-18/14.png)

![](../images/sqli-labs/Less-18/15.png)