# Working with files

## Tổng quan về file
Cấu trúc file và thư mục trên linux được tổ chức theo dạng cây thư mục bắt đầu từ thư mục gôc (`/`).

Trong linux, hệ thống tệp được chia làm 3 loại:
- File thông thường
- Thư mục
- File đặc biệt

Khi ta liệt kê file sẽ có kết quả tương tự như sau:
```
[toor@CentOS-7 /]$ ls -la /
total 20
dr-xr-xr-x.  17 root root  224 Nov 11 22:07 .
dr-xr-xr-x.  17 root root  224 Nov 11 22:07 ..
lrwxrwxrwx.   1 root root    7 Nov 11 21:59 bin -> usr/bin
dr-xr-xr-x.   5 root root 4096 Nov 11 22:08 boot
drwxr-xr-x.  20 root root 3200 Nov 13 02:31 dev
drwxr-xr-x.  74 root root 8192 Nov 13 02:31 etc
drwxr-xr-x.   3 root root   18 Nov 11 22:07 home
lrwxrwxrwx.   1 root root    7 Nov 11 21:59 lib -> usr/lib
lrwxrwxrwx.   1 root root    9 Nov 11 21:59 lib64 -> usr/lib64
drwxr-xr-x.   2 root root    6 Apr 11  2018 media
drwxr-xr-x.   2 root root    6 Apr 11  2018 mnt
drwxr-xr-x.   2 root root    6 Apr 11  2018 opt
dr-xr-xr-x. 110 root root    0 Nov 13 02:31 proc
dr-xr-x---.   2 root root  135 Nov 13 01:50 root
drwxr-xr-x.  23 root root  720 Nov 13 02:31 run
lrwxrwxrwx.   1 root root    8 Nov 11 21:59 sbin -> usr/sbin
drwxr-xr-x.   2 root root    6 Apr 11  2018 srv
dr-xr-xr-x.  13 root root    0 Nov 13 02:31 sys
drwxrwxrwt.  11 root root 4096 Nov 13 02:32 tmp
drwxr-xr-x.  13 root root  155 Nov 11 21:59 usr
drwxr-xr-x.  19 root root  267 Nov 11 22:13 var
[toor@CentOS-7 /]$

```
Trong đó:
- Cột đầu tiên thể hiện loại tệp và quyền (permission)
- Cột thư hai thể hiện bộ nhớ
- Cột thứ ba thể hiện quyền sở hữu
- Cột Thứ tư thể hiện nhóm sở hữu
- Cột thứ năm thể hiện kích thước tệp tính theo byte
- Cột thư sau thể hiện thời gian tạo hoặc cập nhật lần cuối
- Cột cuối cùng là tên của file hoặc thư mục

## Quyền truy cập file và thư mục

Trong linux quyền được chia thành 3 nhóm khác nhau:

|#|Description|
|-|-----------|
|Owner|Chủ sở hữu, xác định những hành động mà chủ sở hữu có thể thực hiện với tệp|
|Group|Nhóm, xác định những hành động mà các thành viên trong nhóm có thể thực hiện với tệp|
|Other|Xác định những hành động mà tất cả các người dùng khác có thể thực hiện với tệp|

Khi liệt kê các tệp ta được kết quả tương được như sau:

```
drwxr-xr-x.  6 root root     4096 Nov 11 22:08 sysconfig
-rw-r--r--.  1 root root      449 Apr 11  2018 sysctl.conf
drwxr-xr-x.  2 root root       28 Nov 11 22:01 sysctl.d
drwxr-xr-x.  4 root root      151 Nov 11 22:01 systemd
```

Trong đó (Ở cột đầu tiên):
- Ký tự thư nhất cho biết đó là file hay thư mục
- Ký tự từ thứ 2-4 thể hiện quyền của chủ sở hữu
- Ký tự từ thư 5-7 thể hiện quyền của nhóm
- Ký tự từ thứ 8-10 thể hiện quyền của các người dùng khác

Các quyền được thể hiện như sau:
- `r` thể hiện có quyền đọc
- `w` thể hiện có quyền ghi hay sử đổi tệp
- `x` thể hiện có quyền thực thi
- `-` không có quyền

## Thay đổi quyền
Để thay đổi quyền ta sử dụng lệnh `chmod`, `chmod` ta có thể sử dụng ở 2 chế độ:

#### Chế độ tượng trưng
Ở chế độ này có 3 toán tử sử dụng để chỉnh sửa  quyền:
- **+**: Thêm quyền được chỉ định cho file hoặc thư mục
- **-**: Loại bỏ quyền được chỉ định cho file hoặc thư mục
- **=**: Gán quyền được chỉ định cho file hoặc thư mục

**Ví dụ** Với `file.txt`:

Để thêm quyền thực thi cho chủ sở hữu vơi file `file.txt`:
`# chmod u+x file.txt`

Để loại bỏ quyền ghi của các người dùng khác:
`# chmod o-w file.txt`

Để gán cho các người dùng thuộc group quyền đọc và ghi mà không có thực thi:
`# chmod g=rw file.txt`

#### Chế độ tuyệt đối
Ngoài ra ta có thể thay đổi quyền của file và thư mục ở chế độ tuyệt đối, ở chế độ này mỗi quyền được gán một giá trị số, bảng sau đây mô ta các quyền tương ứng với cá giá trị:

|Number|Permissions|Descriptions|
|------|-----------|------------|
0|---|Không có quyền gì|
1|--x|Quyền thực thi|
2|-w-|Quyền ghi|
3|-wx|2(w) + 1(x) = 3: Quyền ghi và thực thi|
4|r---|Quyền đọc|
5|r-x|4(r) + 1(x) = 5: Quyền đọc và thực thi|
6|rw-|4(r) + 2(w) = 6: Quyền đọc và ghi|
7|rwx|4(r) + 2(w) + 1(x) = 6: Full quyền|

**Ví dụ** với file `file.txt`:

Để chủ sở hữu có full quyền, group có quyền đọc và ghi còn các người dùng khác không có quyền: `chmod 760 file.txt`

## Thay đổi chủ sở hữu
Để thay đổi người sở hữu ta sử dụng lệnh `chown`, đối với người dùng `root` có thể thay đổi tất cả quyền sở hữu của file và thư mục, ngoài ra đối với các người dùng khác chỉ có thể thay đổi quyên sở hữu của file hoặc thư mục mà họ sở hữu.

Cú pháp: `chown <user> <file or directory>`

Ta có thể thay `<user>` bằng id của người dùng thay vì tên người dùng.

**Ví dụ:**
`# chown www-data file.txt` Sẽ thay đổi chủ sở hữu của `file.txt` thành `www-data` (Người dùng apache)


## Thay đổi nhóm sở hữu
Để thay đổi nhóm sở hữu ta sử dụng lệnh `chgrp`.

Cú pháp: `chgrp <group> <file or directory>`

**Ví dụ:**

`chgrp apache file.txt` Để thay đổi nhóm sở hữu của `file.txt` thành nhóm `apache`.
