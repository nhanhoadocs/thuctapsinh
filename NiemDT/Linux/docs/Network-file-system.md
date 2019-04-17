# Network File System (NFS)
NFS là dịch vụ chia sẻ tài nguyên. Dịch vụ NFS cho phép chia sẻ tài nguyên cho nhiều người dùng trên cùng mạng và người dùng có thể thao tác với tập tin như trên chính đĩa cứng của mình. 
Để thực hiện được việc này ta cần ít nhất 2 máy chạy hệ điều hành Linux trong đó có một máy đóng vai trò Server và các máy còn lại là các máy Client.
## Các bước cài đặt
### Trên server

Trước tiên ta cần cài `NFS` lên máy. Dùng lệnh:
`yum install nfs-utils nfs-utils-lib`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs1.png)

Ta cần xác định những thư mục ta muốn chia sẻ vơí Client. Sau đó ta phải export thư mục đó để cho phía client có thể truy cập vào.
Để export trên server ta vào file `/etc/exports`
Ta thêm vào file đó với cú pháp sau:
`thư_mục_chia_sẻ IP_client(Các_quyền_truy_cập_từ_Client)`
Ở đây tôi sẽ thực hiện chia sẻ thư mục `Data` cho các máy client. 
`IP_client` có thể là địa chỉ của cả một mạng có thể chỉ là địa chỉ của máy cụ thể. Ở ví dụ này tôi chỉ chia sẻ với máy cụ thể có địa chỉ là `192.168.169.129/24`.
`Các_quyền_truy _cập_từ_Client` có các quyền phổ biến sau:
 * `rw` cho phép client đọc ghi với thư mục
 * `ro` quyền chỉ đọc với thư mục
 * `sync` đồng bộ hóa thư mục dùng chung
 * `root_squash` ngăn remote root users
 * `no_root_squash` cho phép remote root users

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs2.png)

Cần chú ý rằng quyền trên thư mục và quyền bạn cấp ở chỗ export sẽ giao nahu để ra quyền cuối cùng cho client(Tức là nếu trên thư mục bạn cấp cho nhóm người dùng là `other` chỉ có quyền `r` mà ở phần export bạn cấp cho nó là `rw` thì quyền cuối cùng của client chỉ là `r`).

Dùng lệnh `vi /etc/exports` để mở file. Mỗi lần sửa file này xong ta cần dùng lệnh `exportfs -a` thì thay đổi mới được cập nhật.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs3.png)

Có lưu ý rằng khi khai báo quyền truy cập của client ta cần viết liền.Ví dụ trên nếu khai báo `192.168.169.129(rw)` sẽ khác với khai báo `192.168.169.129 (rw)` với cách thứ nhất thì option sẽ áp dụng với địa chỉ khai báo ở trước đó. Còn với cách thứ 2 thì các quyền của địa chỉ khai báo trước sẽ được chỉ định là mặc định(chỉ có quyền đọc) còn option sẽ áp dụng với những địa chỉ không được khai báo.

Để dịch vụ NFS có thể gửi và nhận yêu cầu từ phía Client và Server ta cần khởi động dịch vụ `NFS`. Ta sử dụng câu lệnh
`service nfs start`
Mỗi khi reboot máy ta cần chạy lại lệnh này.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs0.png)

Ta cũng cần kiểm tra trạng thái firewall và tắt nó đi để cho máy client có thể truy cập vào. Ta dùng lệnh:
`systemctl status firewalld` để kiểm tra trạng thái

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs5.png)

`systemctl stop firewalld` để tắt nó

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs6.png)

Với 2 lệnh trên ta cũng phải chạy lại khi reboot.
Ta đã thiết lập xong trên server

### Trên client

Máy client của tôi là máy có địa chỉ IP 192.168.169.129/24 như tôi đã khai báo bên trên.
Ta cũng dùng lệnh `yum install nfs-utils nfs-utils-lib` để cài đặt dịch vụ NFS.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs1.png)

Dùng lệnh `showmount -e IP_server` để kiểm tra những thư mục server đã export cho những máy nào.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs8.png)

Bây giờ ta thực hiện lệnh `mount` để mount nó vào 1 thư mục nào đó trên máý của mình và dùng. Nó giống với ta mount ổ đĩa bình thường.
Cú pháp `mount IP_server:/Thư_mục_chia_sẻ_trên_server Thư_mục_trên_máy_mình`
Ở đây tôi thực hiện mount thư mục `/root/data` trên server có địa chỉ `192.168.169.137` vào thư mục `Data_nfs` trên máy của mình.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/nfs7.png)

Khi không dùng ta có thể umount thư mục đó. Mỗi lần reboot mà muốn sử dụng lại ta phải mount lại. Nếu muốn tự động mount khi hệ thống khởi động ta vào file `/etc/fstab` để thêm thông tin giống với disk.
Lúc này ta coi thư `Data` trên máy server như disk trên máy của mình.