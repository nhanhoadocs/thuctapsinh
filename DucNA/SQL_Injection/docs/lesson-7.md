# Những việc làm được với lesson-7
Việc check xem nó là dạng DB gì thì làm giống như những lesson trước. 

Sau khi đăng nhập vào lesson-7 

![](../images/lesson7/screen_9.png)

1. Yêu cầu của nó là nhập ID và ta thử nhập nó vào. và dự đoán cấu trúc của câu truy vấn.

![](../images/lesson7/screen_1.png)

Khi ta nhập id thì như vậy sẽ pass được qua. Nhưng khi ta thêm ký tự đặc biệt vào thì nó không báo lỗi cụ thể ra ngoài màn hình mà nó chỉ thông báo là có lỗi 

![](../images/lesson7/screen_2.png)

Có nghĩa là ta không thể dùng `error-base` cho bài này. Vậy nên ta phải dùng một loại khác. Trước tiên ta tìm cấu trúc câu lệnh truy vấn 

Sau những lesson trước thì thấy rằng khi ký tự đặc biệt có lỗi mà thêm `--+` cuối cùng đúng thì nó là cấu trúc của URL. Ví dụ 

![](../images/lesson7/screen_4.png)

![](../images/lesson7/screen_3.png)

Vậy cấu trúc của nó là
```
?id=1')) --+
```

2. 