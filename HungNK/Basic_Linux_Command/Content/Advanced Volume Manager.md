# Tăng, giảm dung lượng LVM mà không làm mất dữ liệu

## Tăng dung lượng của Logical Volume

kiểm tra dung lượng 

```
#pvs
#vgs
#lvs
#df -h
```

![](../Picture/lvmadvan1.png)

mở rộng volume group :

```
# vgextend vgOne /dev/sdd1
```

![](../Picture/lvmadvan2.png)

kiểm tra bằng câu lệnh
```
vgs
pvs
pvscan
```

dùng câu lệnh `vgdisplay` để kiểm tra xem có thể mở rộng ra thêm bao nhiêu PE
ở đây phần còn dư có thể mở rộng thêm là 255 PE

    Free  PE / Size       255 / 1020.00 MiB


![](../Picture/lvmadvan3.png)

do đó chúng ta có thể mở rộng thêm 255 PE

```
# lvextend -l +255 /dev/vgOne/linearLv
```

sau đó chúng ta phải cập nhật thay đổi vừa rồi ( mở rộng ) vào trong file-system
```
# resize2fs /dev/vgOne/linearLv
```
![](../Picture/lvmadvan4.png)

sau đó kiểm tra lại
```
# lvdisplay
# vgdisplay
# pvs
# vgs
# lvs
```

chúng ta sẽ thấy sự thay đổi thành công, FREE PE sẽ bằng 0

![](../Picture/lvmadvan5.png)


Vậy là chúng ta đã mở rộng thành công mà không bị làm mất dữ liệu. 

-------------------------------
## Giảm dung lượng của Logical Volume

những lưu ý khi giảm dung lượng

- back-up data để lỡ có làm sai thì không bị mất dữ liệu
- có 5 bước
- While extending a volume we can extend it while the volume under mount status (online), but for reduce we must need to unmount the file system before reducing.

**5 bước để giảm dung lượng LVM**
- unmount the file system for reducing.
- Check the file system after unmount.
- Reduce the file system.
- Reduce the Logical Volume size than Current size.
- Recheck the file system for error.
- Remount the file-system back to stage.


kiểm tra dung lượng của LV

![](../Picture/lvmadvan6.png)

thông số ở đây
Size = 3.9G
Used = 12M
Avail = 3.7G

tôi sẽ giảm đi 1.98G , từ 3.98G -> 2G

Đầu  tiên, chúng ta unmount
```
# umount -v /dev/vgOne/linearLv
```
![](../Picture/lvmadvan7.png)


Sau đó kiểm tra xem có lỗi file system ko
```
# e2fsck -ff /dev/vgOne/linearLv
```
![](../Picture/lvmadvan8.png)

Note: Must pass in every 5 steps of file-system check if not there might be some issue with your file-system

Sau đó, lưu thay đổi ở file-system.
```
# resize2fs /dev/vgOne/linearLv 2G
```
![](../Picture/lvmadvan9.png)


Giảm Logical volume sử dụng GB size.
```
# lvreduce -L -1.98G /dev/vgOne/linearLv
```
![](../Picture/lvmadvan10.png)

Re-size the file-system back, In this step if there is any error that means we have messed-up our file-system.
```
# resize2fs /dev/vgOne/linearLv
```
![](../Picture/lvmadvan11.png)

Mount file-system lái như lúc ban đầu.
```
# mount /dev/vgOne/linearLv linear
```

kiểm tra lại size của LV
```
# lvdisplay /dev/vgOne/linearLv
```
vậy là chúng ta đã giảm kích cỡ LV thành công. Chúng ta có thể cắt 1 Physical Volume ra khỏi Volume Group 

![](../Picture/lvmadvan12.png)


tài liệu tham khảo xem tại [đây](https://www.tecmint.com/extend-and-reduce-lvms-in-linux/)