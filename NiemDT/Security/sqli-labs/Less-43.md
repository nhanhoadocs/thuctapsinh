# Less 43

Tôi thấy khung đăng nhập

![](../images/sqli-labs/Less-43/01.png)

Tôi thử click vào một số đường dẫn trên màn này thì thấy không có gì để khai thác. Tôi quay lại đây để nhập linh tinh vào xem có thể khai thác được gì từ đây không

Khi tôi nhập một tài khoản không đúng

![](../images/sqli-labs/Less-43/02.png)

Tôi nhập vào

![](../images/sqli-labs/Less-43/04.png)

Thì thấy có lỗi SQL hiển thị lên màn hình

Tôi tiếp tục thử

![](../images/sqli-labs/Less-43/05.png)

Thì thấy 

![](../images/sqli-labs/Less-43/06.png)

Từ đây ta có thể show được toàn bộ thông tin trong DB

![](../images/sqli-labs/Less-43/09.png)

![](../images/sqli-labs/Less-43/10.png)

Ta có thể tạo một user mới

![](../images/sqli-labs/Less-43/11.png)

Sử dụng user vừa tạo để login

![](../images/sqli-labs/Less-43/12.png)

Tôi có thể đổi password cho một user khi quên pass

![](../images/sqli-labs/Less-43/13.png)

Login với user `dumb` với password vừa đổi

![](../images/sqli-labs/Less-43/14.png)

