# System info


### Linux release
Các thông tin phát hành của kinux được lưu trong thư mục `/etc/`, để xem các thông tin phát hành ta sử dụng lệnh:

`cat /etc/*release`

Kết quả:
```
$ cat /etc/*release
CentOS Linux release 7.7.1908 (Core)
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

CentOS Linux release 7.7.1908 (Core)
CentOS Linux release 7.7.1908 (Core)
```

### Kernel info
Một số option của lệnh `uname` cho ta các thông tin về kernel:
 - `uname -s, --kernel-name` print the kernel name
 - `uname -r, --kernel-release` print the kernel release
 - `uname -v, --kernel-version`     print the kernel version

Kết quả:
```
$ uname -s
Linux
$ uname -r
3.10.0-1062.el7.x86_64
$ uname -v
#1 SMP Wed Aug 7 18:08:02 UTC 2019
```

### Memory info
```
$ lsmem
RANGE                                 SIZE  STATE REMOVABLE BLOCK
0x0000000000000000-0x000000003fffffff   1G online        no   0-7

Memory block size:       128M
Total online memory:       1G
Total offline memory:      0B
```

### File system
`df` (Viết tắt của disk free) là một tiện ích gúp ta xem các thông tin về không gian đĩa trên hệ thống, dung lượng đĩa, khoảng trống, đã sử dụng .v.v.

```
$ df -hT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  475M     0  475M   0% /dev
tmpfs                                   tmpfs     487M     0  487M   0% /dev/shm
tmpfs                                   tmpfs     487M  7.7M  479M   2% /run
tmpfs                                   tmpfs     487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        47G  2.3G   45G   5% /
/dev/sda1                               xfs      1014M  137M  878M  14% /boot
tmpfs                                   tmpfs      98M     0   98M   0% /run/user/1000
[toor@CentOS-7-1908 ~]$
```
### More info from `/proc`
Một số thông tin về hệ thống có thể tìm thấy tại thư mục `/proc`, đây là thư mục chứa các file ảo chứa các thông tin về hệ thống trong thời gian chạy (runtime), ta có thể đọc các file ở đây để có được các thông tin về hệ thống:

`/proc/cpuinfo` Thông tin về cpu

`/proc/interrupts` __

`/proc/meminfo` Thông tin về bộ nhớ

`/proc/mounts`

`/proc/partitions` Thông tin về các phân vùng trên hệ thống

`/proc/version` Thông tin về phiên bản hệ thống

`/proc/<process-id-#>` Thông tin về các tiến trình được đánh theo `PID`

`/proc/sys`