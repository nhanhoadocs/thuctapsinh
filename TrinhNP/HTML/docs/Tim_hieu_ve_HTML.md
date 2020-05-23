# Tìm hiểu về ngôn ngữ HTLM cơ bản
1. Khái niệm
* HTML(Hyper Text Markup Language) hay còn được gọi là ngôn ngữ siêu văn bản được sử dụng để mô tả cấu trúc giao diện một trang web 
* HTML giúp cho trình duyệt web hiển thị nội dung của một trang web
* HTML sử dụng các thẻ. Bên trong các thẻ là nội dung của trang web. Trình duyệt không hiển thị các thẻ mà hiển thị nội dung của trang web theo tính chất của các thẻ đó
* HTML có thể được chỉnh sửa bằng rất nhiều các trình soạt thảo khác nhau. `NOTEPAD` hoặc là `TEXTEDIT` (MAC) là những ứng dụng đơn giản có thể sửa được HTML
* Cấu trúc của một file HTML 
```
<!DOCTYPE html>
<html>
<body>

<h1> Tiêu đề </h1>

</body>
</html>
```

2. Elements 
* Một câu (phần tử) trong file HTML có cấu trúc là nội dung được để ở giữa 2 thẻ(tag) HTML 
```
<tagname> Nội dung </tagname>

ví dụ 

<p> đây là đoạn văn bản </p>
```

* Có những phần tử không có thẻ kế thúc, nó sẽ không có nội dung để hiển thị mà nó có chức năng nhất định. Ví dụ `<br>` là biểu diễn cho sự kết thúc dòng 
* Các phần tử HTML được biểu diễn lồng được vào nhau để hiển thị nội dung 
* Các thẻ trong HTML không phân biệt chữ hoa và chữ thường 

3. Attributes
* Mỗi một attributes có một chức năng riêng biệt 
* attributes thường được biểu diễ dưới dạng `Name = value` 
* attributes thường được sử dụng để gắn link, ảnh, thay đổi màu chữ... 

4. Heading 
- Tiêu đề trong HTML được sử thành nhiều loại và được biểu thị trong các thẻ khác nhau 
- Các kích thước tiêu đề sẽ có từ 1 đến 6 
- Các tiêu đề sẽ tự động được thêm một dòng trắng ở trước và sau mà không cần sử dụng thẻ `<br>`
- Mỗi tiêu đề sẽ có kích thước được mặc định sẵn nhưng mà ta có thể chỉnh sửa kích thước đó với thẻ attributes `style`
- Thẻ `<hr>` là thẻ tạo ra một dòng kẻ ngang trên trình duyệt hiển thị
```
<!DOCTYPE html>
<html>
<body>

<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>

</body>
</html>
```
Kết quả 

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

5. Đoạn văn bản 
- Một nội dung của đoạn văn bản được biểu diễn bên trong thẻ `<p>`
```
<p> Nội dung </p>
```
- Không thể quy định được cách hiển thị của đoạn văn bản. Nó hiện thị dựa trên mức độ to nhỏ của màn hình
- Một số trường hợp quên thẻ kết thúc của thẻ `<p>` trình duyệt vẫn hiểu và cho phép hiển thị nội dung 
- Thẻ `<br>` được sử dụng để kết thúc một đoạn văn bản nếu ta muốn xuống dòng 
- Thẻ `<pre>` được sử dụng để hiển thị nội dung như bên trong thẻ 
```
<pre>
Nội dung 1.

Nội dung 2.
</pre>
```
Kết quả 
```
Nội dung 1.

Nội dung 2.
```
Còn thẻ `<p>` sẽ hiển thị như sau 
```
<p>
Nội dung 1.

Nội dung 2.
</p>
```
Kết quả 
```
Nội dung 1. Nội dung 2.
``` 
6. Styles 
- `Styles` là một attributes. Được biểu diễn dưới dạng 
```
<tagname style="property:value;">
```
Trong đó: 
- `tagname` : Là tên thẻ mà được sử dụng để hiển thị nội dung 
- `style` : Là tên để xác định bắt đầu nội dung của attributes
- `property` : Là tính chất của nội dung. ví dụ như màu chữ, size, màu nền....
- `value` : Là giá trị để hiển thị của property

Ví dụ 
```
<p style="color:red;"> Đây là màu đỏ.</p>
```
kết quả 

<font color="red"> Đây là màu đỏ. </font>

Một số `property` trong HTML
- Sử dung `background-color` để thay đổi màu nền
- Sử dung `color` để thay đổi màu chữ 
- Sử dụng `font-family` để thay đổi phông chữ
- Sử dụng `font-size` để thay đổi size chữ
- Sử dụng `text-align` để thay đổi vị trí bắt đầu 

7. Định dạng văn bản 
- Các văn bản muốn được nổi bật hơn hay được sử dụng để làm chú thích thường được in đấm hay in nghiêng...
- Các thẻ đánh định dạng văn bản trong HTML là 
    - `<b>` In đậm 
    - `<strong>` In đậm 
    - `<i>` và `em` In nghiêng 
    - `<mark>` Xác định văn bản được thêm màu nền 
    - `<small>` Định nghĩa văn bản nhỏ hơn 
    - `<del>` Xác định văn bản bị xóa 
    - `<ins>` Xác định văn bản được chèn thêm 
    - `<q>` Xác định văn bản là lời trích dẫn từ lời nói của ai hoặc là từ sách nào
- Dòng comment. Trong HTML thì để comment một đọan nào đó có cấu trúc như sau 
```
<!-- nội dung comment -->
```
- Trong HTML thì các chữ có thể được thay đổi màu bằng cách sử dụng `style`. Và màu có thể được biểu diễn bằng tên màu hoặc là biểu diễn dưới dạng `hex`...
