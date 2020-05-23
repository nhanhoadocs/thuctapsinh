# Một số câu lệnh hữu ích

## Hiển thị các tiến trình đang sử dụng nhiều RAM / CPU nhất trong hệ thống

Hướng dẫn sử dụng lệnh `ps`:

https://news.cloud365.vn/ps-command-tim-hieu-va-huong-dan-su-dung/

Các option trong lệnh `ps`:

https://blogd.net/linux/cac-vi-du-ve-lenh-ps-theo-doi-tien-trinh-tren-linux/

Useful tips khi dùng `ps`:

https://news.cloud365.vn/ps-command-nhung-tuy-chon-huu-ich-khi-su-dung-lenh-ps/

### Sử dụng lệnh `ps`:

1. Hiển thị các tiến trình đang sử dụng nhiều RAM nhất sắp xếp theo %mem sử dụng

        ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head

2. Hiển thị các tiến trình đang sử dụng nhiều RAM nhất sắp xếp theo dung lượng RAM đang sử dụng (mặc định đơn vị KB)

        ps -aux --sort=-rss | head

3. Để đổi sang đơn vị MB, sử dụng lệnh

        ps -aux --sort=-rss | head | awk 'NR>1 {$6=int($6/1024)"M";}{ print;}'

4. Hiển thị các tiến trình đang sử dụng nhiều RAM nhất sắp xếp theo %cpu sử dụng

        ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%cpu | head

5. Xem lệnh chạy realtime, đặt các lệnh trên trong lệnh watch

        watch -n 1 'ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head'

Ouput mẫu:

    [root@wp ~]# ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
    PID  PPID CMD                         %MEM %CPU
    11891     1 /usr/bin/telegraf -config /  1.9  0.3
    463     1 /usr/sbin/mysqld             4.8  0.1
        1     0 /usr/lib/systemd/systemd --  0.1  0.0
        2     0 [kthreadd]                   0.0  0.0
        4     2 [kworker/0:0H]               0.0  0.0
        5     2 [kworker/u4:0]               0.0  0.0
        6     2 [ksoftirqd/0]                0.0  0.0
        7     2 [migration/0]                0.0  0.0
        8     2 [rcu_bh]                     0.0  0.0

    root@tig:~# ps -aux --sort=-rss | head
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    influxdb 16374  0.6  7.2 1139196 147648 ?      Ssl  09:09   0:33 /usr/bin/influxd -config /etc/influxdb/influxdb.conf
    root       385  0.0  4.3 193456 88976 ?        S<s  May08   3:30 /lib/systemd/systemd-journald
    grafana    610  0.1  3.6 1047948 75184 ?       Ssl  May08   8:57 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/var/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana cfg:default.paths.data=/var/lib/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning
    telegraf 16472  0.5  2.7 1070632 55416 ?       Ssl  09:11   0:30 /usr/bin/telegraf -config /etc/telegraf/telegraf.conf -config-directory /etc/telegraf/telegraf.d
    root       536  0.0  0.9 187164 20064 ?        Ssl  May08   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
    root       528  0.0  0.8 170440 17332 ?        Ssl  May08   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    root         1  0.0  0.4  77852  8928 ?        Ss   May08   0:31 /sbin/init
    thuctap  14865  0.0  0.3  76620  7624 ?        Ss   08:07   0:00 /lib/systemd/systemd --user
    root     14863  0.0  0.3 105692  7108 ?        Ss   08:07   0:00 sshd: thuctap [priv]
    root@tig:~#

    root@tig:~# ps -aux --sort=-rss | head | awk 'NR>1 {$6=int($6/1024)"M";}{ print;}'
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    influxdb 16374 0.6 7.2 1139196 144M ? Ssl 09:09 0:36 /usr/bin/influxd -config /etc/influxdb/influxdb.conf
    root 385 0.0 4.3 193456 87M ? S<s May08 3:30 /lib/systemd/systemd-journald
    grafana 610 0.1 3.6 1047948 73M ? Ssl May08 8:58 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/var/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana cfg:default.paths.data=/var/lib/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning
    telegraf 16472 0.5 2.7 1070632 54M ? Ssl 09:11 0:33 /usr/bin/telegraf -config /etc/telegraf/telegraf.conf -config-directory /etc/telegraf/telegraf.d
    root 536 0.0 0.9 187164 19M ? Ssl May08 0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
    root 528 0.0 0.8 170440 16M ? Ssl May08 0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    root 1 0.0 0.4 77852 8M ? Ss May08 0:31 /sbin/init
    thuctap 14865 0.0 0.3 76620 7M ? Ss 08:07 0:00 /lib/systemd/systemd --user
    root 14863 0.0 0.3 105692 6M ? Ss 08:07 0:00 sshd: thuctap [priv]
    root@tig:~#

    [root@wp ~]# ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
    PID  PPID CMD                         %MEM %CPU
    463     1 /usr/sbin/mysqld             4.8  0.1
    11891     1 /usr/bin/telegraf -config /  1.9  0.3
    9479     1 /usr/bin/python2 -Es /usr/s  1.6  0.0
    10206     1 /usr/bin/python2 -Es /usr/s  0.8  0.0
    631     1 /usr/sbin/httpd -DFOREGROUN  0.6  0.0
    10188     1 /usr/lib/polkit-1/polkitd -  0.5  0.0
    737     1 /usr/sbin/NetworkManager --  0.4  0.0
    632   631 /usr/sbin/httpd -DFOREGROUN  0.3  0.0
    633   631 /usr/sbin/httpd -DFOREGROUN  0.3  0.0

Giải thích tham số trong câu lệnh:

`-o` hoặc `--format` trong `ps` cho phép ta chỉ định format output. Ở đây hiển thị PIDs (`pid`), PPIDs (`ppid`) của các tiến trình, tên file thực thi liên kết với tiến trình (`cmd`), và mức độ sử dụng của RAM, CPU (`%mem` và `%cpu`)

`--sort` để sắp xếp `%mem` hoặc `%cpu`: Mặc định được sắp xếp tăng dần nên ở đây thêm vào dấu trừ `-` để sắp xếp giảm dần.

`aux` Hiển thị toàn bộ thông tin (theo cú pháp BSD). Xem khác biệt giữa cú pháp tiêu chuẩn và cú pháp BSD (https://askubuntu.com/questions/484982/what-is-the-difference-between-standard-syntax-and-bsd-syntax)

**Test:**

Sử dụng lệnh stress để đẩy mức sử dụng RAM lên

    stress -m 1 --vm-bytes 1.5G

Kiểm tra:

    root@tig:~# ps aux --sort=-%mem | head
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root     24456  100 26.4 1056820 538924 pts/2  R+   11:58   0:13 stress -m 1 --vm-bytes 1.5G
    influxdb 16374  0.6  9.3 1349364 190580 ?      Ssl  09:09   1:04 /usr/bin/influxd -config /etc/influxdb/influxdb.conf
    root       385  0.0  4.6 201760 94320 ?        S<s  May08   3:33 /lib/systemd/systemd-journald
    grafana    610  0.1  2.6 1047948 54036 ?       Ssl  May08   9:03 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/var/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana cfg:default.paths.data=/var/lib/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning
    telegraf 16472  0.5  2.4 1070632 49908 ?       Ssl  09:11   0:58 /usr/bin/telegraf -config /etc/telegraf/telegraf.conf -config-directory /etc/telegraf/telegraf.d
    root       536  0.0  0.9 187164 18952 ?        Ssl  May08   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
    root       528  0.0  0.7 170440 16276 ?        Ssl  May08   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    root         1  0.0  0.4  77964  9024 ?        Ss   May08   0:36 /sbin/init
    thuctap  14865  0.0  0.3  76620  7548 ?        Ss   08:07   0:00 /lib/systemd/systemd --user
    root@tig:~# ps aux --sort=-%cpu | head
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root     24456 98.7 19.0 1056820 389480 pts/2  R+   11:58   0:27 stress -m 1 --vm-bytes 1.5G
    influxdb 16374  0.6  9.3 1349364 190580 ?      Ssl  09:09   1:04 /usr/bin/influxd -config /etc/influxdb/influxdb.conf
    root     18547  0.6  0.2  33612  4248 pts/3    S+   11:11   0:17 htop
    telegraf 16472  0.5  2.4 1070632 49908 ?       Ssl  09:11   0:58 /usr/bin/telegraf -config /etc/telegraf/telegraf.conf -config-directory /etc/telegraf/telegraf.d
    grafana    610  0.1  2.6 1047948 54036 ?       Ssl  May08   9:03 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/var/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana cfg:default.paths.data=/var/lib/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning
    root         1  0.0  0.4  77964  9024 ?        Ss   May08   0:36 /sbin/init
    root         2  0.0  0.0      0     0 ?        S    May08   0:00 [kthreadd]
    root         4  0.0  0.0      0     0 ?        I<   May08   0:00 [kworker/0:0H]
    root         6  0.0  0.0      0     0 ?        I<   May08   0:00 [mm_percpu_wq]
    root@tig:~#

Ta thấy tiến trình do lệnh stress đang sử dụng nhiều RAM và CPU nhất.

### Sử dụng `top`

Hiển thị 15 tiến trình đang dùng nhiều RAM nhất (Shift + M)

    top -b -o +%MEM | head -n 22

Hiển thị 15 tiến trình đang dùng nhiều CPU nhất (Shift + P)

    top -b -o +%CPU | head -n 22

Output mẫu:

    [root@wp ~]# top -b -o +%MEM | head -n 22
    top - 10:15:54 up 18:50,  3 users,  load average: 0.00, 0.01, 0.05
    Tasks: 123 total,   2 running, 121 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  3.1 us,  0.0 sy,  0.0 ni, 96.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    KiB Mem :  2046888 total,   154528 free,   305340 used,  1587020 buff/cache
    KiB Swap:  2097148 total,  2097140 free,        8 used.  1548340 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    463 mysql     20   0 1768228 100040  14712 S   0.0  4.9   1:26.21 mysqld
    11891 telegraf  20   0  382020  39636  17892 S   0.0  1.9   0:12.33 telegraf
    9479 root      20   0  362928  33712   7104 S   0.0  1.6   0:01.63 firewalld
    10206 root      20   0  574300  17428   6132 S   0.0  0.9   0:11.63 tuned
    631 root      20   0  329404  14164   7448 S   0.0  0.7   0:05.92 httpd
    10188 polkitd   20   0  613004  10936   4944 S   0.0  0.5   0:00.18 polkitd
    737 root      20   0  476356   8684   6664 S   0.0  0.4   0:02.16 NetworkManager
    632 apache    20   0  329404   7948   1224 S   0.0  0.4   0:00.00 httpd
    633 apache    20   0  329404   7948   1224 S   0.0  0.4   0:00.00 httpd
    634 apache    20   0  329404   7948   1224 S   0.0  0.4   0:00.00 httpd
    636 apache    20   0  329404   7948   1224 S   0.0  0.4   0:00.00 httpd
    637 apache    20   0  329404   7948   1224 S   0.0  0.4   0:00.00 httpd
    12105 root      20   0  155464   6464   5072 S   0.0  0.3   0:00.09 sshd
    11622 root      20   0  155464   6460   5072 S   0.0  0.3   0:00.10 sshd
    11910 root      20   0  155464   6460   5072 S   0.0  0.3   0:00.07 sshd
    [root@wp ~]#

    [root@wp ~]# top -b -o +%CPU | head -n 22
    top - 10:16:49 up 18:51,  3 users,  load average: 0.00, 0.01, 0.05
    Tasks: 123 total,   2 running, 121 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.0 us,  3.0 sy,  0.0 ni, 97.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    KiB Mem :  2046888 total,   154520 free,   305348 used,  1587020 buff/cache
    KiB Swap:  2097148 total,  2097140 free,        8 used.  1548332 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    12170 root      20   0  161996   2096   1528 R   6.2  0.1   0:00.02 top
        1 root      20   0  191052   3900   2436 S   0.0  0.2   0:07.81 systemd
        2 root      20   0       0      0      0 S   0.0  0.0   0:00.05 kthreadd
        4 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/0:0H
        5 root      20   0       0      0      0 S   0.0  0.0   0:00.87 kworker/u4:0
        6 root      20   0       0      0      0 S   0.0  0.0   0:01.73 ksoftirqd/0
        7 root      rt   0       0      0      0 S   0.0  0.0   0:00.09 migration/0
        8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh
        9 root      20   0       0      0      0 R   0.0  0.0   0:44.38 rcu_sched
    10 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 lru-add-drain
    11 root      rt   0       0      0      0 S   0.0  0.0   0:00.52 watchdog/0
    12 root      rt   0       0      0      0 S   0.0  0.0   0:00.40 watchdog/1
    13 root      rt   0       0      0      0 S   0.0  0.0   0:00.11 migration/1
    14 root      20   0       0      0      0 S   0.0  0.0   0:00.09 ksoftirqd/1
    16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/1:0H
    [root@wp ~]#

Giải thích tham số trong câu lệnh:

- `-b`: chạy lệnh top ở batch mode

- `-o`: chỉ định trường hoặc phân loại các tiến trình

- `head -n 22`: hiển thị 22 dòng đầu tiên của kết quả

Lưu kết quả vào 1 file:

    top -b -o +%MEM | head -n 22 > topreport.txt

https://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/

## Tìm các file lớn nhất trong hệ thống

https://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/

## Xác định tiến trình đang đọc/ghi ổ cứng nhiều nhất

    iotop

- TID: Process/Thread ID
-  DISK READ: Tốc độ đọc ổ cứng
- DISK WRITE: Tốc độ ghi ổ cứng
- COMMAND: Lệnh sử dụng