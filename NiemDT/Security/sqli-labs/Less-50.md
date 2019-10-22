# Less 50

Đề bài cho phép truyền vào params `sort`

![](../images/sqli-labs/Less-50/01.png)

Truyền thử vào một số giá trị

![](../images/sqli-labs/Less-50/02.png)

![](../images/sqli-labs/Less-50/03.png)

Thử truyền vào một số giá trị có thể gây ra lỗi

![](../images/sqli-labs/Less-50/04.png)

![](../images/sqli-labs/Less-50/05.png)

Ta thấy lỗi được hiển thị lên màn hình. Như vậy ta có thể căn cứ vào đây để show thông tin bên trong DB

![](../images/sqli-labs/Less-50/06.png)

Tiếp tục thử thì tôi thấy có thể sử dụng query nhiều câu lệnh cùng lúc.

![](../images/sqli-labs/Less-50/07.png)

Tôi thử insert dữ liệu vào bảng này thì tôi thấy kết quả đã insert vào được

![](../images/sqli-labs/Less-50/08.png)
