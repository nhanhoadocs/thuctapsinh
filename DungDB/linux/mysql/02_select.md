# Truy vấn data

Bắt đầu với câu lệnh SELECT

Câu lệnh SELECT cho phép bạn đọc dữ liệu từ một hoặc nhiều bảng. Để viết một câu lệnh SELECT trong MySQL, bạn làm theo cú pháp sau:

    SELECT select_list
    FROM table_name;

Phần SELECT

Trong trường hợp này, SELECT hướng dẫn MySQL truy xuất dữ liệu.

Sau đó, bạn có từ khóa FROM, tên của bảng.

kết thúc bằng dấu ;

Nếu bạn có hai hoặc nhiều câu lệnh, bạn sử dụng dấu chấm phẩy (;) để phân tách chúng để MySQL sẽ thực thi từng câu lệnh riêng lẻ.

Vì SQL không phải là ngôn ngữ phân biệt chữ hoa chữ thường, bạn có thể viết từ khóa bằng chữ thường, nhưng nên viết bằng chữ in hoa cho dễ nhìn và tường minh.

    SELECT all from customers;

![Imgur](https://i.imgur.com/Zb5L9et.png)

    SELECT city from customers;

![Imgur](https://i.imgur.com/0mKvUkI.png)

Khi truy vấn dữ liệu từ một bảng, bạn có thể nhận được các hàng trùng lặp. Để xóa các hàng trùng lặp này, bạn sử dụng mệnh đề `DISTINCT` trong câu lệnh SELECT.

    SELECT DISTINCT
        select_list
    FROM
        table_name;

    SELECT lastname FROM employees ORDER BY lastname;

![Imgur](https://i.imgur.com/cP7OuhQ.png)

Có kết quả trùng

    SELECT DISTINCT lastname FROM employees ORDER BY lastname;

![Imgur](https://i.imgur.com/Ako9Qpt.png)

Không có kết quả trùng

**Chú ý:**

Các toán tử AND, OR, NOT, BETWEEN, ... đều sử dụng như bình thường.

Các giá NULL thì coi như cùng một giá trị.