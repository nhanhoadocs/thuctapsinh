# Boot Process
Từ lúc chúng ta bấm nút nguồn để khởi động máy tính đến khi chúng ta có thể sử dụng chúng thời gian này chỉ mất từ vài giây đến 1 phút. Nhưng trong khoảng thời gian này là cả một quy trình xử lý và tính toán phức tạp. Máy tính phải thực hiện rất nhiều công việc trong khoảng thời gian này.
Sau đây là các bước khởi động của máy Linux.
### 1. BIOS (Basic Input/Output System)
BIOS là chương trình được chạy đầu tiên khi ta bấm nút nguồn hay nút restart trên máy tính. Nó là chương trình được cài sẵn vào chip hay bộ nhớ flast nằm trên bo mạch chủ.
BIOS tiến hành kiểm tra phần cứng nhằm kiểm tra thông số và trạng thái của các phần cứng máy tính như bộ nhớ, CPU, thiết bị lưu trữ, card mạng,... Đồng thời, BIOS cũng phép bạn thay đổi các thiết lập, cấu hình của nó ( bấm F10, F11, ... để vào giao diện của nó lúc khởi động).
Nếu quá trình kiểm tra kết thúc thành công thì BIOS sẽ cố gắng tìm và khởi chạy (boot) một hệ điều hành chứa trong các thiết bị ổ cứng, CD/DVD, USB,...
### 2. Master Boot Record (MBR)
Sector đầu tiên (được đánh số 0) của một thiết bị lưu trữ dữ liệu được gọi là MBR ( thường có kích thước 512 bytes ). Sau khi BIOS xác định được thiết bị lưu trữ nào sẽ được ưu tiên để tìm kiếm đầu tiên thì thì thực chất BIOS sẽ đọc trong MBR của thiết bị này để nạp vào bộ nhớ một chương trình rất nhỏ. Chương trình này sẽ định vị và khởi động boot loader-đây là chương trình chịu trách nhiệm cho việc tìm và nạo nhân ( kernel ) của hệ điều hành.
### 3. Boot loader
Có 2 bootloader phổ biến trên Linux là GRUP và LILO. Nó có chung một mục đích là: cho phép ta lựa chọn một trong các hệ điều hành có trên máy tính để khởi động, sau đó chúng sẽ nạp kernel của hệ điều hành đó vào bộ nhớ và chuyển quyền điều khiển máy tính cho kernel này.
GRUB hay LILO đều có thể khởi động cho cả Linux và Windows.
### 4. Linux kernel được nạp và khởi chạy
Bootloader nạp một chương trình init trong thư mục /sbin/
### 5. Chương trình init thực thi
Khi kernel được khởi chạy xong, nó triệu gọi duy nhất một chương trình có tên là init. Tiến trình này có PID=1, nó là tiến trình cha của tất cả các tiến trình khác. Vì vậy tiến trình này ko thể kill và không được phép chết.
Sau đó, init sẽ xem trong file /etc/inittab để biết được nó cần làm gì tiếp theo. 