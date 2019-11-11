# Less 42

Đề bài cho một khung đăng nhập

![](../images/sqli-labs/Less-42/01.png)

Ta thấy có khá nhiều chức năng nên thử hết các chức năng của website này

![](../images/sqli-labs/Less-42/02.png)

![](../images/sqli-labs/Less-42/03.png)

Như vậy ta thấy ở 2 màn quên pass và tạo mật khẩu chỉ đơn giản là html nên không thể injection được từ đây.

Tôi thử đăng nhập với 1 tài khoản không đúng

![](../images/sqli-labs/Less-42/04.png)

Thử đăng nhập với 1 tài khoản đúng

![](../images/sqli-labs/Less-42/05.png)

Thì ta thấy ở đây cho phép chúng ta đổi pass của tk vủa login.

Trở lại khung đăng nhập tôi tìm cách injection từ đây

Tôi thử nhập vào như sau

![](../images/sqli-labs/Less-42/06.png)

Thì tôi thấy đã login được với user `Dumb`

![](../images/sqli-labs/Less-42/07.png)

Tôi thử truyền vào params

![](../images/sqli-labs/Less-42/08.png)

Thấy có lỗi hiển thị lên màn hình

![](../images/sqli-labs/Less-42/09.png)

Tiếp tục thử

![](../images/sqli-labs/Less-42/10.png)

![](../images/sqli-labs/Less-42/11.png)

![](../images/sqli-labs/Less-42/12.png)

![](../images/sqli-labs/Less-42/13.png)

Ta thấy có thể khai thác DB thông qua cách này.

Tôi thấy ở bài này có sử dụng hàm `mysqli_multi_query` tôi thử nhập thử

![](../images/sqli-labs/Less-42/16.png)

Thì ta thấy kết quả

![](../images/sqli-labs/Less-42/14.png)

Bây giờ tôi đã tạo được user mới với username và password là `less42`

![](../images/sqli-labs/Less-42/15.png)

