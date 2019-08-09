# LVM - Logical Volume Manager

---
## Mục lục

[1. Tìm hiểu về LVM ](#about)  
+ [1.1 Khái niệm](#concept) 
+ [1.2 Bố cục](#layout)
+ [1.3 Chức năng](#function)
+ [1.4 Tạo bố cục LVM](#create)
  
[2. Thay đổi dung lượng LVM ](#setup)  
 + [2.1 Thay đổi dung lượng group volume](#gv)  
 + [2.2 Thay đổi dung lượng logical volume](#lv)

[3. Xóa phân 1 phân vùng LVM](#delete)    
 + [3.1 Xóa logical volume](#dlv)
 + [3.2 Xóa group volume](#dgv)
 + [3.3 Xóa physical volume](#dpv)
  

-----
## Nội dung 

<a name ="about">

#### 1. Tìm hiểu về LVM

<a name ="concept">

##### 1.1 Khái niệm
Là công nghệ giúp quản lý các thiết bị lưu trữ dữ liệu trên các hệ điều hành linux. Cho phép người dùng gom/nhóm các ổ cứng vật lý lại và phân tách chúng thành những phân vùng nhỏ hơn, dễ dàng mở rộng các phân vùng này khi cần thiết.  
Có thể dễ dàng tạo mới, thay đổi và xóa bỏ phân vùng đã tạo

<a name ="layout">

##### 1.2 Bố cục

<img src="https://i.imgur.com/3mr2B8C.jpg">

Một bố cục LVM bao gồm : Hard drives, partitions, physical volume, volume group, logical volume, file systems.

- Physical Volumes: Một ổ đĩa vật lý có thể phân chia thành nhiều phân vùng vật lý gọi là Physical Volumes
- Volume Group: là 1 nhóm bao gồm nhiều Physical Volume trên 1 hoặc nhiều ổ đĩa khác nhau được liên kết lại thành 1 Volume group
- Logical volume: Một volume group được chia nhỏ ra thành nhiều logical volume, được format với các chuẩn định dạng Ext3, Ext4
- File Systems: Hệ thống tập tin quản lý các file và thư mục trên ổ đĩa, được mount tới các logical volumes

<a name="function">

##### 1.3 Chức năng
Quản lý các logical volume được mount với các file 1 cách dễ dàng hơn, dễ dàng tăng giảm kích thức sử dụng của logical mà không làm mất, thất thoát dữ liệu. Các tập có thể được thay đổi kích thước một cách linh hoạt khi có các yêu cầu thay đổi không gian và di chuyển giữa các thiết bị vật lý trong nhóm trên một hệ thống đang chạy hoặc xuất ra dễ dàng

<a name="create">

##### 1.4 Tạo bố cục LVM
Chuẩn bị: add thêm ổ đĩa lần lượt như sau: 
<>
- **Tạo Partition**  
Sử dụng lệnh *`fdisk`* để tạo partition 1G  như sau:
```
[root@localhost ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0xaaa2e28d.

Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-20971519, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-20971519, default 20971519): +1G
Partition 1 of type Linux and of size 1 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```
Tương tự tạo partition 2 và 3 với giá trị lần lượt là 2G và 5G
```
[root@localhost ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type:
   p   primary (1 primary, 0 extended, 3 free)
   e   extended
Select (default p): p
Partition number (2-4, default 2): 2
First sector (2099200-20971519, default 2099200):
Using default value 2099200
Last sector, +sectors or +size{K,M,G} (2099200-20971519, default 20971519): +2G
Partition 2 of type Linux and of size 2 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```  

```  
[root@localhost ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type:
   p   primary (2 primary, 0 extended, 2 free)
   e   extended
Select (default p): p
Partition number (3,4, default 3): 3
First sector (6293504-20971519, default 6293504):
Using default value 6293504
Last sector, +sectors or +size{K,M,G} (6293504-20971519, default 20971519): +5G
Partition 3 of type Linux and of size 5 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```
sau đó ta tiếp tục sử dụng *`fdisk`* để thay đổi loại phân vùng thành LVM:
```
[root@localhost ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): t
Selected partition 1
Hex code (type L to list all codes): 8e
Changed type of partition 'Linux' to 'Linux LVM'

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```
làm tương tự với sdc với các giá trị của partition 1,2,3 lần lượt là: 2G, 2G, 2G sau đó kiểm tra lại bằng lệnh *`lsblk`*:
```
[root@localhost ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   20G  0 disk
├─sda1            8:1    0  244M  0 part /boot
└─sda2            8:2    0 19.8G  0 part
  ├─centos-root 253:0    0 17.9G  0 lvm  /
  └─centos-swap 253:1    0  1.9G  0 lvm  [SWAP]
sdb               8:16   0   10G  0 disk
├─sdb1            8:17   0    1G  0 part
├─sdb2            8:18   0    2G  0 part
└─sdb3            8:19   0    5G  0 part
sdc               8:32   0   10G  0 disk
├─sdc1            8:33   0    2G  0 part
├─sdc2            8:34   0    2G  0 part
└─sdc3            8:35   0    2G  0 part
sdd               8:48   0   20G  0 disk
sde               8:64   0   10G  0 disk
sr0              11:0    1  918M  0 rom
```
- **Tạo physical volume**  
ta tạo 2 physical volume là sdb1 và sdc1 bằng lệnh *`pvcreate`* :
```
[root@localhost ~]# pvcreate /dev/sdb1
  Physical volume "/dev/sdb1" successfully created.
[root@localhost ~]# pvcreate /dev/sdc1
  Physical volume "/dev/sdc1" successfully created.
```
Kiểm tra lại bằng lệnh *`pvs`*
```
[root@localhost ~]# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  centos lvm2 a--  <19.76g    0
  /dev/sdb1         lvm2 ---    1.00g 1.00g
  /dev/sdc1         lvm2 ---    2.00g 2.00g
```  

- **Tạo volume group**  

Câu lệnh *`vgcreate [tên group volume] [tên physical volume1] [tên physical voume2] ...`* dùng để tạo group volume.
```
[root@localhost ~]# vgcreate volume-group1 /dev/sdb1 /dev/sdc1
  Volume group "volume-group1" successfully created
```
Kiểm tra group volume bằng lệnh *`vgs`* hoặc *`vgdisplay`*
```
[root@localhost ~]# vgs
  VG            #PV #LV #SN Attr   VSize   VFree
  centos          1   2   0 wz--n- <19.76g    0
  volume-group1   2   0   0 wz--n-   2.99g 2.99g
```
```
[root@localhost ~]# vgdisplay
  --- Volume group ---
  VG Name               volume-group1
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
  VG Size               2.99 GiB
  PE Size               4.00 MiB
  Total PE              766
  Alloc PE / Size       0 / 0
  Free  PE / Size       766 / 2.99 GiB
  VG UUID               AMY2p6-w7z0-NvIv-R2pp-3gfS-o2VV-ZF37dt

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
  VG Size               <19.76 GiB
  PE Size               4.00 MiB
  Total PE              5058
  Alloc PE / Size       5058 / <19.76 GiB
  Free  PE / Size       0 / 0
  VG UUID               ayFIxP-yFWa-gJwA-myKD-g8ci-wtan-HYLC4s
  ```
  - **Tạo logical volume**   
  Cú pháp lệnh: *`lvcreate -L [dung lượng cần tạo] -n [tên logical volume] [tên group volume]`*
  ```
  [root@localhost ~]# lvcreate -L 1G -n logical-volume1 volume-group1
  Logical volume "logical-volume1" created.
  ```
  kiểm tra logical volume bằng lệnh *`lvs`* hoặc *`lvdisplay`*
  ```
  [root@localhost ~]# lvs
  LV              VG            Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root            centos        -wi-ao---- <17.85g
  swap            centos        -wi-ao----   1.91g
  logical-volume1 volume-group1 -wi-a-----   1.00g
  ```
  ```
  [root@localhost ~]# lvdisplay
  --- Logical volume ---
  LV Path                /dev/volume-group1/logical-volume1
  LV Name                logical-volume1
  VG Name                volume-group1
  LV UUID                dU6KSG-fbQQ-CNEG-Uaj2-zSno-yONo-OI48OD
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2019-07-23 14:49:57 +0700
  LV Status              available
  # open                 0
  LV Size                1.00 GiB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/centos/root
  LV Name                root
  VG Name                centos
  LV UUID                HghZx7-s7QM-TE7s-5uNG-4WP5-5FNQ-q1VkJG
  LV Write Access        read/write
  LV Creation host, time localhost, 2019-07-19 10:58:55 +0700
  LV Status              available
  # open                 1
  LV Size                <17.85 GiB
  Current LE             4569
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:0

  --- Logical volume ---
  LV Path                /dev/centos/swap
  LV Name                swap
  VG Name                centos
  LV UUID                0PH87l-aeM2-TKuO-zy71-NcSP-sKws-gDuWvr
  LV Write Access        read/write
  LV Creation host, time localhost, 2019-07-19 10:58:58 +0700
  LV Status              available
  # open                 2
  LV Size                1.91 GiB
  Current LE             489
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:1
  ```
  - **Định dạng logical volme**  
  ```
  [root@localhost ~]# mkfs -t ext4 /dev/volume-group1/logical-volume1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
65536 inodes, 262144 blocks
13107 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=268435456
8 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
```
- **Mount logical volume vào thư mục và sử dụng**:  

Mình tạo thư mục demo1 và mount logical volume vào.
```
[root@localhost ~]# mkdir demo1
[root@localhost ~]# mount /dev/volume-group1/logical-volume1 demo1/
```
kiểm tra lv đã được mount bằng lệnh *`df -h`*
```
[root@localhost ~]# df -h
Filesystem                                   Size  Used Avail Use% Mounted on
/dev/mapper/centos-root                       18G  1.1G   16G   7% /
devtmpfs                                     475M     0  475M   0% /dev
tmpfs                                        487M     0  487M   0% /dev/shm
tmpfs                                        487M  7.7M  479M   2% /run
tmpfs                                        487M     0  487M   0% /sys/fs/cgroup
/dev/sda1                                    233M  102M  115M  47% /boot
tmpfs                                         98M     0   98M   0% /run/user/0
/dev/mapper/volume--group1-logical--volume1  976M  2.6M  907M   1% /root/demo1
```
<a name="setup">

#### 2. Thay đổi dung lượng LVM  

<a name="gv">

##### 2.1 Thay đổi dung lượng group volume
- **Tạo thêm physical volume**  
```
[root@localhost ~]# pvcreate /dev/sdb2
  Physical volume "/dev/sdb2" successfully created.
```
- **Thêm physical volume vào volume group**  
```
[root@localhost ~]# vgextend /dev/volume-group1 /dev/sdb2
  Physical volume "/dev/sdb2" successfully created.
  Volume group "volume-group1" successfully extended
```  
  
  
<a name="delete">

#### 3. Xóa phân vùng LVM

<a name="dlv">

##### 3.1 Xóa logical volume
 Đầu tiên ta *`umount`* sau đó sử dụng lệnh *`lvremove`* để xóa.  
 Cấu trúc câu lệnh sẽ như sau:  
*`umount /dev/[group volume]/[logical volume]`*  
*`lvremove /dev/[group volume]/[logical volume]`*

```
[root@localhost ~]# umount /dev/volume-group1/logical-volume1
[root@localhost ~]# lvremove /dev/volume-group1/logical-volume1
Do you really want to remove active logical volume volume-group1/logical-volume1? [y/n]: y
  Logical volume "logical-volume1" successfully removed
```

<a name="dgv">

##### 3.2 Xóa group volume

Cấu trúc câu lệnh dùng để xóa group volume : *`vgremove /dev/[group volume]`*

```
[root@localhost ~]# vgremove /dev/volume-group1
  Volume group "volume-group1" successfully removed
```
Ta kiểm tra lại với lệnh *`vgs`*
```
[root@localhost ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  centos   1   2   0 wz--n- <19.76g    0
```

<a name="dpv">

##### 3.3 Xóa physical volume 

Câu lệnh *`pvremove`* dùng để xóa physical volume có cấu trúc như sau: *`pvremove /dev/[partition cần xóa]`*
