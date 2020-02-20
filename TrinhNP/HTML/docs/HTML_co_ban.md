# Một số cách sử dụng cơ bản để viết nội dung văn bản HTML 
1. Gắn link 
- Để gắn được một link cần nói đến trong nội dung thì HTML có thẻ `<a>`
```
<a href="url"> tên muốn hiển thị </a>
```
Kết quả

[đây là link github](https://github.com/duckmak14/thuctapsinh)

Trong việc gắn link thì nó cũng có một số target riêng để tạo ra các option khác nhau 
- `_blank` : Mở nội dung thành một tab mới trên trình duyệt 
- `_parent` : Mở nội dung trong web mới thay cho trang hiện tại 
- `_self` : Mở nội dung trong cùng một tab

2. Gắn ảnh 
- Để có thể đăng ảnh lên trang web thì ta sử dụng `<img`
- Có hai loại gắn ảnh. Đó là gắn ảnh online và gắn ảnh local 
    - Gắn ảnh online là ta sẽ gắn đường link dẫn tới ảnh trên internet vào và nó sẽ hiển thị ảnh đó 
    - Gắn ảnh local là gắn đường dẫn tới thư mục chứa ảnh đó và tên ảnh 
- Cấu trúc 
```
<img src="URL">
```
trong đó:
- `<img` : là thẻ xác định là gắn ảnh 
- `src` : Bắt đầu đường dẫn tới ảnh. Đường dẫn online hoặc local 
- `URL` : là đường dẫn
```
<img src="URL" style="width:500px;height:600px;">
```
- Có thể chỉnh sửa ảnh bằng giá `style` : chỉnh chiều dài(width) chiều rộng(height)
- Có thể xác định được vị trí của từng vật dụng trong một khung hình để có thể link tới một ảnh khác với thẻ `<map>`
- Có thể sử dụng ảnh làm hình nền cho đoạn văn bản 

3. Bảng
- Trong HTML có thể biểu diễn dữ liệu theo dạng bảng 
- Có thể tạo ra các đường viền bo quanh bảng và các ô trong bảng `border` 
- Có thể tạo ra khoảng trắng giữa các ô với `padding`
....
```
<table style="width:100%">
  <tr>
    <th>Firstname</th>
    <th>Lastname</th> 
    <th>Age</th>
  </tr>
  <tr>
    <td>Jill</td>
    <td>Smith</td>
    <td>50</td>
  </tr>
  <tr>
    <td>Eve</td>
    <td>Jackson</td>
    <td>94</td>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>
    <td>80</td>
  </tr>
</table>
```
Trong đó: 
- `<table>` : Thẻ để bắt đầu tạo bảng  
- `width` : 100% độ dài cửa sổ trình duyệt 
- `<tr>` : Là thẻ xác định dữ liệu theo hàng 
- `<th>` : Thẻ xác định tên tiêu đề của cột 
- `<td>` : Thẻ để nói rằng đây là ô chứa dữ liệu 

4. Danh sách 
- Trong HTML có thể tạo biểu diễn được dữ liệu theo kiểu danh sách với các thẻ `<ul>` và `li`
```
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>  
```
Kết quả hiển thị như dưới: 

- Coffee
- Tea
- Milk
<hr>

- Trong đó:

    - `<ul>` : Thẻ bắt đầu danh sách 
    - `<li>` : Mỗi nội dung trong danh sách được bắt đầu bằng thẻ này 

5. Class
- Ta sẽ đặt tên cho một kiểu thuộc tính để có thể sử dụng đi sử dụng lại nhiều lần như là một hàm 
- Class sẽ biểu diễn các kiểu thuộc tính như là : màu nền, màu chữ, size chữ, size nền....

```
Tên_class {

Thuộc tính của class
}
```
Ví dụ 
```
test {

  background-color: black;
  color: white;
  padding: 20px;
}
```

6. iframes 
- Một iframes được sử dụng để hiển thị một trang web trong một trang web 
```
<iframe src="URL"></iframe>
```

- Có thể sử dụng `style` để xác định khung hiển thị trang web đó có chiều dài và chiều rộng bao nhiêu 
```
<iframe src="URL" style="height:200px;width:300px;"></iframe>
```

- Theo mặc định thì nó sẽ có một đường viền xung quanh khi sử dụng iframes. Để xóa đường viên đó ta sử dụng `border`
```
<iframe src="URL" style="border:none;"></iframe>
```
7. id 
- ID được sử dụng để xác định một id nào đó cho một element duy nhất 
- Giá trị của id phân biệt chữ hoa và chữ thường 
- Giá trị id phải chứa ít nhất một ký tự và không được chứa khoảng trắng 
8. Cách bố trí bố cục 

Trong một bài HTML thì sẽ phân chia bố cục trang web thì có 5 cách để phân chia bố cục
- HTML tables
- CSS flexbox
- CSS framework
- CSS grid
- CSS float property
