# Samba Server và Windows file sharing  

Samba là một mã nguồn mở hoàn chỉnh của giao thức SMB/CIFS. Nó cho phép kết nối mạng của Microsoft Windows®, Linux, UNIX và các hệ điều hành khác. Samba cho phép máy chủ Linux, UNIX xuất hiện dưới dạng Windows Server tới Windows Client.

Samba Server được xem là một máy chủ tập tin (File Server), sử dụng trong mạng nội bộ. Là nơi lưu trữ tập trung các thông tin của doanh nghiệp thường được cài đặt trên Linux hoặc Windows.

Với Samba, quản trị viên có thể làm được:
1. Cung cấp dịch vụ cây thư mục và máy in cho Linux, UNIX và Windows Client.
2. Hỗ trợ trình duyệt mạng dù có hay không NetBIOS.
3. Xác thực thông tin đăng nhập tên miền Windows.
4. Cung cấp WINS(phân giải tên máy chủ)

Samba bao gồm các dịch vụ sau: **smb**, **nmb**, **winbind**
- `smbd` (Trình nền máy chủ): cung cấp dịch vụ chia sẻ tệp và máy in cho các Windows Client. Ngoài ra, nó còn chịu trách nhiệm xác thực người dùng, khóa tài nguyên và chia sẻ dữ liệu thông qua giao thức SMB. Các cổng mặc định mà máy chủ lắng nghe lưu lượng SMB là TCP 139 và 445.
- `nmbd` : trình nền máy chủ hiểu và trả lời NetBIOS qua các yêu cầu dịch vụ bởi SMB trong các hệ thống dựa trên Windows. Cổng mặc định mà máy chủ lắng nghe lưu lượng NMB là cổng UDP 137.
- `winbindd` : là dịch vụ phân giải thông tin người dùng và nhóm nhận được từ máy chủ chạy Windows. Điều này giúp cho người dùng Windows và thông tin các nhóm có thể hiểu được bởi các nền tảng Linux và UNIX. Nó cho phép người dùng Windows xuất hiện và hoạt động như người dùng Linux, UNIX trên máy Linux và UNIX. 

Cả `winbindd` và `smbd` đều được đóng gói với các bản phân phối của Samba, nhưng dịch vụ `winbindd` được kiểm soát tách biệt từ dịch vụ `smbd`.

--------

## Samba Lab

### Mô hình lab
Ta sẽ tạo 1 Samba Server trên CentOS-7 để chia sẻ tệp cho máy Window 10.

**IP Planning**
|Host name|Network|Interface|IP|Netmask|Gateway|DNS|
|-|-|-|-|-|-|-|
|CentOS-7|VMnet8|ens33|192.168.37.11|24|192.168.37.1|8.8.8.8|
|Window 10|VMnet8|ens33|192.168.37.12|24|192.168.37.1|8.8.8.8|

### Cài đặt Samba Server
Install Samba Package rồi `enable` và `start` 2 dịch vụ `smbd` và `nmbd`:
```
# yum install samba
# systemctl enable smb
# systemctl enable nmb
# systemctl start smb
# systemctl start nmb
```

### Cấu hình Samba Server
File cấu hình của samba nằm ở `/etc/samba/smb.conf`, ta cần chỉ sửa file cấu hình để share file.

Trước khi chỉnh sửa ta sẽ copy ra 1 file khác để backup:

`[root@localhost ~]# [root@localhost ~]# mv /etc/samba/smb.conf /etc/samba/smb.conf.orig`

Chỉnh sửa file cấu hình tương tự như sau:

```
# See smb.conf.example for a more detailed config file or
# read the smb.conf manpage.
# Run 'testparm' to verify the config is correct after
# you modified it.

[global]
        workgroup = SAMBA
        security = user

        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw

...

# Configs
[Share_One]
comment = Public Documents - Share_One
path = /samba/share1/data
valid users = root
guest ok = no
writable = yes
browsable = yes

[Share_Two]
comment = Public Documents - Share_Two
path = /samba/share2/data
valid users = root
guest ok = no
writable = yes
browsable = yes
```

Sau khi cấu hình xong ta có thể kiểm tra cấu hình bằng lệnh `testparm`:
```
[root@localhost ~]# testparm /etc/samba/smb.conf
rlimit_max: increasing rlimit_max (1024) to minimum Windows limit (16384)
Registered MSG_REQ_POOL_USAGE
Registered MSG_REQ_DMALLOC_MARK and LOG_CHANGED
Load smb config files from /etc/samba/smb.conf
rlimit_max: increasing rlimit_max (1024) to minimum Windows limit (16384)
Processing section "[Share_One]"
Processing section "[Share_Two]"
Loaded services file OK.
Server role: ROLE_STANDALONE

Press enter to see a dump of your service definitions
```

### Tạo user và password
Samba sử dụng nhiều hình thức bảo mật khác nhau. Trong lab này, ta sử dụng phương thức mặc định (user level). Phương thức này, mỗi chia sẻ được gán truy cập với những user cụ thể. Khi user gửi yêu cầu kết nối để chia sẻ, Samba sẽ xác thực bằng username đã được khai báo trong file cấu hình và password trong database.

Samba sử dụng nhiều database backends để lưu trữ password người dùng. Cách đơn giản nhất là lưu trữ password trong file `smbdpasswd` giống như `/etc/passwd`. Thông thường, file này sẽ được lưu tại `/var/lib/samba/private/` hoặc `/usr/bin/smbpasswd`.

Thêm User và set Password trong database :
```
[root@localhost ~]# smbpasswd -a root
New SMB password:
Retype new SMB password:
Added user root.
``` 

Hiển thị danh sách đăng nhập trong database: `#pdbedit --list`
```
[root@localhost ~]# pdbedit --list
root:0:root
danghai:1000:danghai
```

Với `smbpassword database`, Samba user phải là một user trong hệ thống Linux. Để bảo mật máy chủ, bạn nên hủy bỏ quyền đăng nhập từ những user này
```
# useradd -d /samba/share danghai
# usermod -s /bin/false danghai
# cat /etc/passwd | grep danghai
danghai:x:1003:1002::/samba/share:/sbin/nologin
#
# ssh danghai@localhost
danghai@localhost's password:
Last login: Tue Dec 17 11:11:08 2019
This account is currently not available.
Connection to localhost closed.
#
# sftp danghai@localhost
danghai@localhost's password:
subsystem request failed on channel 0
Couldn't read packet: Connection reset by peer
```

Cấu hình firewall để mở port:
```
[root@localhost ~]# firewall-cmd --permanent --zone=public --add-service=samba
success
[root@localhost ~]# firewall-cmd --reload
success
```

Ta tạo file trong file thư mục share để kiểm tra chia sẻ thành công:
```
[root@localhost ~]# echo 'Share' > /var/Samba-Shared/Share_One/Share_File.txt
[root@localhost ~]# cat Share_File.txt
Share
```

### Trên máy Window Client
Ta nhấn tổ hợp phím Window + R để mở hộp thoại Run rồi nhập địa chỉ của máy CentOS như hình

<img src = "https://i.imgur.com/hq2DQve.png">

Sau đó nhập tài khoản và mật khẩu vào ta sẽ được 2 thư mục share như hình

<img src = "https://i.imgur.com/PPq7ive.png">

