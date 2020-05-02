# Network File System (NFS)

## Giới thiệu
NFS ( Network File System ) về cơ bản được phát triển để chia sẻ các tệp và thư mục giữa các hệ thống Linux Unix bởi Sun microsystems vào năm 1980. Nó cho phép bạn gắn kết các hệ thống tệp cục bộ của mình qua mạng và các máy chủ từ xa để tương tác với chúng khi chúng được gắn cục bộ trên cùng một hệ thống.

## Lợi ích của NFS
- NFS cho phép truy cập cục bộ vào các tệp từ xa.
- Nó sử dụng kiến trúc client/server tiêu chuẩn để chia sẻ tệp giữa các máy
- Với NFS , không cần thiết cả hai máy đều chạy trên cùng một hệ điều hành.
- Với sự trợ giúp của NFS, có thể định cấu hình các giải pháp lưu trữ tập trung.
- Người dùng có được dữ liệu của họ bất kể vị trí thực tế.
- Không cần làm mới thủ công cho các tập tin mới.
- Phiên bản mới hơn của NFS cũng hỗ trợ *acl*, *mount root* ảo.
- Có thể được bảo mật với Tường lửa và [Kerberos](https://vi.wikipedia.org/wiki/Giao_th%E1%BB%A9c_Kerberos).

## Dịch vụ NFS
Đây là một System V-launched. NFS bao gồm `portmap` và `nfs-utils package`:

- `portmap`: Nó ánh xạ các cuộc gọi được thực hiện từ các máy khác đến dịch vụ RPC chính xác (không bắt buộc với NFSv4 ).
- `nfs`: Nó dịch các yêu cầu chia sẻ tệp từ xa thành các yêu cầu trên hệ thống tệp cục bộ.
- `rpc.mountd`: Dịch vụ này có trách nhiệm lắp và unmount toàn bộ các hệ thống tập tin.

## Các tệp quan trọng cho cấu hình NFS
- `/etc/export`: Đây là tệp cấu hình chính của NFS, tất cả các tệp và thư mục đã xuất được xác định trong tệp này ở cuối Máy chủ NFS.
- `/etc/fstab`: Để gắn một thư mục NFS trên hệ thống của bạn trên các lần khởi động lại , chúng ta cần tạo một mục trong /etc/fstab.
- `/etc/sysconfig/nfs`: Tệp cấu hình của NFS để kiểm soát cổng rpc và các dịch vụ khác đang nghe.

## Triển khai NFS
### Mô hình
2 máy CentOS-7:
- Client
- Server

Cài đặt và cấu hình NFS để chia sẻ giữa Client với Server.

### Cài đặt NFS trên NFS_Client và NFS_Server
`$ sudo yum install -y nfs-utils`

### IP của 2 máy
Cấu hình IP 2 máy Client và Server:
|Hostname|Network|Interface|IP Address|NetMask|Gateway|DNS|
|-|-|-|-|-|-|-|
|Client|VMnet8|ens33|192.168.37.21|24|192.168.37.1|8.8.8.8|
|Server|VMnet8|ens33|192.168.37.22|24|192.168.37.1|8.8.8.8|

### Thiết lập NFS_Server

Ta tạo 1 thư mục chứa tài nguyên chia sẻ:

`$ sudo mkdir /var/shared/`

Cấu hình thư mục chia sẻ : `/etc/exports`, mở `/etc/export` và thêm vào dòng sau:

`/var/shared 192.168.37.0/24(no_root_squash,no_all_squash,rw,sync)`

Trong đó:

- `/var/shared`: là đường dẫn thư mục được chia sẻ
- `192.168.37.0/24`: là dải ip hoặc ip của client
- `rw`: là quyền truy cập thư mục chia sẻ
- `sync`: đồng bộ hóa thư mục share
- `root_squash`: vô hiệu hóa đặc quyền root
- `no_root_squash`: cho phép đặc quyền root
- `no_all_squash`: cho phép người dùng có quyền truy cập

Start `nfs` và `rpcbind`:
```
$ sudo systemctl start rpcbind
$ sudo systemctl start nfs-server
$ sudo systemctl enable rpcbind
$ sudo systemctl enable nfs-server
$ sudo systemctl status rpcbind
$ sudo systemctl status nfs-server
```

Mở port cho phép truy cập (Đọc thêm chi tiết tại [đây](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/storage_administration_guide/s2-nfs-nfs-firewall-config))
```
$ sudo firewall-cmd --permanent --add-service=rpc-bind
success
$ sudo firewall-cmd --permanent --add-service=mountd
success
$ sudo firewall-cmd --permanent --add-port=2049/tcp
success
$ sudo firewall-cmd --permanent --add-port=2049/udp
success
$ sudo firewall-cmd --reload
success
```

### Thiết lập NFS_Client
Ta tạo 1 thư mục `NFS` và **mount** thư mục `shared` từ phía Server
```
[client@localhost ~]$ mkdir /NFS/
[client@localhost ~]$ mount 192.168.37.22:/var/shared /NFS/
```

Tạo 1 tập tin `Test.txt` trong thư mục `NFS`:

`[client@localhost NFS]$ touch Test.txt`  

Với nội dung:
```
Test
Data
NFS
```

Kiểm tra phía Server:
```
[server@localhost ~]$ cd /var/shared
[server@localhost shared]$ ll
total 4
-rw-r--r--. 1 root root 16 Dec 12 16:20 Test.txt
[server@localhost shared]$ cat Test.txt
Test

Data

NFS
```

### Cấu hình Client tự động mount thư mục được chia sẻ
Các bước trên đã hoàn thành việc share giữa Server và Client, tuy nhiên sau khi hệ thống tắt thư mục shared được `mount` ở phía Client sẽ bị mất, để tự động mount mỗi khi khởi động ta cần thêm vào file cấu hình `/etc/fstab` như sau:

`192.168.37.22:/var/shared/ /NFS/		nfs     defaults 0 0`