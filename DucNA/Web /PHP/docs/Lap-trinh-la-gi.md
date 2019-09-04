# Một số khái niệm trung trong lập trình \
1. Lập trình hướng đối tượng 
- Object Oriented Programming – OOP: là một kỹ thuật lập trình, trong đó chương trình sẽ được chia ra thành các phần nhỏ được gọi là đối tượng (Object).
- Đối tượng trong lập trình hướng đối tượng sẽ tương ứng với các thực thể trong bài toán, nó sẽ có các thuộc tính (attribute), các hành động (method). Các đối tượng có thể tương tác với nhau.
- Lập trình hướng đối tượng tập trung vào các đối tượng nên nó sẽ đơn giản hóa việc mở rộng dữ liệu
- Các ngôn ngữ lập trình hướng đối tượng: Java, C#, Python, Ruby, Swift, Object-C
- Các tính chất cơ bản của lập trình hướng đối tượng: 
    - tính trừu tượng
    - tính đóng gói
    - tính đa hình
    - tính kế thừa


2. Lập trình Hướng cấu trúc
- Lập trình hướng cấu trúc (Procedure Oriented Programming) là ngôn ngữ lập trình trong đó một chương trình sẽ được chia thành các hàm . Mỗi hàm cũng có thể có các hàm con khác.
- Các ngôn ngữ lập trình hướng cấu trúc: Pascal, C…  
-  Mỗi chương trình còn có thể được chia ra nhiều chương trình con khác để đơn giản hóa công việc của chúng. 
- Chương trình = Cấu trúc dữ liệu + Giải thuật
- Lập trình hướng cấu trúc tập trung chủ yếu vào thuật toán 
- Ưu điểm : Tư duy giải thuật rõ ràng. Đơn giản, dễ hiểu. 
- Nhược điểm : 
    - Trong lập trình hướng cấu trúc ta thường quan tâm đến việc phát triển các hàm mà ít quan tâm tới dữ liệu 
    - Không hỗ trợ sử dụng lại mã nguồn: mỗi cấu trúc dữ liệu chỉ phù hợp với một số giải thuật, khi thay đổi cấu trúc dữ liệu thì giải thuật phải thay đổi theo
    - Không phù hợp với các bài toán lớn có nhiều module. 
    - OOP bảo mật hơn POP vì nó giới hạn lượng truy cập dữ liệu 

3. Ngôn ngữ thông dịch 
- Ngôn ngữ thông dịch là ngôn ngữ sau khi viết ra nó sẽ trực tiếp dịch thành ngôn ngữ máy để máy tính thực thi được. 
- Khi máy tính chạy đến dòng lệnh nào thì nó sẽ chuyển thành ngôn ngữ máy đến đó 
- Bộ thông dịch thực hiện quá trình thông dịch gọi là interpreter.
- Ưu điểm 
    - Hỗ trợ đa nền tảng.
    - Kích thước chương trình thực thi nhỏ hơn.
- Nhược điểm 
    - Chương trình có độ tin cậy thấp
    - Source code dễ dàng bị dịch ngược.
    - Tốc độ thực thi chậm hơn.
    - Tiềm tàng nguy cơ có lỗi do thiếu     

4. Ngôn ngữ biên dịch 
- Cách hoạt động của trình biên dịch khác so với thông dịch. Thay vì chạy trực tiếp thành mã máy, trình biên dịch sẽ phải chuyển đổi tất cả ngôn ngữ lập trình thành mã máy rồi chứa kết quả vào ổ đĩa cứng để có thể thực thi ở lần chạy sau.
- Bộ biên dịch thực hiện quá trình biên dịch được gọi là compiler.
- Các ngôn ngữ thuộc loại biên dịch như là: C, pascal, C++... 
- Ưu điểm 
    - Chương trình sau đó được thực thi nhanh hơn.
    - Độ tin cậy cao
    - Khó bị dịch ngược mã nguồn.   
- Nhược điểm 
    - Mã máy của mỗi nền tảng là khác nhau, khó thực hiện đa nền tảng.
    - Khó xây dựng một compiler có tính chính xác cao để chuyển toàn bộ chương trình thành mã máy.

Có những ngôn ngữ vừa là biên dịch và vừa là thông dịch. Ví dụ như PHP là loại ngôn ngữ vừa thuộc biên dịch và vừa thuộc thông dịch 
- Trong PHP thì nhiệm vụ của quá trình biên dịch là phân tích code PHP thành một loại ngôn ngữ trung gian 
- Sau đó nó sẽ được thông dịch bở runtime engine 