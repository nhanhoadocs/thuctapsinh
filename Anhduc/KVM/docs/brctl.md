## Khái niệm 
- `brctl` : Được dùng để tạo và thao tác với bridge ethernet  
## a) Hiển thị bridge ethernet có sẵn 
```
brctl show
```
```
[root@localhost ~]# brctl show
bridge name	bridge id		STP enabled	interfaces
virbr0		8000.525400e13858	yes		virbr0-nic
```
- Trong `brctl show`
    - Bridge name : Tên của bridge 
    - bridge id : ID của bridge 
    - STP enabled : Giao thức Spanning Tree 
    - interfaces :  interface gắn vào bridge
## b) Tạo một bridge ethernet 
```
brctl addbr (tên bridge)
```
- Ta hãy thêm bridge  `br0` và kiểm tra lại nó bằng lệnh show ở trên 
```
[root@localhost ~]# brctl addbr br0
[root@localhost ~]# brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.000000000000	no		
virbr0		8000.525400e13858	yes		virbr0-nic
```
## c) Xóa một bridge ethernet 
```
brctl delbr (tên bridge)
```
- Ta xóa một bridge vừa tạo ra rồi dùng lệnh show để kiểm tra lại 
```
[root@localhost ~]# brctl delbr  br0
[root@localhost ~]# brctl show
bridge name	bridge id		STP enabled	interfaces
virbr0		8000.525400e13858	yes		virbr0-nic
```
## d) Thêm một if cho bridge 
```
brctl addif (tên bridge) (tên card)
```
- Ta sẽ add bridge (br0) vào if ens9  rồi kiểm tra nó bằng lệnh show ở bên trên 
```
[root@localhost ~]# brctl addif br0 ens9
[root@localhost ~]# brctl show 
bridge name	bridge id		STP enabled	interfaces
br0		8000.5254006a622d	no		ens9
virbr0		8000.525400e13858	yes		virbr0-nic
```
## e) Xem địa chỉ MAC của bridge 
```
brctl showmacs (tên bridge )
```
- ta sẽ xem địa chỉ MAC của ens3 và kiểm tra nó bằng lệnh IP a xem có giống nhau không 
```
[root@localhost ~]# brctl showmacs br0
port no	mac addr		is local?	ageing timer
  1	52:54:00:6a:62:2d	yes		   0.00
  1	52:54:00:6a:62:2d	yes		   0.00
```
## f) Thiết lập thời gian hết hạn cho bridge 
```
brctl setaging (tên bridge) (time (s))
```
## g) Tắt và bật giao thức Spanning Tree
```
brctl stp (Tên bridge) on
brctl stp  (Tên bridge)yes
```
```
[root@localhost ~]# brctl stp br0 on 
[root@localhost ~]# brctl stp br0 yes
[root@localhost ~]# brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.5254006a622d	yes		ens9
virbr0		8000.525400e13858	yes		virbr0-nic
```
```
brctl stp (Tên bridge) off
```
```
[root@localhost ~]# brctl stp br0 off
[root@localhost ~]# brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.5254006a622d	no		ens9
virbr0		8000.525400e13858	yes		virbr0-nic
```
- Nếu sau một khoảng thời gian time(s) mà không thấy được frame cho bridge thì địa chỉ MAC của client sẽ bị xóa cơ sở dữ liệu chuyển tiếp
