# Less 19

Đề bài cho khung đăng nhập

![](../images/sqli-labs/Less-19/01.png)

Thử đăng nhập vào đây

![](../images/sqli-labs/Less-19/02.png)

Thử đăng nhập xem có thể pass qua màn đăng nhập như những bài trước được hay không. Nhưng trong bài này tôi thấy không thể pass qua màn đăng nhập được như những bài trước. Tôi thử dùng một tài khoản để đăng nhập vào

![](../images/sqli-labs/Less-19/03.png)

![](../images/sqli-labs/Less-19/04.png)

Tôi thấy có một dòng hiện lên. Dòng này tôi thấy giống với một trường trong header của http request

![](../images/sqli-labs/Less-19/05.png)

Thôi thử sửa dòng này trong header của http request

![](../images/sqli-labs/Less-19/06.png)

Tôi thấy nó lấy đúng giá trị này lên trên màn hình

![](../images/sqli-labs/Less-19/07.png)

Tôi thử truyền vào một vài giá trị có các ký tự đặc biệt vào đây

![](../images/sqli-labs/Less-19/08.png)

Thì tôi thấy

![](../images/sqli-labs/Less-19/09.png)

Tôi thấy ở đây có xuất hiện lỗi lên màn hình. Lỗi ở đây là lỗi của SQL, như vậy ta có thể tận dụng vào đây để show lên các thông tin của DB. Dựa vào lỗi ta có thể thấy nó ở đây họ đã lấy thông tin của `Referer` trong http request header để ghi xuống DB. Câu query xuống DB có thể là một câu lệnh `insert` hoặc `update`. Phía sau trường dữ liệu của lấy từ `referer` còn một trường giá trị là `IP`. 

Khi tôi truyền vào 

![](../images/sqli-labs/Less-19/10.png)

Thì tôi thấy giá trị trả về đã không còn báo lỗi 

![](../images/sqli-labs/Less-19/11.png)

Tôi thử show một vài thông tin trong DB

Show tên DB

![](../images/sqli-labs/Less-19/12.png)

Show user sử dụng để kết nối DB

![](../images/sqli-labs/Less-19/13.png)

Show cột bên trong một bảng

![](../images/sqli-labs/Less-19/14.png)

Hoặc cũng có thể show dữ liệu bên trong một bảng

![](../images/sqli-labs/Less-19/15.png)

Tương tự như vậy ta có thể show các giá trị khác nữa
