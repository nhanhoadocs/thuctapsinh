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

- Show thông tin máy tính.

`` hostnamectl ``

- Show thông tin CPU.

`` lscpu ``

- Show thông tin về RAM

```
free -h 
cat /proc/meminfo 
vmstat -s
``` 

- Show thông tin disk

```
[user1@localhost sa]$ df
Filesystem              1K-blocks    Used Available Use% Mounted on
/dev/mapper/centos-root  39298308 3794692  35503616  10% /
devtmpfs                   480848       0    480848   0% /dev
tmpfs                      497960       0    497960   0% /dev/shm
tmpfs                      497960   14980    482980   4% /run
tmpfs                      497960       0    497960   0% /sys/fs/cgroup
/dev/sda1                  520868  163020    357848  32% /boot
/dev/mapper/centos-var    2086912  811656   1275256  39% /var
tmpfs                       99596       4     99592   1% /run/user/42
tmpfs                       99596      44     99552   1% /run/user/1000
/dev/sr0                  4480476 4480476         0 100% /run/media/user1/CentOS 7 x86_64
```

```
[user1@localhost sa]$ df -h
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/centos-root   38G  3.7G   34G  10% /
devtmpfs                 470M     0  470M   0% /dev
tmpfs                    487M     0  487M   0% /dev/shm
tmpfs                    487M   15M  472M   4% /run
tmpfs                    487M     0  487M   0% /sys/fs/cgroup
/dev/sda1                509M  160M  350M  32% /boot
/dev/mapper/centos-var   2.0G  793M  1.3G  39% /var
tmpfs                     98M  4.0K   98M   1% /run/user/42
tmpfs                     98M   44K   98M   1% /run/user/1000
/dev/sr0                 4.3G  4.3G     0 100% /run/media/user1/CentOS 7 x86_64
```
- Show thông tin về hệ thống tập tin cụ thể

`` df /dev/sda ``

- Show thông tin về thời tiết.

`` curl -4 http://wttr.in/Cityname ``

- Show thông tin về thời tiết ở vị trí hiện tại.

`` curl wttr.in ``

- Để chỉnh sửa ngày và giờ trên Ubuntu.

`` timedatectl ``

- Để thay đổi sang múi giờ Vietnam (UTC +7).

`` timedatectl set-timezone Asia/Ho_Chi_Minh ``

- Xem danh sách múi giờ bằng lệnh.

`` timedatectl list-timezones ``

- Để hiện thêm thông tin về lệnh df.

`` df --help ``

- Kiểm tra phiên bản hệ điều hành.

`` cat /etc/centos-release ``
  
 
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





