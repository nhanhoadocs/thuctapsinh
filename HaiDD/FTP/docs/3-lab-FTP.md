# Lab FTP Server

## Mô hình lab

||OS|IP Address|Use|
|-|-|-|-|
|**FTP Server**|CentOS 7|192.168.37.25|Vsftpd, ProFTPD, Pure-FTPd|
|Client 1|CentOS 7||lftp|
|Client 2|Window 10||FileZilla|

### Bài toán:
FTP Server tạo ra 3 user cho Client truy cập:
1. *user1* - /var/ftp/user1
2. *user2* - /var/ftp/user2
3. *user3* - /var/ftp/user3

### Điều kiện
- *user1* và *user2* chỉ sử dụng được trên thư mục riêng của chúng. Và có 1 thư mục dùng chung.

- *user3* có thể truy cập tất cả các thư mục nhưng chỉ có quyền đọc.

<img src = "..\images\Screenshot_9.png">



### Danh mục lab

[1. FTP Server use Vsftp](..\docs\4-lab1-FTP_vsftpd.md)

[2. FTP Server use ProFTPD]()

[3. FTP Server use FileZilla]()
