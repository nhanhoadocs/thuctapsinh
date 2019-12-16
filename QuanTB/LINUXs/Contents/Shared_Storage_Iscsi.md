# Shared storage on the network with iSCSI


## Introduction
Có nhiều cách để chia sẻ lưu trữ trên mạng tồn tại. Giao thức iSCSI định nghĩa một cách để xem thiết bị chặn từ xa dưới dạng đĩa cục bộ. Một thiết bị từ xa trên mạng được gọi là iSCSI Target, một máy khách kết nối với iSCSI Target được gọi là iSCSI Initiator.


## Mô hình lab
Mô hình lab bao gồm hai máy CentOS, 1 máy đóng vai trò là srorage server (target), máy còn lại sẽ đóng vai trò là Initiator.



### Ip-Planning
|HostName|Network|Interface|IP Address|Netmask|Gateway|DNS|
|--------|-------|---------|----------|-------|-------|---|
|ISCSI_Target|VMnet8|ens33|192.168.235.140|24|192.168.235.2|8.8.8.8|
|ISCSI_Initator|VMnet8|ens33|192.168.235.141|24|192.168.235.2|8.8.8.8|



## Cấu hình trên máy Target

### Create a Backstore
```
/> /backstores/block create name=Block_Storage dev=/dev/sdb
Created block storage object Block_Storage using /dev/sdb.
/>
```






### Create an iSCSI Target
```
/> iscsi/ create iqn.2019-11.com.nhanhoa.toor:3260
Created target iqn.2019-11.com.nhanhoa.toor:3260.
Created TPG 1.
Global pref auto_add_default_portal=true
Created default portal listening on all IPs (0.0.0.0), port 3260.
/>
```






### Configure an iSCSI Portal
iSCSI Portal là một đối tượng chỉ định địa chỉ IP và cổng nơi mục tiêu iSCSI lắng nghe các kết nối đến

```
/> iscsi/iqn.2019-11.com.nhanhoa.toor:3260/tpg1/portals/ create
Using default IP port 3260
Binding to INADDR_ANY (0.0.0.0)
Created network portal 0.0.0.0:3260
```




### Configure Access List



### Configure the LUNs

```
/> iscsi/iqn.2019-11.com.nhanhoa.toor:3260/tpg1/luns create /backstores/block/Block_Storage
Created LUN 0.
/> ls
o- / ......................................................................................................................... [...]
  o- backstores .............................................................................................................. [...]
  | o- block .................................................................................................. [Storage Objects: 1]
  | | o- Block_Storage ................................................................... [/dev/sdb (50.0GiB) write-thru activated]
  | |   o- alua ................................................................................................... [ALUA Groups: 1]
  | |     o- default_tg_pt_gp ....................................................................... [ALUA state: Active/optimized]
  | o- fileio ................................................................................................. [Storage Objects: 0]
  | o- pscsi .................................................................................................. [Storage Objects: 0]
  | o- ramdisk ................................................................................................ [Storage Objects: 0]
  o- iscsi ............................................................................................................ [Targets: 1]
  | o- iqn.2019-11.com.nhanhoa.toor:3260 ................................................................................. [TPGs: 1]
  |   o- tpg1 ............................................................................................... [no-gen-acls, no-auth]
  |     o- acls .......................................................................................................... [ACLs: 0]
  |     o- luns .......................................................................................................... [LUNs: 1]
  |     | o- lun0 .............................................................. [block/Block_Storage (/dev/sdb) (default_tg_pt_gp)]
  |     o- portals .................................................................................................... [Portals: 1]
  |       o- 0.0.0.0:3260 ..................................................................................................... [OK]
  o- loopback ......................................................................................................... [Targets: 0]
/>
```





## Cấu hình trên máy Initiator


### Cài đặt công cụ quản trị
Đầu tiên ta cần cài đặt các công cụ để có thể làm việc với initiator:

`# yum install iscsi-initiator-utils`

Sau khi cài đặt xong ta cần start dịch vụ `iscsi` và `iscsid` lên:

```
[root@iscsi_initator ~]# systemctl start iscsi
[root@iscsi_initator ~]# systemctl start iscsid
[root@iscsi_initator ~]# systemctl enable iscsi
[root@iscsi_initator ~]# systemctl enable iscsid
Created symlink from /etc/systemd/system/multi-user.target.wants/iscsid.service to /usr/lib/systemd/system/iscsid.service.
[root@iscsi_initator ~]# systemctl status iscsi
● iscsi.service - Login and scanning of iSCSI devices
   Loaded: loaded (/usr/lib/systemd/system/iscsi.service; enabled; vendor preset: disabled)
   Active: inactive (dead)
Condition: start condition failed at Wed 2019-11-20 05:10:18 EST; 32s ago
     Docs: man:iscsid(8)
           man:iscsiadm(8)
[root@iscsi_initator ~]# systemctl status iscsid
● iscsid.service - Open-iSCSI
   Loaded: loaded (/usr/lib/systemd/system/iscsid.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2019-11-20 05:08:15 EST; 2min 39s ago
     Docs: man:iscsid(8)
           man:iscsiadm(8)
   CGroup: /system.slice/iscsid.service
           ├─1678 /usr/sbin/iscsid
           └─1679 /usr/sbin/iscsid

Nov 20 05:08:15 iscsi_initator systemd[1]: Starting Open-iSCSI...
Nov 20 05:08:15 iscsi_initator systemd[1]: Failed to parse PID from file /var/run/iscsid.pid: Success
Nov 20 05:08:15 iscsi_initator systemd[1]: Started Open-iSCSI.
Nov 20 05:08:15 iscsi_initator iscsid[1678]: iSCSI daemon with pid=1679 started!
[root@iscsi_initator ~]#
```

Discovery target để kết nối:

```

```