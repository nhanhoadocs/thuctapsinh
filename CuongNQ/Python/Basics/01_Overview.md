# Tổng quan về ngôn ngữ Python
## **1) Giới thiệu** <img src=https://i.imgur.com/obaHj2d.png width=25% align=right>
- Trang chủ : https://www.python.org/
- Phiên bản ổn định : `3.7.4`
- **Python** là một ngôn ngữ lập trình bậc cao ( ***high-level programming language*** ) cho các mục đích lập trình đa năng , do **`Guido van Rossum`** tạo ra và lần đầu ra mắt vào năm `1991` .
- **Python** được thiết kế với ưu điểm mạnh là dễ đọc, dễ học và dễ nhớ.
- **Python** là ngôn ngữ có hình thức rất sáng sủa, cấu trúc rõ ràng, thuận tiện cho người mới học lập trình. 
- Cấu trúc của **Python** còn cho phép người sử dụng viết mã lệnh với số lần gõ phím tối thiểu
- **Python** được phát triển trong một dự án mã mở, do tổ chức phi lợi nhuận **Python Software Foundation** quản lý.
- Ban đầu, **Python** được phát triển để chạy trên nền Unix. Nhưng rồi theo thời gian, **Python** dần mở rộng sang mọi hệ điều hành từ MS-DOS đến Mac OS, OS/2, Windows, Linux và các hệ điều hành khác thuộc họ Unix. Mặc dù sự phát triển của **Python** có sự đóng góp của rất nhiều cá nhân, nhưng **`Guido van Rossum`** hiện nay vẫn là tác giả chủ yếu của **Python** . Ông giữ vai trò chủ chốt trong việc quyết định hướng phát triển của **Python** .
- Vào tháng 7 năm 2018, **`Van Rossum`** đã từ chức Leader trong cộng đồng ngôn ngữ **Python** sau 30 năm lãnh đạo.
- **Python** giờ đây đã trở thành 1 trong các ngôn ngữ lập trình phổ biến nhất thế giới .
## **2) Những điều Python có thể làm được**
- Lập trình Web : Youtube , Google , Dropbox , Quora , Reddit , Instagram , Nasa , Firefox ,....
- Data Analysis
    - Machine Learning
    - Data Visualization
    - Google Cloud Platform
    - Image and Video Analysis
- Lập trình Robot
- Lập trình game
- Lập trình ứng dụng
- Bảo mật mạng máy tính
## **3) Lịch sử phát triển các phiên bản**
### **2.1) Python 1**
- Bao gồm các bản phát hành `1.x`
- Kéo dài từ đầu đến cuối thập niên `1990`
### **2.2) Python 2**
- Bao gồm các bản phát hành `2.x`
- Ra đời vào năm `2000`
- Phiên bản cuối : `2.7.16`
### **2.3) Python 3**
- Còn gọi là `Python 3000` hoặc `Py3K`
- Dòng `3.x` sẽ không hoàn toàn tương thích với dòng `2.x` , tuy vậy có công cụ hỗ trợ chuyển đổi từ các phiên bản `2.x` sang `3.x`
- Nguyên tắc chủ đạo để phát triển **Python `3.x`** là "bỏ cách làm việc cũ nhằm hạn chế trùng lặp về mặt chức năng của **Python**"
- Các đặc điểm mới trong **Python `3.x`** :
    - Lệnh `print` trở thành hàm `print()` . Theo đó sau `print()` ta cần nhớ gõ vào cặp ngoặc `()`:
        ```py
        print("Goodbye")
        print(2+3)
        ```
    - Trả lại kết quả không còn là `list` trong một số trường hợp :
        - `dict.keys()`, `dict.items()`, `dict.values()` kết quả cho ra các "view" thay vì list .
        - `map` và `filter` trả lại các `iterator` .
        - `range` bây giờ có tác dụng như `xrange` , và không trả lại `list` .
    - So sánh : Không còn hàm `cmp` , và `cmp(a, b)` có thể được thay bằng `(a > b) - (a < b)`
    - Số nguyên :
        - Kiểu `long` được đổi tên thành `int`.
        - `1/2` cho ta kết quả là số thực chứ không phải số nguyên.
        - Không còn hằng số `sys.maxint`
        - Kiểu bát phân được ký hiệu bằng `0o` thay vì `0` , chẳng hạn `0o26`.
    - Phân biệt văn bản - dữ liệu nhị phân thay vì Unicode - chuỗi `8-bit`
        - Tất cả chuỗi văn bản đều dưới dạng Unicode, nhưng chuỗi Unicode mã hóa lại là dạng dữ liệu nhị phân. Dạng mặc định là `UTF-8`.
        - Không thể viết u"a string" để biểu diễn chuỗi như trong các phiên bản `2.x`
    - Cú pháp mới :
        - Các tham biến chỉ chấp nhận keyword: Các tham biến phía sau `*args` phải được gọi theo dạng keyword.
        - Từ khóa mới `nonlocal`. Muốn khai báo một biến `x` với có phạm vi ảnh hưởng rộng hơn, nhưng chưa đến mức toàn cục, ta dùng nonlocal x.
        - Gán giá trị vào các phần tử tuple một cách thông minh, chẳng hạn có thể viết (`a`, `*rest`, `b`) = `range(5)` để có được a = 0; b = [1,2,3]; c = 4
        - Dictionary comprehension, chẳng hạn {k: v for k, v in stuff} thay vì dict(stuff).
        - Kiểu nhị phân, chẳng hạn `b110001`.
    - Cú pháp được thay đổi :
        - `raise [biểu_thức [from biểu_thức]]`
        - `except lệnh as biến`
        - Sử dụng metaclass trong đối tượng
    - Cú pháp bị loại bỏ :
        - Không còn dấu ` `` `, thay vì đó, dùng `repr` .
        - Không còn so sánh `<>` (dùng `!=`).
        - Không còn các lớp kiểu classic.