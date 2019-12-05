# Logical Volume Manager (LVM) Lab





# Introduction
Bài lab mô phỏng sử dụng LVM trong thực tế, mổ phỏng cách mở rộng và thu nhỏ các logical volume mà vẫn đảm bảo dữ liệu được an toàn.




# Mô hình lab


## Thông tin hệ thống
Bài lab thực hiện trên CentOS 7, hệ thống gồm có ba ổ đĩa:
- sda: Ổ đĩa cài đặt OS (50GB)
- sdb: Ổ đĩa lưu trữ dữ liệu mysql (db) (30GB)
- sdc: Ổ đĩa để mở rộng bd (20GB)
- sdd: Ổ đĩa để mở rộng bd (20GB)



## Thực hành
- Cài đặt mysql trên ổ sdb và cài đặt cở sở dữ liệu mẫu để kiểm tra sự toàn vẹn của dữ liệu khi tác động đến ổ đĩa
- Mở rộng ổ đĩa lưu trữ cơ sở dữ liệu
- Thu nhỏ ổ đĩa lưu trữ cơ sở dữ liệu


# Triển khai
Thông tin các ổ đĩa trước khi thực hiện:
```
[root@CentOS-7-1908 ~]# lsblk -a
NAME                            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                               8:0    0   50G  0 disk
├─sda1                            8:1    0    1G  0 part /boot
└─sda2                            8:2    0   49G  0 part
  ├─centos_centos--7--1908-root 253:0    0   47G  0 lvm  /
  └─centos_centos--7--1908-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                               8:16   0   30G  0 disk
sdc                               8:32   0   20G  0 disk
sdd                               8:48   0   20G  0 disk
sr0                              11:0    1  942M  0 rom


[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.3G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
[root@CentOS-7-1908 ~]#
```

## Tạo logical volume mới trên sdb



### Tạo logical volume
```
[root@CentOS-7-1908 ~]# pvcreate /dev/sdb
  Physical volume "/dev/sdb" successfully created.
[root@CentOS-7-1908 ~]# vgcreate VG-DB /dev/sdb
  Volume group "VG-DB" successfully created
[root@CentOS-7-1908 ~]# lvcreate -n LV-DB -l 100%FREE VG-DB
  Logical volume "LV-DB" created.



[root@CentOS-7-1908 ~]# pvdisplay /dev/sdb
  --- Physical volume ---
  PV Name               /dev/sdb
  VG Name               VG-DB
  PV Size               30.00 GiB / not usable 4.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              7679
  Free PE               0
  Allocated PE          7679
  PV UUID               ej346q-g1qD-fTvG-6RbS-Cdnh-86ui-LPq3tK

[root@CentOS-7-1908 ~]# vgdisplay /dev/VG-DB
  --- Volume group ---
  VG Name               VG-DB
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <30.00 GiB
  PE Size               4.00 MiB
  Total PE              7679
  Alloc PE / Size       7679 / <30.00 GiB
  Free  PE / Size       0 / 0
  VG UUID               yc6Qse-d9dA-biDZ-7SRg-0Nxo-HC9D-RkQ7YX

[root@CentOS-7-1908 ~]# lvdisplay VG-DB
  --- Logical volume ---
  LV Path                /dev/VG-DB/LV-DB
  LV Name                LV-DB
  VG Name                VG-DB
  LV UUID                umJ7dr-mSnd-2FGN-pJnI-VFLQ-xGSn-AF3zo3
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 10:30:54 -0500
  LV Status              available
  # open                 0
  LV Size                <30.00 GiB
  Current LE             7679
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

[root@CentOS-7-1908 ~]#
```


### Format và Mount logical volume (LV-DB)
```
[root@CentOS-7-1908 ~]# mkfs.ext4 /dev/VG-DB/LV-DB
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
1966080 inodes, 7863296 blocks
393164 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2155872256
240 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

[root@CentOS-7-1908 ~]# mkdir /DB
[root@CentOS-7-1908 ~]# mount /dev/VG-DB/LV-DB /DB/
[root@CentOS-7-1908 ~]# lsblk -a
NAME                            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                               8:0    0   50G  0 disk
├─sda1                            8:1    0    1G  0 part /boot
└─sda2                            8:2    0   49G  0 part
  ├─centos_centos--7--1908-root 253:0    0   47G  0 lvm  /
  └─centos_centos--7--1908-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                               8:16   0   30G  0 disk
└─VG--DB-LV--DB                 253:2    0   30G  0 lvm  /DB
sdc                               8:32   0   20G  0 disk
sdd                               8:48   0   20G  0 disk
sr0                              11:0    1  942M  0 rom
[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.3G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG--DB-LV--DB               ext4       32G   47M   30G   1% /DB
[root@CentOS-7-1908 ~]#
```



## Cài đặt mysql và dữ liệu mẫu
Cài đặt mysql:
```
[root@CentOS-7-1908 DB]# rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
Retrieving http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
Preparing...                          ################################# [100%]
Updating / installing...
   1:mysql-community-release-el7-5    ################################# [100%]
[root@CentOS-7-1908 DB]# yum install -y mysql-server
Loaded plugins: fastestmirror
Determining fastest mirrors
...
Replaced:
  mariadb-libs.x86_64 1:5.5.64-1.el7

Complete!
[root@CentOS-7-1908 DB]# vi /etc/my.cnf
[mysqld]
...
datadir=/DB/MySql/
...
[root@CentOS-7-1908 DB]#



[root@CentOS-7-1908 DB]# systemctl start mysql
[root@CentOS-7-1908 DB]# systemctl status mysql
● mysqld.service - MySQL Community Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-11-19 11:16:22 EST; 8s ago
  Process: 1649 ExecStartPost=/usr/bin/mysql-systemd-start post (code=exited, status=0/SUCCESS)
  Process: 1589 ExecStartPre=/usr/bin/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
...
[root@CentOS-7-1908 DB]# systemctl enable mysqld
[root@CentOS-7-1908 DB]# mysql -V
mysql  Ver 14.14 Distrib 5.6.46, for Linux (x86_64) using  EditLine wrapper
[root@CentOS-7-1908 DB]#
```

Cài đặt git và cơ sở dữ liệu mẫu với bộ kiểm tra tích hợp, được sử dụng để kiểm tra các ứng dụng và máy chủ cơ sở dữ liệu từ github:

```
[root@CentOS-7-1908 DB]# yum install git
...
[root@CentOS-7-1908 DB]# git clone https://github.com/datacharmer/test_db.git
Cloning into 'test_db'...
remote: Enumerating objects: 105, done.
remote: Total 105 (delta 0), reused 0 (delta 0), pack-reused 105
Receiving objects: 100% (105/105), 74.27 MiB | 919.00 KiB/s, done.
Resolving deltas: 100% (54/54), done.
[root@CentOS-7-1908 DB]# ls -la
total 4
drwxr-xr-x.  3 root root   21 Nov 19 11:20 .
dr-xr-xr-x. 18 root root  234 Nov 19 10:38 ..
drwxr-xr-x.  5 root root 4096 Nov 19 11:22 test_db
[root@CentOS-7-1908 DB]# cd test_db/
[root@CentOS-7-1908 test_db]# ls
Changelog                      employees.sql          load_dept_emp.dump      load_salaries1.dump  load_titles.dump  sakila            test_employees_md5.sql
employees_partitioned_5.1.sql  images                 load_dept_manager.dump  load_salaries2.dump  objects.sql       show_elapsed.sql  test_employees_sha.sql
employees_partitioned.sql      load_departments.dump  load_employees.dump     load_salaries3.dump  README.md         sql_test.sh
[root@CentOS-7-1908 test_db]#
```


Load cơ sở dữ liệu mẫu:

```
[root@CentOS-7-1908 test_db]# mysql < employees.sql
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING departments
INFO
LOADING employees
INFO
LOADING dept_emp
INFO
LOADING dept_manager
INFO
LOADING titles
INFO
LOADING salaries
data_load_time_diff
NULL
[root@CentOS-7-1908 test_db]#
```

Chạy bộ thử nghiện:

```
[root@CentOS-7-1908 test_db]# mysql -t < test_employees_md5.sql
+----------------------+
| INFO                 |
+----------------------+
| TESTING INSTALLATION |
+----------------------+
+--------------+------------------+----------------------------------+
| table_name   | expected_records | expected_crc                     |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+------------------+----------------------------------+
| table_name   | found_records    | found_crc                        |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+---------------+-----------+
| table_name   | records_match | crc_match |
+--------------+---------------+-----------+
| employees    | OK            | ok        |
| departments  | OK            | ok        |
| dept_manager | OK            | ok        |
| dept_emp     | OK            | ok        |
| titles       | OK            | ok        |
| salaries     | OK            | ok        |
+--------------+---------------+-----------+
+------------------+
| computation_time |
+------------------+
| 00:00:08         |
+------------------+
+---------+--------+
| summary | result |
+---------+--------+
| CRC     | OK     |
| count   | OK     |
+---------+--------+
[root@CentOS-7-1908 test_db]#
```

## Tạo thêm lvm từ sdc, sdd và Mở rộng volume db
```
[root@CentOS-7-1908 ~]# pvcreate /dev/sdc
  Physical volume "/dev/sdc" successfully created.
[root@CentOS-7-1908 ~]# pvcreate /dev/sdd
  Physical volume "/dev/sdd" successfully created.
[root@CentOS-7-1908 ~]# vgextend VG-DB /dev/sdc /dev/sdd
  Volume group "VG-DB" successfully extended


[root@CentOS-7-1908 ~]# lvextend -l +100%FREE /dev/VG-DB/LV-DB
  Size of logical volume VG-DB/LV-DB changed from <30.00 GiB (7679 extents) to <69.99 GiB (17917 extents).
  Logical volume VG-DB/LV-DB successfully resized.
[root@CentOS-7-1908 ~]#


[root@CentOS-7-1908 ~]# pvscan
  PV /dev/sdb    VG VG-DB                  lvm2 [<30.00 GiB / 0    free]
  PV /dev/sdc    VG VG-DB                  lvm2 [<20.00 GiB / 0    free]
  PV /dev/sdd    VG VG-DB                  lvm2 [<20.00 GiB / 0    free]
  PV /dev/sda2   VG centos_centos-7-1908   lvm2 [<49.00 GiB / 4.00 MiB free]
  Total: 4 [118.98 GiB] / in use: 4 [118.98 GiB] / in no VG: 0 [0   ]

[root@CentOS-7-1908 ~]# vgscan
  Reading volume groups from cache.
  Found volume group "VG-DB" using metadata type lvm2
  Found volume group "centos_centos-7-1908" using metadata type lvm2

[root@CentOS-7-1908 ~]# vgdisplay
  --- Volume group ---
  VG Name               VG-DB
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               <69.99 GiB
  PE Size               4.00 MiB
  Total PE              17917
  Alloc PE / Size       17917 / <69.99 GiB
  Free  PE / Size       0 / 0
  VG UUID               yc6Qse-d9dA-biDZ-7SRg-0Nxo-HC9D-RkQ7YX

  --- Volume group ---
  VG Name               centos_centos-7-1908
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <49.00 GiB
  PE Size               4.00 MiB
  Total PE              12543
  Alloc PE / Size       12542 / 48.99 GiB
  Free  PE / Size       1 / 4.00 MiB
  VG UUID               9iJrDX-2Xrb-csAA-5W0m-sI2r-YIu8-6aNMzg

[root@CentOS-7-1908 ~]# lvscan
  ACTIVE            '/dev/VG-DB/LV-DB' [<69.99 GiB] inherit
  ACTIVE            '/dev/centos_centos-7-1908/swap' [2.00 GiB] inherit
  ACTIVE            '/dev/centos_centos-7-1908/root' [46.99 GiB] inherit
[root@CentOS-7-1908 ~]#
```

Bây giờ kích thước của VG-DB đã tăng lên 69.99 GiB nhưng kích thước file system vẫn là 30G

```
[root@CentOS-7-1908 ~]# df -Th
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  475M     0  475M   0% /dev
tmpfs                                   tmpfs     487M     0  487M   0% /dev/shm
tmpfs                                   tmpfs     487M  7.7M  479M   2% /run
tmpfs                                   tmpfs     487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        47G  2.6G   45G   6% /
/dev/sda1                               xfs      1014M  137M  878M  14% /boot
tmpfs                                   tmpfs      98M     0   98M   0% /run/user/0
/dev/mapper/VG--DB-LV--DB               ext4       30G   45M   28G   1% /DB
[root@CentOS-7-1908 ~]#
```

Tiếp theo ta cần resize bằng `resize2fs`:

```
[root@CentOS-7-1908 ~]# resize2fs -p /dev/VG-DB/LV-DB
resize2fs 1.42.9 (28-Dec-2013)
Filesystem at /dev/VG-DB/LV-DB is mounted on /DB; on-line resizing required
old_desc_blocks = 4, new_desc_blocks = 9
The filesystem on /dev/VG-DB/LV-DB is now 18347008 blocks long.

[root@CentOS-7-1908 ~]# df -Th
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  475M     0  475M   0% /dev
tmpfs                                   tmpfs     487M     0  487M   0% /dev/shm
tmpfs                                   tmpfs     487M  7.7M  479M   2% /run
tmpfs                                   tmpfs     487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        47G  2.6G   45G   6% /
/dev/sda1                               xfs      1014M  137M  878M  14% /boot
tmpfs                                   tmpfs      98M     0   98M   0% /run/user/0
/dev/mapper/VG--DB-LV--DB               ext4       69G   52M   66G   1% /DB
[root@CentOS-7-1908 ~]#
```

Bây giờ DB đã được mở rộng thành 69G, tiếp theo ta cần check lại dữ liệu.
```
[root@CentOS-7-1908 test_db]# mysql -t < test_employees_md5.sql
+----------------------+
| INFO                 |
+----------------------+
| TESTING INSTALLATION |
+----------------------+
+--------------+------------------+----------------------------------+
| table_name   | expected_records | expected_crc                     |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+------------------+----------------------------------+
| table_name   | found_records    | found_crc                        |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+---------------+-----------+
| table_name   | records_match | crc_match |
+--------------+---------------+-----------+
| employees    | OK            | ok        |
| departments  | OK            | ok        |
| dept_manager | OK            | ok        |
| dept_emp     | OK            | ok        |
| titles       | OK            | ok        |
| salaries     | OK            | ok        |
+--------------+---------------+-----------+
+------------------+
| computation_time |
+------------------+
| 00:00:13         |
+------------------+
+---------+--------+
| summary | result |
+---------+--------+
| CRC     | OK     |
| count   | OK     |
+---------+--------+
[root@CentOS-7-1908 test_db]#
```

Dữ liệu vẫn không bị ảnh hưởng gì.


## Thu nhỏ volume db
Bây giờ ta muốn thu nhỏ DB lại chỉ sử dụng sdb và sdc.

Đầu tiên ta cần dừng mysql và backup lại dữ liệu:
```
[root@CentOS-7-1908 test_db]# systemctl stop mysql
[root@CentOS-7-1908 test_db]# systemctl status mysql
● mysqld.service - MySQL Community Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since Tue 2019-11-19 12:58:45 EST; 10s ago
  Process: 1168 ExecStartPost=/usr/bin/mysql-systemd-start post (code=exited, status=0/SUCCESS)
  Process: 1167 ExecStart=/usr/bin/mysqld_safe --basedir=/usr (code=exited, status=0/SUCCESS)
  Process: 1141 ExecStartPre=/usr/bin/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
 Main PID: 1167 (code=exited, status=0/SUCCESS)

Nov 19 12:45:12 CentOS-7-1908 systemd[1]: Starting MySQL Community Server...
Nov 19 12:45:14 CentOS-7-1908 mysqld_safe[1167]: 191119 12:45:14 mysqld_safe Logging to '/var/log/mysqld.log'.
Nov 19 12:45:14 CentOS-7-1908 mysqld_safe[1167]: 191119 12:45:14 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
Nov 19 12:45:18 CentOS-7-1908 systemd[1]: Started MySQL Community Server.
Nov 19 12:58:44 CentOS-7-1908 systemd[1]: Stopping MySQL Community Server...
Nov 19 12:58:45 CentOS-7-1908 systemd[1]: Stopped MySQL Community Server.
[root@CentOS-7-1908 test_db]#



[root@CentOS-7-1908 test_db]# tar cvf data_backup.tar *
Changelog
employees_partitioned_5.1.sql
employees_partitioned.sql
employees.sql
images/
images/employees.jpg
images/employees.gif
images/employees.png
load_departments.dump
load_dept_emp.dump
load_dept_manager.dump
load_employees.dump
load_salaries1.dump
load_salaries2.dump
load_salaries3.dump
load_titles.dump
objects.sql
README.md
sakila/
sakila/README.md
sakila/sakila-mv-data.sql
sakila/sakila-mv-schema.sql
show_elapsed.sql
sql_test.sh
test_employees_md5.sql
test_employees_sha.sql
[root@CentOS-7-1908 test_db]# ls -la
total 340088
drwxr-xr-x. 5 root root      4096 Nov 19 12:57 .
drwxr-xr-x. 4 root root      4096 Nov 19 12:52 ..
-rw-r--r--. 1 root root       964 Nov 19 12:52 Changelog
-rw-r--r--. 1 root root 175851520 Nov 19 12:57 data_backup.tar
-rw-r--r--. 1 root root      7948 Nov 19 12:52 employees_partitioned_5.1.sql
-rw-r--r--. 1 root root      6276 Nov 19 12:52 employees_partitioned.sql
-rw-r--r--. 1 root root      4193 Nov 19 12:52 employees.sql
drwxr-xr-x. 8 root root      4096 Nov 19 12:52 .git
drwxr-xr-x. 2 root root      4096 Nov 19 12:52 images
-rw-r--r--. 1 root root       250 Nov 19 12:52 load_departments.dump
-rw-r--r--. 1 root root  14159880 Nov 19 12:52 load_dept_emp.dump
-rw-r--r--. 1 root root      1090 Nov 19 12:52 load_dept_manager.dump
-rw-r--r--. 1 root root  17722832 Nov 19 12:52 load_employees.dump
-rw-r--r--. 1 root root  39806034 Nov 19 12:53 load_salaries1.dump
-rw-r--r--. 1 root root  39805981 Nov 19 12:53 load_salaries2.dump
-rw-r--r--. 1 root root  39080916 Nov 19 12:53 load_salaries3.dump
-rw-r--r--. 1 root root  21708736 Nov 19 12:53 load_titles.dump
-rw-r--r--. 1 root root      4568 Nov 19 12:53 objects.sql
-rw-r--r--. 1 root root      4325 Nov 19 12:52 README.md
drwxr-xr-x. 2 root root      4096 Nov 19 12:53 sakila
-rw-r--r--. 1 root root       272 Nov 19 12:53 show_elapsed.sql
-rwxr-xr-x. 1 root root      1800 Nov 19 12:53 sql_test.sh
-rw-r--r--. 1 root root      4878 Nov 19 12:53 test_employees_md5.sql
-rw-r--r--. 1 root root      4882 Nov 19 12:53 test_employees_sha.sql
[root@CentOS-7-1908 test_db]# gzip data_backup.tar
[root@CentOS-7-1908 test_db]# mv data_backup.tar.gz /data_backup_folder
```

Unmount `/DB`:

`[root@CentOS-7-1908 test_db]# umount /DB/`


Kiểm tra hệ thông tệp:
```
[root@CentOS-7-1908 ~]# e2fsck -f /dev/VG-DB/LV-DB
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG-DB/LV-DB: 77/4587520 files (7.8% non-contiguous), 395989/18347008 blocks
[root@CentOS-7-1908 ~]#
```

Bây giờ ta cần tính tổng kích thước cần thu nhỏ khi ta muốn loại bỏ sdd:

Vì ta loại bỏ sdd nên tổng kích thước còn lại sẽ bằng tổng kích thước của sdb + sdc = 7679 + 5119 = 12798 * 4 = 51192M


Thu nhỏ LV-DB:
```
[root@CentOS-7-1908 ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdb
  VG Name               VG-DB
  PV Size               30.00 GiB / not usable 4.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              7679
  Free PE               0
  Allocated PE          7679
  PV UUID               ej346q-g1qD-fTvG-6RbS-Cdnh-86ui-LPq3tK

  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               VG-DB
  PV Size               20.00 GiB / not usable 4.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              5119
  Free PE               0
  Allocated PE          5119
  PV UUID               Z80IBz-DqQo-9d6h-ozTh-22yz-vT7s-uSDk1j

  --- Physical volume ---
  PV Name               /dev/sdd
  VG Name               VG-DB
  PV Size               20.00 GiB / not usable 4.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              5119
  Free PE               0
  Allocated PE          5119
  PV UUID               Ba8gfC-ZZTe-9mSA-ZLDu-i4XP-WlPL-l2a9Bo

  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               centos_centos-7-1908
  PV Size               <49.00 GiB / not usable 3.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              12543
  Free PE               1
  Allocated PE          12542
  PV UUID               mPUvz2-i52b-pX16-taf1-kOjQ-tkV8-44cB1o

[root@CentOS-7-1908 ~]# fsadm -e -y resize /dev/VG-DB/LV-DB 51192M
resize2fs 1.42.9 (28-Dec-2013)
Resizing the filesystem on /dev/mapper/VG--DB-LV--DB to 13105152 (4k) blocks.
The filesystem on /dev/mapper/VG--DB-LV--DB is now 13105152 blocks long.

[root@CentOS-7-1908 ~]# lvreduce -L 51192M /dev/VG-DB/LV-DB
  WARNING: Reducing active logical volume to 49.99 GiB.
  THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce VG-DB/LV-DB? [y/n]: y
  Size of logical volume VG-DB/LV-DB changed from <69.99 GiB (17917 extents) to 49.99 GiB (12798 extents).
  Logical volume VG-DB/LV-DB successfully resized.

[root@CentOS-7-1908 ~]# vgreduce VG-DB /dev/sdd
  Removed "/dev/sdd" from volume group "VG-DB"

[root@CentOS-7-1908 ~]# pvremove /dev/sdd
  Labels on physical volume "/dev/sdd" successfully wiped.
```

Bây giờ ta cần check lại và gắt kết ổ đĩa:

```
[root@CentOS-7-1908 ~]# e2fsck -ff /dev/VG-DB/LV-DB
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG-DB/LV-DB: 77/3276800 files (7.8% non-contiguous), 313749/13105152 blocks
[root@CentOS-7-1908 ~]# mount /dev/VG-DB/LV-DB /DB/
[root@CentOS-7-1908 ~]# df -Th
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  475M     0  475M   0% /dev
tmpfs                                   tmpfs     487M     0  487M   0% /dev/shm
tmpfs                                   tmpfs     487M  7.7M  479M   2% /run
tmpfs                                   tmpfs     487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        47G  2.6G   45G   6% /
/dev/sda1                               xfs      1014M  137M  878M  14% /boot
tmpfs                                   tmpfs      98M     0   98M   0% /run/user/0
/dev/mapper/VG--DB-LV--DB               ext4       50G  295M   47G   1% /DB
[root@CentOS-7-1908 ~]#
```

Bây giờ ta cần start lại mysql và kiểm tra tính toàn vẹn:

```
[root@CentOS-7-1908 ~]# cd /DB/
[root@CentOS-7-1908 DB]# ls -la
total 24
drwxr-xr-x.  4 root root  4096 Nov 19 13:08 .
dr-xr-xr-x. 18 root root   260 Nov 19 12:57 ..
drwx------.  2 root root 16384 Nov 19 10:38 lost+found
drwxr-xr-x.  5 root root  4096 Nov 19 12:57 test_db
[root@CentOS-7-1908 DB]# cd test_db/
[root@CentOS-7-1908 test_db]# systemctl start mysql
[root@CentOS-7-1908 test_db]# systemctl status mysql
● mysqld.service - MySQL Community Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-11-19 13:17:04 EST; 9s ago
  Process: 1874 ExecStartPost=/usr/bin/mysql-systemd-start post (code=exited, status=0/SUCCESS)
  Process: 1861 ExecStartPre=/usr/bin/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
 Main PID: 1873 (mysqld_safe)
   CGroup: /system.slice/mysqld.service
           ├─1873 /bin/sh /usr/bin/mysqld_safe --basedir=/usr
           └─2039 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --log-error=/var/log/mysqld.log --pid-file=/var/ru...

Nov 19 13:17:02 CentOS-7-1908 systemd[1]: Starting MySQL Community Server...
Nov 19 13:17:03 CentOS-7-1908 mysqld_safe[1873]: 191119 13:17:03 mysqld_safe Logging to '/var/log/mysqld.log'.
Nov 19 13:17:03 CentOS-7-1908 mysqld_safe[1873]: 191119 13:17:03 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
Nov 19 13:17:04 CentOS-7-1908 systemd[1]: Started MySQL Community Server.
[root@CentOS-7-1908 test_db]# mysql -t < test_employees_md5.sql
+----------------------+
| INFO                 |
+----------------------+
| TESTING INSTALLATION |
+----------------------+
+--------------+------------------+----------------------------------+
| table_name   | expected_records | expected_crc                     |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+------------------+----------------------------------+
| table_name   | found_records    | found_crc                        |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+---------------+-----------+
| table_name   | records_match | crc_match |
+--------------+---------------+-----------+
| employees    | OK            | ok        |
| departments  | OK            | ok        |
| dept_manager | OK            | ok        |
| dept_emp     | OK            | ok        |
| titles       | OK            | ok        |
| salaries     | OK            | ok        |
+--------------+---------------+-----------+
+------------------+
| computation_time |
+------------------+
| 00:00:09         |
+------------------+
+---------+--------+
| summary | result |
+---------+--------+
| CRC     | OK     |
| count   | OK     |
+---------+--------+
[root@CentOS-7-1908 test_db]#
```