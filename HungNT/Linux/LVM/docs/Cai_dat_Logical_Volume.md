# LOGICAL VOLUME  

1. Cài đặt Linear :  
Linear là mặc định của các logical volume khi được tạo . Xem bài viết sau  
/Linux/LVM/docs/Tim_Hieu_LVM.md

2. Cài đặt Striped:  
Từ Volume group được tạo trước , ta dùng lệnh sau :  
```
lvcreate -L 500M -i2 -n lv-strip vg1
```  
Chú ý:  
 -L dung lượng tạo logical volume , ở đây là 500MB  
 -i2 số physical volume ta ghi vào khi sử dụng striped,  ở đây khi dữ liệu được ghi vào sẽ chia vào 2 physical volume  

<img src="https://i.imgur.com/2azZccY.png">
Ta có thể kiểm tra bằng các lệnh :  

```
pvdisplay -m

lvs --segments


```
<img src="https://i.imgur.com/QKoXkYQ.png">  
<img src="https://i.imgur.com/XSPGIox.png">  
Logical volume có type là striped .  

3. Cài đặt Mirror:  
 Tương tự như striped , ta tạo logical volume từ volume group đã được tạo trước bằng lệnh :  
 ```
 lvcreate -L 500M -m1 -n mirrorlv vg1
 ```  
 Trong đó :  
 -L dung lượng Logical volume
 -m1 số mirror lưu ,ở đây ta tạo 2 mirror lưu vào 2 ổ 
 <img src="https://i.imgur.com/pibr7WC.png">  
 Kiểm tra bằng các lệnh tương tự như của striped:  
   <img src="https://i.imgur.com/anh1PEp.png">  
   Ta thấy type là Raid1 , tức là logical volume mirror đã được cài đặt thành công.
