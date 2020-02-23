### Tìm hiểu về LAMP  

**1. LAMP là gì?**  

`LAMP` là một nền tảng phát triển Web nguồn mở sử dụng **Linux** làm hệ điều hành, **Apache** làm máy chủ Web, **MySQL** làm hệ thống quản lý cơ sở dữ liệu quan hệ và **PHP** làm ngôn ngữ kịch bản hướng đối tượng. (Đôi khi Perl hoặc Python được sử dụng thay vì PHP)

<img src="https://i.imgur.com/0mCgDGX.png">  

Mỗi trong số đó là các gói phần mềm riêng lẻ được kết hợp để tạo thành một giải pháp máy chủ linh hoạt. Bốn phần mềm nói trên tạo thành một gói phần mềm LAMP.

Ngoài ra, MySQL có thể được thay thế bằng PostgreSQL để lập thành gói phần mềm LAMP với các khả năng kỹ thuật tương tự. 

**2. LAMP có ưu điểm gì?**  

Đặc trưng mã nguồn mở mang đến cho LAMP những ưu điểm vượt trội:  
- *Hoàn toàn miễn phí*  
Hiện nay, thế độc quyền WISA (Windows-IIS-SQL Sever-ASP) của Microsoft vốn với giá khá cao. Với chi phí bản quyền bằng 0, LAMP đã thuyết phục rất nhiều người dùng.  
- *Được hỗ trợ rộng rãi*  
Khi có sự cố xảy ra, bạn rất dễ dàng tìm được hướng dẫn bởi cộng đồng người sử dụng rất lớn.
- *Cơ hội tìm host miễn phí*  
Chi phí các máy chủ cài đặt Linux không cao lắm. Do đó, nếu code trên LAMP Stack, các bạn có thể dễ dàng tìm host free cho ứng dụng của mình.  
Stack này còn có một số dị bản như: MAMP (Trên MAC), WAMP( Trên Win), XAMPP (Trên mọi hệ điều hành).  

**3. Cấu trúc gói phần mềm LAMP**  

Trong những năm gần đây, LAMP đã dần trở thành một tiêu chuẩn mặc định trong cộng đồng web.  
Bốn thành phần Linux, Apache, MySQL, PHP/Perl/Python được sắp xếp theo các lớp hỗ trợ lẫn nhau và tạo thành các stack phần mềm. Các website và ứng dụng web chạy trên nền tảng của các stack cơ bản này.  

**Linux**  
Linux là lớp đầu tiên trong stack. Nó là cơ sở nền tảng cho các lớp phần mềm khác. Linux được dùng để quản lý, điều phối các tài nguyên (resource) của hệ thống (bao gồm cả hardware và sofeware khác).  

**Apache**  
Lớp thứ 2 bao gồm phần mềm Web server, thường là Apache Web (HTTP) server. Lớp này nằm trên lớp Linux, có nhiệm vụ chuyển đổi các Web browser sang các website chính xác của chúng.  
Đây là phần mềm máy chủ web phổ biến nhất trên mạng với độ an toàn, nhanh chóng và tin cậy cao. Bạn có thể tùy chỉnh để Apache hỗ trợ các ngôn nhữ web khác nhau như PHP, CGI / Perl, SSL, SSI, ePerl, và thậm chí ASP.  

**MySQL**   
Lớp thứ 3 là nơi cơ sở dữ liệu database được lưu trữ. MySQL lưu trữ các chi tiết có thể được truy vấn bằng script để xây dựng lên website. Với tốc độ ổn định; độ bảo mật thông tin cao, dễ sử dụng và có tính khả chuyển, MySQL trở thành hệ quản trị cơ sở dữ liệu nguồn mở phổ biến nhất trên thế giới.  
MySQL có thể được cài đặt trên nhiều nền tảng hệ điều hành khác nhau như Windows, Linux và Mac OS X.  

**PHP**  
PHP là lớp trên cùng của stack. Lớp script bao gồm PHP và (hoặc) các ngôn ngữ lập trình web tương tự khác. Các website và ứng dụng web chạy trong lớp này.  
