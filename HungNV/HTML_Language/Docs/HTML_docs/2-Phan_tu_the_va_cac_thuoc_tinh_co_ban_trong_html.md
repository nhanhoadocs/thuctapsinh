# Các phần tử và các thẻ cơ bản trong HTML

### Các phần tử: 

1.  Bắt đầu bằng `<!DOCTYPE html` : khai báo tài liệu 

2. Bản thân tài liệu HTML bắt đầu bằng `<html>` và kết thúc bằng `</html>` 

3. Phần hiển thị nằm giữa `<body>` và `</body>`

4. Phần tử trống : Các phần tử không có nội dung được gọi là phần tử trống. `<br>` là phần tử trống không có thẻ đóng. `<br>` là 1 thẻ ngắt xuống dòng. 

Ví dụ: 
```
<p>This is a <br> paragraph with a line break.</p>
```
5. Phần tử `head`

Phần tử `head` trong html là 1 thùng chứa siêu dữ liệu. Siêu dữ liệu không được hiển thị 

Phần tử `head` được đặt giữa thẻ bắt đầu `html` và thẻ bắt đầu `body`. 

Ví dụ: 
```
<!DOCTYPE html>
<html>

<head>
  <title>My First HTML</title>
  <meta charset="UTF-8">
</head>

<body>

.....

</body>
</html>
```
### Các thẻ html

1. heading h1, h2, h3

Tiêu đề html được định nghĩa từ h1 đến h6 

h1 là tiêu đề quan trọng nhất, h6 là tiêu đề ít quan trọng nhất. 

Bắt đầu bằng `<h1>` kết thúc bằng `</h1>` 

Ví dụ:
```
<h1>heading</h1>
```

Các thẻ heading có dạng như sau :

# h1 
## h2
### h3
#### h4
##### h5
###### h6 

1 tiêu đề có thể chỉ định 1 kích thước tùy ý. 

vd: 
```
<h1 style="font-size:60px;">Heading 1</h1>
```

2. Để trích dẫn 1 đoạn văn, ta sử dụng tag `<p>`

bắt đầu bằng `<p>` và kết thúc bằng `</p>`  
Ví dụ: 

```
<p>This is my paragrap</p>
```

3. Để dẫn 1 đường link, ta sử dụng tag `<a>` 

```
<a href="url">link text</a>
```
4. Nút trong html 

Để tạo nút bấm trong html ta sử dụng thẻ `<button>`

Ví dụ: 
```
<button>Bắt đầu</button>
```

<button>Bắt đầu</button>

5. Tạo 1 danh sách

Tạo danh sách có 2 loại: 

Danh sách có dấu đầu dòng sử dụng thẻ <ul> : 

```
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>
```
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>

Danh sách đánh số đầu dòng sử dụng thẻ <ol>
```
<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>
```
<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>

**Note:** Trong các yếu tố của html luôn luôn bao gồm thẻ `bắt đầu` và `kết thúc`, nội dung được chèn ở giữa `<tag>Nội dung...</tag>`

6. Thẻ `hr`

Phần tử `hr`được sử dụng để phân tách nội dung trong trang html 

Ví dụ: 

```
<h1>This is heading 1</h1>
<p>This is some text.</p>
<hr>
<h2>This is heading 2</h2>
<p>This is some other text.</p>
<hr>
```


### Các thuộc tính

Các tag trong html đều có các thuộc tính riêng 

Các thuộc tính cung cấp thông tin về 1 yếu tố. 

Các thuộc tính luôn được chỉ định trong thẻ bắt đầu 

Các thuộc tính thường có cặp tên/giá trị như `name="value"`

1. Thuộc tính `href`

Liên kết trong html được xác định trong thẻ `<a>`, liên kết được chỉ định trong thuộc tính `href` 

ví dụ: 
```
<a href="https://web.telegram.org/">This is a link</a>
```

2. Thuộc tính `src`

Hình ảnh xác định trong thẻ `<img>`, tệp nguồn của hình ảnh được xác định trong thuộc tính `src`

ví dụ: 

```
<img src="img.jpg">
```

3. Các thuộc tính `width` và `height`

thuộc tính `width` chỉ định chiều rộng 

thuộc tính `height` chỉ định chiều cao. 

ví dụ: 

```
<img src="img.jpg" width="500" height="600">
```

4. Thuộc tính `alt`

Chỉ định 1 văn bản thay thế sẽ được sử dụng nếu hình ảnh không thể hiển thị. 

ví dụ: 

```
<img src="img.jpg" alt="Buc anh demo">
```

5. Thuộc tính style 

Chỉ định kiểu dáng của 1 thành phần vd: màu sắc, kích thước, phông chữ 

Thuộc tính `style` trong html có cú pháp như sau: 

```
tagname style="property:value;">
```

vd: 
```
<p style="color:red">This is a red paragraph.</p>
```



6. Thuộc tính lang 

Được khai báo trong thẻ `<html>` 

Sử dụng để khai báo ngôn ngữ của tài liệu 

ví dụ : 

```
<html lang="vi-VN">
```

7. Thuộc tính `title` 

Thuộc tính  `title` được thêm vào thành phần `<p>`. Giá trị của thuộc tính title được hiển thị khi di chuột qua đoạn văn 

ví dụ: 

```
<p title="I'm a tooltip">
This is a paragraph.
</p>
```
