# System Info

- Thông tin hệ điều hành: `# cat /etc/*release`
```
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

- Kernel version: `# uname -r`
```
# uname -r
3.10.0-1062.el7.x86_64
```

- Thông tin bộ nhớ: `# head /proc/meminfo`
```
# head /proc/meminfo
MemTotal:         995748 kB
MemFree:          575328 kB
MemAvailable:     686728 kB
Buffers:           16188 kB
Cached:           215784 kB
SwapCached:            0 kB
Active:           190804 kB
Inactive:         108612 kB
Active(anon):      67984 kB
Inactive(anon):     7264 kB
```

- File hệ thống: `# df -h`
```
# df -h
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 475M     0  475M   0% /dev
tmpfs                    487M     0  487M   0% /dev/shm
tmpfs                    487M  7.7M  479M   2% /run
tmpfs                    487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos-root   17G  1.3G   15G   8% /
/dev/sda1                497M  130M  367M  27% /boot
tmpfs                     98M     0   98M   0% /run/user/0
```

- Đếm số lượng CPU: `cat /proc/cpuinfo | grep model`
```
# cat /proc/cpuinfo | grep model
model           : 69
model name      : Intel(R) Core(TM) i5-4210U CPU @ 1.70GHz
```

- Tên máy chủ: `cat /etc/hostname`
Đổi tên máy chủ: `# hostname NEW_NAME`

- Hệ thống tập tin **proc**:
Các /prochệ thống tập tin chứa các tập tin ảo mà chỉ tồn tại trong bộ nhớ. Hệ thống tập tin này chứa các tập tin và thư mục mà các cấu trúc hạt nhân bắt chước và cấu hình chi tiết. Nó không chứa các tệp thực nhưng có thông tin hệ thống thời gian chạy (ví dụ: bộ nhớ hệ thống, thiết bị được gắn, cấu hình phần cứng, v.v.). Một số tập tin quan trọng trong việc /procbao gồm:
```
/proc/cpuinfo
/proc/interrupts
/proc/meminfo
/proc/mounts
/proc/partitions
/proc/version
/proc/<process-id-#>
/proc/sys
```

Hệ thống `/proc` tập tin rất hữu ích vì thông tin mà nó báo cáo chỉ được thu thập khi cần thiết và không bao giờ cần lưu trữ trên đĩa.
