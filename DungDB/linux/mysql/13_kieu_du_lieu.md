# Kiểu dữ liệu

MySQL sử dụng nhiều kiểu dữ liệu khác nhau được chia thành ba loại –

- Số
- Ngày và giờ
- Các loại chuỗi.

## Kiểu dữ liệu số
MySQL sử dụng tất cả các kiểu dữ liệu số theo chuẩn ANSI SQL. Danh sách sau đây là các kiểu dữ liệu số phổ biến:

`INT`: Một số nguyên có kích thước bình thường có thể được sử dụng trong phạm vi số âm và số dương. Nếu được sử dụng khoảng âm, phạm vi cho phép là từ -2147483648 đến 2147483647. Nếu không phạm vi cho phép là từ 0 đến 4294967295. Bạn có thể chỉ định chiều rộng tối đa là 11 chữ số.

`TINYINT`: Một số nguyên rất nhỏ có thể được sử dụng trong phạm vi số âm và số dương. Nếu bao gồm số âm, phạm vi cho phép là từ -128 đến 127. Nếu không, phạm vi cho phép là từ 0 đến 255. Bạn có thể chỉ định chiều rộng tối đa 4 chữ số.

`SMALLINT`: Một số nguyên nhỏ có thể sử dụng trong phạm vi số âm và số dương. Nếu bao gồm số âm, phạm vi cho phép là từ -32768 đến 32767. Nếu không phạm vi cho phép là từ 0 đến 65535. Bạn có thể chỉ định chiều rộng tối đa 5 chữ số.

`MEDIUMINT`: Một số nguyên có kích thước trung bình có thể được sử dụng trong phạm vi số âm và số dương. Nếu bao gồm số âm, phạm vi cho phép là từ -8388608 đến 8388607. Nếu không, phạm vi cho phép là từ 0 đến 16777215. Bạn có thể chỉ định chiều rộng tối đa 9 chữ số.

`BIGINT`: Một số nguyên lớn có thể sử dụng trong phạm vi số âm và số dương. Nếu bao gồm số âm, phạm vi cho phép là từ -9223372036854775808 đến 9223372036854775807. Nếu không, phạm vi cho phép là từ 0 đến 18446744073709551615. Bạn có thể chỉ định chiều rộng tối đa 20 chữ số.

`FLOAT` (M, D): Một số dấu phẩy động được sử dụng để ngăn cách phần nguyên và phần hữu tỷ. Độ chính xác của số thập phân có thể lên tới 24 vị trí cho một FLOAT.

`DOUBLE` (M, D): Một số dấu chấm động được sử dụng để ngăn cách phần nguyên và phần hữu tỷ. Bạn có thể xác định độ dài hiển thị (M) và số thập phân (D). Độ chính xác thập phân có thể tới 53 vị trí cho một DOUBLE. REAL là một từ đồng nghĩa với DOUBLE.

`DECIMAL` (M, D): Một số dấu phẩy động được sử dụng để ngăn cách phần nguyên và phần hữu tỷ. Trong các số thập phân được giải nén, mỗi số thập phân tương ứng với một byte. Xác định độ dài hiển thị (M) và số thập phân (D) là bắt buộc. NUMERIC là một từ đồng nghĩa với DECIMAL.

## Kiểu dữ liệu ngày và giờ

`DATE`: Ngày theo định dạng YYYY-MM-DD, trong khoảng từ 1000-01-01 đến 9999-12-31. Ví dụ, ngày 30 tháng 12 năm 2018 sẽ được lưu trữ như 2018-12-30.
`
DATETIME`: Kết hợp ngày và giờ theo định dạng HH: MM: SS HHYYY-MM-DD, trong khoảng từ 1000-01-01 00:00:00 và 9999-12-31 23:59:59. Ví dụ: 5:30 chiều ngày 30 tháng 12 năm 2018 sẽ được lưu trữ là 2018-12-30 17:30:00.

`TIMESTAMP`: Mốc thời gian lúc nửa đêm. Kiểu này giống như định dạng DATETIME trước đó chỉ không có dấu gạch nối giữa các số; ví dụ: 3:30 chiều ngày 30 tháng 12 năm 2018 sẽ được lưu giữ là 20181230153000 (YYYYMMDDHHMMSS).

`TIME`: Lưu trữ thời gian theo định dạng HH: MM: SS.
YEAR (M): Lưu trữ một năm ở định dạng 2 chữ số hoặc 4 chữ số. Nếu độ dài được xác định là 2 (ví dụ NĂM (2)), NĂM có thể nằm trong khoảng từ 1970 đến 2069 (70 đến 69). Nếu độ dài được chỉ định là 4, thì YEAR có thể là 1901 đến 2155. Độ dài mặc định là 4.

## Kiểu dữ liệu String

`CHAR` (M): Một chuỗi có độ dài cố định trong khoảng từ 1 đến 255 ký tự (ví dụ CHAR (5)), được ghi thêm bên phải bằng dấu cách với độ dài được chỉ định khi lưu trữ. Việc xác định độ dài là không bắt buộc, nhưng mặc định là 1.

`VARCHAR` (M): Một chuỗi có độ dài từ 1 đến 255 ký tự. Ví dụ, VARCHAR (25). Bạn phải xác định độ dài khi tạo trường VARCHAR.

`BLOB` hoặc `TEXT`: Trường có độ dài tối đa 65535 ký tự. BLOB là “Đối tượng lớn nhị phân” và được sử dụng để lưu trữ lượng lớn dữ liệu nhị phân, chẳng hạn như hình ảnh hoặc các loại tệp khác. Các trường được định nghĩa là TEXT cũng chứa một lượng lớn dữ liệu. Sự khác biệt giữa hai loại và trên là dữ liệu được lưu trữ phân biệt chữ hoa chữ thường trên các BLOB và không phân biệt chữ hoa chữ thường trong các trường TEXT. Bạn không chỉ định độ dài cho BLOB hoặc TEXT.

`TINYBLOB` hoặc `TINYTEXT`: Cột BLOB hoặc TEXT có độ dài tối đa 255 ký tự. Bạn không chỉ định độ dài cho TINYBLOB hoặc TINYTEXT.

`MEDIUMBLOB` hoặc `MEDIUMTEXT`: Cột BLOB hoặc TEXT có độ dài tối đa 16777215 ký tự. Bạn không được chỉ định độ dài cho MEDIUMBLOB hoặc MEDIUMTEXT.

`LONGBLOB` hoặc `LONGTEXT`: Cột BLOB hoặc TEXT có chiều dài tối đa là 4294967295 ký tự. Bạn không được chỉ định độ dài cho LONGBLOB hoặc LONGTEXT.

`ENUM`: dùng để chỉ định một hằng số. Khi xác định một ENUM, bạn tạo một danh sách các mục mà từ đó giá trị phải được chọn (hoặc nó có thể là NULL).

https://vietpro.net.vn/bai-mysql-08-cac-kieu-du-lieu-trong-mysql.html