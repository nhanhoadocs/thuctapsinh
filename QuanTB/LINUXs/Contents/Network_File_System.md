# Network File System (NFS)




## Introduction
NFS ( Network File System ) về cơ bản được phát triển để chia sẻ các tệp và thư mục giữa các hệ thống Linux Unix bởi Sun microsystems vào năm 1980. Nó cho phép bạn gắn kết các hệ thống tệp cục bộ của mình qua mạng và các máy chủ từ xa để tương tác với chúng khi chúng được gắn cục bộ trên cùng một hệ thống.




## Lợi ích của NFS
- NFS cho phép truy cập cục bộ vào các tệp từ xa.
- Nó sử dụng kiến trúc client/server tiêu chuẩn để chia sẻ tệp giữa các máy
- Với NFS , không cần thiết cả hai máy đều chạy trên cùng một hệ điều hành.
- Với sự trợ giúp của NFS, có thể định cấu hình các giải pháp lưu trữ tập trung.
- Người dùng có được dữ liệu của họ bất kể vị trí thực tế.
- Không cần làm mới thủ công cho các tập tin mới.
- Phiên bản mới hơn của NFS cũng hỗ trợ acl, mount root ảo.
- Có thể được bảo mật với Tường lửa và Kerberos.



## Dịch vụ NFS
Đây là một System V-launched. NFS bao gồm `portmap` và `nfs-utils` package:
- portmap: Nó ánh xạ các cuộc gọi được thực hiện từ các máy khác đến dịch vụ RPC chính xác (không bắt buộc với NFSv4 ).
- nfs: Nó dịch các yêu cầu chia sẻ tệp từ xa thành các yêu cầu trên hệ thống tệp cục bộ.
- rpc.mountd: Dịch vụ này có trách nhiệm lắp và unmount toàn bộ các hệ thống tập tin.




## Các tệp quan trọng cho cấu hình NFS
- `/etc/export`: Đây là tệp cấu hình chính của NFS, tất cả các tệp và thư mục đã xuất được xác định trong tệp này ở cuối Máy chủ NFS.
- `/etc/fstab`: Để gắn một thư mục NFS trên hệ thống của bạn trên các lần khởi động lại , chúng ta cần tạo một mục trong `/etc/fstab`.
- `/etc/sysconfig/nfs`: Tệp cấu hình của NFS để kiểm soát cổng rpc và các dịch vụ khác đang nghe.




## Triển khai NFS
### Mô hình lab
Mô hình lab gồm có 2 máy CentOS, một máy đóng vai trò là Client, 1 máy là Server, ta sẽ cài đặt và cấu hình nfs để chia sẽ giữa client và server.

### Ip-Planning
|HostName|Network|Interface|IP Address|Netmask|Gateway|DNS|
|--------|-------|---------|----------|-------|-------|---|
|NFS_Server|VMnet8|ens33|192.168.235.136|24|192.168.235.2|8.8.8.8|
|NFS_Client|VMnet8|ens33|192.168.235.137|24|192.168.235.2|8.8.8.8|



### Cài đặt NFS trên NFS_Client và NFS_Server
`# yum install -y nfs-utils`



### Thiết lập NFS_Server
Đầu tiên ta cần tạo thư mục để chứa các tài nguyên được chia sẻ:

`# mkdir /var/shared/`

Tiếp theo ta cần cấu hình thư mục chia sẻ trong `/etc/exports`, mở `/etc/exports` và thêm vào dòng sau:

`/var/shared 192.168.235.0/24(no_root_squash,no_all_squash,rw,sync)`

Trong đó:
- `/var/shared`: là đường dẫn thư mục được chia sẻ
- `192.168.235.0/24`: là dải ip hoặc ip của client
- `rw`: là quyền truy cập thư mục chia sẻ
- `sync`: đồng bộ hóa thư mục share
- `root_squash`: vô hiệu hóa đặc quyền root
- `no_root_squash`: cho phép đặc quyền root
- `no_all_squash`: cho phép người dùng có quyền truy cập

Tiếp theo ta cần start nfs và rpcbind:

```
# systemctl start rpcbind
# systemctl start nfs-server
# systemctl enable rpcbind
# systemctl enable nfs-server
# systemctl status rpcbind
# systemctl status nfs-server
```

Mở port cho phéo truy cập:

```
[root@nfs_server shared]# firewall-cmd --permanent --add-service=rpc-bind
success
[root@nfs_server shared]# firewall-cmd --permanent --add-service=mountd
success
[root@nfs_server shared]# firewall-cmd --permanent --add-port=2049/tcp
success
[root@nfs_server shared]# firewall-cmd --permanent --add-port=2049/udp
success
[root@nfs_server shared]# firewall-cmd --reload
success
```




### Thiết lập NFS_Client

Đầu tiên ta cần tạo thư mục và mount thư mục shared từ phía server:

```
# mkdir /NFS/
# mount 192.168.235.136:/var/shared /NFS/
# cd /NFS/
# echo 'Data' > Test.txt
```

kiểm tra phía Server:

```
[root@nfs_server ~]# cd /var/shared/
[root@nfs_server shared]# ls -la
total 4
drwxr-xr-x.  2 root root  22 Nov 20 00:52 .
drwxr-xr-x. 20 root root 281 Nov 20 00:13 ..
-rw-r--r--.  1 root root   5 Nov 20 00:51 Test.txt
[root@nfs_server shared]# cat Test.txt
Data
[root@nfs_server shared]#
```


### Cấu hình Client tự động mount thư mục được chia sẻ
Các bước trên đã hoàn thành việc share giữa server và client, tuy nhiên sau khi hệ thống tắt thư mục shared được mount ở phía client sẽ bị mất, để tự động mount mỗi khi khởi động ta cần thêm vào file cấu hình `/etc/fstab` như sau:

```
192.168.235.136:/var/shared/ /NFS/		nfs     defaults 0 0
```