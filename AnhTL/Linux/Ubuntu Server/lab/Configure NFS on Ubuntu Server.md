# Configure NFS on Ubuntu 18.04 LTS

- Ta có mô hình:

![](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/65550546_476633782883165_6427367723231084544_n.png?_nc_cat=101&_nc_oc=AQlGdmuNoNrUnKk5YvIdwqaxLXH4aKQRGMjpZa8Ff85kBcxQahjUoakPd10osDVrubQ&_nc_ht=scontent.fhan5-5.fna&oh=e474f423397a9987f9fc0e9c15f9bc9e&oe=5DB02E6A)

**Phía Server**
- **B1**: Để có thể chia sẻ thư mục, bước đầu tiên ta cần tắt firewall.
```
ufw disable
```

Để bật lại ta dùng lệnh:
```
ufw enable
```

Để xem trạng thái ta dùng lệnh:
```
ufw status
```
- **B2**: Cài đặt NFS ta dùng lệnh:
```
apt -y install nfs-kernel-server
```
- **B3**: Viết đường dẫn thư mục, file cần share vào file ``/etc/exports``
```
vi /etc/exports
```
Ví dụ: Ta share thư mục /test đến địa chỉ ip client. 
![](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/65569493_465170757627033_1423138637595279360_n.png?_nc_cat=111&_nc_oc=AQkF4-DniwG-L7QvLszKjsZ3d7y78ynpCmZnb1vzt0axqS-SkfAgkGoCswwZbmPvSQ4&_nc_ht=scontent.fhan5-3.fna&oh=fa3b056553a6b6c4e1b675d041bba550&oe=5DB3F5CC)

Còn nếu muốn share cho tất cả các máy client khác trong cùng dải mạng thì ta sửa địa chỉ ip là: ``192.168.230.0``

Các option trong ngoặc là các quyền của thư mục mà **server NFS** cho phép **Client NFS** thao tác trên thư mục đó.
![](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/65672552_612250205934877_5729270520692604928_n.png?_nc_cat=110&_nc_oc=AQn4Wp4PkrYEf7NwI6DREFdzeYkzOHLDYBEPP0K2Ev0CLI8da0p3dIVTyJrv-YlsRfc&_nc_ht=scontent.fhan5-2.fna&oh=4092a15d5e3b78afea493827f75f7f9f&oe=5DBDB2F1)

Các option hay dùng:
![](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/65671578_701868550266208_4139816537349423104_n.png?_nc_cat=106&_nc_oc=AQkL7uOv375NOm5T3etgG9jUdpfhCO2LvwA5GIY_SvrpSF9tzyHgG6yavOyWuPtyb6w&_nc_ht=scontent.fhan5-3.fna&oh=5da0e07cf3ecc8ecb54624e3c24e1d28&oe=5D7A9FA8)

Vẫn còn khá nhiều option khác.

Sau khi đã xác định xong các thư mục mà ta muốn share, ta dùng lệnh `` exportfs -a`` để lưu thay đổi 
```
exportfs -a
```

- **B4**: Sau khi đã lưu thay đổi thì ta cần khởi động lại máy chủ NFS:
```
systemctl restart nfs-server
```

**Phía Client**
- **B1**: Cài đặt NFS
```
apt -y install nfs-common
```

- **B2**: Để kiểm tra xem server đã share những thư mục nào ta dùng lệnh:
```
 showmount -e 192.168.230.141
```

![](https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/65822895_1048867435502662_2084921728437321728_n.png?_nc_cat=109&_nc_oc=AQn8byyhZLMc98jRxhOBdKMeE0oF98v8AFSCnYW37brvTbD5kH1ilDPy35MoRZf4bTs&_nc_ht=scontent.fhan5-1.fna&oh=ecd71ee416dbc50230cdd1aaa85e504e&oe=5DAEB9C3)

Địa chỉ IP ở trên là địa chỉ ip của **Server NFS**

- **B3**: Ta cần mount và thư mục vừa được Server chia sẻ vào 1 thư mục khác để có thể sử dụng:
  - VD: ta mount vào thư mục /trap
```
mount -t nfs 192.168.230.141:/test2 /trap
```
Sau đó dùng lệnh ``df -hT`` để kiểm tra xem đã mount thành công hay chưa:
```
df -hT
```
![](https://scontent.fhan5-4.fna.fbcdn.net/v/t1.15752-9/65454801_508824939685445_658591036787916800_n.png?_nc_cat=104&_nc_oc=AQn1C3i7RDsPbDVXjWgC1KybHg69dG4zd_mMlUp0AlMESiDq5di4ccmVaSb151iNPrk&_nc_ht=scontent.fhan5-4.fna&oh=76c421657d781ef346bc079e110c964c&oe=5DAE5AE0)

- Nhưng mỗi lần reboot thì hệ thống sẽ umount, để có thể tự động mount mỗi khi reboot ta có thể viết thư mục muốn share vào file ``vi /etc/fstab``
```
vi /etc/fstab
```

VD: ta sẽ tự động share /dev/sdb2 mỗi khi máy reboot.
![](https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/66020070_1322001097966114_7383204156560900096_n.png?_nc_cat=109&_nc_oc=AQkVRMDcY3M_BswFhK1k3lhSMSdOAhB3CuoEXlCPgRgNxsu-OO5Enuc32N1yEAkbhNE&_nc_ht=scontent.fhan5-1.fna&oh=8fd80598928f03a192e2dd3eb807d1cc&oe=5D81226B)

****

## END
