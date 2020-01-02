# LAB - Configuration FTP Server on Centos 7

## I. Giới thiệu
FTP là giao thức truyền tệp. Dù đã được thêm vào các biện pháp bảo mật, FTP bản chất vẫn là 1 phương pháp truyền tệp không an toàn. Tuy nhiên, nó có thể hữu ích khi cung cấp các tệp cho nhiều người dùng hoặc khi làm việc trong một mạng riêng tư và an toàn.

Ta sẽ cấu hình FTP Server với VSFTPD(Very Secure File Transport Protocol Daemon)

Địa chỉ IP FTP Server: `192.168.37.25/24`

## II. Install FTP Server
### 1. Cài đặt gói `vsftpd`

Cài đặt gói `vsftpd`:
```
# yum install vsftpd
```

Khởi động dịch vụ:
```
[root@localhost ~]# systemctl start vsftpd
[root@localhost ~]# systemctl enable vsftpd
Created symlink from /etc/systemd/system/multi-user.target.wants/vsftpd.service to /usr/lib/systemd/system/vsftpd.service.
```

Cấu hình tường lửa và cho FTP trên cổng 21:
```
[root@localhost ~]# firewall-cmd --permanent --add-port=21/tcp
success

[root@localhost ~]# firewall-cmd --permanent --add-service=ftp
success

firewall-cmd: error: unrecognized arguments: -reload
[root@localhost ~]# firewall-cmd --reload
success
```

Kiểm tra trạng thái dịch vụ:
```
[root@localhost ~]# systemctl status vsftpd
● vsftpd.service - Vsftpd ftp daemon
   Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2019-12-30 10:28:37 +07; 24min ago
 Main PID: 1391 (vsftpd)
   CGroup: /system.slice/vsftpd.service
           └─1391 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

Dec 30 10:28:37 localhost.localdomain systemd[1]: Starting Vsftpd ftp daemon...
Dec 30 10:28:37 localhost.localdomain systemd[1]: Started Vsftpd ftp daemon.
```

### 2. Cấu hình `VSFTPD`
Tệp cấu hình của dịch vụ `vsftpd` : `/etc/vsftpd/vsftpd.conf`

1. Copy bản sao của tệp cấu hình mặc định:
```
[root@localhost ~]# cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
```

2. Chỉnh sửa file cấu hình:
```
# vi /etc/vsftpd/vsftpd.conf
```

- **FTP Access**: Ta không cho kết nối nặc danh, mà chỉ cho kết nối cục bộ vào FTP server
```
anonymous_enable=NO    // Không cho kết nối nặc danh 
local_enable=YES        // Cho phép kết nối cục bộ
```

- **Enabling uploads**: Cho phép tải lên. Ta bỏ ghi chú dòng sau
```
write_enable=YES        //Cho phép người dùng nội bộ tải lên
```

- **Chroot Jail**: Chroot là 1 kỹ thuật để giữ người dùng trong thư mục của họ, không cho phép truy cập ra ngoài.

Chroot cho tất cả User:
```
chroot_local_user=YES
chroot_list_enable=NO
```
Chroot đối với 1 số User trong danh sách được tạo trong file `/etc/vsftpd.chroot_list`
```
chroot_local_user=NO
chroot_list_enable=YES
```
Chroot tất cả User ngoại trừ các User có trong file `/etc/vsftpd.chroot_list`
```
chroot_local_user=YES
chroot_list_enable=YES
```

- `ftpd_banner`: Login banner FTP Server

- File `xferlog` tại: `/var/log/xferlog`

- `idle_session_timeout=600` : Thời gian nghỉ của các phiên (đơn vị: giây)
- `data_connection_timeout=120` : Thời gian chờ kết nối dữ liệu (đơn vị: giây)

- Đặt giới hạn cổng dành cho kết nối FTP thụ động.
```
pasv_min_port=30000
pasv_max_port=31000
```

- Giới hạn User đăng nhập vào hệ thống: Để chỉ cho phép một số User nhất định đăng nhập vào máy chủ FTP, thêm 2 dòng sau vào sau dòng `userlist_enable=YES`. Khi đó, những user có trong `/etc/vsftpd/user_list` mới được truy cập vào hệ thống.
```
userlist_enable=YES
userlist_file=/etc/vsftpd/user_list
userlist_deny=NO
```

Sau đó lưu file cấu hình đã chỉnh sửa.

3. Khởi động lại service `vsftpd`
```
# systemctl restart vsftpd
```

4. Cho phép các cổng FTP đi qua tường lửa
```
[root@localhost ~]# firewall-cmd --permanent --add-port=30000-31000/tcp
success
[root@localhost ~]# firewall-cmd --reload
success
```

5. Tạo các User để truy cập FTP
Tạo User và password cho User:

user : `danghai`
pass : `23091996`
```
[root@localhost ~]# adduser danghai
[root@localhost ~]# passwd danghai
```

Thêm user vào danh sách được truy cập FTP server tại `/etc/vsftpd/user_list`
```
# echo "danghai" | tee -a /etc/vsftpd/user_list
```

Tạo cây thư mục FTP và đặt chính xác các permission:
```
# mkdir -p /home/danghai/ftp/upload
# chmod 550 /home/danghai/ftp
# chmod 750 /home/danghai/ftp/upload
# chown -R danghai: /home/danghai/ftp
```

## III. Truy cập FTP Server
### 1. CentOS 7
Cài đặt gói `lftp`:
```
# yum install lftp
```

Truy cập vào FTP Server:
```
lftp ftp://danghai@192.168.37.25`
```

hoặc
```
lftp -u danghai 192.168.37.25
```

Sau đó nhập password của User.

Tại đây ta có giao diện như sau :

<img src = "..\images\Screenshot_1.png">

Ta có thể gõ `?` để xem danh sách các lệnh có thể sử dụng:

<img src = "..\images\Screenshot_3.png">

Xem các mục và truy cập thư mục của Ftp Server: sử dụng `ls` và `cd`:
```
`ls -l`

`cd`
```

<img src = "..\images\Screenshot_4.png">

Up load files lên server: `put <filenames>`

<img src = "..\images\Screenshot_5.png">

Thay đổi thư mục Local của Client :
```
>`lcd <đường_dẫn_thư_mục>`
```

Xem thư mục Local hiện tại của Client:
```
>`lpwd`
```

Tải lên toàn bộ thư mục Local hiện tại của Client: `mirror -R`

Tải toàn bộ thư mục đang đứng của Server về thư mục hiện tại của Client: `mirror`

Tải về thư mục tùy ý:
```
mirror . <đường_dẫn>
```

Tiếp tục quá trình tải(nếu bị gián đoạn): `mirror -R -c`

Tải file từ Server về thư mục Local: `pget <filename>`

<img src = "..\images\Screenshot_6.png">

### 2. Trên Window
Sử dụng FileZilla

<img src ="..\images\Screenshot_7.png">

Hoặc trên `cmd` :

<img src = "..\images\Screenshot_8.png">