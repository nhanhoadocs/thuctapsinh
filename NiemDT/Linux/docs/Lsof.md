# lcof
`lsof` là một lệnh có chức năng xuất danh sách tất cả các tập tin đang được mở và những tiến trình đang mở chúng. Các tập tin được mở bao gồm các tập tin trên đĩa, pipe, socket mạng và các thiết bị được sử dụng bởi các tiến trình. Ví dụ khi không thể umount một thiết bị vì một sood tập tin đang được sử dụng. Chương trình sẽ liên kết những tệp đang mở và tiến trình nào đang sử dụng chúng.

## Một số option
### 1. Hiển thị tất cả các file đang mở
Dùng lệnh `lsof`
```
[root@localhost ~]# lsof | head -10
COMMAND    PID  TID    USER   FD      TYPE             DEVICE  SIZE/OFF       NODE NAME
systemd      1         root  cwd       DIR              253,0       224         64 /
systemd      1         root  rtd       DIR              253,0       224         64 /
systemd      1         root  txt       REG              253,0   1612152   50535122 /usr/lib/systemd/systemd
systemd      1         root  mem       REG              253,0     20112      70037 /usr/lib64/libuuid.so.1.3.0
systemd      1         root  mem       REG              253,0    261456      70039 /usr/lib64/libblkid.so.1.1.0
```
Trong đó:
 * `Command` tên của chương trình lệnh tương ứng với tiến trình.
 * `PID` thông tin PID của tiến trình
 * `USER` user thực hiện tiến trình đó
 * `FD`- File Descriptor của file được liệt kê
    + `cwd` là thư mục đang hoạt động của tiến trình
    + `txt` program text
    + `mem` memory-mapped file
    + `rtd` root directory
    + `DEL` Linux map file đã bị xóa
    + `w` đang truy cập ghi xuống dữ liệu
    + `u` đang truy cập đọc và ghi dữ liệu
    + `r` đang truy cập đọc dữ liệu
 * `TYPE` 
    + `REG` file bình thường
    + `sock` socket
    + `ipv4/ipv6` socket ipv4/v6
    + `DIR` thư mục
 * ` DEVICE` số đại diện của thiết bị như partition mà file nằm trên partition đó.
 * ` SIZE/OFF` dung lượng của file
 * `NODE` số node của file
 * `NAME` tên file
### 2. Hiển thị các file được mở bởi một người dùng 
Để hiển thị các file đang được mở bởi một người dùng cụ thể ta dùng lênh:
`lsof -u tên_user`
### 3. Hiển thị tiến trình đang chạy trên port 
Để hiển thị tất cả các tiến trình đang sử dụng một port cụ thể nào ta sử dụng option `-i`
VD hiển thị tất cả các file dùng giao thức kết nối TCP port 22
`lsof -i TCP:22`
Ta cũng có thể để hiển thị các tiến trình đang chạy các file đang mở của port TCP từ 1-1024 bằng cách
`lsof -i TCP:1-1024`
### 4. Chỉ hiển thị các file đang mở với IPv4 hoặc IPv6
`lsof -i 4` với ipv4
`lsof -i 6` với ipv6
### 5. Chỉ hiển thị file của 1 user
`lsof -u tên_user`
### 6. Hiển thị tất cả các kết nối mạng
`lsof -i`
### 7. Hiển thị theo PID
`lsof -p PID`
### 8. Kill tất cả các hoạt động của một user
` kill -9 `lsof -t -u tên_user` `