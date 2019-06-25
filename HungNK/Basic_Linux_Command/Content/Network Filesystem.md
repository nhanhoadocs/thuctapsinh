# Network File System

## Network File System là gì

- NFS ( Network File System ) là dịch vụ chia sẻ file trong môi trường network giữa các sever `Linux`. NFS cho phép chia sẻ tập tin cho nhiều người dùng trên cùng mạng và người dùng có thể thao tác như với tập tin trên chính đĩa cứng của mình.

- NFS là một giao thức cho phép một máy tính nào đó truy cấp một đĩa hoặc một máy tính khác trong cùng một mạng ở chế độ trong suốt. Dịch vụ NFS cho phép các NFS client mount một phân vùng của NFS server như phân vùng cục bộ của nó.

- Dịch vụ NFS không được security nhiều, vì vậy cần thiết phải tin tưởng các client được permit mount các phân vùng của NFS server.

- Hiện tại có 3 phiên bản NFS là NFSv2, NFSv3 và NFSv4.

## Hướng dẫn 

Vậy chúng ta đã biết NFS là gì. Và ở phần tiếp theo chúng ta sẽ đi hiện thực hóa nó. Sau đây là những thứ chúng ta cần chuẩn bị 

- Máy ảo VMWare , sử dụng 2 máy ảo Centos 7
    - máy Sever : địa chỉ IP : 
- Sử dụng mạng ở chế độ NAT

## Các bước cài đặt

### Trên sever:

Trước tiên ta cần cài NFS lên máy. Dùng lệnh: 
```
yum install nfs-utils nfs-utils-lib
```

Ta cần xác định những thư mục ta muốn chia sẻ vơí Client. Sau đó ta phải export thư mục đó để cho phía client có thể truy cập vào. Để export trên server ta vào file `/etc/exports` Ta thêm vào file đó với cú pháp sau: 
```
thư_mục_chia_sẻ IP_client(Các_quyền_truy_cập_từ_Client) 
```
Ở đây tôi sẽ thực hiện chia sẻ thư mục Data cho các máy client. IP_client có thể là địa chỉ của cả một mạng có thể chỉ là địa chỉ của máy cụ thể. Ở ví dụ này tôi chỉ chia sẻ với máy cụ thể có địa chỉ là `192.168.52.129/24`. 

Các_quyền_truy _cập_từ_Client có các quyền phổ biến sau:

- rw cho phép client đọc ghi với thư mục
- ro quyền chỉ đọc với thư mục
- sync đồng bộ hóa thư mục dùng chung
- root_squash ngăn remote root users
- no_root_squash cho phép remote root users

***CHÚ Ý: Cần chú ý rằng quyền trên thư mục và quyền bạn cấp ở chỗ export sẽ giao nahu để ra quyền cuối cùng cho client***

(Tức là nếu trên thư mục bạn cấp cho nhóm người dùng là `other` chỉ có quyền `r` mà ở phần export bạn cấp cho nó là `rw` thì quyền cuối cùng của client chỉ là `r`).

Ví dụ :
```
mkdir /var/home_sharing
chmod 777 /var/home_sharing/
```

Dùng lệnh `vi /etc/exports` để mở file. Mỗi lần sửa file này xong ta cần dùng lệnh `exportfs -a` thì thay đổi mới được cập nhật. Thêm vào file dòng dưới đây :

```
/var/home_sharing   192.168.52.169/24(rw,sync,no_root_squash)
```
***LƯU Ý***

Có lưu ý rằng khi khai báo quyền truy cập của client ta cần viết liền.Ví dụ trên nếu khai báo `192.168.169.129(rw)` sẽ khác với khai báo `192.168.169.129 (rw)`.

Với cách thứ nhất thì option sẽ áp dụng với địa chỉ khai báo ở trước đó. Còn với cách thứ hai thì các quyền của địa chỉ khai báo trước sẽ được chỉ định là mặc định(chỉ có quyền đọc) còn option sẽ áp dụng với những địa chỉ không được khai báo.

Để dịch vụ NFS có thể gửi và nhận yêu cầu từ phía Client và Server ta cần khởi động dịch vụ NFS. Ta sử dụng câu lệnh `service nfs start` Mỗi khi reboot máy ta cần chạy lại lệnh này.


Ta cũng cần kiểm tra trạng thái firewall và tắt nó đi để cho máy client có thể truy cập vào. Ta dùng lệnh: `systemctl status firewalld` để kiểm tra trạng thái. 

Nếu chưa được tắt ta dùng lệnh sau đẻ tắt :
```
systemctl stop firewalld
```

Với 2 lệnh trên ta cũng phải chạy lại khi reboot. Ta đã thiết lập xong trên Server

### Trên Client

Ta dùng lệnh:
```
yum install nfs-utils nfs-utils-lib 
```
để cài đặt dịch vụ NFS.

Dùng lệnh `showmount -e IP_server` để kiểm tra những thư mục server đã export cho những máy nào.

```
showmount -e 192.168.52.81
```

Bây giờ ta thực hiện lệnh `mount` để mount nó vào 1 thư mục nào đó trên máý của mình và dùng. Nó giống với ta mount ổ đĩa bình thường. Cú pháp mount `IP_server:/Thư_mục_chia_sẻ_trên_server Thư_mục_trên_máy_mình`. Ở đây tôi thực hiện mount thư mục `/var/home_sharing` trên server có địa chỉ 192.168.52.81 vào thư mục `clinet_home_sharing` trên máy của mình.
```
mount 192.168.52.81:/var/home_sharing /client_home_sharing
```
Khi không dùng ta có thể umount thư mục đó. Mỗi lần reboot mà muốn sử dụng lại ta phải mount lại. Nếu muốn tự động mount khi hệ thống khởi động ta vào file `/etc/fstab` để thêm thông tin giống với disk. Lúc này ta coi thư mục `home_sharing` trên máy server như disk trên máy của mình.

```
vi /etc/fstab
```

```
#
# /etc/fstab
# Created by anaconda on Tue Aug 19 12:15:24 2014
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos-root /                       xfs     defaults        1 1
UUID=2ba8d78a-c420-4792-b381-5405d755e544 /boot                   xfs     defaults        1 2
/dev/mapper/centos-swap swap                    swap    defaults        0 0
192.168.52.81:/var/home_sharing/ /clinet_home_sharing/ nfs rw,sync,hard,intr 0 0

Reboot the client system and check the share whether it is automatically mounted or not.
```
Sau đó dùng lệnh này để kiểm tra
```
mount
```
càedit
Nguồn tham khảo :

https://www.unixmen.com/setting-nfs-server-client-centos-7/

https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Linux/docs/Network-file-system.md

https://adminvietnam.org/network-file-system-tren-ubuntu/166/c

http://thonghoang.com/linux/dich-vu-file-tren-linux-nfs-va-samba-server.html