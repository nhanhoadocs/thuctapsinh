# Mô hình OSI
Mô hình OSI là một trong những công cụ quan trọng nhất để giúp ta nắm bắt cách làm việc của các thiết bị mạng như router, switch, PC ...
OSI viêt tắt của từ Open System Interconnection (liên kết nối hệ thống mở)
![alt](http://www.adminvietnam.org/wp-content/uploads/2016/10/osi.png)

- Ví dụ: 1 máy ở Việt Nam muốn gửi tới 1 máy ở Mỹ và 2 máy này của các hãng khác nhau thì sẽ không truyền tin được do các chuẩn của các máy là khác nhau. Thì Mô hình phân lớp OSI sẽ giúp 2 máy này trao đổi được với nhau.
Mô hình OSI sẽ chia ra làm 7 lớp công việc, mỗi lớp sẽ quy định đặc tính kỹ thuật, tính năng, chuẩn cụ thể mà buộc các nhà sản xuất thiết bị khi tham gia phải tuân theo.
Nó sẽ đảm bảo tính tương tích về mặt công nghệ, Lúc này thiết bị của các hãng khác nhau sẽ giao tiếp được với nhau
Các mô hình trong OSI thường được gọi là số thay vì tên (ta sẽ gọi là "lớp 3" thay vì "lớp mạng")
Môi lớp sẽ có 1 công việc riêng
## Mô ta chi tiết từng lớp.
### Lớp 1 - Physical
- Chức năng là truyền 1 dòng bit (0,1) qua 1 đường truyền cụ thể nào đó, Ví dụ như cáp xoắn đôi UTP, FTP, hay cáp đồng trục, hay cáp quang ... đó chính là vấn đề mà lớp 1 này quy định. 
- Lớp 1 sẽ xây dựng được 1 đường truyền vậy lý cho các host, và sau khi có đường truyền vật lý rồi, thì làm cách nào để các lớp ở bên trên có thể truy cập vào đường truyền vật lý và chia sẻ đường truyền vật lý trên mạng thì đó là lớp Data Link
### Lớp 2 - Data Link
- Là lớp liên kết dữ liệu thì sẽ thực hiện chức năng điều khiển truy nhập vào đường truyền vật lý (lớp 1) và nó thực hiện giao tiếp với lớp bên trên là lớp Network.
Các lớp liên kết dữ liệu định dạng các thông điệp vào một khung dữ liệu(Frame), và thêm vào đó một header chứa các địa chỉ phần cứng nơi nhận và địa chỉ nguồn của nó.Tiêu đề này chịu trách nhiệm cho việc tìm kiếm các thiết bị đích tiếp theo trên một mạng nội bộ.
- Lớp 3 là chịu trách nhiệm cho việc tìm kiếm con đường đến đích cuối cùng (mạng) nhưng nó không quan tâm về việc ai sẽ là người nhận tiếp theo. Vì vậy lớp 2 giúp cho dữ liệu truyền được điểm đến tiếp theo.
- Lớp này là chia nhỏ thành 2 lớp con: điều khiển logic liên kết (LLC) và  (MAC).
Các chức năng LLC bao gồm:
+ Quản lý các khung cho các lớp trên và dưới
+ Kiểm soát lỗi
+ Điều khiển luồng
- Lớp này sẽ lấy địa chỉ MAC để xác định ai là người nhận.

### Lớp 3 - Network
- Nếu ta có nhiều đường truyền vật lý và đường nào cũng có thể truy nhập vào được, thì lớp Network này sẽ giúp ta tìm ra đường đi tốt ưu nhất
- Nó sẽ chịu chắc nghiệm chó việc phân bố dữ liệu từ điểm này tới điểm kia 1 cách tối ưu nhấ, bằng cách thực hiện("route"  " định tuyến" đường đi tối ưu nhất để phân phối dữ liệu)
- VD: khi ta muốn đi từ A đến B, ta cẩn phải biết địa chỉ để định danh các điểm ta cần đến, lúc này lớp Network sẽ quy định ra cái cách định tuyến địa chỉ IP
### lớp 4 - Transport
- Lớp này sẽ quản lý đầu cuối end - to - end và nó không cần quan tâm ở giữa các gói tin đi như thế nào nữa vì các lớp ở dưới sẽ xử lý phần này.
- Xử lý các vấn đề truyền tải giữa các host đảm bảo rằng dữ liệu được truyền tải 1 cách đáng tin cậy ( TCP ). 
- Lớp này sẽ thiết lập, duy trì và kết thúc các đường mạch ảo.
- Cung cấp cơ chế dò lỗi, sửa lỗi tin cậy và cơ chế phục hồi thông tin.

### lớp 5 - Session
- Lớp này sẽ thực hiện thao tác tuyền thông liên host, thiết lập, duy trì và kết thúc kết nối.
- Đồng bộ hội thoại.
### lớp 6 - Presentation
- Lớp này sẽ làm nghiệm vụ thông ngôn, đứng ra đảm bảo rằng là dữ liệu từ đầu này gửi đến có thể đọc được ở đầu nhận.
- Nó sẽ định dạng lại dữ liệu.
- Cấu trúc lại dữ liệu
- Thương lượng lại cú pháp truyền dữ liệu cho tầng ứng dụng
- Cung cấp cơ chế mã hóa.
### Lớp 7 - Application
- Lớp này giao tiếp trực tiếp với người dùng.
- Nó cung cấp các ứng dụng, dịch vụ mạng như: email, file transfer và các truy nhập từ xa.
- Cung cấp cơ chế xác thực người dùng.
 + ví dụ: Username - password
 - Những ví dụ của lớp Application là Telnet, FTP, client email (SMTP), HyperText Transfer Protocol (HTTP).
