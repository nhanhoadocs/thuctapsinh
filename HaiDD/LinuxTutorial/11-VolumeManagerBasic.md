# **Logical Volume Manager(LVM)**


## **Giới thiệu về LVM**
---
-LVM là một công cụ để quản lý phân vùng logic được tạo và phân bổ từ các ổ đĩa vật lý. Với LVM bạn có thể dễ dàng tạo mới, thay đổi kích thước hoặc xóa bỏ phân vùng đã tạo.

LVM được sử dụng cho các mục đích sau
- Tạo 1 hoặc nhiều phần vùng logic hoặc phân vùng với toàn bộ đĩa cứng (hơi giống với RAID 0, nhưng tương tự như JBOD), cho phép thay đổi kích thước volume.
- Quản lý trang trại đĩa cứng lớn (Large hard Disk Farms) bằng cách cho phép thêm và thay thế đĩa mà không bị ngừng hoạt động hoặc gián đoạn dịch vụ, kết hợp với trao đổi nóng (hot swapping).
- Trên các hệ thống nhỏ (như máy tính để bàn), thay vì phải ước tính thời gian cài đặt, phân vùng có thể cần lớn đến mức nào, LVM cho phép các hệ thống tệp dễ dàng thay đổi kích thước khi cần.
- Thực hiện sao lưu nhất quán bằng cách tạo snapshot nhanh các khối một cách hợp lý.
- Mã hóa nhiều phân vùng vật lý bằng một mật khẩu.

Cơ bản, **LVM**(Logical Volume Manager) bao gồm :
- **Physical volumes**: là những đĩa cứng vật lý hoặc phân vùng trên nó.
(`/dev/fileserver/share, /dev/fileserver/backup, /dev/fileserver/media`)
- **Volume groups**: là một nhóm bao gồm các Physical volumes. Có thể xem Volume group như 1 “ổ đĩa ảo”.
(`fileserver`)
- **Logical volumes**: có thể xem như là các “phân vùng ảo” trên “ổ đĩa ảo” bạn có thể thêm vào, gỡ bỏ và thay đổi kích thước một cách nhanh chóng. (`/dev/sda1, /dev/sdb1, /dev/sdc1, /dev/sdd1`)

## **Thao tác trên LVM**
Liệt kê các phân vùng ổ cứng trong hệ thống.
`fdisk -l`. (hoặc để đơn giản. Ta dùng `# ls -la /dev/sd*`)
- Có 3 ổ cứng: sda, sdb, sdc
- sda : ổ cài đặt hệ điều hành
- sdb(2GB) và sdc(4GB): ổ để lưu trữ data
```
brw-rw----. 1 root disk 8,  0 Dec 11 08:56 /dev/sda
brw-rw----. 1 root disk 8,  1 Dec 11 08:56 /dev/sda1
brw-rw----. 1 root disk 8,  2 Dec 11 08:56 /dev/sda2
brw-rw----. 1 root disk 8, 16 Dec 11 08:56 /dev/sdb
brw-rw----. 1 root disk 8, 32 Dec 11 08:56 /dev/sdc
```

### Mục tiêu :
- Sử dụng LVM để phân chia `sdb` và `sdc` thành 2 logical volumn 3GB có tên là `Datas` và `Backups`
- Mount logical volumes
- Giảm kích thước logical volume `Backups`
- Tăng kích thước logical volume `Data`

### Tạo Physical Volume
Tạo 2 Physical Volume từ 2 ổ `sdb` và `sdc`: 
`# pvcreate /dev/sdb /dev/sdc`
```
[root@localhost ~]# pvcreate /dev/sdb /dev/sdc
Physical volume "/dev/sdb" successfully created.
Physical volume "/dev/sdc" successfully created.
```

### Hiển thị thông tin về Physical Volumes
Câu lệnh  : `# pvdisplay`
```
[root@localhost ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               centos
  PV Size               <19.00 GiB / not usable 3.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              4863
  Free PE               0
  Allocated PE          4863
  PV UUID               XBNlHh-qQNo-FCuK-6vv6-zcmt-Z9Bh-s1kWq6

  "/dev/sdb" is a new physical volume of "2.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb
  VG Name
  PV Size               2.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               hV7TEZ-1hCS-w1Ob-Exh4-1Ma4-EUok-ZXf5PU

  "/dev/sdc" is a new physical volume of "4.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdc
  VG Name
  PV Size               4.00 GiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               Hdem7P-n5f3-bEvY-921f-Kgs0-7alc-49dRZZ
```

### Tạo Volume Groups (VG)
Lệnh kiểm tra những VG hiện có: `# vgs`
```
[root@localhost ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  VG0      2   2   0 wz--n-   5.99g    0
  centos   1   2   0 wz--n- <19.00g    0
```

Tạo 1 VG có tên VG0 từ 2 Physical Volume vừa tạo ở trên: `# vgcreate VG0 /dev/sdb /dev/sdc`
```
[root@localhost ~]# vgcreate VG0 /dev/sdb /dev/sdc
  Volume group "VG0" successfully created
```
Xem lại thông tin về VG0 ta vừa tạo:
```
[root@localhost ~]# vgdisplay
  --- Volume group ---
  VG Name               centos
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
  VG Size               <19.00 GiB
  PE Size               4.00 MiB
  Total PE              4863
  Alloc PE / Size       4863 / <19.00 GiB
  Free  PE / Size       0 / 0
  VG UUID               OckXWY-W1T8-TI6a-5Fbe-NNr5-q9Zj-vi8Dkg

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
  VG Size               5.99 GiB
  PE Size               4.00 MiB
  Total PE              1534
  Alloc PE / Size       0 / 0
  Free  PE / Size       1534 / 5.99 GiB
  VG UUID               UZfjFo-irwV-kOgi-xKjT-zaAI-cERu-pkNTKe
```

### Tạo Logical Volume
Lệnh kiểm tra xem có những LV nào:
`# lvs`
```
[root@localhost ~]# lvs
  LV      VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  Backups VG0    -wi-ao----   2.00g
  Data    VG0    -wi-ao----   3.99g
  root    centos -wi-ao---- <17.00g
  swap    centos -wi-ao----   2.00g
```

Ta tạo 2 Logical volume là `Data` và `Backups` như đã nói ở trên.
```
# lvcreate -n Data -L 3G VG0
# lvcreate -n Backups -l 100%FREE VG0
```
Trong đó: 
- `-n` <ten_logical_volume> 
- `-L` : Sử dụng kích thước cố định
- `-l` : Sử dụng % của không gian còn lại trong Volume

```
[root@localhost ~]# lvcreate -n Data -L 3G VG0
  Logical volume "Data" created.
[root@localhost ~]# lvcreate -n Backups -l 100%FREE VG0
  Logical volume "Backups" created.
```

Ta kiểm tra thông tin các Logical Volume vừa tạo : `# lvdisplay`
```
[root@localhost ~]# lvdisplay
  --- Logical volume ---
  LV Path                /dev/centos/swap
  LV Name                swap
  VG Name                centos
  LV UUID                hsJatx-w85H-zyqW-bkBY-TVU9-cyfW-zfIc83
  LV Write Access        read/write
  LV Creation host, time localhost, 2019-12-05 10:56:02 +0700
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
  LV Path                /dev/centos/root
  LV Name                root
  VG Name                centos
  LV UUID                bk0fKD-oeJ9-cuJk-xwCt-7GO7-rrRP-fOK4SG
  LV Write Access        read/write
  LV Creation host, time localhost, 2019-12-05 10:56:02 +0700
  LV Status              available
  # open                 1
  LV Size                <17.00 GiB
  Current LE             4351
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:0

  --- Logical volume ---
  LV Path                /dev/VG0/Data
  LV Name                Data
  VG Name                VG0
  LV UUID                wlyvA2-rTwd-xTLX-rfQr-JhWs-2Fsx-qsBD9z
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:26:39 +0700
  LV Status              available
  # open                 0
  LV Size                3.00 GiB
  Current LE             768
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                uciXwq-FW1j-qEgM-PdCC-zhVr-ZdZH-qkf0PP
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:27:01 +0700
  LV Status              available
  # open                 0
  LV Size                2.99 GiB
  Current LE             766
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3
```

### Định dạng Logical Volume
 `Ext4`: cũng giống như `Ext3`, lưu giữ được những ưu điểm và tính tương thích ngược với phiên bản trước đó. Như vậy, chúng ta có thể dễ dàng kết hợp các phân vùng định dạng `Ext2`, `Ext3` và `Ext4` trong cùng 1 ổ đĩa trong Ubuntu để tăng hiệu suất hoạt động. Trên thực tế, `Ext4` có thể giảm bớt hiện tượng phân mảnh dữ liệu trong ổ cứng, hỗ trợ các file và phân vùng có dung lượng lớn... Thích hợp với ổ SSD so với `Ext3`, tốc độ hoạt động nhanh hơn so với 2 phiên bản Ext trước đó, cũng khá phù hợp để hoạt động trên server, nhưng lại không bằng `Ext3`.

 Ta sẽ định dạng Logical Volume ở dạng `ext4`:

 - `# mkfs.ext4 /dev/VG0/Data`
 - `# mkfs.ext4 /dev/VG0/Backups`

 ```
 [root@localhost ~]# clear
[root@localhost ~]# mkfs.ext4 /dev/VG0/Data
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
196608 inodes, 786432 blocks
39321 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=805306368
24 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done

[root@localhost ~]# mkfs.ext4 /dev/VG0/Backups
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
196224 inodes, 784384 blocks
39219 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=803209216
24 block groups
32768 blocks per group, 32768 fragments per group
8176 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
 ```

### Mount logical volume
 Ta cần Mount Logical volume để kiểm tra việc tạo thành công:
 ```
 [root@localhost ~]# mkdir /Data
[root@localhost ~]# mount /dev/VG0/Data /Data/
[root@localhost ~]#
[root@localhost ~]# mkdir /Backups
[root@localhost ~]# mount /dev/VG0/Backups /Backups/
[root@localhost ~]#
[root@localhost ~]# ls -la /
total 4194388
dr-xr-xr-x.  20 root root       4096 Dec 11 09:43 .
dr-xr-xr-x.  20 root root       4096 Dec 11 09:43 ..
drwxr-xr-x.   3 root root       4096 Dec 11 09:36 Backups
lrwxrwxrwx.   1 root root          7 Dec  5 10:56 bin -> usr/bin
dr-xr-xr-x.   5 root root       4096 Dec  5 11:02 boot
drwxr-xr-x.   3 root root       4096 Dec 11 09:36 Data
drwxr-xr-x.  21 root root       3340 Dec 11 09:27 dev
drwxr-xr-x.  74 root root       4096 Dec 11 08:56 etc
drwxr-xr-x.   6 root root       4096 Dec  6 09:34 home
lrwxrwxrwx.   1 root root          7 Dec  5 10:56 lib -> usr/lib
lrwxrwxrwx.   1 root root          9 Dec  5 10:56 lib64 -> usr/lib64
drwx------.   2 root root      16384 Dec  5 10:56 lost+found
drwxr-xr-x.   2 root root       4096 Apr 11  2018 media
drwxr-xr-x.   2 root root       4096 Apr 11  2018 mnt
drwxr-xr-x.   2 root root       4096 Apr 11  2018 opt
dr-xr-xr-x. 112 root root          0 Dec 11 08:56 proc
dr-xr-x---.   4 root root       4096 Dec 10 11:52 root
drwxr-xr-x.  24 root root        720 Dec 11 08:56 run
lrwxrwxrwx.   1 root root          8 Dec  5 10:56 sbin -> usr/sbin
drwxr-xr-x.   2 root root       4096 Apr 11  2018 srv
-rw-r--r--.   1 root root         48 Dec  6 11:32 subA
-rw-------.   1 root root 4294967296 Dec 10 15:55 swapfile
dr-xr-xr-x.  13 root root          0 Dec 11 08:56 sys
drwxrwxrwt.  17 root root       4096 Dec 11 09:14 tmp
drwxr-xr-x.  13 root root       4096 Dec  5 10:56 usr
drwxr-xr-x.  19 root root       4096 Dec  5 11:17 var
 ```

## **Thay đổi kích thước Logical Volume**

### Giảm kích thước LV
Trước khi bắt đầu, cần sao lưu dữ liệu vì vậy sẽ được tránh sự cố xảy ra. Cần thực hiện cẩn thận 5 bước dưới đây:
- Ngắt kết nối file system.
- Kiểm tra file system sau khi ngắt kết nối.
- Giảm file system.
- Giảm kích thước Logical Volume hơn kích thước hiện tại.
- Kiểm tra lỗi cho file system.
- Mount lại file system và kiểm tra kích thước của nó.

Ta sẽ giảm kích thước của LV `Backups` từ 2.99GB xuống còn 2GB mà không làm mất dữ liệu.

### Kiểm tra dung lượng của Logical Volume và kiểm tra file system trước khi thực hiện giảm

`# lvdisplay VG0`
```
[root@localhost ~]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Data
  LV Name                Data
  VG Name                VG0
  LV UUID                wlyvA2-rTwd-xTLX-rfQr-JhWs-2Fsx-qsBD9z
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:26:39 +0700
  LV Status              available
  # open                 1
  LV Size                3.00 GiB
  Current LE             768
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                uciXwq-FW1j-qEgM-PdCC-zhVr-ZdZH-qkf0PP
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:27:01 +0700
  LV Status              available
  # open                 1
  LV Size                2.99 GiB
  Current LE             766
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3
```
`# df -TH`
```
[root@localhost ~]# df -TH
Filesystem              Type      Size  Used Avail Use% Mounted on
devtmpfs                devtmpfs  498M     0  498M   0% /dev
tmpfs                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos-root ext4       18G  5.7G   12G  34% /
/dev/sda1               xfs       521M  137M  385M  27% /boot
tmpfs                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Data    ext4      3.2G  9.5M  3.0G   1% /Data
/dev/mapper/VG0-Backups ext4      3.1G  9.5M  3.0G   1% /Backups
```

### Unmount Logical volume Backups và Kiểm tra trạng thái mount
`# umount /Backups/`
```
[root@localhost ~]# umount /Backups/
[root@localhost ~]# df -TH
Filesystem              Type      Size  Used Avail Use% Mounted on
devtmpfs                devtmpfs  498M     0  498M   0% /dev
tmpfs                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos-root ext4       18G  5.7G   12G  34% /
/dev/sda1               xfs       521M  137M  385M  27% /boot
tmpfs                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Data    ext4      3.2G  9.5M  3.0G   1% /Data
```
-> Ta thấy không còn `/VG0-Backups` nữa.

### Kiểm tra lỗi
Ta dùng lệnh:  `# e2fsck -f /dev/VG0/Backups`
```
[root@localhost ~]# e2fsck -f /dev/VG0/Backups
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG0/Backups: 11/196224 files (0.0% non-contiguous), 31006/784384 blocks
```
-> Không thấy lỗi

### Giảm kích thước Logical volume `Backups`
Ta sử dụng lệnh `# lvreduce -L (n) /dev/<tên_group>/<tên_logical>`

Trong đó: 
lvreduce : là lệnh dùng để giảm dung lượng
-L : là option của lệnh
(n) : là số dùng để tăng giảm dung lượng theo ý muốn

```
[root@localhost ~]# lvreduce -L 2G /dev/VG0/Backups
  WARNING: Reducing active logical volume to 2.00 GiB.
  THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce VG0/Backups? [y/n]: y
  Size of logical volume VG0/Backups changed from 2.99 GiB (766 extents) to 2.00 GiB (512 extents).
  Logical volume VG0/Backups successfully resized.
```

Sau đó, ta xác nhận thay đổi bằng cách sử dụng lệnh `resize2fs`

`# resize2fs /dev/<tên_group>/<ten_volume>`

```
[root@localhost ~]# resize2fs /dev/VG0/Backups
resize2fs 1.42.9 (28-Dec-2013)
Resizing the filesystem on /dev/VG0/Backups to 524288 (4k) blocks.
resize2fs: Can't read a block bitmap while trying to resize /dev/VG0/Backups
Please run 'e2fsck -fy /dev/VG0/Backups' to fix the filesystem
after the aborted resize operation.
```
Định dạng lại Volume về ext4:
```
[root@localhost ~]# mkfs.ext4 /dev/VG0/Backups
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
131072 inodes, 524288 blocks
26214 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=536870912
16 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
```

Kiểm tra lại lỗi:
```
[root@localhost ~]# e2fsck -f /dev/VG0/Backups
e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/VG0/Backups: 11/131072 files (0.0% non-contiguous), 26156/524288 blocks
```

Mount lại file system và kiểm tra kích thước của nó.
`# mount /dev/VG0/Backups /Backups/`
```

[root@localhost ~]# mount /dev/VG0/Backups /Backups/
[root@localhost ~]# df -TH
Filesystem              Type      Size  Used Avail Use% Mounted on
devtmpfs                devtmpfs  498M     0  498M   0% /dev
tmpfs                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos-root ext4       18G  5.7G   12G  34% /
/dev/sda1               xfs       521M  137M  385M  27% /boot
tmpfs                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Data    ext4      3.2G  9.5M  3.0G   1% /Data
/dev/mapper/VG0-Backups ext4      2.1G  6.3M  2.0G   1% /Backups
```

### **Tăng kích thước LV**
### Kiểm tra kích thước và umount LV `Data`
```
[root@localhost ~]# umount /Data
[root@localhost ~]# df -HT
Filesystem              Type      Size  Used Avail Use% Mounted on
devtmpfs                devtmpfs  498M     0  498M   0% /dev
tmpfs                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos-root ext4       18G  5.7G   12G  34% /
/dev/sda1               xfs       521M  137M  385M  27% /boot
tmpfs                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Backups ext4      2.1G  6.3M  2.0G   1% /Backups
```

### Mở rộng kích thước LV
Ta sẽ tăng kích thước LV Data lên ~4G(dung lượng còn lại của tổng `sdb` và `sdc`)
Ta sử dụng lệnh : `# lvextend -l 100%FREE /dev/VG0/Data`
```
[root@localhost ~]# lvextend -l +100%FREE /dev/VG0/Data
  Size of logical volume VG0/Data changed from 3.00 GiB (768 extents) to 3.99 GiB (1022 extents).
  Logical volume VG0/Data successfully resized.
```

Kiểm tra lỗi và xác nhận thay đổi:
```
# e2fsck - /dev/VG0/Data
# resize2fs /dev/VG0/Data
```

Kiểm tra dung lượng :

```
[root@localhost ~]# lvdisplay VG0
  --- Logical volume ---
  LV Path                /dev/VG0/Data
  LV Name                Data
  VG Name                VG0
  LV UUID                wlyvA2-rTwd-xTLX-rfQr-JhWs-2Fsx-qsBD9z
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:26:39 +0700
  LV Status              available
  # open                 0
  LV Size                3.99 GiB
  Current LE             1022
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VG0/Backups
  LV Name                Backups
  VG Name                VG0
  LV UUID                uciXwq-FW1j-qEgM-PdCC-zhVr-ZdZH-qkf0PP
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-12-11 09:27:01 +0700
  LV Status              available
  # open                 1
  LV Size                2.00 GiB
  Current LE             512
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3
```

Mount lại LV `Data` và kiểm tra kích thước:
```
[root@localhost ~]# mount /dev/VG0/Data /Data/
[root@localhost ~]# df -TH
Filesystem              Type      Size  Used Avail Use% Mounted on
devtmpfs                devtmpfs  498M     0  498M   0% /dev
tmpfs                   tmpfs     510M     0  510M   0% /dev/shm
tmpfs                   tmpfs     510M  8.0M  502M   2% /run
tmpfs                   tmpfs     510M     0  510M   0% /sys/fs/cgroup
/dev/mapper/centos-root ext4       18G  5.7G   12G  34% /
/dev/sda1               xfs       521M  137M  385M  27% /boot
tmpfs                   tmpfs     102M     0  102M   0% /run/user/0
/dev/mapper/VG0-Backups ext4      2.1G  6.3M  2.0G   1% /Backups
/dev/mapper/VG0-Data    ext4      3.2G  9.5M  3.0G   1% /Data
```

## **Xóa 1 Logical Volume và 1 Group Volume**
### Xóa 1 Logical Volume
`lvremove /dev/<ten_group>/<ten logical>`

Ta sẽ xóa LV Data theo các bước sau:

- Kiểm tra những LV hiện có:
```
[root@localhost ~]# lvs
  LV      VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  Backups VG0    -wi-ao----   2.00g
  Data    VG0    -wi-ao----   3.99g
  root    centos -wi-ao---- <17.00g
  swap    centos -wi-ao----   2.00g
```

- Umount Data: `# umount /Data/`
- Disable LV Data`# lvchange -an /dev/VG0/Data`
- Xóa LV Data: 
```
[root@localhost ~]# lvremove /dev/VG0/Data
Do you really want to remove active logical volume VG0/Data? [y/n]: y
  Logical volume "Data" successfully removed
```
- Kiểm tra lại danh sách LV:
```
[root@localhost ~]# lvs
  LV      VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  Backups VG0    -wi-ao----   2.00g
  root    centos -wi-ao---- <17.00g
  swap    centos -wi-ao----   2.00g
```

### Xóa 1 Group Volume
`# vgremove /dev/<tên_Group_Volume>`
- Kiểm tra các danh sách GV: `# vgs`
```
[root@localhost ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  VG0      2   1   0 wz--n-   5.99g 3.99g
  centos   1   2   0 wz--n- <19.00g    0
```

- Disable Volume Group : `# vgchange -an /dev/VG0`
- Remove GV: 
```
[root@localhost ~]# vgremove /dev/VG0
  Volume group "VG0" successfully removed
```
- Kiểm tra lại các VG :
```
[root@localhost ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  centos   1   2   0 wz--n- <19.00g    0
```
### Xóa Physical Volume

Cuối cùng là xóa Physical Volume:

`# pvremove /dev/sdb`


