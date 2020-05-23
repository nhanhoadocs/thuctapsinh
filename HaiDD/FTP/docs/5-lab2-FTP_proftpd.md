# Lab - FTP use PROFTPD

## I. FTP Server
### 1. IP Server: `192.168.37.25`

### 2. Install PROFTPD
ProFtpd nằm trong gói mở rộng nên ta cần cài epel trước khi cài ProFtpd:
```
# yum install epel-release
# yum install proftpd
```

Copy file cấu hình để backups: `/etc/proftpd.conf`
```
# cp /etc/proftpd.conf /etc/proftpd.conf.backup
```

### 3. Configure `proftpd.conf`
Ta xóa bỏ những kí tự comment trong file cấu hình:
```
# egrep -v '^.*#' /etc/proftpd.conf | tee /etc/proftpd.conf
```

Chú ý để DefaultRoot(thư mục home của FTP server)

<img src = "..\images\Screenshot_34.png">

### 4. Create local user
**Các bước làm tương tự như với [vsftp](./4-lab1-FTP_vsftpd.md)**

Tạo 3 user như đã nói ở trên, đồng thời thay đổi Home directory của các user sang home của FTP server
```
# useradd -d /var/ftp/user1 user1
# useradd -d /var/ftp/user2 user2
# useradd -d /var/ftp/user3 user3
```

Tạo mật khẩu cho user: Tại đây, mình đặt pass là `23091996`:
```
# passwd user1
# passwd user2
# passwd user3
```

Thêm các tài khoản vào file `/etc/ftpusers`, mỗi user trên 1 dòng
```
# vi /etc/ftpusers
```

Nếu tài khoản đã tạo trước đó, ta có thể thay đổi Home directory của nó như sau:
```
# usermod -d /var/ftp/user user
```

Ta sẽ tạo 2 group để phân quyền theo điều kiện đã đề ra:
```
// ftp_basic : user1, user2 có quyền bình thường
# groupadd ftp_basic

// ftp_onlyread : user3 chỉ có quyền đọc
# groupadd ftp_onlyread
```

Add user vào 2 group đã tạo:
```
# usermod -g ftp_basic user1
# usermod -g ftp_basic user2
# usermod -g ftp_onlyread user3
```

### 5. Adjust permission
**Các bước làm tương tự như với [vsftp](./4-lab1-FTP_vsftpd.md)**

Tạo 1 thư mục dùng chung cho user1 và user2:
```
# mkdir /var/ftp/user12 
```

Thay đổi quyền sở hữu các thư mục:
```
chown -R user1:ftp_basic /var/ftp/user1
chown -R user2:ftp_basic /var/ftp/user2
chown -R user3:ftp_onlyread /var/ftp/user3
chown -R :ftp_basic /var/ftp/user12
```

Thay đổi permission các thư mục:
```
chmod 705 /var/ftp/user1
chmod 705 /var/ftp/user2
chmod 550 /var/ftp/user3
chmod 775 /var/ftp/user12
```

### 6. Start FTP Server
Khởi động proftpd : 
```
# systemctl start proftpd
# systemctl enable proftpd
```

Cấu hình tường lửa:
```
# firewall-cmd --permanent --add-port=21/tcp
# firewall-cmd --permanent --add-service=ftp
# firewall-cmd --reload
```

SELinux:
```
# setsebool -P ftpd_full_access on
```

Khởi động lại và kiểm tra trạng thái:
```
# systemctl restart proftpd
# systemctl status proftpd
```

## II. FTP Client
Giống như khi sử dụng [vsftpd](./4-lab1-FTP_vsftpd.md)