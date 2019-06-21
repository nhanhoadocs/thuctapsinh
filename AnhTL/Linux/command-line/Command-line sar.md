# Command-line "Sar (System active report)"
- Được sử dụng để thu thập, báo cáo và lưu CPU , sử dụng bộ nhớ , I/O trong Unix. Lệnh SAR tạo ra các báo cáo một cách nhanh chóng và cũng có thể lưu các báo cáo trong các tệp nhật ký.

B1: Đầu tiên ta phải cài dịch vụ: sysstat
```
[ root @ localhost ~] # yum install sysstat
```
- Dịch vụ (sysstat) để nó tiết kiệm báo cáo trong log file “/ var / log / sa / Sadd ” trong đó dd đại diện cho ngày hiện tại và các tệp hiện có sẽ được lưu trữ.

**B2: Chúng ta sẽ bắt đầu và bật sysstat lên.

```
[root@localhost ~]# systemctl start sysstat
[root@localhost ~]# systemctl enable sysstat
```
- Nó thu thập dữ liệu cứ sau 10 phút và tạo báo cáo hàng ngày. file crontab chịu trách nhiệm thu thập và tạo báo cáo.

```
[user1@localhost ~]$ sudo cat /etc/cron.d/sysstat
# Run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 1 1
# 0 * * * * root /usr/lib64/sa/sa1 600 6 &
# Generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
```
- Dưới đây là tập tin cấu hình của SysStat (lệnh sar).

```
[user1@localhost ~]$ sudo cat /etc/sysconfig/sysstat
# sysstat-10.1.5 configuration file.

# How long to keep log files (in days).
# If value is greater than 28, then log files are kept in
# multiple directories, one for each month.
HISTORY=28

# Compress (using gzip or bzip2) sa and sar files older than (in days):
COMPRESSAFTER=31

# Parameters for the system activity data collector (see sadc manual page)
# which are used for the generation of log files.
SADC_OPTIONS="-S DISK"

# Compression program to use.
ZIP="bzip2"
```

Tiếp theo ta sẽ làm các ví dụ về lệnh sar
- Ví dụ 1: Tạo Báo cáo CPU 5 lần cứ sau 2 giây.
```
[user1@localhost ~]$ sar 2 5
Linux 3.10.0-957.el7.x86_64 (localhost.localdomain)     06/19/2019      _x86_64_        (2 CPU)

04:05:38 PM     CPU     %user     %nice   %system   %iowait    %steal     %idle
04:05:40 PM     all      0.00      0.00      0.00      0.00      0.00    100.00
04:05:42 PM     all      0.00      0.00      0.25      0.00      0.00     99.75
04:05:44 PM     all      0.00      0.00      0.00      0.00      0.00    100.00
04:05:46 PM     all      0.00      0.00      0.25      0.00      0.00     99.75
04:05:48 PM     all      0.25      0.00      0.25      0.00      0.00     99.50
Average:        all      0.05      0.00      0.15      0.00      0.00     99.80
```
Nếu **%iowait** lớn hơn 0 trong một khoảng thời gian dài hơn thì chúng ta có thể xem xét có một số điểm nghẽn trong hệ thống I/O (Đĩa cứng hoặc Mạng)

- Ví dụ 2: Tạo báo cáo sử dụng bộ nhớ bằng cách sử dụng -r
```
[user1@localhost ~]$ sar -r 2 5
Linux 3.10.0-957.el7.x86_64 (localhost.localdomain)     06/19/2019      _x86_64_        (2 CPU)

04:08:50 PM kbmemfree kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
04:08:52 PM    101772    894152     89.78        52    156864   4028208    404.47    594192     80268         0
04:08:54 PM    101772    894152     89.78        52    156864   4028208    404.47    594192     80268         0
04:08:56 PM    101772    894152     89.78        52    156864   4028208    404.47    594196     80268         0
04:08:58 PM    101772    894152     89.78        52    156864   4028208    404.47    594196     80268         0
04:09:00 PM    101756    894168     89.78        52    156864   4028208    404.47    594196     80268         0
Average:       101769    894155     89.78        52    156864   4028208    404.47    594194     80268         0
```
**kbcommit & %commit** là bộ nhớ tổng thể được sử dụng bao gồm RAM & Swap.

- Ví dụ 4: Tạo Báo cáo thống kê trang web bằng cách sử dụng -B

`` [ root @ localhost ~] # sar -B 2 5 ``

![](https://www.linuxtechi.com/wp-content/uploads/2015/11/paging-statistics-sar-command1.jpg)

Trong báo cáo **majflts/s** hiển thị các lỗi chính mỗi giây có nghĩa là số trang được tải vào bộ nhớ từ disk, nếu giá trị của nó cao hơn thì ta có thể nói rằng hệ thống đang chạy RAM.

**%vmeff** cho biết số lượng trang được quét mỗi giây, nếu value là 100% thì nó được coi là ổn và khi nó dưới 30% thì có vấn đề với bộ nhớ ảo. Giá trị bằng 0 chỉ ra rằng không có trang nào được quét trong thời gian đó.

- Ví dụ 5: Tạo báo cáo thống kê thiết bị theo khối bằng cách sử dụng -d

Tùy chọn -d trong lệnh sar được sử dụng để hiển thị báo cáo thống kê thiết bị khối. Sử dụng tùy chọn -p cùng với -d làm cho cột dev dễ đọc hơn.

`` [ root @ localhost ~] # sar -d -p 2 4``

![img](https://www.linuxtechi.com/wp-content/uploads/2015/11/block-device-report-sar-command2.jpg)

- Ví dụ 6: Tạo báo cáo thống kê mạng bằng cách sử dụng -n.

Tùy chọn -n trong lệnh sar được sử dụng để tạo báo cáo thống kê mạng. Dưới đây là synatx:

**sar -n {keyword} hoặc {ALL}**

Có thể sử dụng các từ khóa sau: DEV, EDEV, NFS, NFSD, SOCK, IP, EIP, ICMP, EICMP, TCP, ETCP, UDP, SOCK6, IP6, EIP6, ICMP6, EICMP6 & UDP6.

Để tạo tất cả các báo cáo thống kê mạng ta sử dụng lệnh:

``[ root @ localhost ~] # sar -n ALL ``

![](https://www.linuxtechi.com/wp-content/uploads/2015/11/network-statistics-report-sar-command-1024x584.jpg)

- Ví dụ: 7 Đọc tệp nhật ký SAR bằng cách sử dụng -f

 Các tệp nhật ký sar được giữ trong /var/log/sa/saDD, sử dụng tùy chọn -f trong lệnh sar, chúng ta có thể đọc các tệp nhật ký.
 
 **DD là số ngày mà ta muốn chọn để hiển thị, nó sẽ được lưu theo từng ngày từ lúc nó bắt đầu ghi**
 
 ``[ root @ localhost ~] # sar -r -f / var / log / sa / sa26``
 
 ![](https://www.linuxtechi.com/wp-content/uploads/2015/11/reading-sar-log-file2-1024x323.jpg)
 
 # Các thông số trong lệnh "sar"

- sar - Thu thập, báo cáo hoặc lưu thông tin hoạt động hệ thống.

**Sau khi ta gõ lệnh sar kèm theo các option của nó thì sẽ có các thông số sau:**
- sar -A : nó sẽ hiển thị tất cả các thông số trong các option khác **-bBdqrRSuvwWy**.
- Trong đây sẽ giải thích tất cả các thông số trong các option của lệnh **sar**: https://linux.die.net/man/1/sar

**sar**
- **CPU** : Hiển thị số CPU(s) sử dụng.
- **%user**: Phần trăm CPU mà user sử dụng.      
- **%nice**: Tỷ lệ sử dụng CPU xảy ra trong khi thực hiện ở chế độ người dùng với mức độ ưu tiên cao tương ứng.
- **%system**: Phần trăm CPU mà hệ thống sử dụng.       
- **%iowait**: Hiển thị phần trăm mà CPU chờ trong thời gian mà hệ thống đang xử lý dữ liệu.
- **%steal**: Hiển thị phần trăm chia sẻ tài nguyên cpu cho máy khác. Chỉ xảy ra trong trường hợp máy ảo.
- **%idle**: Hiển thị phần trăm mà cpu không hoạt động và hệ thống không có yêu cầu I / O.

**sar -b**

Báo cáo I/O và thống kê tốc độ truyền tải. Các giá trị sau được hiển thị:

- **tps**: Tổng số lần truyền tải mỗi giây được phát cho các thiết bị vật lý. truyền tải là một yêu cầu I/O đến một thiết bị vật lý. Nhiều yêu cầu logic có thể được kết hợp thành một yêu cầu I/O duy nhất cho thiết bị. Một sự chuyển giao có kích thước không xác định.
- **rtps**: Tổng số yêu cầu đọc mỗi giây được cấp cho các thiết bị vật lý.
- **wtps**: Tổng số yêu cầu ghi mỗi giây được cấp cho các thiết bị vật lý.
- **beard/s**: Tổng lượng dữ liệu được đọc từ các thiết bị theo khối mỗi giây. Các khối tương đương với các cung có 2,4 kernel và mới hơn và do đó có kích thước 512 byte. Với các kernel cũ hơn, một khối có kích thước không xác định.
- **bwrtn/s**: Tổng lượng dữ liệu được ghi vào các thiết bị theo khối mỗi giây.

 
 # END
 
 ## Chúc Các Bạn Học Tốt
 
