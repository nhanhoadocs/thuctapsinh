# Những việc làm được với lesson-35
Việc check xem nó là dạng DB gì thì làm giống như những lesson trước. Ta sẽ sử dụng command `nmap`

Sau khi đăng nhập vào lesson-35 Giống như lesson-2

![](../images/lesson35/screen_2.png)

Bài này yêu cầu nhập id vào. Và sau khi nhập id thì ta thấy user và pass được hiển thị ra. Điều này có nghĩa là ta có thể sử dụng được union và select nếu ta tìm được cấu trúc của nó 

![](../images/lesson35/screen.png)

1. Tìm cấu trúc của câu truy vấn 
- Trong lúc tìm truy vấn thì có xuất ra dữ liệu khi cấu trúc lỗi ta cũng có thể sử dụng được error-base cho bài này nếu muốn 

![](../images/lesson35/screen_1.png)

- Cấu trúc của bài này đơn giải giá trị id được nhập mà không có ký tự đặc biệt nào `id = $id`  

![](../images/lesson35/screen_3.png)

2. Sử dụng union và select 

Sau khi biết được cấu trúc ta dùng union để có thể lấy được dữ liệu 

![](../images/lesson35/screen_4.png)

Cấu trúc của union là như thế này. Ví dụ như là tìm version và tên của DB  

![](../images/lesson35/screen_5.png)

