# Less 55

![](../images/sqli-labs/Less-55/01.png)

Như ta thấy ở đây cho phép ta truyền vào param ID. Ở đây mục đích lấy được `secret key` để submit. Như ở đây chỉ cho phép thực hiện 14 request. Nếu qúa 14 request thì các thông tin như tên bảng và tên cột sẽ được reset. Như vậy để lấy được `secret key` thì số request phải nhỏ hơn 14.

Thử truyền vào một số giá trị

![](../images/sqli-labs/Less-55/03.png)

Thử truyền vào một số giá trị có thể gây ra lỗi

![](../images/sqli-labs/Less-55/04.png)

![](../images/sqli-labs/Less-55/05.png)

![](../images/sqli-labs/Less-55/02.png)

Tìm cách injection

![](../images/sqli-labs/Less-55/06.png)

![](../images/sqli-labs/Less-55/07.png)

Show được DB đang làm việc với

![](../images/sqli-labs/Less-55/09.png)

Show tên của các table trong DB

![](../images/sqli-labs/Less-55/10.png)

Show thông tin trong bảng vủa show được

![](../images/sqli-labs/Less-55/11.png)

Tôi đem thông tin tin show được để submit thì thành công

![](../images/sqli-labs/Less-55/12.png)