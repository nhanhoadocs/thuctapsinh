# Swap memory
### 1. Linux swap memory
Linux chia RAM thành các bộ nhớ gọi là các trang. Không gian trao đổi là quá trình mà một trang bộ nhớ được sao chép vào một không gian đĩa cứng cấu hình có sẵn. Không gian trao đổi này được gọi là dung lượng bộ nhớ ảo có sẵn.  
Chức năng chính của không gian trao đổi này là thay thế bộ nhớ RAM bằng không gian đĩa khi bộ nhớ thực sự đầy hoặc quá tải, cần thêm dung lượng để không phải dừng mọi hoạt động cho đến khi giải phóng được 1 phần bộ nhớ RAM bằng cách đóng 1 số chương trình.  
Hoán đổi làm tăng dung lượng bộ nhớ ảo nhưng so với RAM vật lý, hoán đổi chậm hơn rất nhiều lần. 
### 2. Các lệnh về phân vùng trao đổi
#### 1. Bật, tắt và kiểm tra các phân vùng trao đổi
**Bật phân vùng trao đổi**
```
[root@host ~]# swapon -a
```
**Vô hiệu hóa phân vùng trao đổi:**

- Ta có thể vô hiệu hóa tất cả các phân vùng trao đổi bằng lệnh:
```
[root@host ~]# swapoff -a
```
- Để vô hiệu hóa vĩnh viễn 1 vùng trao đổi, ta truy cập vào file /etc/fstab, 
```
[root@host ~]# vi /etc/fstab

```
thêm hastag(#) vào phía trước dòng trao đổi như sau:
```

#
# /etc/fstab
# Created by anaconda on Sat Apr 20 09:13:33 2019
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos-root /                       xfs     defaults        0 0
UUID=24bc936c-2be6-4915-a67f-9d951cf58880 /boot                   xfs     defaults        0 0
#/dev/mapper/centos-swap swap                    swap    defaults        0 0
~
~
~
~
~
```
 Sau đó khởi động lại hệ thống hoặc chạy lệnh `mount -a` và kiểm tra lại với lệnh `free -h`
```
[root@host ~]# mount -a

```
```
[root@host ~]# free -h
              total        used        free      shared  buff/cache   available
Mem:           972M        124M        744M        7.6M        103M        705M
Swap:            0B          0B          0B
```
Như vậy vùng trao đổi đã bị vô hiệu hóa.  

**Kiểm tra các phân vùng trao đổi:**

```
[root@host ~]# blkid
/dev/sr0: UUID="2018-11-25-21-21-31-00" LABEL="CentOS 7 x86_64" TYPE="iso9660" PTTYPE="dos"
/dev/sda1: UUID="24bc936c-2be6-4915-a67f-9d951cf58880" TYPE="xfs"
/dev/sda2: UUID="ikfdTG-fdYf-oax6-bdgQ-hGzd-m0gp-MkYEmm" TYPE="LVM2_member"
/dev/mapper/centos-root: UUID="91692a54-a71c-410c-b282-6456c56c69eb" TYPE="xfs"
/dev/mapper/centos-swap: UUID="40cebfb7-94e8-4198-bff3-20820fd60606" TYPE="swap"

```
```
[root@host ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   20G  0 disk
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0   19G  0 part
  ├─centos-root 253:0    0   17G  0 lvm  /
  └─centos-swap 253:1    0    2G  0 lvm  [SWAP]
sr0              11:0    1  918M  0 rom

```
```
[root@host ~]# swapon --show
NAME      TYPE      SIZE USED PRIO
/dev/dm-1 partition   2G   0B   -2
```
#### 2. Tạo 1 phân vùng trao đổi
Trước tiên, khi tạo 1 phân vùng trao đổi, ta phải có quyền sudo.
Ở đây mình muốn tạo tệp với 1G trao đổi vào file `/var/swapfile`, ta thực hiện như sau:
```
[root@host ~]# dd if=/dev/zero of=/var/swapfile bs=1G count=1
dd: error writing ‘/var/swapfile’: No space left on device
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB) copied, 7.02131 s, 153 MB/s
```
**Gán quyền để đảm bảo rằng chỉ người dùng root mới có thể read và write**
```
[root@host ~]# chmod 600 /var/swapfile
```
**Thiết lập file dưới dạng vùng trao đổi linux**
```
[root@host ~]# mkswap /var/swapfile
Setting up swapspace version 1, size = 1048572 KiB
no label, UUID=3fc80974-254d-42cb-8c0c-c85aeccbc812
```
**Thay đổi vĩnh viễn trao đổi bằng cách thêm */var/swapfile none swap defalts 0 0*  vào file `/etc/fstab`**
```
[root@host ~]# echo /var/swapfile none swap defalts 0 0 | sudo tee -a /etc/fstab
/var/swapfile none swap defalts 0 0
```
**Kích hoạt vùng trao đổi:**
```
[root@host ~]# swapon -a
```
sau đó kiểm tra lại bằng lệnh `swapon -s`
```
[root@host ~]#  swapon -s
Filename                                Type            Size    Used    Priority
/dev/dm-1                               partition       2097148 69664   -2
/var/swapfile                           file    1048572 0       -3
```
Vùng trao đổi đã được thêm.

 
