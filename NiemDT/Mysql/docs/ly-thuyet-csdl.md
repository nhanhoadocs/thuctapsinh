## Mục lục

[Một số khái niệm](#1)
 * [Cơ sở dữ liệu](#1.1)
 * [Hệ quản trị CSDL](#1.2)
 * [MySQL](#1.3)

[Khóa](#3)
 * [Khóa chính](#3.1)
 * [Khóa ngoại](#3.2)

[Các dạng chuẩn hóa CSDL](#4)
 * [Dạng chuẩn 1NF](#4.1)
 * [Dạng chuẩn 2NF](#4.2)
 * [Dạng chuẩn 3NF](#4.3)

[Quan hệ giữa các bảng](#5)

<a name="1">

## Một số khái niệm

<a name="1.1">

**1. Cơ sở dữ liệu**

Cơ sở dữ liệu là một tập các dữ liệu có quan hệ logic với nhau, có thể dễ dàng chia sẻ và được thiết kế nhằm đáp ứng nhu cầu sử dụng của một tổ chức, cá nhân nào đó.

<a name="1.2">

**1. Hệ quản trị cơ sở dữ liệu**

Hệ quản trị cơ sở dữ liệu (Database Management System-DBMS) là một hệ thống hay phần mềm được thiết kế dùng để quản trị một cơ sở dữ liệu. Hầu hết hệ quản trị cơ sở dữ liệu đều thực hiện các chức năng sau:

* Lưu trữ dữ liệu.
* Tạo và duy trì cấu trúc dữ liệu.
* Hỗ trợ bảo mật.
* Cho xem và xử lý các dữ liệu lưu trữ.
* Cung cấp một cơ chế chỉ mục hiệu quả để truy cập nhanh các dữ liệu lụa chọn.
* Cung cấp tính nhất quán giữa các bản ghi khác nhau.

<a name="1.3">

**2. MySQL**

`SQL` là ngôn ngữ truy vấn theo cấu trúc.

`MySQL` là một hệ quản trị cơ sở dữ mã nguồn mở sử dụng ngôn ngữ truy vấn `SQL`.

Với `MySQL` ta có thể quản lý cơ sở dữ liệu bằng giao diện đồ họa thông qua một số phần mền ví dụ như `workbench` hoặc có thể dùng câu lệnh để thao tác với CSDL.

<a name="3">

## Khóa 

<a name="3.1">

**Khóa chính**

Khóa chính để định danh duy nhất mỗi bản ghi trong một bảng của cơ sở dữ liệu.

Dữ liệu trong trường khóa chính phải là duy nhất và ko được chứa giá trị NULL.

Mỗi bảng chỉ có một khóa chính và khóa chính có thể tạo ra từ nhiều trường trong bảng.

<a name="3.2">

**Khóa ngoại**

Khóa ngoại của bảng này được coi như một con trỏ trỏ tới khóa chính của bảng khác.

Hay có thể hiểu một trong bảng này có một trường mà trường này lại là khóa chính của một bảng khác. Thì trường đó trong bảng này được gọi là khóa ngoại.

<a name="4">

## Các dạng chuẩn hóa CSDL

Chuẩn hóa là quá trình phân tách các bảng thành các bảng nhỏ hơn dựa và các phụ thuộc hàm

Các dạng chuẩn là các chỉ dẫn để thiết kế các bảng trong CSDL.

Mục đích của chuẩn hóa là làm giảm dữ liệu dư thừa và các lỗi xảy ra khi cập nhật CSDL. Nhưng điều này làm tăng thời gian truy vấn dữ liệu.

<a name="4.1">

**Dạng chuẩn 1NF**

Một bảng được gọi là 1NF khi và chỉ khi toàn bộ các miền giá trị của các cột có mặt trong bảng đều chỉ chứa các giá trị nguyên tử(nguyên tố)

VD

Một bảng chưa ở 1NF:

| MASV	| HOTEN	| DIACHI	| MAMON	| TENMON	| DIEM |
| ------ | --- | ------ | -------- | -------- | ------ |
| A01	| Lê Na |	12 Thái Hà |	M01M02	| CSDLAnh	| 89 |
| A02	| Trần An	| 56 Mã Mây	| M01	| CSDL	| 8 |
| A03	| Hà Nam	| 24 Cầu Gỗ	| M01M02M03	| CSDLAnhToán 1 |	689 |

Chuyển về dạng chuẩn 1NF:

| MASV	| HOTEN	| DIACHI	| MAMON	| TENMON	| TENGV	| PHONG |	DIEM | 
| ------ | ----- | ------- | ------ | --------- | ----- | ------ | ----- |
| A01	| Lê Na |	12 Thái Hà |	M01	| CSDL	| Mai	| P401	| 8 |
| A01	| Lê Na |  	12 Thái Hà |	M02	| Anh	| Hương	| P405	| 9 |
| A02	| Trần An |	56 Mã Mây |	M01	| CSDL | 	Mai	| P401	| 8 |
| A03	| Hà Nam | 	24 Cầu Gỗ |	M01	| CSDL	| Mai	| P401	| 6 |
| A03	| Hà Nam |	24 Cầu Gỗ |	M02	| Anh	 | Hương	| P405	| 8 |
| A03	| Hà Nam |	24 Cầu Gỗ |	M03	| Toán 1	| Hoa	| P406	| 9 |


<a name="4.2">

**Dạng chuẩn 2NF**

Một quan hệ ở dạng chuẩn 2NF nếu quan hệ đó:
* Là 1NF.
* Các thuộc tính không khóa phải phụ thuộc hàm đầy đủ vào khóa chính.

Một quan hệ ở dạng chuẩn 2NF nếu thỏa mãn 1 trong các điều kiện sau:
* Khóa chính chỉ gồm một thuộc tính
* Bảng không có các thuộc tính không khóa
* Tất cả các thuộc tính không khóa phụ thuộc hoàn toàn vào các thuộc tính khóa chính.

<a name="4.3"> 

**Dạng chuẩn 3NF** 

Một quan hệ ở dạng chuẩn 3NF nếu quan hệ đó:
* Là 2NF
* Các thuộc tính không khóa phải phụ thuộc trực tiếp vào khóa chính

<a name="5">

## Mối quan hệ giữa các bảng

`Quan hệ 1-1` là quan hệ mà một bản ghi của bảng A quan hệ với duy nhất với một bản ghi của bảng B và ngược lại.

`Quan hệ 1-n` là quan hệ một bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B.

`Quan hệ n-n` là quan hệ nhiều bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B.

Trên thực tế quan hệ `n-n` ít được sử dụng người ta thường tách nó ra thành các quan hệ `1-n`