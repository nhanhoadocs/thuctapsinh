# Less 17

Ta thấy có một khung để reset mật khẩu

![](../images/sqli-labs/Less-17/01.png)

Tôi nhập linh tinh thử vào đây thì thấy 

![](../images/sqli-labs/Less-17/02.png)

Tiếp tục thử thì khi tôi nhập vào là

![](../images/sqli-labs/Less-17/03.png)

Thì thấy thông báo reset pass thành công

![](../images/sqli-labs/Less-17/04.png)

Tôi thử dùng username và password này để đăng nhập vào bài trước thì thấy đăng nhập thành công

![](../images/sqli-labs/Less-17/05.png)

Chứng tỏ rằng ở bài này sẽ thực hiện update lại password của user khi chúng ta chỉ cần chỉ ra tên của user và truyền vào cho nó một password mới.

Tôi tiếp tục thử xem có gì mới xuất hiện hay không. Ban đầu tôi nhập linh tinh vào khung username thì tôi không thấy nó xuất hiện gì. Nhưng khi tôi sử dụng một username đúng(user admin như tôi thử được ở bên trên) và sau đó tôi thử nhập linh tinh vào `New Password`. Sau nhiều lần đăng thử thì khi tôi đăng nhập vào như sau:

![](../images/sqli-labs/Less-17/06.png)

Thì tôi thấy có lỗi của SQL hiển thị ra màn hình

![](../images/sqli-labs/Less-17/07.png)

Như vậy ta có thể tận dụng vào đây để khai thác các thông tin trong DB

Show tên DB

![](../images/sqli-labs/Less-17/08.png)

![](../images/sqli-labs/Less-17/09.png)

Show bảng trong DB

![](../images/sqli-labs/Less-17/11.png)

![](../images/sqli-labs/Less-17/10.png)

Tương tự như vậy ta cũng có thể khai thác các thông tin khác giống như những bài trước.
