# 1. Quá trình Khởi động của linux 
- Quá trình khởi động rất đơn giản. Hạt nhân khởi động đơn luồng và đồng bộ trên mọi lõi đơn và dường như rất dễ nhìn
- Quá trình khởi động của máy khi ta bấm nút khởi động là 
    - BIOS 
    - BOOT 
    - kernel
# 2. Công cụ quản lý Intel  và trung tâm điều khiển Minix
- BMC không phải là vi điều khiển duy nhất có thể hoạt động khi hệ thống tắt danh nghĩa. 
- Một loạt các thiết bị điện tử được sản xuất cho phép các chức năng điều khiểu từ xa KVM và dịch vụ cấp phép khả năng của Intel.
# 3. BIOS 
- BIOS à một chương trình được chạy ngay sau khi ta bấm nút nguồn hay khi ta reboot lại máy. 
- Nó là chương trình được cài sẵn vào chip hay bộ nhớ flast nằm trên bo mạch chủ.
- BIOS tiến hành kiểm tra phần cứng nhằm kiểm tra thông số và trạng thái của các phần cứng máy tính như bộ nhớ, CPU, thiết bị lưu trữ, card mạng,... 
- Đồng thời, BIOS cũng phép bạn thay đổi các thiết lập, cấu hình của nó ( bấm F10, F11, ... để vào giao diện của nó lúc khởi động). Nếu quá trình kiểm tra kết thúc thành công thì BIOS sẽ cố gắng tìm và khởi chạy (boot) một hệ điều hành chứa trong các thiết bị ổ cứng, CD/DVD, USB,...
# 4. Bộ tải khởi động (boot loader)
- Sector đầu tiên (được đánh số 0) của một thiết bị lưu trữ dữ liệu được gọi là MBR ( thường có kích thước 512 bytes ).
- Sau khi BIOS xác định được thiết bị lưu trữ nào sẽ được ưu tiên để tìm kiếm đầu tiên thì thì thực chất BIOS sẽ đọc trong MBR của thiết bị này để nạp vào bộ nhớ một chương trình rất nhỏ. Chương trình này sẽ định vị và khởi động boot loader
- Công việc của bộ tải khởi động là cung cấp cho bộ xử lý mới được cung cấp tài nguyên cần thiết để chạy hệ điều hành có mục đích chung như Linux 
- Khi bật nguồn, không chỉ không có bộ nhớ ảo mà còn có DRAM cho đến khi bộ điều khiển của nó được đưa lên
- Sau đó, một bộ tải khởi động sẽ bật nguồn cung cấp năng lượng và quét các bus và giao diện để xác định vị trí hình ảnh kernel và hệ thống tập tin gốc
- Bộ tải khởi động cũng tương tác với các thiết bị bảo mật phần cứng như Modules nền tảng đáng tin cậy  để thiết lập chuỗi tin cậy từ lần khởi động sớm nhất.
# 5. Kernel 
## a) Cung cấp kernel khởi động 
- Bootloader nạp một chương trình init trong thư mục /sbin/
- Nó chính là  mã kernel mà nó đã tải vào bộ nhớ chính và bắt đầu thực thi, chuyển qua bất kỳ tùy chọn dòng lệnh nào mà người dùng đã chỉ định. 
- Khi kernel được khởi chạy xong, nó triệu gọi duy nhất một chương trình có tên là init. Tiến trình này có PID=1, nó là tiến trình cha của tất cả các tiến trình khác. Vì vậy tiến trình này ko thể kill và không được phép chết. Sau đó, init sẽ xem trong file /etc/inittab để biết được nó cần làm gì tiếp theo.