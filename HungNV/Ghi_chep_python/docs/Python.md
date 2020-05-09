# Python

Ra đời cuối những năm 1980   
python 2.0 ngày 16/10/2000  
python 3.0 3/12/2008  

Python 2.7.x chính thức ngưng hoạt động vào 1/1/2020 

Hiện tại chỉ hỗ trợ 3.5 trở lên

## Phân biệt giữa lập trình cấu trúc và lập trình hướng đối tượng 

### Lập trình hướng đối tượng 

- Chương trình sẽ chia  ra thành các phần nhỏ gọi là object 
- Đối tượng trong lập trình hướng đối tượng sẽ tương ứng với các thực thể trong bài toán , nó sẽ có các thuộc tính atribute 
- Các đối tượng có thể tương tác với nhau
- Các tính chất cơ bản : Tính trừu tượng, tính đóng gói, tính đa hình, tính kế thừa. 
- Là ngôn ngữ dễ đọc, dễ bảo trì, dễ mở rộng. 
- Các ngôn ngữ lập trình hướng đối tượng : java, c#, python, ruby, ...

### Lập trình cấu trúc 

- Là 1 kỹ thuật lập trình, trong đó chương trình được chia thành các hàm (chương trình con)
- Mỗi chương trình được chia thành nhiều các chương trình con khác để đơn giản hóa công việc của chúng
- Để liên kết các hàm với nhau, ta thường dùng các biến toàn cục hoặc con trỏ. 
- Các tính chất cơ bản của lập trình hướng cấu trúc : 
    - Tập trung vào công việc cần thực hiện 
    - Chương trình lớn được chia thành các hàm nhỏ hơn 
    - Phần lớn các hàm sử dụng dữ liệu chung
    - Hàm biến đổi dữ liệu từ hàm này qua hàm khác 
- Các ngôn ngữ lập trình hướng cấu trúc : passcall, c, ... 

### Khác nhau: OOP và POP

OOP tập trung vào các dữ liệu còn POP tập trung vào các hàm thuật toán hơn là dữ liệu 
- Chương trình : OOP chia chương trình thành các đối tượng còn POP chia chương trình thành các hàm 
- Khả năng truy cập : OOP chia ra các modifier (private, public, default) còn POP thì không 
- OOP thì chia dữ liệu và hàm 1 cách riêng biệt còn POP thì không 
- OOP bảo mật hơn POP vì giói hạn truy cập dữ liệu 
- OOP có thể thêm mới dữ liệu 1 cách dễ dàng còn POP thì rất khó. 

## Thông dịch và biên dịch 

Có thể hiểu :   
    - Thông dịch là dịch từng dòng, từng câu 
    - Biên dịch là dịch cả đoạn, cả bài 
- Python là 1 trình thông dịch vì khi gõ 1 dòng, 1 câu thì python xử lý ngay lập tức 

- Trình thông dịch của python được viết bằng C

## Chương trình 

Là 1 chuỗi các câu lệnh python được tạo ra để làm cái gì đó. ví dụ python.py cũng là 1 chương trình.

### Các khối xây dựng của chương trình 

Đầu vào : Lấy dữ liệu từ các nguồn, có thể là đọc dữ liệu từ 1 tập tin hoặc thậm chí 1 số loại cảm biến như micro hoặc gps 

Đầu ra : Hiển thị kết quả của chương trình trên màn hình hoặc lưu trữ chúng trong 1 tệp  hoặc ghi vào các thiết bị 

Thực hiện tuần tự : Thực hiện lần lượt từng câu lệnh theo thứ tự chúng gặp 

Thực hiện có điều kiện : Kiểm tra các điều kiện nhất định và thực hiện hoặc bỏ qua 1 chuỗi các câu lệnh. 

Thực hiện lặp đi lặp lại 

Tái sử dụng : Viết hướng dẫn, đặt tên cho hướng dẫn đó sau đó sử dụng lại các hướng dẫn đó khi cần trong suốt chương trình của bạn 

## Các loại lỗi 

- Lỗi cú pháp 
- Lỗi logic
- Lỗi ngữ nghĩa 

## Thuật ngữ 

- bug : lỗi 

- Interput ( thông dịch): Để thực hiện 1 chương trình ngôn ngữ cấp cao bằng cách dịch từng dòng 1 
- Compile (Biên dịch) : Dịch 1 chương trình được viets bằng ngôn ngữ cấp cao sang ngôn ngữ cấp thấp cùng 1 lúc, để thực hiện cho việc thực hiện sau này 
- Ngôn ngữ bậc cao: Thiết kế để người dùng dễ đọc, dễ viết
- Ngôn ngữ bậc thấp : Thiết kế để máy tính dễ đọc, dễ thực thi, dũng được gọi là "mã máy"
- Mã máy: ngôn ngữ cấp thấp nhất cho phần mềm, là ngôn ngữ được đơn vị xử lý trung tâm (CPU) thực hiện trực tiếp 
- Mã nguồn : 1 Chương trình tring 1 ngôn ngữ cấp cao 

## Python2 vs python3 

|python3              |python2                |
|------------------------|-----------------------|
|print("hello")          |print"hello"           |
|Lưu trữ chuỗi mặc định bằng unicode|Xác định bằng u nếu muốn lueu trữ bằng unicode|
|Cú pháp đơn giản, dễ hiểu|Tương đối khó hiểu|
|Các giá trị biến không bao giờ thay đổi|Thay đổi khi sử dụng bên trong vòng lặp for-loop|
|Các thư viện mới được tạo từ các nhà phát triển tương thích với python3|Các thư viện cũ, không còn tương thích|
|Cung cấp hàm range() để thực hiện các lần lặp| xrange() được sử dụng cho các lần lặp|
|Có thể di chuyể từ python 2 lên 3|python 3 không thể về 2|