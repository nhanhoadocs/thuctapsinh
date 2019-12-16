# Logical Volume Manager (LVM)




## Introduction
LVM (Logical Volume Manager) là một phương pháp cho phép ấn định nhiều không gian đĩa thành các Logical Volume khiến cho việc thay đổi kích thay đổi kích thước trờ nên dễ dàng hơn (So với partition). Với kỹ thuật LVM bạn có thể thay đổi kích thước mà không cần phải sửa lại partition table của OS.



## Một số thuật ngữ trong LVM
 - Physical volumes (PV): Là đĩa cứng vật lý. Khi dùng LVM có thể kết hợp nhiều PV để tạo thành một Volume Groups với dung lượng bằng tổng dung lượng các PV. Tuy nhiên PV chỉ là đại diện cho các ổ đĩa vật ký chứ không phải là bản thân ổ đĩa đó, vì vậy để cần phải tạo PV từ các dev đã mount.
 - Volume Groups (VG): là một tập hợp các PV, từ VG sẽ có thể phân chia thành các Logical Volumes và các Logical Volumes này có thể thay đổi kích thước dễ dàng.
 - Logical Volumes (LV): Là đơn vị cuối cùng của hệ thống LVM, các LV tương đương với partition theo cách phân chia truyền thống. LV có thể thay đổi kích thước dễ dàng, tất cả chỉ phụ thuộc vào kích thước của VG.



## Thao tác trên LVM
Thông tin hệ thống:
- Có 3 ổ cứng: sda, sdb và sdc
- dsa là ổ cài đặt hệ điều hành
- sdb và sdc là ổ để lưu trữ data
- sdb có dung lượng 10G
- sdc có dung lượng 20G

```
[root@CentOS-7-1908 ~]# ls -la /dev/sd*
brw-rw----. 1 root disk 8,  0 Nov 19 02:13 /dev/sda
brw-rw----. 1 root disk 8,  1 Nov 19 02:13 /dev/sda1
brw-rw----. 1 root disk 8,  2 Nov 19 02:13 /dev/sda2
brw-rw----. 1 root disk 8, 16 Nov 19 00:31 /dev/sdb
brw-rw----. 1 root disk 8, 32 Nov 19 00:31 /dev/sdc
[root@CentOS-7-1908 ~]#
```
Thực hành:
- Sử dụng LVM để phân chia sdb và sdc thành 2 logical volumn 15G có tên là `Datas` và `Backups`.
- Mount logical volumes
- Giảm kích thước logical volume `Backups`
- Tăng kích thước logical volume `Data`


### Tạo Physical volumes (PV)
Đầu tiên ta cần tạo physical volume từ hai ổ sdb và sdc:

```
[root@CentOS-7-1908 ~]# pvcreate /dev/sdb /dev/sdc
  Physical volume "/dev/sdb" successfully created.
  Physical volume "/dev/sdc" successfully created.
[root@CentOS-7-1908 ~]#
```


### Hiển thị thông tin về Physical volumes
Ta cần xem thông tin về cac physical volumes vừa được tạo:

```
[root@CentOS-7-1908 ~]# pvdisplay
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

  "/dev/sdb" is a new physical volume of "10.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb
  VG Name
  PV Size               10.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               KzcUY4-o7ff-WT4N-288X-xen4-1xB2-cytuyH

  "/dev/sdc" is a new physical volume of "20.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdc
  VG Name
  PV Size               20.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               QDFELi-AqCV-XGWy-Zv4q-aK4f-7j4A-1d7U63

[root@CentOS-7-1908 ~]#
```

### Tạo Volume Groups (VG)
Tiếp theo ta tạo Volume Group có lên là GV0 từ hai physical volume vừa tạo ở trên:

```
[root@CentOS-7-1908 ~]# vgcreate VG0 /dev/sdb /dev/sdc
  Volume group "VG0" successfully created
[root@CentOS-7-1908 ~]#
```


### Hiển thị thông tin về Volume Groups
Ta cần xem lại các thông tin về Volume Groups vừa tạo:

```
[root@CentOS-7-1908 ~]# vgdisplay
  --- Volume group ---
  VG Name               VG0
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               29.99 GiB
  PE Size               4.00 MiB
  Total PE              7678
  Alloc PE / Size       0 / 0
  Free  PE / Size       7678 / 29.99 GiB
  VG UUID               lYRtZR-uRy5-suz2-PHhK-2B22-qtPh-xCMMzk

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

[root@CentOS-7-1908 ~]#
```

### Tạo Logical Volumes (LV)
Tiếp theo ta tạo ra hai Logical Volume là `Datas` và `Backups` như đã trình bày ở trên:

```
[root@CentOS-7-1908 ~]# lvcreate -n Datas -L 15G VG0
  Logical volume "Datas" created.
[root@CentOS-7-1908 ~]# lvcreate -n Backups -l 100%FREE VG0
  Logical volume "Backups" created.
```

Trong đó:
- `-n` Tên logical volume cần tạo
- `-L` Sử dụng kích thước cố định
- `-l` Sử dụng chỉ thị phần trăm của không giam còn lại trong volumn

### Hiển thị thông tin về Logical Volumes
Tiếp theo ta cần kiểm tra xem các Logical Volume đã được tạo thành công chưa, ta show các thông tin về logical volume:

```
[root@CentOS-7-1908 ~]# lvdisplay
  --- Logical volume ---
  LV Path                /dev/VG0/Datas
  LV Name                Datas
  VG Name                VG0
  LV UUID                9SM462-dh1T-dosO-H3Fi-hc0h-PZFm-A5BU4n
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:32:58 -0500
  LV Status              available
  # open                 0
  LV Size                15.00 GiB
  Current LE             3840
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                qSUbqi-fKEz-Ma3J-bAEC-7dWh-FeMs-gND7v6
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:33:32 -0500
  LV Status              available
  # open                 0
  LV Size                14.99 GiB
  Current LE             3838
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

  --- Logical volume ---
  LV Path                /dev/centos_centos-7-1908/swap
  LV Name                swap
  VG Name                centos_centos-7-1908
  LV UUID                2jPBMY-8naH-hdF0-XkBx-ykDe-IW1W-qvCb6c
  LV Write Access        read/write
  LV Creation host, time centos-7-1908, 2019-11-14 10:19:21 -0500
  LV Status              available
  # open                 2
  LV Size                2.00 GiB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:1

  --- Logical volume ---
  LV Path                /dev/centos_centos-7-1908/root
  LV Name                root
  VG Name                centos_centos-7-1908
  LV UUID                PdCps5-ZPnp-jxyj-KUk6-aJ2Y-aLQ1-infeYv
  LV Write Access        read/write
  LV Creation host, time centos-7-1908, 2019-11-14 10:19:21 -0500
  LV Status              available
  # open                 1
  LV Size                46.99 GiB
  Current LE             12030
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:0

[root@CentOS-7-1908 ~]#
```

### Định dạng logical volume
Ta định dạng logical volume ở dạng ext4:

```
[root@CentOS-7-1908 ~]# mkfs.ext4 /dev/VG0/Datas
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
983040 inodes, 3932160 blocks
196608 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2151677952
120 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

[root@CentOS-7-1908 ~]# mkfs.ext4 /dev/VG0/Backups
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
983040 inodes, 3930112 blocks
196505 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2151677952
120 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

[root@CentOS-7-1908 ~]#
```

### Mount logical volume
Ta cần mount logical volume để kiểm tra việc tạo thành công:

```
[root@CentOS-7-1908 ~]# mkdir /Datas
[root@CentOS-7-1908 ~]# mount /dev/VG0/Datas /Datas/
[root@CentOS-7-1908 ~]# mkdir /Backups
[root@CentOS-7-1908 ~]# mount /dev/VG0/Backups /Backups/
[root@CentOS-7-1908 ~]#
[root@CentOS-7-1908 ~]#
[root@CentOS-7-1908 ~]# ls -la /
total 28
dr-xr-xr-x.  19 root root  252 Nov 19 03:06 .
dr-xr-xr-x.  19 root root  252 Nov 19 03:06 ..
drwxr-xr-x.   3 root root 4096 Nov 19 02:57 Backups
lrwxrwxrwx.   1 root root    7 Nov 14 10:19 bin -> usr/bin
dr-xr-xr-x.   5 root root 4096 Nov 14 10:24 boot
drwxr-xr-x.   3 root root 4096 Nov 19 02:57 Datas
drwxr-xr-x.  21 root root 3340 Nov 19 02:33 dev
drwxr-xr-x.  74 root root 8192 Nov 19 00:31 etc
drwxr-xr-x.   4 root root   30 Nov 18 20:35 home
lrwxrwxrwx.   1 root root    7 Nov 14 10:19 lib -> usr/lib
lrwxrwxrwx.   1 root root    9 Nov 14 10:19 lib64 -> usr/lib64
drwxr-xr-x.   2 root root    6 Apr 11  2018 media
drwxr-xr-x.   2 root root    6 Apr 11  2018 mnt
drwxr-xr-x.   2 root root    6 Apr 11  2018 opt
dr-xr-xr-x. 121 root root    0 Nov 19 00:30 proc
dr-xr-x---.   2 root root  135 Nov 18 20:19 root
drwxr-xr-x.  24 root root  720 Nov 19 00:31 run
lrwxrwxrwx.   1 root root    8 Nov 14 10:19 sbin -> usr/sbin
drwxr-xr-x.   2 root root    6 Apr 11  2018 srv
dr-xr-xr-x.  13 root root    0 Nov 19 00:31 sys
drwxrwxrwt.  15 root root 4096 Nov 19 02:20 tmp
drwxr-xr-x.  13 root root  155 Nov 14 10:19 usr
drwxr-xr-x.  19 root root  267 Nov 14 10:48 var
[root@CentOS-7-1908 ~]#
```

### Giảm kích thước logical volume
Khi chúng ta muốn giảm dung lượng các Logical Volume. Chúng ta cần phải chú ý vì nó rất quan trọng và có thể bị lỗi trong khi chúng ta giảm dung lượng Logical Volume. Để đảm bảo an toàn khi giảm Logical Volume cần thực hiện các bước sau:

Trước khi bắt đầu, cần sao lưu dữ liệu vì vậy sẽ không phải đau đầu nếu có sự cố xảy ra.
Để giảm dung lượng Logical Volume, cần thực hiện đầy đủ và cẩn thận 5 bước cần thiết.
Khi giảm dung lượng Logical Volume chúng ta phải ngắt kết nối hệ thống tệp trước khi giảm.
Cần thực hiện cẩn thận 5 bước dưới đây:

- Ngắt kết nối file system.
- Kiểm tra file system sau khi ngắt kết nối.
- Giảm file system.
- Giảm kích thước Logical Volume hơn kích thước hiện tại.
- Kiểm tra lỗi cho file system.
-  nMount lại file system và kiểm tra kích thước củaó.

Tiếp theo ta sẽ giảm Logical Volume có tên `Backups` với kích thước từ 14.99 GiB giảm xuống còn 10GB mà không làm mất dữ liệu. Chúng ta thực hiện các bước như sau:

Kiểm tra dung lượng của Logical Volume và kiểm tra file system trước khi thực hiện giảm:

```
[root@CentOS-7-1908 ~]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Datas
  LV Name                Datas
  VG Name                VG0
  LV UUID                9SM462-dh1T-dosO-H3Fi-hc0h-PZFm-A5BU4n
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:32:58 -0500
  LV Status              available
  # open                 1
  LV Size                15.00 GiB
  Current LE             3840
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                qSUbqi-fKEz-Ma3J-bAEC-7dWh-FeMs-gND7v6
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:33:32 -0500
  LV Status              available
  # open                 1
  LV Size                14.99 GiB
  Current LE             3838
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

[root@CentOS-7-1908 ~]# df -TH
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.1M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Datas                   ext4       16G   42M   15G   1% /Datas
/dev/mapper/VG0-Backups                 ext4       16G   42M   15G   1% /Backups
[root@CentOS-7-1908 ~]#

```

#### Unmount logical volume `Backups` và Kiểm tra trạng thái mount
```
[root@CentOS-7-1908 ~]# umount /Backups/
[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.1M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Datas                   ext4       16G   42M   15G   1% /Datas
```


#### Kiểm tra lỗi
Ta cần kiểm tra lỗi bằng lệnh `e2fsck`:

```
[root@CentOS-7-1908 ~]# e2fsck -f /dev/VG0/Backups
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG0/Backups: 11/983040 files (0.0% non-contiguous), 104724/3930112 blocks
[root@CentOS-7-1908 ~]#
```
#### Giảm kích thước logical volume `Backups`
Tiếp theo ta cần giảm kích thước của `Backups` xuống còn 10GB sử dụng lệnh `lvreduce`:

```
[root@CentOS-7-1908 ~]# resize2fs /dev/VG0/Backups 10G
resize2fs 1.42.9 (28-Dec-2013)
The containing partition (or device) is only 1308672 (4k) blocks.
You requested a new size of 2621440 blocks.
```

```
[root@CentOS-7-1908 ~]# lvreduce -L 10G /dev/VG0/Backups
  WARNING: Reducing active logical volume to 10.00 GiB.
  THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce VG0/Backups? [y/n]: y
  Size of logical volume VG0/Backups changed from 14.99 GiB (3838 extents) to 10.00 GiB (2560 extents).
  Logical volume VG0/Backups successfully resized.
[root@CentOS-7-1908 ~]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Datas
  LV Name                Datas
  VG Name                VG0
  LV UUID                9SM462-dh1T-dosO-H3Fi-hc0h-PZFm-A5BU4n
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:32:58 -0500
  LV Status              available
  # open                 1
  LV Size                15.00 GiB
  Current LE             3840
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                qSUbqi-fKEz-Ma3J-bAEC-7dWh-FeMs-gND7v6
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:33:32 -0500
  LV Status              available
  # open                 0
  LV Size                10.00 GiB
  Current LE             2560
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

[root@CentOS-7-1908 ~]#

```

Để đảm bả an toàn ta kiểm tra lại

```
[root@CentOS-7-1908 ~]# e2fsck -f /dev/VG0/Backups
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG0/Backups: 11/655360 files (0.0% non-contiguous), 83137/2621440 blocks
```

#### Mount lại file system và kiểm tra kích thước của nó.

```
[root@CentOS-7-1908 /]# mount /dev/VG0/Backups /Backups/
[root@CentOS-7-1908 /]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.1M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Datas                   ext4       16G   42M   15G   1% /Datas
/dev/mapper/VG0-Backups                 ext4       11G   38M  9.9G   1% /Backups
[root@CentOS-7-1908 /]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Datas
  LV Name                Datas
  VG Name                VG0
  LV UUID                9SM462-dh1T-dosO-H3Fi-hc0h-PZFm-A5BU4n
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:32:58 -0500
  LV Status              available
  # open                 1
  LV Size                15.00 GiB
  Current LE             3840
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                YbSxVP-szek-rjnl-bsaE-6pIs-NIAW-dRpCzJ
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 03:49:39 -0500
  LV Status              available
  # open                 1
  LV Size                10.00 GiB
  Current LE             2560
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

[root@CentOS-7-1908 /]#
```




### Tăng kích thước logical volume

#### Kiểm tra kích thước và unmount `Datas`

```
[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.1M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Datas                   ext4       16G   42M   15G   1% /Datas
/dev/mapper/VG0-Backups                 ext4       11G   38M  9.9G   1% /Backups
[root@CentOS-7-1908 ~]# umount /Datas/
[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.1M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Backups                 ext4       11G   38M  9.9G   1% /Backups
[root@CentOS-7-1908 ~]#
```

#### Mở rộng kích thước `Datas`
Để mở rộng kích thước một logical volume ta sử dụng `lvextend`:

```
[root@CentOS-7-1908 ~]# lvextend -l +100%FREE /dev/VG0/Datas
  Size of logical volume VG0/Datas changed from 15.00 GiB (3840 extents) to 19.99 GiB (5118 extents).
  Logical volume VG0/Datas successfully resized.
[root@CentOS-7-1908 ~]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Datas
  LV Name                Datas
  VG Name                VG0
  LV UUID                9SM462-dh1T-dosO-H3Fi-hc0h-PZFm-A5BU4n
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 02:32:58 -0500
  LV Status              available
  # open                 0
  LV Size                19.99 GiB
  Current LE             5118
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                YbSxVP-szek-rjnl-bsaE-6pIs-NIAW-dRpCzJ
  LV Write Access        read/write
  LV Creation host, time CentOS-7-1908, 2019-11-19 03:49:39 -0500
  LV Status              available
  # open                 1
  LV Size                10.00 GiB
  Current LE             2560
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

[root@CentOS-7-1908 ~]#
```

#### Mount Datas và kiểm tra lại kích thước

```

[root@CentOS-7-1908 ~]# e2fsck /dev/VG0/Datas
e2fsck 1.42.9 (28-Dec-2013)
/dev/VG0/Datas: clean, 11/983040 files, 104724/3932160 blocks
[root@CentOS-7-1908 ~]# e2fsck -f /dev/VG0/Datas
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG0/Datas: 11/983040 files (0.0% non-contiguous), 104724/3932160 blocks
[root@CentOS-7-1908 ~]# resize2fs /dev/VG0/Datas
resize2fs 1.42.9 (28-Dec-2013)
Resizing the filesystem on /dev/VG0/Datas to 5240832 (4k) blocks.
The filesystem on /dev/VG0/Datas is now 5240832 blocks long.

[root@CentOS-7-1908 ~]# mount /dev/VG0/Datas /Datas/
[root@CentOS-7-1908 ~]# df -HT
Filesystem                              Type      Size  Used Avail Use% Mounted on
devtmpfs                                devtmpfs  498M     0  498M   0% /dev
tmpfs                                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos_centos--7--1908-root xfs        51G  1.4G   50G   3% /
/dev/sda1                               xfs       1.1G  143M  921M  14% /boot
tmpfs                                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Backups                 ext4       11G   38M  9.9G   1% /Backups
/dev/mapper/VG0-Datas                   ext4       21G   47M   20G   1% /Datas
[root@CentOS-7-1908 ~]#
```