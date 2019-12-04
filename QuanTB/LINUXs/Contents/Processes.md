# Processes



### Linux processes
Một tiến trình (processes) chỉ đơn giản là một thể hiện của một hoặc nhiều tác vụ (task) liên quan đến thực thi trên cùng một máy.

Các processes có thể có nhiều loại khác nhau tùy theo nhiệm vụ đang được thực hiện:

|Type|Description|
|----|-----------|
|Interactive|Tiến trình tương tác cần được tạo ra bởi một người dùng từ một dòng lệnh hoặc một giao diện|
|Batch|Các tiến trình được lên lịch và tự động chạy sau đó ngắn kết nối với termial, Các tiến trình này được xếp hàng và hoạt động theo cơ chế FIFO (First In, First Out)|
|Daemons|Tiến trình máy chủ chạy liên tục, thường được chạy khi hệ thống khỏi động và chạy cho đến khi tắt hoặc người dùng hủy bỏ|
|Threads|Các tiến trình nhẹ. Đây là các tác vụ chạy dưới quy trình chính, chia sẻ bộ nhớ và các tài nguyên khác, nhưng được hệ thống lên lịch và chạy trên cơ sở cá nhân.|
|Kernel Threads|Các tiến trình kernel mà người dùng không bắt đầu cũng không chấm dứt và có ít quyền kiểm soát. Chúng có thể thực hiện các hành động như di chuyển một luồng từ CPU này sang CPU khác hoặc đảm bảo các hoạt động đầu vào/đầu ra vào đĩa được hoàn thành.|

Để quản lý các tiến trình linux gán cho mỗi tiến trình một ID duy nhất gọi là PID, PID được đánh số tăng dần, PID 1 là tiến trình đầu tiên trong hệ thống (init)

Linux cho phép ta đặt mức độ ưu tiên cho các tiến trình, giá trị ưu tiên càng thấp thì tiến trình càng được ưu tiên, các tiến trình có giá trị ưu tiên càng cao thì càng phải chờ đợi lâu.

### Running processes
Lệnh `ps` cung cấp thông tin về các tiên trình đang chạy trên hệ thống, nếu bạn muốn cập nhật liên tục thông tin về các processes có thể sử dụng lệnh 'top', `htop` hoặc `atop`

Để xem các tiên trình của một user nà đó bạn có thể sử dụng lệnh:

`ps -u Test`

```
[toor@CentOS-7-1908 ~]$ ps -u toor
   PID TTY          TIME CMD
  1348 ?        00:00:00 sshd
  1349 pts/0    00:00:00 bash
  1734 ?        00:00:00 sshd
  1735 pts/1    00:00:00 bash
  1756 ?        00:00:00 sshd
  1757 ?        00:00:00 sftp-server
  1964 pts/1    00:00:00 ps

```
Để hiển thị chi tiết hơn về các tiến trình ta sử dụng `ps -ef`

lệnh `pstree` cho ta thông tin về các tiến trình dưới dạng cây, thể hiện mối quan hệ giữa các tiến trình như tiến trình cha, con.

```
$ yum install psmisc
$ pstree
systemd─┬─NetworkManager─┬─dhclient
        │                └─2*[{NetworkManager}]
        ├─agetty
        ├─auditd───{auditd}
        ├─chronyd
        ├─crond
        ├─dbus-daemon───{dbus-daemon}
        ├─firewalld───{firewalld}
        ├─lvmetad
        ├─master─┬─pickup
        │        └─qmgr
        ├─polkitd───6*[{polkitd}]
        ├─rsyslogd───2*[{rsyslogd}]
        ├─sshd─┬─sshd───sshd───bash
        │      ├─sshd───sshd───bash───pstree
        │      └─sshd───sshd───sftp-server
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-udevd
        └─tuned───4*[{tuned}]
```

Để chấm dứt một tiến trình bạn có thể sử dụng `kill -SIGKILL <pid>` hoặc `kill -9 <pid>`. Tuy nhiên, lưu ý, bạn chỉ có thể giết các quy trình của riêng mình: những quy trình thuộc về người dùng khác sẽ vượt quá giới hạn trừ khi bạn đã root.


Lệnh `top` cho phép ta xem thông tin về các tiến trình và được cập nhật thường xuyên:

```
top - 22:57:02 up  2:39,  2 users,  load average: 0.00, 0.01, 0.05
Tasks: 103 total,   2 running, 101 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.3 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :   995748 total,   584828 free,   171988 used,   238932 buff/cache
KiB Swap:  2097148 total,  2097148 free,        0 used.   675628 avail Mem

   PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
  1734 toor      20   0  159240   2612   1164 S  0.3  0.3   0:00.32 sshd
  2074 root      20   0       0      0      0 S  0.3  0.0   0:00.02 kworker/0:2
     1 root      20   0  127960   6552   4116 S  0.0  0.7   0:02.42 systemd
     2 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kthreadd
     4 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kworker/0:0H
     5 root      20   0       0      0      0 S  0.0  0.0   0:00.03 kworker/u256:0
     6 root      20   0       0      0      0 S  0.0  0.0   0:00.13 ksoftirqd/0
     7 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 migration/0
     8 root      20   0       0      0      0 S  0.0  0.0   0:00.00 rcu_bh
     9 root      20   0       0      0      0 R  0.0  0.0   0:01.02 rcu_sched
    10 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 lru-add-drain
    11 root      rt   0       0      0      0 S  0.0  0.0   0:00.10 watchdog/0
    13 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kdevtmpfs
    14 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 netns
    15 root      20   0       0      0      0 S  0.0  0.0   0:00.00 khungtaskd
    16 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 writeback
    17 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kintegrityd
    18 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    19 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    20 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    21 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kblockd
    22 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 md
    23 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 edac-poller
    24 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 watchdogd
    30 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kswapd0
    31 root      25   5       0      0      0 S  0.0  0.0   0:00.00 ksmd
    32 root      39  19       0      0      0 S  0.0  0.0   0:01.00 khugepaged
    33 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 crypto
    41 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kthrotld
    43 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kmpath_rdacd
    44 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kaluad
    45 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kpsmoused
```

Dòng đâu tiên trong đầu ra lệnh cho ta biết các thông tin tổng quan về hệ thống như:
- Thời gian hệ thống hoạt động (up)
- Số người dùng đang đăng nhập (users)
- Trung bình tải (load average)

Trung bình tải xác định mức độ bận rộn của hệ thống. Trung bình tải 1,00 trên mỗi CPU cho biết hệ thống được đăng ký đầy đủ, nhưng không bị quá tải. Nếu trung bình tải vượt quá giá trị này, nó chỉ ra rằng các quy trình đang cạnh tranh về thời gian của CPU. Nếu trung bình tải rất cao, nó có thể chỉ ra rằng hệ thống đang gặp sự cố.

Dòng thứ hai của `top` đầu ra hiển thị tổng số tiến trình, số lượng tiến trình running, sleep, stop và zombie

Dòng thưc ba thể hiện % CPU sử dụng được phân chia

Dòng thưc 4 và 5 thể hiện thông tin về bộ nhớ, bộ nhớ RAM vật lý ở dòng 4 và swap memory (RAM ảo) ở dòng 5, cả hai dòng đều hiển thị đầy đủ thông tin về bộ nhớ như tổng số, sử dụng, còn trống.

Tiếp theo mỗi dòng thể hiện thông tin về một tiến trình, theo mặc định các tiến trình được sắp xếp theo mức độ sử dụng CPU từ cao đến thấp, các thông tin sau đây về mỗi tiến trình được thể hiện:

- Process Identification Number (PID)
- Process owner - Sở hữu (USER)
- Priority - Dộ ưu tiên (PR) and nice values - Giá trị tốt đẹp(NI)
- Virtual (VIRT), physical (RES), and shared memory (SHR)
- Status (S)
- Percentage of CPU (%CPU) and memory (%MEM) used - % sử dụng CPU và Memory
- Execution time (TIME+) - Thời gian thực hiện
- Command (COMMAND)

### Scheduling processes (Tiến trình lập lịch)
Lập lịch tiến trình là làm cho một trương trình chạy theo một lịch trình cụ thể, một số tiện ích cho phép lập lịch như `at` hay `crontab`.

### Tiến trình trì hoãn
Khi các tiến trình cần dừng lại để chờ đợi một sự kiện nào đó để có thể tiếp tục, ví dụ như một tiến trình phụ thuộc vào một tiến trình thứ 3 mà tiến trình đó đang bận không thể xử lý được yêu cầu, khi đó tiên trình này sẽ dơi vào trạng thái ngủ (sleep) để chờ đợi tiến trình kia. Lệnh `sleep` cho phép ta đỉnh chỉ trong một khoảng thời gian và sau đó nó sẽ tiếp tục, ta có thể sử dụng nó trong các chương trình shell.