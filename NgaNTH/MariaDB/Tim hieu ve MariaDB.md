## Tìm hiểu về MySQL và MariaDB  
### 1. Lịch sử phát triển  

`MySQL` là gì? MySQL là một trong những cơ sở dữ liệu được sử dụng rộng rãi nhất trên thế giới được phát triển dựa trên C/C ++. MySQL sau đó được Sun Microsystems mua lại vào năm 2008. Tiếp sau đó vào năm 2010 Sun Microsystems đã được Oracle mua lại và kể từ đó MySQL được duy trì và quản lý bởi đội ngũ Oracle.  
`MariaDB` là gì? Trong quá trình mua lại Sun Microsystems của Oracle thì một số kỹ sư cao cấp đang nghiên cứu phát triển MySQL cảm thấy có xung đột lợi ích giữa cơ sở dữ liệu thương mại của MySQL và Oracle. Kết quả là các kỹ sư đó đã tạo ra một nhánh của cơ sở mã MySQL và như thế MariaDB được tạo ra.  
<img src="https://i.imgur.com/Ek33Uva.png">
Theo số liệu thống kê thì MySQL được xếp thứ 2 trong số các cơ sở dữ liệu quan hệ và MariaDB xếp ở vị trí thứ 9 (đứng đầu là cơ sở dữ liệu Oracle).  

### 2. Ưu điểm khi sử dụng MariaDB  
- **Mã nguồn mở**  
MariaDB hay Mysql đều có 2 phiên bản: thương mại và cộng đồng.

Trái ngược với MySQL, MariaDB hoàn toàn mã nguồn mở được vận hành bởi cộng đồng thực sự (MariaDB Foundation), đứng đằng sau là công ty Monty Program, mặc dù cũng có bản thương mại nhưng không ảnh hưởng đến phiên bản mã nguồn mở.  
- **Được bảo trì bởi người tạo ra MySQL**  
Sau khi bị Oracle mua lại, một số thành viên chủ lực của MySQL đã ra đi, trong đó bao gồm những người tạo ra MySQL. Trong khi đó, MariaDB tiếp tục phát triển, đến bây giờ đã phát triển đến thế hệ 10.x. Do đó, tất cả những nhược điểm của MySQL đều được khắc phục ở MariaDB.  
- **Hoàn toàn tương thích với MySQL**  
Do “sinh cùng cha” nên MariaDB có hệ thống hoàn toàn tương thích như với MySQL từ phiên bản 5.1 -> 5.5. Do đó, nếu Website của bạn đang dùng MySQL 5.1 -> 5.5 thì việc chuyển qua MariaDB là cực kì dễ dàng.  
Vì có sự tương thích giữa MariaDB và MySQL nên trong hầu hết trường hợp chúng ta có thể xóa bỏ MySQL và cài đặt MariaDB để thay thế mà hệ thống vẫn hoạt động bình thường.  
- **Tối ưu tốc độ**  
Trong cùng một điều kiện như nhau thì MariaDB nhanh hơn MySQL từ 3-5% tốc độ.  
- **Các Website lớn đã sử dụng MariaDB**  
Một trong những website lớn nhất thế giới là Wikipedia đã chuyển từ MySQL qua MariaDB. Ngay cả Fullstack-Station cũng đang dùng MariaDB.    
