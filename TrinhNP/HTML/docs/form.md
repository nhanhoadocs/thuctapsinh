# Các form và một số cách tạo form trong HTML 
- Có những trang web có yêu câu thu thập thông tin của người sử dụng như là tạo tài khoản. Để làm như vậy thường sẽ có một khung để thu thập dữ liệu của người dùng:
- Thẻ `<form>` được sử dụng để tạo ra khung trong HTML 
- Bên trong thẻ HTML sẽ chứa các thành phần của form để tạo ra form như là: input elements, like text fields, checkboxes, radio buttons, submit buttons...
- `Action` Attribute : Xác định hành động sau khi gửi biểu mẫu đi. 
- `<button>` : Xác định phần có thể nhấn vào 
- Xác định trường không thể thay đổi giá trị `readonly`
```
<form action="">
First name:<br>
<input type="text" name="firstname" value ="Đức" readonly>
<br>
Last name:<br>
<input type="text" name="lastname">
</form>
```
<form action="">
First name:<br>
<input type="text" name="firstname" value ="Đức" readonly>
<br>
Last name:<br>
<input type="text" name="lastname">
</form>

- Nếu thay trường `readonly` bằng `disable` thì trường đó sẽ bị vô hiệu hóa. Và khi dữ liệu gửi đi thì giá trị đó sẽ không được gửi đi 
- Sử dụng size để hiển thị kích thước nhập khung nhập dữ liệu 
- `maxlength` Trường này sẽ xác định ký tự tối đa nhập vào 

1. Khung trong forms 
- `<fieldset>` Được sử dụng để đóng khung cho `<form>`
```
<fieldset>
<legend> tên khung đóng </legend>
test
</fieldset>

```
<fieldset>
<legend> tên khung đóng </legend>
test
</fieldset>

- `<legend>` Được dùng để xác định tên của `<fieldset>`
2. Attribute `method` : sử dụng để chỉ định phương thức HTTP khi gửi biểu mẫu: có hai loại là (POST hoặc GET) 

| GET | POST |
|---|---|
| Khi gửi thông tin biểu mẫu đi sẽ hiểu thị trên thanh URL | Khi gửi thông tin biểu mẫu đi sẽ không hiển thị trên thanh URL |
| Độ dài URL bị giới hạn 2048 kí tự | Không dùng được bookmarked|

3. Type trong forms 
- Xác định được kiểu dữ liệu đầu vào phụ thuộc vào thẻ `input`. Trong một thẻ input thì dữ liệu được xác định bằng attribute `type`. Một số kiểu type 

| Type | Description |
|---|---|
| `<input type="text">`| Dữ liệu nhập vào sẽ là text |
| ` <input type="radio"> ` | Dữ liệu sẽ có kiểu nút để chọn |
| `<input type="submit">` | Nút để gửi mẫu đi | 
| `<input type="button">` | Nút để nhấn |
| `<input type="date">`|Kiểu dữ liệu là ngày tháng năm|
| `<input type="color">`| Kiểu chọn màu ô |
| `<input type="file">` | Kiểu chọn file |
| `<input type="month">` | Kiểu dữ liệu tháng và năm |
| ` <input type="number">` | Kiểu nhập số |
| `<input type="password">` | Kiểu dữ liệu nhập vào là pass | 
| `<input type="time">` | Kiểu dữ liệu nhập vào là thời gian |
| `<input type="week">` | Kiêu tuần và năm |
| `<input type="reset">` | Kiểu xác định đặt lại tất cả biểu mẫu |

Ví dụ 
```
<form>
  First name:<br>
  <input type="text" name="firstname">
  <br>
  Last name:<br>
  <input type="text" name="lastname">
</form>
```
<form>
  First name:<br>
  <input type="text" name="firstname">
  <br>
  Last name:<br>
  <input type="text" name="lastname">
</form>

Trong đó :
- `</form>` : bắt đầu khung biểu mẫu
- `First name` và `Last name` : Là dòng text hiển thị bên trên khung biểu mẫu 
- ` type` : xác định kiểu dữ liệu nhập vào 
- `name` : Xác định tên của Khung biểu mẫu để đối chiếu dữ liệu. Nếu thiếu trường này thì dữ liệu sẽ không được gửi đi 

4. Trường select trong forms 
- Được sử dụng để tạo ra một danh sách tùy chọn được kéo xuống khi bấm vào 
- Theo mặc định thì dữ liệu đầu tiên sẽ được hiển thị trong mục thả các dữ liệu khác xuống 
- Sử dụng `multiple` để có thể hiển thị được nhiều hơn là một dữ liệu đầu tiên
- Bình thường văn bản nhập vào sẽ chỉ có một dòng. Muốn ô nhập có được nhiều dòng dữ liệu khi nhập vào sử dụng trường `textarea` 
- Dùng `rows` để chọn số dòng hiển thị dữ liệu 
- Dùng `cols` Để chọn số cột hiển thị dữ liệu 
```
<select name="cars">
    <option value="1"> 1 </option>
    <option value="2"> 2 </option>
    <option value="3"> 3 </option>
    <option value="4"> 4 </option>
  </select>
```
<select name="cars">
    <option value="1"> 1 </option>
    <option value="2"> 2 </option>
    <option value="3"> 3 </option>
    <option value="4"> 4 </option>
</select>

Trong đó: 
- `<select>` : Bắt đầu tạo khung tùy chọn 
- `<option>` : Xác định tùy chọn. 
