# so sánh mô hình OSI và TCP/IP.

![img](http://2.bp.blogspot.com/-zH0z9PvKSgY/VcrFhwD_ToI/AAAAAAAAAOU/rROFvIvGU58/s1600/TCP-IP.png)

![img](https://voer.edu.vn/file/12549)

## Điểm Giống và Khác nhau của 2 mô hình OSI và TCP/IP
#### Giống nhau:
- Đều có phân lớp.
- Đều có lớp Ứng Dụng (Application).
- Đều có lớp vận chuyển và lớp Mạng.

#### Khác nhau:
- Về mặt cấu trúc.
  - Khác nhau về số lớp.
    + TCP/IP kết hợp lớp Presentation và lớp Session vào lớp Application.
    + Lớp Data Link và Lớp Physical cũng được thì được kết hợp vào lớp Network Access.
- Về mặt kết nối.
  - Mô hình OSI hỗ trợ cả truyền dữ liệu có kết nối và không kết nối ở lớp Network và truyền dữ liệu có kết nối ở lớp Transport.
  - Mô hình TCP/IP chỉ hỗ trợ 1 phương thức truyền dữ liệu không kết nối ở lớp Internet nhưng ở lớp Transport lại hỗ trợ cả hai phương thức truyền có kết nối và không kết nối.
- Về mặt khái niệm.
  - Mô hình OSI phân biệt rõ 3 khái niệm cơ bản:
    + Dịch vụ.
    + Giao diện.
    + Giao thức.
  - Mô hình TCP/IP thì không phân biệt được ranh giới 3 khái niệm này.
- Về mặt thiết kế.
  - Mô hình OSI: được thiết kế trước khi có các giao thức, Không thiết kế để dùng cho chồng giao thức, mang tính tổng quát, các chức năng đưa ra không phù hợp với thực tế.
  - Mô hình TCP/IP: được thiết kế sau khi có các giao thức và mô hình thực tế chỉ là mô tả các giao thức đã có.

#### Ưu, nhược điểm của 2 mô hình 
- Mô hình OSI:
  - Tách hoạt động thông tin trên mạng thành những phần nhỏ hơn, đơn giản hơn.
  - Cho phép các loại phần cứng và phần mềm khác nhau thông tin được với nhau.
  - Nó giúp cho việc học tập về mạng được dễ dàng hơn.
- Mô hình TCP/IP:
  - Không phân biệt được rõ ràng các khái niệm về dịch vụ, giao diện và giao thức.
  - Không mang tính tổng quát và có tính tương thích kém.
  - Không phân biệt rõ ràng giữa 1 lớp và 1 giao diện.
    + VD: như từ Host - to - Network chỉ là 1 giao diện, chứ không phải 1 lớp.
  - Không phân biệt rõ nhiệm vụ của lớp data link và lớp Physical trong lớp Network Access.
  - Có nhiều giao thức mang tính chuyên biệt, không theo thể thức, do các giao thức này được phân phối tự do nên nhanh chóng trở thành phổ biến, được sử dụng rộng rãi và khó thay thế.
