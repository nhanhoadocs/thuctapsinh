# HTML Form 

## Phần tử Form 

##### Các phần tử trong `<form>` :

- Phần tử `<input>` 
- Phần tử `<label>` : `for` của thẻ `label` nên bằng với thuộc tính id của thẻ `input` để ràng buộc chúng lại với nhau.  
- Phần tử `<select>`:  Tạo 1 danh sách ẩn, chứa phần tử `<option>`
- Phần tử `<textarea>` xác định 1 vùng nhập văn bản 
- Phần tử `<datalist>`: Chỉ định danh sách các tùy chọn được xác định trước cho các điều kiện đầu vào. 
- phần tử `<output>` xác định kết quả tính toán. 

Xác định biểu mẫu được sử dụng để thu thập dữ liệu người dùng.

Form xác định định dạng mà input thuộc về. 

Giá trị form của `<input>` phải bằng id của `<form>`. 

1.  `formation` :Chỉ định url của tệp sẽ được xử lý đầu vào khi biểu mẫu được gửi. 

2. `formenctype` : Xác định cách mã hóa dữ liệu của biểu mẫu, chỉ dành cho `method = post` , chỉ hoạt động vs `submit` và `image`

3. `formethod` : Xác định phương thức HTTP để gửi biểu mẫu đến url, có thể dành cho cả `method = post` và `method= get`. 

4. `formtarget`: Chỉ định tên hoặc từ khóa cho biết nơi hiển thị phản hồi nhận được sau khi gửi biểu mãu. Ghi đè `target` , đầu vào là `submit` và `image`

5. `formnovalidate`: Chỉ định rằng phần tử `<input>`` không được xác thực khi gửi, ghi đè `novalidate`, đầu vào là `submit`

6. `novalidate` : Dữ liệu không được xác thực khi gửi, đầu vào là thẻ `<form>`
 
## Phần tử input

Là phần tử hình thức quan trọng nhất, phần tử `<input>` được hiển thị theo nhiều cách, ví dụ: 

```
<input type="text">
<input type="radio">
<input type="submit">
```

Các loại phần tử đầu vào của Input (type) : 
- `<input type="button">` 
- `<input type="checkbox">`  : tạo những ô để tích giá trị, có thể bao gồm nhiều  giá trị. 
- `<input type="color">`
- `<input type="date">`
- `<input type="datetime-local">`
- `<input type="email">` 
- `<input type="file">` : Chọn 1 file trong máy để tải lên
- `<input type="hidden">`
- `<input type="image">` 
- `<input type="month">` : Tháng, năm
- `<input type="number">` : Nhập vào số, giới hạn dãy số nhập vào. ( gồm các giá trị : min, max, step, value)
- `<input type="password">` 
- `<input type="radio">` : Tạo nút để tích. 
- `<input type="range">` : thanh kéo để chọn kết quả ( gồm các giá trị:  min, max, step, value)
- `<input type="reset">`
- `<input type="search">` : tạo 1 ô nhập để search
- `<input type="submit">` 
- `<input type="tel">`
- `<input type="text">`: Nhập giá trị
- `<input type="time">`
- `<input type="url">`
- `<input type="week">` : tuần, năm

## Các thuộc tính đầu vào : 

- `value` Chỉ định giá trị ban đầu cho trường đầu vào 

- `readonly` Xác định trường đầu vào là chỉ đọc (có thẻ bôi đen, tab vào)

- `disable` Thuộc tính bị vô hiệu hóa (không thể nhấp, không được gửi khi biểu mẫu)

- `size` Chỉ định chiều rộng, mặc định là size = 20. Sử dụng cho đầu vào là văn bản, tìm kiếm, tel, url, email, mật khẩu. 

- `maxlength` Chỉ định số lượng ký tự tối đa được phép trong trường đầu vào. Sử dụng cho trường đầu vào là : number, range, date, month, time and week, datetime-local. 

- `multiple` Xác định rằng người dùng được phép nhập nhiều hơn 1 giá trị trong trường đầu vào. Sử dụng cho trường đầu vào là: email và file

- `pattern` Xác định 1 biểu thức chính quy rằng giá trị trường đầu vào được kiểm tra. Ví dụ: pattern="[A-Za-z]{3}". Thuộc tính làm việc với các loại đầu vào sau: text, date, search, url, tel, email, password

- `placeholder` Xác định 1 gợi ý mô tả giá trị dự kiến của trường đầu vào. Thuộc tính làm việc với các loại đầu vào sau: text, search, url, tel, email, password 

- `required` Xác định rằng bắt buộc điền. Thuộc tính làm việc với các loại đầu vào sau: text, search, url, tel, email, password, number, checkbox, radio, file. 

- `step` Chỉ định khoảng số hợp pháp cho trường đầu vào number, date, dateime-local, month, time and week

- `list` Đề cập đến `<datalist>` chứa các tùy chọn cho trước hoặc nhập vào tùy chọn. 

- `autocomplete` (`off` hoặc `on`) Tự động hiện ra những lần nhập trước đây. 