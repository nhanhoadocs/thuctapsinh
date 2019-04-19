## Chuẩn bị phần cứng

Hai máy cài đặt KVM.

Một máy đóng vai trò là NFS server.

![](/KVM/images/migrate1.png)

## Chuẩn bị môi trường

Trên 1 máy KVM cần cài 1 VM để có thể tiến hành migrate VM đó. Ở đây VM tôi cài trên máy 2.

Tắt `firewalld` trên cả 3 máy

`systemctl stop firewalld`

Disable selinux trên 2 máy cài đặt KVM

`setenforce 0`

**Thiết lập kết nối qemu trên cả 2 máy cài KVM**

Trên cả 2 máy vào file `/etc/libvirt/libvirtd.conf` bỏ comment ở các dòng sau

```
listen_tls = 0
listen_tcp = 1
tcp_port = "16509"
listen_addr = "0.0.0.0"
```

Bỏ comment dòng `LIBVIRTD_ARGS=”--listen”` trong file `/etc/sysconfig/libvirtd`

Restart lại libvirtd trên cả 2 máy

```
systemctl restart libvirtd
```

**Thiết lập NFS**

Trên cả 2 máy KVM tạo ra 1 thư mục cùng đường dẫn để khi khơỉ động VM trên cả 2 máy có ddeuf có thể tìm theo đường dẫn đó để đến file images

`mkdir /root/storage`

Sau đó mount thư mục share vào với thư mục vừa tạo bên trên trên 2 máy.

Khi tạo VM ta cần lưu file disk của VM vào mà ta đã mount

**Thiết lập domain name**

Sửa file `/etc/hosts`

File này để phân dải tên miền theo địa chỉ. 

Vd trên máy 192.168.122.219 có tên là `kvm-219` thì trong file `/etc/hosts` của máy cài KVM còn lại phải bỏ sung thêm dòng

```
192.168.122.219   kvm-219.local   kvm-219
```

Và tương tự trên KVM còn lại cũng phải sửa file này

Sau đó reboot máy.

**Migrate**

Kiểm tra VM trên máy `192.168.122.219` 

```
[root@test2 ~]# virsh list --all

 Id    Name                           State
----------------------------------------------------
 5     demo1                          running
```

Tiến hành migrate VM `demo1` từ máy `192.168.122.219` sang máy `192.168.122.118` dùng lệnh

```
virsh migrate --live demo1 qemu+tcp://192.168.122.118/system
```

Kiểm tra VM trên máy `192.168.122.118`

```
[root@test1 qemu]# virsh list --all
 Id    Name                           State
----------------------------------------------------
 5     demo1                          running
```

Khi migrate sang thì VM chỉ tồn tại trên máy đc migrate sang cho đến khi tắt VM đó. Muốn nó ở tồn tại trên host KVM đó thì ta tiến hành copy file xml sang và define file này trên máy KVM này.
