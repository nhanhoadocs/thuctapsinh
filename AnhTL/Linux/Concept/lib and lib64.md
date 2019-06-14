# lib và  lib64

#### /lib
- Chứa các thư viện cần thiết cho các nhị phân cần thiết trong thư mục /bin và /sbin.

- Sự khác biệt giữa lib và lib64 là:  /lib là 32 bit và /lib64 là các thư viện 64 bit được sử dụng cho các ứng dụng 64 bit.

  -  Với mục đích chính của /lib là chứa các thư viện cho các công cụ được triển khai vào thư mục /bin và /sbin, các thư viện trong /lib có thể là 32 bit hoặc 64 bit.

- /usr/lib64 không sử dụng được trên 32-bit. 
- Trên 64-bit, cả hai có thể được sử dụng. 


![img](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/64359143_336648070340649_7665929226452729856_n.png?_nc_cat=108&_nc_oc=AQnuZC5ne1rUYQ7_PidtS5NTrX1m2CPcm3tePPe7YTPXni8-7ij4jxslOLJohd6g2_c&_nc_ht=scontent.fhan5-5.fna&oh=92dcd0e35c993e490313437e88a09738&oe=5D983146)

Hình bên trên là lib và lib64 được tham chiếu đến thư mục usr/lib và usr/lib64.

- VD: Khi ta đang biên dịch trên hệ thống 64 bit , trong đó mặc định là tuân thủ các nhị phân 64 bit, liên kết đến các thư viện 64 bit. Nhị phân được biên dịch thành 32 bit và liên kết tự nhiên đến các thư viện 32 bit. 

  - Khi cài đặt CentOS 64 bit, các thư viện 64 bit nằm trong /lib64 và các thư viện 32 bit nằm trong /lib. Các thư viện 32 bit chỉ cần thiết để thực hiện các nhị phân 32 bit. Các thư viện không thực sự khác nhau về chức năng, nhưng 64 bit có thể là trình bao bọc 32 bit cho phép nhị phân 32 bit thực thi trong hệ thống 64 bit.

- 32 bits hay 64 bits có thể được dùng để áp dụng cho CPU hoặc phần mềm.
- CPU 32 bits hay 64 bits nghĩa là CPU đó được thiết kế với độ dài thanh ghi là 32 bits hay 64 bits.

**CÁC THƯ MỤC THƯ VIỆN KHÁC TRONG LINUX**
- /usr/lib - Tất cả các thư viện phần mềm được cài đặt tại đây. Điều này không chứa mặc định hệ thống hoặc thư viện kernel.
  -  /usr/lib bao gồm các tệp đối tượng, thư viện và các tệp nhị phân nội bộ không được thực hiện trực tiếp bởi người dùng hoặc tập lệnh shell.
- /usr/local/lib - Để đặt thêm các tệp thư viện hệ thống tại đây. Những tập tin thư viện có thể được sử dụng bởi các ứng dụng khác nhau.

### Tài liệu tham khảo

https://www.linuxnix.com/linux-directory-structure-lib-explained/

https://www.centos.org/forums/viewtopic.php?t=18169

https://unix.stackexchange.com/questions/74646/difference-between-lib-lib32-lib64-libx32-and-libexec
