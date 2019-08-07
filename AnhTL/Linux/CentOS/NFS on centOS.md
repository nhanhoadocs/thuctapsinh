# NFS (Network File System)

### Mục Lục
[1. Khái niệm](#1)

[2. cách cài đặt](#2)

[3. Thực hành](#3)

[- server](#3.1)

[- Client](#3.2)

[4. Tóm tắt](#4)


### <a name="1"> 1. Khái niệm </a>
- Dịch vụ NFS cho phép chia sẻ tập tin cho nhiều người dùng trên cùng mạng và ta có thể thao tác như tập tin trên chính đĩa cứng của mình.
- Cần làm được việc này thì sẽ phải có hai máy chạy hệ điều hành linux
  - một máy đóng vai trò là server.
  - một máy đóng vai trò client.

### <a name="2"> 2. Cách cài đặt </a>
- Đối với hệ thống centOS thì ta dùng lệnh:
```
yum install nfs-utils nfs-utils-lib
```
### <a name="3"> 3. Thực hành </a>
- Ví dụ:  Đây là địa chỉ ip của 2 máy.
  - IP server: 192.168.169.137/24
  - IP client: 192.168.169.129/24
  
<a name="3.1"> **Trên máy server:** </a>

  - Ta xác định những thư mục mà ta muốn chia sẻ với client. Rồi ta chia sẻ bằng cách sửa file /etc/exports bằng trình soạn thảo vi:
```
 vi /etc/exports
```
  - Cấu trúc để cài đặt thư mục và file chia sẻ trong file exports là:
    - VD: ta muốn chia sẻ thư mục /root/test cho máy client với quyền đọc, viết.
```
/root/test 192.168.169.129(rw)
```
Sau khi chia sẻ thư mục xong ta cần dùng lệnh ``exportfs -a`` để lưu.
```
exportfs -a
```
  - Cần chú ý rằng quyền trên thư mục và quyền bạn cấp ở chỗ export sẽ giao nhau để ra quyền cuối cùng cho client (Tức là nếu trên thư mục bạn cấp cho nhóm người dùng là other chỉ có quyền **r** mà ở phần export bạn cấp cho nó là **rw** thì quyền cuối cùng của client chỉ là **r**).
  - khi khai báo quyền truy cập của client ta cần viết liền. Ví dụ trên nếu khai báo 192.168.169.129(rw) sẽ khác với khai báo 192.168.169.129 (rw) với cách thứ nhất thì option sẽ áp dụng với địa chỉ ip khai báo ở trước đó. Còn với cách thứ 2 thì các quyền của địa chỉ khai báo trước sẽ được chỉ định là mặc định(chỉ có quyền đọc) còn option sẽ áp dụng với những địa chỉ không được khai báo.
  - Có thể có các quyền sau:
    - (rw): cho phép client đọc ghi với thư mục.
    - (ro): quyền chỉ đọc với thư mục.
    - (sync): đồng bộ hóa thư mục dùng chung.
    - (root_squash) ngăn remote root users.
    - (no_root_squash) cho phép remote root users .
  - Để có thể sử dụng được dịch vụ NFS có thể gửi và nhận yêu cầu từ phía client và server ta cần khởi động dịnh vụ nfs.
```
service nfs start
```
![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/nfs0.png)

  - Để các client cùng truy cập vào server thì máy server cần tắt tường lửa:
![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/nfs5.png)
```
systemctl stop firewalld
```
- Để kiểm tra trạng thái firewall ta dùng lệnh:
```
systemctl status firewalld
```
![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/nfs6.png)

<a name="3.2"> **Trên máy client:** </a>
- Ta cũng cài đặt dịch vụ NFS
```
 yum install nfs-utils nfs-utils-lib 
```
![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/nfs1.png)

- Dùng lệnh ``showmount -e IP_server`` để kiểm tra những thư mục mà server đã export cho những máy nào.
```
showmount -e 192.168.169.137
```
![](https://github.com/niemdinhtrong/NIEMDT/raw/master/linux/images/nfs8.png)

- Bây giờ ta thực hiện lệnh ``mount`` để mount nó vào 1 thư mục nào đó thì mới có thể sử dụng được thư mục mà server đã exports. Giống như ta mount ổ cứng bình thường: ``mount ip_server:/thư_mục_exports /thư_mục_cần_mount_tới``. Ở đây ta sẽ mount thư mục mà ta vừa showmount ra thư mục home:
```
mount -t nfs 192.168.169.137:/home/kt1 /home
```
- Dùng lệnh `` df -h `` để check xem đã mount được chưa:

```
df -h
```
- Khi không dùng ta có thể umount thư mục đó. Mỗi lần reboot mà muốn sử dụng lại ta phải mount lại. Nếu muốn tự động mount khi hệ thống khởi động ta vào file ``/etc/fstab`` để thêm thông tin giống với disk. Lúc này ta coi thư Data trên máy server như disk trên máy của mình.

### <a name="4"> 4. Tóm tắt các bước: </a>
**Phía Server:**

B1: ``yum install nfs-utils nfs-utils-lib``

B2: viết những thư mục mà ta muốn chia sẻ với client vào ``vi /etc/exports``
- VD: /home/test 192.168.169.129(rw)

B3: ``exportfs -a``

B4: ``service nfs start``

B5: ``systemctl stop firewalld``

**Phía Client:**

B1: `` yum install nfs-utils nfs-utils-lib ``

B2: ``showmount -e 192.168.169.137``

B3: ``mount 192.168.169.137:/home/kt1 /home``
# END
