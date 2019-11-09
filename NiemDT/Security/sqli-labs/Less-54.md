# Less 54

Đề bài cho phép truyền vào ID.

![](../images/sqli-labs/Less-54/01.png)

Ta thấy như thông báo ở đây chỉ cho phép thực hiện 10 request. Nếu quá 10 request thì tên bảng và tên column sẽ được đổi bằng cách sinh random.

Tôi thử truyền vào id

![](../images/sqli-labs/Less-54/02.png)

![](../images/sqli-labs/Less-54/03.png)

Mỗi lần request thì ta thấy nó đã được đếm. Khi quá 10 lần thì nó được reset lại 0

![](../images/sqli-labs/Less-54/04.png)

Thử reset lại challenge

![](../images/sqli-labs/Less-54/06.png)

Thử tìm cách injection

![](../images/sqli-labs/Less-54/05.png)

Show tên DB đang làm việc

![](../images/sqli-labs/Less-54/07.png)

Show user đang đứng

![](../images/sqli-labs/Less-54/08.png)

Show tên tables

![](../images/sqli-labs/Less-54/10.png)

Show các column của bảng

![](../images/sqli-labs/Less-54/09.png)

Show thông tin trong bảng

![](../images/sqli-labs/Less-54/12.png)

Tôi thử đem lần lượt 1 trong 2 chuỗi show được để submit vào khung submit `secret key`. Thì khi submit chuỗi thứ 2 thì thành công

![](../images/sqli-labs/Less-54/13.png)

Ở trong bài này để thực hiện lấy được chuỗi như bên trên thì từ đầu đến cuối chỉ được thực hiện dưới 10 request. Nếu quá 10 request thì ta lại phải thực hiện lại từ đầu.

Trong bài này tôi cũng thử tìm các injection từ khung `submit` nhưng không được.