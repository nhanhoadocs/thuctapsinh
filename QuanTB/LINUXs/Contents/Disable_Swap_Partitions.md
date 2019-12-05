## Disable swap partition
Swap partition (hay được gọi là RAM ảo) là một phân vùng đặc biệt, nó được sử dụng như bộ nhớ RAM mỗi khi dung lượng RAM vật lý của hệ thống hết hoặc khi bạn sử dụng sleep hệ thống, mọi dữ liệu trên RAM vật lý được chuyển sang phân vùng này trước khi hệ thống tắt.

Swap rất hữu ích, tuy nhiên nếu bạn có một lượng RAM vật lý đủ lớn và không cần dùng đến swap hoặc vì một lý do nào đó, bạn hoàn toàn có thể tắt nó.

Để tắt vĩnh viễn swap bạn cần thực hiện các bước sau:
- off tất cả các swap có trên hệ thông
- loại bỏ hoặc comment tất cả các thông tin cấu hình cho swap trong `/etc/fstab`
- loại bỏ phân vùng swap để giải phóng disk (Nếu cần thiết)

### Off tất cả các swap đang bật
Để có thông tin về swap bạn có để sử dụng lệnh:

```
[root@CentOS-7-1908 ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
/dev/dm-1                               partition       2097148 0       -2
[root@CentOS-7-1908 ~]#
```

Hoặc

```
[root@CentOS-7-1908 ~]# free -m
              total        used        free      shared  buff/cache   available
Mem:            972         163         702           7         106         681
Swap:          2047           0        2047
[root@CentOS-7-1908 ~]#
```

Hoặc

```
[root@CentOS-7-1908 ~]# lsblk
NAME                            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                               8:0    0   50G  0 disk
├─sda1                            8:1    0    1G  0 part /boot
└─sda2                            8:2    0   49G  0 part
  ├─centos_centos--7--1908-root 253:0    0   47G  0 lvm  /
  └─centos_centos--7--1908-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                               8:16   0   10G  0 disk
└─VG0-Backups                   253:3    0   10G  0 lvm
sdc                               8:32   0   20G  0 disk
├─VG0-Datas                     253:2    0   20G  0 lvm
└─VG0-Backups                   253:3    0   10G  0 lvm
sr0                              11:0    1  942M  0 rom
[root@CentOS-7-1908 ~]#
```

Khi bạn đã có được các thông tin về swap bạn có thể sử dụng lệnh `swapoff <swap>` để tắt chúng, hoặc đơn giản hơn bạn chỉ cần chạy lệnh `swapoff -a` để tắt tất cả các swap đang hoạt động.


Bạn có thể loại bỏ hoàn toàn swap partition để giải phóng bộ nhớ.


### Loại bỏ hoặc comment tất cả các thông tin cấu hình tron `/etc/fstab`
Các bước trên chỉ có thể tắt swap tại thời điểm hiện tại và sau khi khởi động lại hệ thống swap vẫn sẽ hoạt động, để tắt hoàn toàn swap bạn cần loại bỏ các thông tin cấu hình khỏi động của swap trong `/etc/fstab`.

Để loại bỏ các cấu hình đó bạn chỉ cần mở `/etc/fstab` bằng trình soạn thảo quen thuộc của bạn và loại bỏ nó:

```
vi /etc/fstab

#
# /etc/fstab
# Created by anaconda on Thu Nov 14 10:19:22 2019
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos_centos--7--1908-root /                       xfs     defaults        0 0
UUID=bc96bd45-3cb4-4dcf-9976-054435060335 /boot                   xfs     defaults        0 0
# /dev/mapper/centos_centos--7--1908-swap swap                    swap    defaults        0 0
~
~
```

Sau đó bạn lưu lại và kiểm tra xem swap đã được tắt chưa.

```
[root@CentOS-7-1908 ~]# free -m
              total        used        free      shared  buff/cache   available
Mem:            972         162         703           7         106         682
Swap:             0           0           0
[root@CentOS-7-1908 ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
[root@CentOS-7-1908 ~]#
```

## Enable swap partition
Để bật lại swap ta làm ngược lại, bỏ comment trong file `/etc/fstab` và chạy lệnh `swapon -a` để bật tất cả các swap.