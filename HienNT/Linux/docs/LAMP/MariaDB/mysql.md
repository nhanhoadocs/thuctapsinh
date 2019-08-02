<img src ="../../../images/25 bai linux/mariadb-vs-mysql.png">  
<a name ="I-Lịch sử phát triển"></a>  

## I - Lịch sử phát triển  
- `MySQL` được phát triển vào năm 1994 bởi công ty Thụy Điển MySQL AB. Năm 2008 công ty công nghệ Mỹ Sun Microsystem mua lại MySQL. Nawmm 2010, Oracle mua Sun Microsystem và MySQL thuộc quyền sở hữu của Oracle từ đó.  
- `MariaDB` là một phiên bản nhánh khác của dịch vụ MySQLDB. MariaDB được xây dựng bởi một số tác giả sáng lập ra MySQL và nhận được sự hỗ trợ của đông đảo cộng đồng các nhà phát triển phần mềm mã nguồn mở. MariaDB phát hành phiên bản đầu tiên vào 11/2008 bởi Monty Widenius - người đồng sáng lập MySQL. 

<A NAME="II - MySQL"></a>  

## II - MySQL  
- `MySQL` là một hệ thống quản trị cơ sở dữ liệu mã nguồn mở(Relational Database Management System), viết tắt là RDBMS hoạt động theo mô hình client-server. `RDMS` là một phần mềm hay dịch vụ dùng để tạo và quản lý các cơ sở dữ liệu theo hình thức quản lý các mối liên hệ giữa chúng.  
- Được dùng cho mục đích lưu trữ dữ liệu.  
- Tương thích với nhiều hạ tầng máy tính: Linux, macOS, Windows và Ubuntu.  
- Chu kì ra version: 1-2 năm  
- Dữ liệu có cấu trúc, được sắp xếp được sắp xếp theo cách cụ thể trong các bảng.  
- Một số thuật ngữ:  
  - `Database:` là tập hợp dữ liệu theo cùng một cấu trúc hay chính là nơi chứa và sắp xếp dữ liệu. Dữ liệu được đặt trong một bộ dữ liệu chung, được tổ chức sắp xếp giống như 1 bảng tính. Ví dụ khi chụp ảnh: hình ảnh là dữ liệu, thư viện lưu ảnh là cơ sở dữ liệu.  
  - `Open source:` dịch là mã nguồn mở, nghĩa là ai cũng có thể dùng và chỉnh sửa nó. Bất kỳ ai cũng có thể cài đặt phần mềm này.  
  - ` Mô hình Client-server:` máy tính cài đặt và chạy phần mềm RDBMS được gọi là client. Mỗi khi cần truy cập dữ liệu, phần mềm này sẽ kết nối đến máy chủ RDBMS. Cách thức này chính là mô hình "client-server"  
  - `MySQL Server:` là máy tính hay hệ các máy tính cài đặt phần mềm MySQL dành cho server để giúp bạn lưu trữ dữ liệu trên đó.  
  - `MySQL Client:` là các thiết bị có thể thực hiện truy vấn lên một MySQL server và nhận kết quả trả về; không thiết phải cài phần mềm MySQL của Oracle.  
  - `SQL:` - Structured Query Language - ngôn ngữ truy vấn có cấu trúc chung.  
- Phiên bản mới nhất hiện tại: 8.0.16


<a name="III - MariaDB"></a>

## III - MariaDB  
- `MariaDB` là một hệ thống quản lý cơ sở dữ liệu mã nguồn mở. Được tạo ra như một nhánh phần mềm của MySQL.  
- Hiện tại phiên bản mới nhất của MariaDB là 10.5. Xem các phiên bản hiện có: [https://mariadb.com/](https://mariadb.com/kb/en/library/mariadb-server-releases/) 
- `MariaDB` có hệ thống hoàn toàn tương thích với MySQL từ phiên bản 5.1 --> 5.5
- Kể từ MySQL 5.6, MariaDB đã không còn giống với MySQL nữa, họ đã tách hẳn và nâng cấp nhiều tính năng để cải thiện tốc độ cũng như những tính năng mới.  
- Dữ liệu trong Maria có cả 2 loại: có cấu trúc(SQL) và không có cấu trúc(NoSQL)  

<img src ="../../../images/25 bai linux/photo-1-15394044140661301193795.png">  


## TÀI LIỆU THAM KHẢO  
- [https://cuongquach.com/](https://cuongquach.com/cai-dat-mariadb-10-2-tren-centos-7.html)
- [https://viblo.asia/](https://viblo.asia/p/su-dung-mariadb-thay-cho-mysql-tai-sao-oOVlYd0nZ8W)  
- [https://toidicodedao.com/](https://toidicodedao.com/2015/09/24/nosql-co-gi-hay-ho-tong-quan-ve-nosql-phan-1/)  
- [https://tech.vccloud.vn/nosql](https://tech.vccloud.vn/nosql-la-gi-20181013113252686.htm)  
- [https://quantrimang.com/](https://quantrimang.com/co-so-du-lieu-phi-quan-he-nosql-160708)
