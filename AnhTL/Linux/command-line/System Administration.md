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

Tên giao diện [ens33] khác nhau tùy thuộc vào môi trường.
  
**II.Tiến Trình (processus)**

- Hiển thị tất cả các tiến trình đã được thực hiện (pid et ppid).

`` ps -ef ``  

- Hiển thị chi tiết các tiến trình.

`` ps aux ``

- Hiển thị các tiến trình liên quan đến chương trình khởi động ``soft``

`` ps aux | grep soft ``

- Hiển thị chi tiết các tiến trình được cập nhật liên tục.

`` top ``

- Để hiển thị phiên bản hiện tại của lệnh trên cùng.

`` top -h ``    

- Để chỉ định độ trễ giữa của lần cập nhật mới nhất.

`` top -d <số giây> ``

- Với lệnh dưới đây, lệnh top sẽ tự động thoát sau 10 lần lặp lại. (bao nhiêu tùy chọn)

`` top -n 10 ``

- Để chỉ hiển thị các quy trình mà người dùng cụ thể đang chạy.

`` top -u <tên người dùng> ``


- Báo chấm dứt tiến trình mang số ``pid``

`` kill pid ``

- Yêu cầu hệ thống chấm dứt tiến trình ``pid``

`` kill -9 pid ``

- Chấm dứt một ứng dụng theo dạng đồ họa (ấn chuột vào cửa sổ của ứng dụng)

`` xkill ``

- Lệnh để hiển thị ai đã đăng nhập và họ đang làm gì, hiển thị thông tin về người dùng hiện tại trên máy và các quy trình của họ.

`` w `` 
    + Nhập lệnh ``man w`` để hiển thị thêm các option.
      
- Để tìm ra các tệp thư viện được sử dụng.

`` strace -e open pwd ``

- Hiển thị bản ghi hệ thống.

`` gnome-system-log ``

- Để đếm được thông tin trên một tập tin

`` wc tên_tệp``

- Để in số lượng dòng trong một tệp.

`` wc -l tên_tệp ``

- In số lượng ký tự trong một tệp

`` wc -m tên_tệp ``

- in số byte trong một tệp.

`` wc -c tên_tệp ``

![](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/64699382_2617704338240622_1896494104343216128_n.png?_nc_cat=108&_nc_oc=AQlIznLubg0ANnwKjrBp6Zq1qxTeMEDru7ztSMfDEexkvLMOQhctOVIfdYNQkHACRJc&_nc_ht=scontent.fhan5-5.fna&oh=2ecee7c52854904d8ac4e4445554b225&oe=5D921AAD)

- Theo dõi hiệu suất của các (CPU, Bộ nhớ, I / O ..) trong thời gian thực.

`` sar ``

- Hiển thị phiên bản sar

`` sar -V ``

- Thống kê CPU hệ thống 3 lần (với khoảng thời gian 1 giây).

`` sar 1 3 ``


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





