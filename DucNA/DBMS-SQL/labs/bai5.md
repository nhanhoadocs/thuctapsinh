1. Tạo cơ sở dữ liệu quản lý sinh viên gồm 3 bảng Sinh viên, Giáo viên và Lớp học. Cấu trúc các bảng như sau:
- SINHVIEN ( *maSV*, hoten , ngaysinh, gioitinh, diem, malop)

![](../images/lab/bai5/screenshot_17.png)

- GIAOVIEN (*maGV* , tenGV, trinhdoCM, malop )

![](../images/lab/bai5/screenshot_1.png)

- LOPHOC ( *malop*, tenlop, diadiem, GVCN)

![](../images/lab/bai5/screenshot.png)

- Kiểu dữ liệu của các trường sinh viên tự thiết kế
- Các trường có gạch chân là khóa chính của các bảng
- Giới tính có giá trị mặc định là ‘Nam’
- Tên lớp không được để trống
2. thiết lập mối quan hệ giữa các bảng vừa tạo ra. Khóa chính của bảng này là khóa phụ của bảng kia. Như vậy ta mới tạo ra được mối quan hệ 

3. Tạo ít nhất 3 bản ghi cho mỗi bảng 
![](../images/lab/bai5/screenshot_2.png)

![](../images/lab/bai5/screenshot_4.png)

![](../images/lab/bai5/screenshot_3.png)

4. đưa ra danh sách các sinh viên nữ đạt điểm giỏi ( điểm >=9 )

![](../images/lab/bai5/screenshot_6.png)

5. Hiển thị tên giáo viên, trình độ của tất cả những giáo viên dạy lớp có tên là at5

![](../images/lab/bai5/screenshot_7.png)

6. Cho biết họ tên, điểm của các sinh viên có điểm lớn hơn điểm trung bình của lớp

![](../images/lab/bai5/screenshot_8.png)

7. tạo một thủ tục lưu trữ có chức năng hiển thị danh sách sinh viên của một lớp bất kỳ

![](../images/lab/bai5/screenshot_9.png)

Kết quả khi ta gọi hàm đó với tên lớp

![](../images/lab/bai5/screenshot_8.png)