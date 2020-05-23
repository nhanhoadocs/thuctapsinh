# Phân vùng cho KVM Slave

Ở đây, ta có 2 disk là vda(50G) và vdb(50G). 

The physical extent size nên để là 32M chứ không để mặc định là 4M

<img src= "..\images\Screenshot_1.png">

```
# lsblk
# pvcreate /dev/vdb
# vgcreate -s 32M solusvm /dev/vdb
# vgs
```