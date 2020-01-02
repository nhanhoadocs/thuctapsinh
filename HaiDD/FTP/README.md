# FTP Server

## FTP server
[1. Tìm hiểu về FTP](./docs/1-FTP.md)

[2. Cài đặt FTP Server cơ bản](./docs/2-FTP_setup_vsftpd.md)

[3. Bắt gói tin FTP](./docs/3-tcpdump_ftp.md)

## Danh mục lab

[4. FTP Server use Vsftp](./docs/4-lab1-FTP_vsftpd.md)

[5. FTP Server use ProFTPD](./docs/5-lab2-FTP_proftpd.md)

[6. FTP Server use Pure-FTPD](./docs/6-lab3-FTP_pureftpd.md)


-----
## LAB - Phân quyền User
### Mô hình lab

||OS|IP Address|Use|
|-|-|-|-|
|**FTP Server**|CentOS 7|192.168.37.25|Vsftpd, ProFTPD, Pure-FTPd|
|Client 1|CentOS 7||lftp|
|Client 2|Window 10||FileZilla|

#### Bài toán:
FTP Server tạo ra 3 user cho Client truy cập:
1. *user1* - /var/ftp/user1
2. *user2* - /var/ftp/user2
3. *user3* - /var/ftp/user3

#### Điều kiện
- *user1* và *user2* chỉ sử dụng được trên thư mục riêng của chúng. Và có 1 thư mục dùng chung.

- *user3* có thể truy cập tất cả các thư mục nhưng chỉ có quyền đọc.

<img src = "..\FTP\images\Screenshot_9.png">


