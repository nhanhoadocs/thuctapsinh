# System Administration

**I. Basic**
- Thực hiện command với tư cách siêu người dùng (root).

`` sudo command ``

- Giống với sudo nhưng dùng cho các ứng dụng đồ họa.

`` gksudo command ``

- Chấm dứt chế độ siêu người dùng.

`` sudo -k ``

- Cho biết phân bản của nhân Linux.

`` uname -r ``

- Show version.

`` cat /etc/os-release ``

- Khởi động lại máy ngay lập tức.

`` shutdown -h now ``

- Liệt kê các thiết bị PCI (Peripheral Component Interconnect) hoặc usb có mặt trong máy tính.

`` lsusb ``

`` lspci ``

- Cho biết thời gian cần thiết để thực hiện xong lệnh ``Command``.

`` time command ``

- Chuyển kết quả của lệnh command1 làm đầu vào của lệnh command2.

`` command1 | command2 ``

- Xóa màn hình của cửa sổ (teminal).

`` clear ``

- Show địa chỉ IP

`` nmcli device show ens33 ``

  - Tên giao diện [ens33] khác nhau tùy thuộc vào môi trường.
  
**II.Tiến Trình (processus)**

- Hiển thị tất cả các tiến trình đã được thực hiện (pid et ppid).

`` ps -ef ``  

- Hiển thị chi tiết các tiến trình.

`` ps aux ``

- Hiển thị chi tiết các tiến trình được cập nhật liên tục.

`` top ``

- Hiển thị các tiến trình liên quan đến chương trình khởi động ``soft``

`` ps aux | grep soft ``

- Báo chấm dứt tiến trình mang số ``pid``

`` kill pid ``

- Yêu cầu hệ thống chấm dứt tiến trình ``pid``

`` kill -9 pid ``

- Chấm dứt một ứng dụng theo dạng đồ họa (ấn chuột vào cửa sổ của ứng dụng)

`` xkill ``

- Lệnh để hiển thị ai đã đăng nhập và họ đang làm gì, hiển thị thông tin về người dùng hiện tại trên máy và các quy trình của họ.

`` w ``

**III. Gói phần mềm**
- Tập tin xác định nguồn các kho phần mềm để tải xuống nhằm cài mới hoặc cập nhật hệ thống
``  ``

**IV. Mạng máy tính**
- Thông tin cấu hình của các bộ phần giao diện (interfaces).

`` cat /etc/networks ``

- Hiển thị tên của máy tính trong mạng.

`` uname -a ``

- Thử nối mạng đến máy có địa chỉ IP.

`` ping địa_chủ_ip ``





