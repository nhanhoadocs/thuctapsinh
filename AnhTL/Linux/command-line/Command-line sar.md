# Command-line "Sar (System active report)"
- Được sử dụng để thu thập, báo cáo và lưu CPU , sử dụng bộ nhớ , I / O trong Unix như hệ điều hành. Lệnh SAR tạo ra các báo cáo một cách nhanh chóng và cũng có thể lưu các báo cáo trong các tệp nhật ký.

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
- Nó thu thập dữ liệu cứ sau 10 phút và tạo báo cáo hàng ngày. Tập tin crontab chịu trách nhiệm thu thập và tạo báo cáo.

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
Nếu %iowait lớn hơn 0 trong một khoảng thời gian dài hơn thì chúng ta có thể xem xét có một số điểm nghẽn trong hệ thống I/O (Đĩa cứng hoặc Mạng)

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
