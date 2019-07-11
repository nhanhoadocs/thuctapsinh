# Mục lục 
1. [Cơ sở dữ liệu](#a)
2. [DBMS](#b)
3. [Bảng](#c) 
4. [Khóa](#d) 
5. [Dạng chuẩn CSDL](#e)
6. [Khái niệm SQL](#f) 



<a name="a">

# 1. Cơ sở dữ liệu</a>
Là tập hợp các dữ liệu có cấu trúc được lưu trữ trên các thiết bị lưu trữ nhằm phục vụ cho nhiêu mục của một cá nhân hay một tổ chức nào đó

<a name='b'>

# 2. Hệ quản trị cơ sở dữ liệu(DBMS)</a>
Một hệ thống quản lý cơ sở dữ liệu lưu trữ dữ liệu theo cách mà việc truy xuất, thao tác và sản xuất thông tin trở nên dễ dàng hơn.

Hệ quản trị cơ sở dữ liệu (Database Management System-DBMS) là một hệ thống được thiết kế dùng để quản trị một cơ sở dữ liệu. Trên đó người dùng có thể định nghĩa, thao tác, và xử lí dữ liệu trong một hệ quản trị CSDL. Hầu hết hệ quản trị cơ sở dữ liệu đều thực hiện các chức năng sau:
* Lưu trữ dữ liệu.
* Tạo và duy trì cấu trúc dữ liệu.
* Hỗ trợ bảo mật.
* Cho xem và xử lý các dữ liệu lưu trữ.
* Cung cấp một cơ chế chỉ mục hiệu quả để truy cập nhanh các dữ liệu lụa chọn.
* Cung cấp tính nhất quán giữa các bản ghi khác nhau.
* Bảo vệ dữ liệu khỏi mất mát bằng các quá trình sao lưu (backup) và phục hồi (recovery).
## Phân loại DBMS 
Hệ quản trị cơ sở dữ liệu quan hệ(RDBMS) được sử dụng phổ biến nhất hiện nay. Và hai loại ngôn ngữ được sử dụng trên nền tảng RDBMS là: 
- Ngôn ngữ truy vấn có cấu trúc
- Ngôn ngữ truy vấn phi cấu trúc

<a name='c'>

# 3. Bảng </a>
Bảng là một đối tượng được sử dụng để tổ chức và lưu trữ dữ liệu. Một cơ sở dữ liệu bao gồm nhiều bảng. Các bảng đều có mối liên hệ với nhau.

## Mối quan hệ giữa các bảng
`Quan hệ 1-1` :  là quan hệ mà một bản ghi của bảng A quan hệ với duy nhất với một bản ghi của bảng B và ngược lại

`Quan hệ 1-n` là quan hệ một bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B

`Quan hệ n-m` là quan hệ nhiều bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B.

<a name='d'>

# 4. Khóa </a>
## khóa chính
Khóa chính là để định danh duy nhất mỗi bản ghi trong một bảng của cơ sở dữ liệu.

Dữ liệu trong trường khóa chính phải là duy nhất và không được chứa giá trị NULL Một trường với một giá trị NULL là một trường không có giá trị (Trường có giá trị NULL là giá trị đã để trống trong quá trình tạo bản ghi)

Mỗi bảng chỉ có một khóa chính và khóa chính có thể tạo ra từ nhiều trường trong bảng.

## Khóa ngoại
Khóa ngoại của bảng này được coi như một con trỏ trỏ tới khóa chính của bảng khác.

Hay có thể hiểu một trong bảng này có một trường mà trường này lại là khóa chính của một bảng khác. Thì trường đó trong bảng này được gọi là khóa ngoại.

<a name='e'>

# 5. Dạng chuẩn của CSDL</a>
Chuẩn hóa là quá trình phân tách các bảng thành các bảng nhỏ hơn dựa và các phụ thuộc hàm

Các dạng chuẩn là các chỉ dẫn để thiết kế các bảng trong CSDL.

Mục đích của chuẩn hóa là làm giảm dữ liệu dư thừa và các lỗi xảy ra khi cập nhật CSDL. Nhưng điều này làm tăng thời gian truy vấn dữ liệu.

## 5.1 Dạng chuẩn 1NF: Không có phần tử/nhóm phần tử lặp
Một bảng được gọi là 1NF: 
- khi và chỉ khi toàn bộ các miền giá trị của các cột có mặt trong bảng đều chỉ chứa các giá trị nguyên tử (nguyên tố) không được có giá trị NULL 
- Mỗi hàng phải có một thuộc tính nhận dạng duy nhất (Khóa chính)
## 5.2 Dạng chuẩn 2NF
Mối quan hệ ở dạng chuẩn 2NF nếu:
- Là 1NF
- Các thuộc tính không khóa phụ thuộc hàm không đầy đủ vào khóa chính.

Một quan hệ ở dạng chuẩn 2NF nếu thỏa mãn 1 trong các điều kiện sau:
- Khóa chính chỉ gồm một thuộc tính
- Bảng không có các thuộc tính không khóa
- Tất cả các thuộc tính không khóa phụ thuộc hoàn toàn vào các thuộc tính khóa chính.

## 5.3 Dạng chuẩn 3NF 
Một quan hệ ở dạng chuẩn 3NF nếu quan hệ đó:
- Là 2NF
- Các thuộc tính không khóa phải phụ thuộc trực tiếp vào khóa chính

<a name='f'>

# 6. SQL</a>
SQL viết tắt của Structured Query Language (ngôn ngữ truy vấn cấu trúc). công cụ sử dụng để tổ chức, quản lý và truy xuất dữ liệu đuợc lưu trữ trong các cơ sở dữ liệu. SQL là một hệ thống ngôn ngữ bao gồm tập các câu lệnh sử dụng để tương tác với cơ sở dữ liệu quan hệ.

SQL không chỉ dùng để truy xuất dữ liệu mà SQL được sử dụng để điều khiển tất cả các chức năng mà một hệ quản trị cơ sở dữ liệu cung cấp cho người dùng bao gồm:
- Có thể truy vấn Database theo nhiều cách khác nhau, bởi sử dụng các lệnh.
- Người dùng có thể truy cập dữ liệu từ RDBMS.
- SQL cho phép người dùng miêu tả dữ liệu.
- SQL cho phép người dùng định nghĩa dữ liệu trong một Database và thao tác nó khi cần thiết.
- Cho phép người dùng tạo, xóa Database và bảng.
- Cho phép người dùng tạo view, Procedure, hàm trong một Database.
- Cho phép người dùng thiết lập quyền truy cập vào bảng, thủ tục và view.

