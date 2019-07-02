# iSCSI

## iSCSI là gì 

- Trong hệ thống mạng máy tính, iSCSI (viết tắt của internet Small Computer System Interface) dựa trên giao thức mạng internet (IP) để kết nối các cơ sở dữ liệu.

- Nói một cách đơn giản nhất, iSCSI sẽ giúp tạo 1 ổ cứng Local trong máy tính của bạn với mọi chức năng y như 1 ổ cứng gắn trong máy tính vậy. Chỉ khác ở chỗ dung lượng thực tế nằm trên NAS và do NAS quản lý.

- Hiện nay, iSCSI đang dần chiếm một phần lớn trong hệ thống NAS và Server quản lý của các doanh nghiệp bởi chi phí lắp ráp vận hành rất rẻ so với mạng SAN Fiber Channel.

- Nếu như các doanh nghiệp lớn từ trước tới nay đều sử dụng Fiber Channel SAN để quản lý, lưu trữ với băng thông tối đa lên 4Gbps còn iSCSI qua giao thức mạng Internet chỉ được tối đa 1Gbps. Thì bây giờ, giới hạn về tốc độ đã được phá vỡ.

- Các hệ thống NAS như NAS Synology Rackstation chẳng hạn, với 4 cổng LAN Gigabits hỗ trợ Failover, Load Balancing, ngoài ra còn có khe gắn thêm 1 card PCI-Express 10Gbps cho tốc độ cao hơn cả mạng Fiber Channel (Max 8Gbps).

## Ưu điểm của iSCSI

- Chi phí rẻ hơn nhiều so với Fiber Channel SAN

- Tạo và quản lý được nhiều ổ cứng cho nhiều máy tính nội-ngoại mạng(VPN).

-    Gián tiếp mở rộng dung lượng lưu trữ cho các máy tính nội-ngoại mạng(VPN).

-    Cài VMware trên ổ cứng iSCSI hoặc cài phần mềm từ xa.

-  Hiển thị y hệt ổ cứng trong máy, thân thiện với người dùng phổ thông.

-   Bảo mật cao bằng mật khẩu.

-   Kết nối rất nhanh, không cần qua nhiều bước.

-   Thích hợp cho doanh nghiệp quản lý dữ liệu của máy nhân viên.


##  Cách thức hoạt động của iSCSI

- Khi một người dùng hoặc một ứng dụng gửi một request yêu cầu truy xuất dữ liệu trong Storage.

-    Hệ thống sẽ tạo ra một số lệnh SCSI tương ứng với yêu cầu.

-    Sau đó đóng gói (Encapsulate) và mã hóa (Encrypt) và gửi đi trên đường Network.

 -   Khi Server nhận được, nó sẽ tháo (De-Encapsulate) và giải mã (Decrypt) để cuối cùng nhận được các lệnh SCSI.

 -   Các lệnh SCSI sẽ được đưa vào SCSI Controller để thực thi và xử lý theo yêu cầu.

  -  Các ổ đĩa ISCSI đưiSCSI gồm 2 thành phần iSCSI Target và iSCSI Initiator:ợc tạo ra từ các Server chạy các hệ điều hành như Windows/Linux.


## iSCSI gồm 2 thành phần iSCSI Target và iSCSI Initiator:

-  Khi một server hoặc một thiết bị nào đó muốn kết nối tới hệ thống iSCSI SAN, chúng sẽ dùng một software gọi là iSCSI Initiator để kết nối tới con số “Target” này. Và con số này sẽ quản lý kết nối giữa iSCSI Target và iSCSI Initiator.

- Từ Windows Server 2008 trở về sau, Microsoft hỗ trợ tính năng tạo ra hệ thống lưu trữ iSCSI SAN và chúng được gọi là “iSCSI Targets Server”

## Thực hành Lab iCSI

### Chuẩn bị 

- Máy iSCSI target : 
    - IP : 172.16.59.129
    - HDH : Centos 7 Sever
- Máy iSCSI Initiator :
    - IP : 172.16.59.130
    - HDH : Centos 7 Sever 

### Cài đặt và cấu hình trên iSCSI target

***Steps to setup iSCSI target***

1. Create the backing storage devices.

2. Create the IQN and default target portal group (TPG).

3. Configure one or more ACLs for the TPG.

4. Create LUNs to provide access to the backing storage devices.

5. Create a portal to provide a network interface that iSCSI initiators can connect to.

6. Verify and commit the configuration.


#### 1. Create backing storage device

Before we start working on our iSCSI target, we need a backend storage. On my node I have added an additional disk mapped to `/dev/sdb`. Below using `fdisk` I am creating a new partition `/dev/sdc1` with `1GB` size, which will be used to create my iSCSI target.

```
[root@localhost ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   10G  0 disk 
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0    9G  0 part 
  ├─centos-root 253:0    0    8G  0 lvm  /
  └─centos-swap 253:1    0    1G  0 lvm  [SWAP]
sdb               8:16   0    5G  0 disk 
sr0              11:0    1  918M  0 rom  

```
```
[root@localhost ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0xbea4308d.

Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-10485759, default 2048): 
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-10485759, default 10485759): +1G
Partition 1 of type Linux and of size 1 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
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

Kiểm tra lại 
```
[root@localhost ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   10G  0 disk 
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0    9G  0 part 
  ├─centos-root 253:0    0    8G  0 lvm  /
  └─centos-swap 253:1    0    1G  0 lvm  [SWAP]
sdb               8:16   0    5G  0 disk 
└─sdb1            8:17   0    1G  0 part 
sr0              11:0    1  918M  0 rom  
```
Vậy ta đã tạo thành công ổ  sdb

#### 2. Install targetcli rpm

To manage the kernel-based iSCSI Target service on RHEL / CentOS 7, we will need to install the targetcli package, as shown in the following command:
```
yum -y install targetcli


```

#### 3. Managing iSCSI targets with targetcli

The `targetcli` command is a shell to view, edit, save, and load the iSCSI target configuration. When you look at the configuration, you will see that `targetcli` provides a hierarchical structure in a similar way to a filesystem.

To invoke the `targetcli` shell, we will run this command as `root`. You will see that on the first run of the command, a preferences file is created. This is illustrated in the following snippet
```
[root@localhost ~]# targetcli
targetcli shell version 2.1.fb46
Copyright 2011-2013 by Datera, Inc and others.
For help on commands, type 'help'.

/> 
```

As you can see in the preceding output, you can enter help to display a list of commands that can be entered. To view the available configuration objects, we can use the ls command. The output is shown in the following :
```
/> ls
o- / ......................................................................................................................... [...]
  o- backstores .............................................................................................................. [...]
  | o- block .................................................................................................. [Storage Objects: 0]
  | o- fileio ................................................................................................. [Storage Objects: 0]
  | o- pscsi .................................................................................................. [Storage Objects: 0]
  | o- ramdisk ................................................................................................ [Storage Objects: 0]
  o- iscsi ............................................................................................................ [Targets: 0]
  o- loopback ......................................................................................................... [Targets: 0]
```

We will work with backstores objects to start with so that we can add it to the LVM block device in the configuration in addition to the fileio backstore. As the name suggests, this will be a file within the filesystem; we can share this to a network as a virtual disk.

#### 4. Create block backstores

We will work from the root of the `targetcli` configuration; this should be exactly where we are, but we can always use the `pwd` command to display our working directory. If required, we can change it to the root of the configuration with `cd /`.

```
[root@localhost ~]# targetcli
targetcli shell version 2.1.fb46
Copyright 2011-2013 by Datera, Inc and others.
For help on commands, type 'help'.

/> /backstores/block create name=block_storage dev=/dev/sdb1
Created block storage object block_storage using /dev/sdb1.
```

This will create the block `block_storage` with a name called sdb1. Using the `ls` command again will list the additional object within the hierarchy. In the following screenshot, we see the creation of the backstore and the subsequent listing:

```
/> ls
o- / ......................................................................................................................... [...]
  o- backstores .............................................................................................................. [...]
  | o- block .................................................................................................. [Storage Objects: 1]
  | | o- block_storage ................................................................ [/dev/sdb1 (0 bytes) write-thru deactivated]
  | |   o- alua ................................................................................................... [ALUA Groups: 1]
  | |     o- default_tg_pt_gp ....................................................................... [ALUA state: Active/optimized]
  | o- fileio ................................................................................................. [Storage Objects: 0]
  | o- pscsi .................................................................................................. [Storage Objects: 0]
  | o- ramdisk ................................................................................................ [Storage Objects: 0]
  o- iscsi ............................................................................................................ [Targets: 0]
  o- loopback ......................................................................................................... [Targets: 0]
```

To go back to the home directory

```
/backstores/block> cd /
```
#### 5. Creating iSCSI targets

The iSCSI objects that we see in the main list represents iSCSI targets and their properties. Firstly, we will create a simple iSCSI target with default names.

```
/> cd iscsi
```
Here we will now create an iSCSI target by supplying a custom IQN. To perform this, we create the object and specify the name that is usually written to contain the date and the reversed DNS name. Here we have used a sample IQN

```
/backstores/b...block_storage> cd /
/> cd iscsi
/iscsi> create wwn=iqn.2019-06.vn.com.test:sever
Created target iqn.2019-06.vn.com.test:sever.
Created TPG 1.
Global pref auto_add_default_portal=true
Created default portal listening on all IPs (0.0.0.0), port 3260.

```

We can add the description of the target with the `:servers` at the end, indicating that this is a target for the servers.

We can filter what is displayed using the `ls` command by adding the object hierarchy that we want to list. For example, to list targets, we will use the `ls iscsi` command.
The output of this command is shown in the following :
```
/iscsi> ls
o- iscsi .............................................................................................................. [Targets: 1]
  o- iqn.2019-06.vn.com.test:sever ....................................................................................... [TPGs: 1]
    o- tpg1 ................................................................................................. [no-gen-acls, no-auth]
      o- acls ............................................................................................................ [ACLs: 0]
      o- luns ............................................................................................................ [LUNs: 0]
      o- portals ...................................................................................................... [Portals: 1]
        o- 0.0.0.0:3260 ....................................................................................................... [OK]
```
Now we have our customized name for the target, but we still have to add the LUNS or logical units to make the SAN (Storage Area Network) effective.

#### 6. Adding ACL

To create an ACL, we limit the access from LUN to a given initiator name or names that we mention in Access Control List (ACL). The initiator is the iSCSI client and will have a unique client IQN configured on the initiator in the `/etc/iscsi/initiatorname.iscsi `  file.

The filename used to configure the initiator name will be consistent for Linux clients, but will differ for other operating systems. To add an ACL, we will remain with the current configuration hierarchy: `/iscsi/iqn….:servers/tpg1` and issue the following command, again written as a single line:

```
/iscsi> cd iqn.2019-06.vn.com.test:sever/tpg1/acls 
/iscsi/iqn.20...ver/tpg1/acls> create wwn=iqn.2019-06.vn.com.test:node1
Created Node ACL for iqn.2019-06.vn.com.test:node1
/iscsi/iqn.20...ver/tpg1/acls> cd /

```
Using the ls command from this location in the configuration hierarchy, we see the output similar to the following screenshot, which also includes the command to create the ACL:

```
/> ls
o- / ......................................................................................................................... [...]
  o- backstores .............................................................................................................. [...]
  | o- block .................................................................................................. [Storage Objects: 1]
  | | o- block_storage ................................................................ [/dev/sdb1 (0 bytes) write-thru deactivated]
  | |   o- alua ................................................................................................... [ALUA Groups: 1]
  | |     o- default_tg_pt_gp ....................................................................... [ALUA state: Active/optimized]
  | o- fileio ................................................................................................. [Storage Objects: 0]
  | o- pscsi .................................................................................................. [Storage Objects: 0]
  | o- ramdisk ................................................................................................ [Storage Objects: 0]
  o- iscsi ............................................................................................................ [Targets: 1]
  | o- iqn.2019-06.vn.com.test:sever ..................................................................................... [TPGs: 1]
  |   o- tpg1 ............................................................................................... [no-gen-acls, no-auth]
  |     o- acls .......................................................................................................... [ACLs: 1]
  |     | o- iqn.2019-06.vn.com.test:node1 ........................................................................ [Mapped LUNs: 0]
  |     o- luns .......................................................................................................... [LUNs: 0]
  |     o- portals .................................................................................................... [Portals: 1]
  |       o- 0.0.0.0:3260 ..................................................................................................... [OK]
  o- loopback ......................................................................................................... [Targets: 0]
```
#### 7. Adding LUNs to the iSCSI target

Staying with the `targetcli` shell, we will now move on to our target and TPG (Target Portal Group) object. Similar to the filesystem, this is achieved using the `cd` command, as shown in the following command:
```
/> cd iscsi/iqn.2019-06.vn.com.test:sever/tpg1/luns 
```

We have one portal that listens on all IPv4 interfaces on the TCP port 3260. Currently, we have no acls or luns. To add a LUN, we will use the following command, which will utilize the LVM block backstore:

```
/iscsi/iqn.20...ver/tpg1/luns> create /backstores/block/block_storage 
Created LUN 0.
Created LUN 0->0 mapping in node ACL iqn.2019-06.vn.com.test:node1
```

The iSCSI target is now configured. Once you exit the configuration will be saved to `/etc/target/saveconfig.json ` or you can optionally also run `saveconfig` on the terminal.
```
/iscsi/iqn.20...ver/tpg1/luns> exit
Global pref auto_save_on_exit=true
Configuration saved to /etc/target/saveconfig.json
```

#### 8. Update firewall

Now that the iSCSI target has been configured, you need to make sure that it can be accessed through the firewall and that the service is started automatically.
To open port **3260** in the firewall, execute below commands
```
firewall-cmd --add-port=3260/tcp --permanent

firewall-cmd --reload
```
#### 9. Start and enable target service
Now that the iSCSI target has been configured, we need to start and enable the target service
```
systemctl start target

systemctl enable target

```
so we done.
-----------------------
