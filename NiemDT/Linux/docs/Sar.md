# SAR
`SAR`- System Activity Report là một công cụ để thu thập dữ liệu, hiệu suất hoạt động của hệ thống để lưu trữ làm lịch sử phân tích hệ thống sau này. Với lệnh này ta có thể nắm bắt được các thông tin cơ bản sau của hệ thống.
 * Thống kê thông số cơ bản của CPU
 * Thống kê riêng biệt từng CPU
 * Thống kê RAM, swap
 * Thống kê I/O của hệ thống
 * Kiểm tra tốc độ I/O của từng hệ thống riêng biệt
 * Thống kê tốc độ truyền tải trung bình
 * Thống kê mạng
 * Báo cáo các dữ liệu vào một thời gian cụ thể.
### Cài đặt 
Chúng ta phải cài đặt gói `sysstat` để có thể sử dụng `sar`
Có nhiều cách để cài `sysstat`. Chúng ta có thể cài trực tiếp từ các gói có sẵn bằng cách
`yum install sysstat`
Hoặc cũng có thể download file trên internet về và cài.
## Một số lệnh với sar
### 1. Kiểm tra real-time
Để kiểm tra các thông số của hệ thống thời điểm hiện tại ta sử dụng lệnh với cú pháp như sau:
`sar [option] [interval] [count]`
`interval` chỉ ra khoảng thời gian sau bao nhiêu giây sẽ xuất một kết quả ra màn hình.
`count` thể hiện số lần kết qủa trả về. Nếu không có trường này thì kết quả trả về cho đến khi nào ta nhấn `Ctrl+C` để thoát.
#### Sủ dụng CPU
Để kiểm tra về CPU ta sử dụng option `-u`
```
[root@localhost ~]# sar -u 2 4
Linux 3.10.0-862.el7.x86_64 (localhost.localdomain) 	12/12/2018 	_x86_64_	(1 CPU)

22:06:15        CPU     %user     %nice   %system   %iowait    %steal     %idle
22:06:17        all      0,00      0,00      0,50      0,00      0,00     99,50
22:06:19        all      0,00      0,00      0,00      0,00      0,00    100,00
22:06:21        all      0,00      0,00      0,00      0,00      0,00    100,00
22:06:23        all      0,00      0,00      0,50      0,00      0,00     99,50
Average:        all      0,00      0,00      0,25      0,00      0,00     99,75
```
Trong đó: 
 * `%user` là % CPU được sử dung trong khi thực hiện các chương trình cuả người dùng.
 * `%nice` là % thời gian 
 * `%system` là % sử dụng CPU trong khi thực hiện các tiến trình ở cấp độ hệ thống. Bao gồm cả thời gian ngắt phần cứng và phần mềm
 * `%iowait` là % thời gian mà CPU không hoạt động trong thời gian hệ thống có yêu cầu nhập xuất xuống disk.
 * `%steal` là % thời gian dành cho việc chờ đợi không tự nguyện vì thực ra CPU đang phục vụ một hệ thống khác.
 * `%idle` là % thời gian mà CPU không hoạt động và hệ thống cũng không có yêu cầu nhập xuất xuống đĩa.

Trong cột `CPU` chúng ta có thể thấy giá trị `all` có nghĩa là đây là giá trị trung bình đại diện cho tất cả các cores của CPU. Để thấy được mức độ sử dụng của từng CPU ta có thể sử dụng option `-P ALL`
```
niemdt@niemdt:~$ sar -P ALL 2 1
Linux 4.15.0-42-generic (niemdt) 	12/12/2018 	_x86_64_	(8 CPU)

22:25:04        CPU     %user     %nice   %system   %iowait    %steal     %idle
22:25:06        all      0,82      0,00      0,31      0,00      0,00     98,87
22:25:06          0      0,00      0,00      0,00      0,00      0,00    100,00
22:25:06          1      1,50      0,00      0,50      0,00      0,00     98,00
22:25:06          2      1,01      0,00      1,01      0,00      0,00     97,99
22:25:06          3      0,00      0,00      0,00      0,00      0,00    100,00
22:25:06          4      1,01      0,00      0,50      0,00      0,00     98,49
22:25:06          5      0,50      0,00      0,50      0,00      0,00     98,99
22:25:06          6      1,00      0,00      0,00      0,50      0,00     98,51
22:25:06          7      1,50      0,00      0,00      0,00      0,00     98,50

Average:        CPU     %user     %nice   %system   %iowait    %steal     %idle
Average:        all      0,82      0,00      0,31      0,00      0,00     98,87
Average:          0      0,00      0,00      0,00      0,00      0,00    100,00
Average:          1      1,50      0,00      0,50      0,00      0,00     98,00
Average:          2      1,01      0,00      1,01      0,00      0,00     97,99
Average:          3      0,00      0,00      0,00      0,00      0,00    100,00
Average:          4      1,01      0,00      0,50      0,00      0,00     98,49
Average:          5      0,50      0,00      0,50      0,00      0,00     98,99
Average:          6      1,00      0,00      0,00      0,50      0,00     98,51
Average:          7      1,50      0,00      0,00      0,00      0,00     98,50
```
#### Run queue và trung bình tải
Để thấy chiều dài hành đợi và trung bình tải ta dùng option `-q`
```
niemdt@niemdt:~$ sar -q 2 2
Linux 4.15.0-42-generic (niemdt) 	12/12/2018 	_x86_64_	(8 CPU)

22:28:40      runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
22:28:42            0      1259      0,57      0,46      0,43         0
22:28:44            0      1259      0,57      0,46      0,43         0
Average:            0      1259      0,57      0,46      0,43         0
```
Trong đó:
 * `runq-sz` show ra size của hành đợi. Nó là số công việc đang chờ xử lý trong thời gian đó.
 * `plist-sz` show số công việc trong danh sách công việc
 * `ldavg-1` ` ldavg-5` `ldavg-15` là tải trung bình trong khoản thời gian `1` `5` và `15` phút cuối.
 * `blocked` show số công việc hiện đang bị chặn chờ I/O thực hiện xong.
#### Sử dụng Memory
Option `-r` cho phép ta thấy được trạng thái sử dụng memory
```
niemdt@niemdt:~$ sar -r 2 3
Linux 4.15.0-42-generic (niemdt) 	12/12/2018 	_x86_64_	(8 CPU)

22:38:11    kbmemfree   kbavail kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
22:38:13       883880   2498604   6880096     88,62    244500   3124608  15452060    156,70   4355872   2052840       792
22:38:15       882572   2497304   6881404     88,63    244500   3126500  15452060    156,70   4355640   2054724       808
22:38:17       881472   2496204   6882504     88,65    244500   3126500  15455844    156,74   4356548   2054728       808
Average:       882641   2497371   6881335     88,63    244500   3125869  15453321    156,71   4356020   2054097       803
```
Trong đó:
 * `kbmemfree` và `kbmemused` là tổng số memory còn trống và đã sử dụng được tính băng kilobytes
 * `%memused` là % memory được sử dụng.
 * `kbbuffers` và `kbcached` là tổng dung lượng memory được sử dụng làm buffers và data cache cho kernel.
 * `kbcommit` là lượng bộ nhớ cần thiết cho công việc hiện tại. Đây là ước tính về lượng RAM/trao đổi cần thiết để bào đảm rằng không bao giờ hết bộ nhớ.
 * `%commit` là tỷ lệ % của bộ nhớ cần thiết để hỗ trợ lượng công việc hiện tại so với tổng dung lượng bộ nhớ(RAM+swap). Con số này có thể lớn hơn 100%. Tỷ lệ lớn hơn 100% có thể chỉ ra sự thiếu hụt bộ nhớ.
#### Kiểm tra swap
Option `-S` hiển thị thông tin về bộ nhớ swap
```
niemdt@niemdt:~$ sar -S 2 2
Linux 4.15.0-42-generic (niemdt) 	12/12/2018 	_x86_64_	(8 CPU)

23:14:28    kbswpfree kbswpused  %swpused  kbswpcad   %swpcad
23:14:30      2096636       512      0,02        52     10,16
23:14:32      2096636       512      0,02        52     10,16
Average:      2096636       512      0,02        52     10,16
```
#### Trạng thái I/O
Để xem thông tin về hoạt động I/O ta sử dụng option `-b`
```
niemdt@niemdt:~$ sar -b 2 2
Linux 4.15.0-42-generic (niemdt) 	12/12/2018 	_x86_64_	(8 CPU)

23:18:31          tps      rtps      wtps   bread/s   bwrtn/s
23:18:33         0,00      0,00      0,00      0,00      0,00
23:18:35         0,00      0,00      0,00      0,00      0,00
Average:         0,00      0,00      0,00      0,00      0,00
```
Trong đó:
 * `tps` tổng số transfers trên giây. Một transfer là 1 yêu cầu nhập xuất xuống thiết bị vật lý. Nhiều yêu cầu logic có thể được kết hợp thành một yêu cầu I/O duy nhất cho thiết bị. Có thể hiểu `tps` hiển thị số lượng hoạt đông I/O mỗi giây. Nó là tông của `rtps` và `wtps`
 * `rtps` và `wtps` là tổng số yêu cầu đọc và viết mỗi giây xuống thiết bị vật lý.
 * `bread/s` là lượng dữ liệu đọc từ đọc từ thiết bị theo blocks mỗi giây. Blocks tương đương với các sector và do đó nó có kích thức 512 bytes.
 * `bwrtn/s` là lượng dữ liệu được viết lên thiết bị theo blocks mỗi giây.
Để hiển thị chi tiết hoạt động trên từng thiết bị ta sử dụng option `-dp`
```
[root@localhost ~]# sar -dp 2 1
Linux 3.10.0-862.el7.x86_64 (localhost.localdomain) 	12/12/2018 	_x86_64_	(1 CPU)

23:36:09          DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
23:36:11          sda      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11          sdb      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11          sdc      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11          sdd      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11          sr0      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11    centos-root      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11    centos-swap      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:36:11          sde      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00

Average:          DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
Average:          sda      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:          sdb      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:          sdc      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:          sdd      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:          sr0      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:    centos-root      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:    centos-swap      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:          sde      0,00      0,00      0,00      0,00      0,00      0,00      0,00      0,00
```
Trong đó:
 * `rd_sec/s` và `wr_sec/s` là số sector được đọc từ thiết bị và ghi vào thiết bị. Mỗi sector có size là 512 bytes.
 * `avgrq-sz` là kích thước trung bình trong sector cảu các yêu cầu được đưa xuống thiết bị.
 * `avgqu-sz` nó show ra có bao nhiêu yeu cầu trong hành đợi đang được phục vụ. 
 * `await` là thời gian trung bình từ khi một yêu cầu được đặt trong hàng đợi và đến khi yêu cầu đó được xử lý xong.
 * `%util` là tổng thời gian mà các hoạt động I/O đang diễn ra chia cho khoảng thời gian lấy mẫu. 
#### Trạng thái của thiết bị mạng
Để hiển thị các thông số về mạng ta dùng cú pháp sau:
`sar -n [từ khóa] [interval] [count]`
```
[root@localhost ~]# sar -n DEV 2 2
Linux 3.10.0-862.el7.x86_64 (localhost.localdomain) 	12/12/2018 	_x86_64_	(1 CPU)

23:55:50        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
23:55:52           lo      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:55:52        ens33      0,50      0,50      0,03      0,09      0,00      0,00      0,00

23:55:52        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
23:55:54           lo      0,00      0,00      0,00      0,00      0,00      0,00      0,00
23:55:54        ens33      0,50      0,50      0,03      0,19      0,00      0,00      0,00

Average:        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
Average:           lo      0,00      0,00      0,00      0,00      0,00      0,00      0,00
Average:        ens33      0,50      0,50      0,03      0,14      0,00      0,00      0,00
```
Trong đó có một số từ khóa sau:
 * `DEV` – Thống kê các thông số các card mạng. Ví dụ eth0, eth1, lo…
 * `EDEV` – Thống kê thất bại chuyển mạch
 * `NFS` – Thống kê các máy khách kết nối giao thức NFS
 * `NFSD` – Thống kê máy chủ kết nối giao thức NFS
 * `SOCK` – Thống kê sockets được sử dụng áp dụng IPv4
 * `IP` – Thống kê gói tin IPv4
 * `EIP` – Thống kê gói tin lỗi IPv4
 * `ICMP` – Thống kê các gói tin giao thức ICMPv4
 * `EICMP` – Thống kê các gói tin lỗi giao thức ICMPv4
 * `TCP` – Thống kê các gói tin giao thức TCPv4
 * `ETCP` – Thống kê các gói tin lỗi giao thức TCPv4
 * `UDP` – Thống kê các gói tin giao thức UDPv4
 * `SOCK6`, `IP6`, `EIP6`, `ICMP6`, `UDP6` sử dụng trong kết nối IPv6
 * `ALL` – Thống kê tất cả các thông tin đã thu thập.
### 2. Thu thập số liệu theo thời gian
Để thiết lập việc ghi thông tin vào file log ta thiết lập trong 2 file sau
 * `/etc/sysconfig/sysstat`
 * `/etc/cron.d/sysstat`
Khi đã config thì file log sẽ được xuất định kỳ ra thư mục `/var/log/sa/`
```
[root@localhost ~]# ls /var/log/sa/
sa12  sa13  sar12
```
Và các file log này sẽ được ghi theo ngày và các file có dạng
`/var/log/sa/sa[ngày]`
trong đó [ngày] là ngày trong tháng từ 1-31
#### Xem thông tin các ngày trước
`sar -r -f /var/log/sa/sa[ngày]`
Ví dụ tôi muốn xem ngày 12 `sar -r -f /var/log/sa/sa12`
```
[root@localhost ~]# sar -r -f /var/log/sa/sa12
Linux 3.10.0-862.el7.x86_64 (localhost.localdomain) 	12/12/2018 	_x86_64_	(1 CPU)

21:30:01    kbmemfree kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
21:40:02       600256    397700     39,85      2108    187076    337588     10,91    151348    100952         0
21:50:01       600312    397644     39,85      2108    187080    337588     10,91    151400    100904         0
22:00:01       600272    397684     39,85      2108    187088    337588     10,91    151412    100900         0
22:10:01       600176    397780     39,86      2108    187100    337588     10,91    151424    100900         0
22:20:01       601388    396568     39,74      2108    187108    336004     10,86    150432    100900         0
22:30:01       600132    397824     39,86      2108    187132    337588     10,91    151480    100900         0
```
#### Xem thông tin trong một khoảng thời gian nhất định
`sar -s {hh:mm:ss} -e {hh:mm:ss}`
```
Linux 3.10.0-862.el7.x86_64 (localhost.localdomain) 	13/12/2018 	_x86_64_	(1 CPU)

00:00:01        CPU     %user     %nice   %system   %iowait    %steal     %idle
00:10:01        all      0,00      0,00      0,06      0,00      0,00     99,93
Average:        all      0,00      0,00      0,06      0,00      0,00     99,93
```
Nếu muốn xem thông tin trong một khoảng thời gian nhất định của một ngày nhất định ta dùng cú pháp sau:
` sar -f /var/log/sa/sa[ngày] -s {hh:mm:ss} -e {hh:mm:ss}`