# Linux command

## 1. Lệnh `man` (manual - hướng dẫn sử dụng)
Hầu hết các file và lệnh Unix đều có trang `man` khá tốt để giải thích việc sử dụng chúng. Nó cung cấp thông tin và chi tiết về tên, tóm tắt, mô tả, các option, trạng thái đầu ra, giá trị trả về, lỗi, file, thông tin phiên bản, ví dụ, tác giả,...

### 1.1. man $command
Xem thông tin của 1 lệnh nào đó: tác dụng, các option, ...

Gõ `q` để thoát.

Ví dụ: `# man echo`

<img src = "https://i.imgur.com/kziziVJ.png">

Ta có thể sử dụng lệnh `man` với lệnh `man`: `# man man`

<img src = "https://i.imgur.com/mLMN9WQ.png">

### 1.2.  man $configfile
Xem hướng dẫn các file cấu hình. Hầu hết các file cấu hình đều có hướng dẫn riêng.

Ví dụ: 

### 1.3.  man $daemon
Xem thông tin trình nền trên hệ thống.

Ví dụ: # man dhcpd, # man syslogd, ...

### 1.4. man -k (apropos)
Hiển thị các manpage chứa chứa chuỗi string sau đó.

Ví dụ: `# man -k dhcp`

<img src = "https://i.imgur.com/07d4GoN.png">

`# man nmcli`

<img src = "https://i.imgur.com/ERdKdp7.png">

### 1.5. whatis
Xem mô tả trang hướng dẫn của từ sau nó.

Ví dụ:

`# whatis mkdir`
```
[root@localhost ~]# whatis mkdir
mkdir (1)            - make directories
```
`# whatis echo`
```
[root@localhost ~]# whatis echo
echo (1)             - display a line of text
```

### 1.6. whereis
Dùng để tìm vị trí tệp nguồn, binary file của một lệnh hoặc phần hướng dẫn sử dụng cho một tệp được chỉ định.

Cú pháp : 
```
# whereis [option] filename
```

Ví dụ
```
[root@localhost ~]# whereis ip
ip: /usr/sbin/ip /usr/share/man/man8/ip.8.gz
```

Các option:
- `-b` : Tìm kiếm nhị phân
```
[root@localhost ~]# whereis -b gunzip
gunzip: /usr/bin/gunzip
```
- `-m` : Tìm phần hướng dẫn (manpage)
```
[root@localhost ~]# whereis -m nmcli
nmcli: /usr/share/man/man1/nmcli.1.gz
```

- `-s` : Tìm kiếm nguồn(source)
- `-u` : Tìm kiếm các mục bất thường. Mỗi tệp nguồn hoặc một tệp nhị phân được cho là không bình thường nếu nó không có bất kì sự tồn tại nào trong hệ thống theo sự mô tả [-bmsu]

Ví dụ: Để hiển thị các tệp trong thư mục hiện tại không có tệp tài liệu.
```
[root@localhost var]# whereis -m -u *
local: /usr/share/man/man1/local.1.gz /usr/share/man/man8/local.8.gz
```

- `-B` : Giới hạn khu vực tìm kiếm nhị phân
```
[root@localhost var]# whereis -B /bin -f gunzip
gunzip: /usr/share/man/man1/gunzip.1.gz /usr/bin/gunzip
```

- `-M` : Giới hạn khu vực tìm kiếm manpage
- `-S` : Giới hạn khu vực tìm kiếm source
- `-f` : Chấm dứt danh sách thư mục cuối cùng và báo hiệu bắt đầu tên tệp. Sử dụng kèm với `-B`, `-M`,`-S`
- `-V` : Hiển thị thông tin phiên bản và thoát
```
[root@localhost ~]# whereis -V
whereis from util-linux 2.23.2
```
- `-h` : Hiển thị bảng help
```
[root@localhost ~]# whereis -h

Usage:
 whereis [options] file

Options:
 -b         search only for binaries
 -B <dirs>  define binaries lookup path
 -m         search only for manuals
 -M <dirs>  define man lookup path
 -s         search only for sources
 -S <dirs>  define sources lookup path
 -f         terminate <dirs> argument list
 -u         search for unusual entries
 -l         output effective lookup paths

For more details see whereis(1).
```

### 1.7. man sections
Ý nghĩa các con số trong dấu ngoặc `()` khi dùng lệnh `man`:
- 1 :Chương trình thực thi hoặc lệnh shell
- 2 :Gọi hệ thống (các chức năng được cung cấp bởi kernel)
- 3 :Gọi thư viện (chức năng trong thư viện chương trình)
- 4 :Tệp đặc biệt (thường được tìm thấy trong /dev)
- 5 :Định dạng và quy ước về tệp, vd /etc/passwd
- 6 :Trò chơi
- 7 :Khác (bao gồm các gói và quy ước vĩ mô), ví dụ: man(7)
- 8 :Lệnh quản trị hệ thống (thường chỉ dành cho root)
- 9 :Kernel routines [Không chuẩn]

### 1.8. mandb
Kiểm tra xem 1 thư mục có tồn tại 1 trang man hay không.

```
[root@localhost ~]# mandb A
Processing manual pages under /root/A...
0 man subdirectories contained newer manual pages.
0 manual pages were added.
0 stray cats were added.
0 old database entries were purged.
```

## 2. Lệnh `pwd` (Print Working Directory)
Lệnh `pwd` dùng để hiển thị đường dẫn đến thư mục đang làm việc hiện tại:
```
[root@localhost wp-admin]# pwd
/root/wordpress/wp-admin
```

Option:
- `-L`: In đường dẫn tượng trưng
- `-P`: In đường dẫn thực tế

## 3. Lệnh `cd` (change directory)
Chuyển đổi thư mục làm việc.
- `cd /duong/dan/tuyet/doi` : chuyển tới thư mục /doi/
- `cd` : chuyển về thư mục chính của người dùng
- `cd A && ls` : chuyển tới thư mục A và hiện danh sách các file của nó.
- `cd -`: chuyển về thư mục đang làm việc trước đó.
- `cd ..` : chuyển về thư mục cha.
- `cd~` : Thay đổi thư mục hiện tại về thư mục chính

## 4. Lệnh `ls` (list)
### 4.1. `ls`
Hiển thị các tệp tin và thư mục trong thư mục.
```
[root@localhost ~]# ls
```
<img src = "https://i.imgur.com/r2u66lC.png">

### 4.2. `ls -t` 
Hiển thị các thư mục và file theo thời gian chỉnh sửa.

```
[root@localhost ~]# ls -t
```
<img src = "https://i.imgur.com/EVlIz2b.png">

Để show ra các file cuối cùng được chỉnh sửa. Thêm `head -(số_file)`
```
[root@localhost ~]# ls -t | head -1
```
<img src = "https://i.imgur.com/FpfuwcB.png">

### 4.3. `ls -1`
Hiển thị mỗi mục trên 1 dòng
```
[root@localhost ~]# ls -1
```
<img src = "https://i.imgur.com/E5BT74k.png">

### 4.4. `ls -l`
Hiển thị tất cả thông tin các mục
```
[root@localhost ~]# ls -l
```
<img src = "https://i.imgur.com/ro3xYEt.png">

Trong đó:
- Kí tự đầu tiên: định dạng:
    - `-`: file bình thường
    - `d`: thư mục
    - `s`: file socket
    - `l`: link file
- Trường 1: File permission
- Trường 2: Số lượng liên kết đến tệp hay thư mục đó
- Trường 3: Chủ sở hữu của tệp, thư mục
- Trường 4: Nhóm của tệp, thư mục
- Trường 5: Kích thước của tệp, thư mục đó(đơn vị: byte)
- Trường 6: Thời gian sửa đổi cuối cùng
- Trường 7: Tên của tệp, thư mục

### 4.5. `ls -lh`
Giống `ls -l` nhưng hiển thị trường 5 (kích thước) ở dạng dễ đọc. M là MB, K là KB, G là GB.
<img src = "https://i.imgur.com/1nUIyE1.png">

### 4.6. `ls -a`
Như lệnh `ls` nhưng hiển thị cả những file ẩn. Trong Linux, các file có tên bắt đầu bằng dấu chấm được coi là file ẩn và nó không hiển thị cùng các file bình thường.

<img src = "https://i.imgur.com/vLUNLHt.png">

### 4.7 `ls -ld`
Hiển thị thông tin thư mục.
```
[root@localhost ~]# ls -ld /etc

drwxr-xr-x. 78 root root 4096 Dec 24 20:00 /etc
```

### 4.8. `ls -r`
Giống `ls` nhưng sắp xếp ngược lại.
Có thể kết hợp với option `-l` và `-t` để được kết quả như sau:

<img src = "https://i.imgur.com/k0k5bgN.png">

### 4.9. `ls -i`
Liệt kê kèm số lượng `inone`

<img src = "https://i.imgur.com/XO4GGjz.png">

### 4.10. `ls -F`
Nếu chỉ cần biết các mục là file hay thư mục ta sử dụng `ls -F`:

<img src = "https://i.imgur.com/I6pXQCm.png">

Trong đó:
- `/` : Thư mục
- Nothing : tệp bình thường
- `*` : Tập tin thực thi
- `@` : link file

### 4.11. `ls -S`
Hiển thị danh sách nội dung theo kích thước giảm dần.

<img src = "https://i.imgur.com/5Kg5Ptl.png">

## 5. Lệnh `mkdir` (make directory - tạo thư mục)
### 5.1. Một số thông tin
- `mkdir --version`: Hiển thị thông tin phiên bản, giấy phép, tác giả.

<img src = "https://i.imgur.com/mDeFli8.png">

- `mkdir --help`: Hiển thị 1 số thông tin trợ giúp

<img src = "https://i.imgur.com/cKhbWMQ.png">

### 5.2. `mkdir <ten_thu_muc>`
Tạo thư mục tại vị trí thư mục đang đứng.

Có thể tạo nhiều thư mục cùng lúc:
```
# mkdir D1 D2 D3       // Tạo 3 thư mục D1 D2 D3 cùng lúc
```

### 5.3. `mkdir -v <ten_thu_muc>
Tạo thư mục và hiển thị thông báo tạo thư mục.

<img src = "https://i.imgur.com/ZIkNQUR.png">

### 5.4 `mkdir -p`
Tạo thư mục kèm thư mục cha khi cần thiết.
```
# mkdir -v -p /S1/S2/S3
```

<img src = "https://i.imgur.com/2ET77jk.png">

### 5.5. `mkdir -m`
Đặt permission cho thư mục ngay khi tạo. (tương tự như lệnh `chmod`)
```
[root@localhost ~]# mkdir -m a=rwx S5

[root@localhost ~]# ls -l | grep "S5"
drwxrwxrwx. 2 root   root      4096 Dec 24 22:45 S5
```

## 6. Lệnh `rmdir` (remove directory - Xóa thư mục)
### 6.1. `rmdir`
Xóa thư mục rỗng.
```
[root@localhost D1]# mkdir E1 E2 E3

[root@localhost D1]# ls
E1  E2  E3

[root@localhost D1]# rmdir E3

[root@localhost D1]# ls
E1  E2
```

Khi dùng lệnh này với thư mục không rỗng sẽ xảy ra lỗi:
```
[root@localhost D1]# cd E1
[root@localhost E1]# mkdir a
[root@localhost E1]# cd ..
[root@localhost D1]# rmdir E1
rmdir: failed to remove ‘E1’: Directory not empty
```

### 6.2. Một số thông tin
Cũng giống lệnh `mkdir`. `rmdir` có thể sử dụng option `--version` và `--help`

### 6.3. `rmdir -p <thu_muc>`
Trong tùy chọn này, đối số thư mục được coi là tên đường dẫn trong đó tất cả các thành phần sẽ bị xóa. Nếu chúng đã trống thì sẽ lần lượt xóa từ thành phần cuối cùng.

Xem ví dụ sau:

<img src = "https://i.imgur.com/F8dJz7R.png">

### 6.4. `rmdir -v <thu_muc>
Tùy chọn này hiển thị thông tin xóa thư mục.

<img src = "https://i.imgur.com/XaSW5LC.png">


## 7. Lệnh `file`
```
file [option] [file_name]
```

Lệnh `file` được sử dụng để xác định loại tệp. 

<img src = "https://i.imgur.com/RFnCMHs.png">

Lệnh `file` sử dụng tệp `magic` chứa các mẫu để nhận dạng các loại tệp. Tệp `magic` nằm ở  `/usr/share/file/magic`.

Để thêm thông tin chi tiết : `# man 5 magic`

Các Option:
### 7.1. `file -b` (-b = -brrief) - tóm tắt
Hiển thị kiểu file 1 cách đơn giản, ngắn gọn.

<img src = "https://i.imgur.com/2Ef60o2.png">

### 7.2. `file *`
Hiển thị tất cả các loại file trong thư mục đang đứng:
```
# file *
```
<img src = "https://i.imgur.com/un7JtfR.png">

Hiển thị tất cả cái loại file trong thư mục nào đó
```
file <đường_dẫn_thư_mục>/*
```
<img src = "https://i.imgur.com/lTP6jhv.png">

### 7.3. `file [range]*`
Hiển thị kiểu file của các file trong khoảng nào đó.

<img src = "https://i.imgur.com/9CE0ms9.png">

### 7.4. `file -s`
Hiển thị các loại tệp của tệp đặc biệt như các tệp trong `/dev/` và `/proc/`

<img src = "https://i.imgur.com/MbxqBFP.png">

### 7.5. `file -f -`
Kiểm tra kiểu file của nhiều file. Mỗi file gõ trên 1 dòng.

<img src = "https://i.imgur.com/hFNDKMS.png">

### 7.6. `file <filename1> <filename2> ...`
Hiển thị loại tệp của nhiều tệp.

<img src =  "https://i.imgur.com/65tWIfj.png">

### 7.7. `file -z <file_nén>`
Lệnh này sẽ cố gắng nhìn vào bên trong file nén.

## 8. Lệnh `touch`
Là 1 cách đơn giản để tạo 1 file trống hoặc thay đổi dấu thời gian (timestamps) của file.

Dấu thời gian của file có loại:
- accesstime
- modifytime
- changetime

### 8.1. Tạo file trống
Tạo 1 file:
```
# touch <filename>
```
<img src = "https://i.imgur.com/gooJVLY.png">

Tạo nhiều file:
```
# touch <filename1> <filename2> ...
```

### 8.2. Thay đổi dấu thời gian
`touch -a <filename>` :Thay đổi thời gian truy cập (acesstime) của file.

Xem ví dụ sau để hiểu thêm

<img src = "https://i.imgur.com/vmYI2oY.png">

`touch -m <filename>`: Thay đổi thời gian sửa đổi (modifytime)


### 8.3. `touch -c <filename>`
Option này dùng để tránh tạo tệp khi gõ nhầm. Tức là ta chỉ muốn thay đổi dấu thời gian của tệp mà không muốn tạo ra 1 tệp.

<img src = "https://i.imgur.com/0Ef4IGt.png">

### 8.4. `touch -t YYYYMMDDHHMM <filename>`
Tạo 1 tệp tin với dấu thời gian nhất định hoặc thay đổi dấu thời gian của 1 tệp đã có.

<img src = "https://i.imgur.com/VTSjfJL.png">


## 9. Lệnh `rm` (remove)
Dùng để xóa file hoặc thư mục.
### 9.1. `rm <tên_file>`
<img src ="https://i.imgur.com/HZ5AVBm.png">

Xóa nhiều file: `# rm fielname1 filename2`

<img src = "https://i.imgur.com/uRpJcyB.png">

### 9.2. `rm -i`
Xóa file có xác nhận trước khi xóa.

<img src = "https://i.imgur.com/xGhleyg.png">

### 9.3. `rm -f`
Xóa file không có xác nhận.

<img src = "https://i.imgur.com/zlFm0JF.png">

### 9.4. `rm -I file*`
Xóa hàng loạt file có tên gần giống nhau.

<img src = "https://i.imgur.com/SWQcO9a.png">

### 9.5. `rm -d <ten_thumuc>`
Xóa thư mục rỗng

<img src = "https://i.imgur.com/fVnLiLs.png">

Không xóa được thư mục không rỗng

<img src = "https://i.imgur.com/Z01JwVQ.png">

### 9.6. `rm -r <ten_thumuc>`
Xóa thư mục không rỗng và xác nhận từng nội dung trước khi xóa.

<img src = "https://i.imgur.com/8JMV8q4.png">

### 9.7. `rm -v`
Hiển thị kết quả xóa.

<img src = "https://i.imgur.com/OINtPFG.png">

## 10. Lệnh `cp`
Dùng để sao chép file hoặc thư mục.

### 10.1. Copy nội dung 1 file vào 1 file khác
Sao chép nội dung 1 file vào 1 file khác. Nếu file đích đó chưa tồn tại thì sẽ tạo ra file đó với nội dung giống hệt file nguồn.
```
# cp <file_nguồn> <file_đích>
```

<img src = "https://i.imgur.com/EMOSz62.png">

### 10.2. Copy file vào thư mục khác
```
# cp <filename_1> <filename_2> ... <filename_n> <thư_mục_đích>
```

<img src = "https://i.imgur.com/Ump4y8p.png">

### 10.3. `cp -r/-R <thư_mục_nguồn> <thư_mục_đích>`
`r - recursive` : đệ quy

Copy 1 thư mục vào 1 thư mục khác. 

<img src = "https://i.imgur.com/jG0FhFX.png">


### 10.4. `cp -i`
`i - interactive` : tương tác

Hỏi lại người dùng có muốn ghi đè không khi có tệp trùng tên. Hoặc ghi đè nội dung của file đích.

<img src = "https://i.imgur.com/w3WJiAH.png">


### 10.5. `cp -b`
`b - backup` : sao lưu

Tạo bản sao lưu của tệp đích trong cùng thư mục với tệp khác và ở 1 định dạng khác.

<img src = "https://i.imgur.com/Z540T2x.png">

### 10.6. `cp -f`
`f - force : ép buộc`

Khi hệ thống không thể mở tệp đích để thực hiện thao tác ghi vì người dùng không có quyền ghi cho tệp này thì ta sử dụng tùy chọn `-f`. Khi này, tệp đích sẽ bị xóa trước rồi sau đó copy nội dung từ tệp nguồn tới tệp đích. Nó thay đổi luôn cả quyền của tệp đích.

<img src = "https://i.imgur.com/W2mEBfw.png">

### 10.7. `cp -p`
`p - preserve` : bảo quản

Khi sử dụng `-p`, lệnh `cp` sẽ bảo toàn các đặc điểm sau của tệp nguồn: timestamp, quyền sở hữu (owner, chỉ khi nó có quyền) và permission.

<img src = "https://i.imgur.com/D1024Qb.png">

### 10.8. `cp -n`
`n - no clobber`

Không ghi đè lên tệp hiện có.

<img src = "https://i.imgur.com/4veS7Lf.png">

### 10.9. `cp -u`
`u - update` : Chỉ sao chép tệp nguồn nếu nó mới hơn tệp đích hoặc tệp đích chưa tồn tại.

<img src ="https://i.imgur.com/9NAG6K2.png">

### 10.10. `cp -v`

`-v - verbose` : Xem quá trình

<img src = "https://i.imgur.com/QpoOIXM.png">


## 11. Lệnh `mv`
`mv - move(rename) file` : được sử dụng để di chuyển một hoặc nhiều tệp hoặc thư mục từ nơi này sang nơi khác trong hệ thống tệp như UNIX. Nó có hai chức năng riêng biệt:
- Đổi tên 1 file hoặc thư mục
- Di chuyển 1 nhóm các tệp tin vào thư mục khác.

### 11.1. Đổi tên file, thư mục
```
# mv <ten_hien_tai> <ten_moi>
```

<img src = "https://i.imgur.com/E6Rc2hs.png">

<img src = "https://i.imgur.com/IBHv4Ys.png">

### 11.2. `mv -i`
`i - Interactive` : Tương tác

Xác nhận di chuyển và ghi đè lên 1 tệp tin hiện có.

<img src = "https://i.imgur.com/drViolk.png">

### 11.3. `mv -f`
`f - Force` : ép buộc

`mv` sẽ nhắc xác nhận ghi đè tệp đích nếu tệp đích được bảo vệ ghi, tức là ta không có quyền ghi lên tập đích. `-f` sẽ cho bạn ghi đè tệp đích và xóa tệp nguồn.

<img src = "https://i.imgur.com/XhuHEyy.png">

### 11.4. `mv -n`
`n - no clobber` : với option này sẽ ngăn không cho ghi đè 1 tệp hiện có.

<img src = "https://i.imgur.com/wNqu2oZ.png">

### 11.5. `mv -b`
`b -backup` : tạo 1 bản lưu trữ tệp tin sẽ bị ghi đè

<img src = "https://i.imgur.com/r2HlK30.png">

### 11.6. Di chuyển tệp tin, thư mục
Chuyển tệp tin tới 1 thư mục khác

<img src = "https://i.imgur.com/Ox1TcL8.png">

Chuyển 1 thư mục tới 1 thư mục khác

<img src = "https://i.imgur.com/EkKzIF5.png">

## 12. Lệnh `rename`
Thường được dùng để đổi tên file được đặt tên theo biếu thức. Thường dùng để đổi tên hàng loạt các file có tên cấu trúc gần giống nhau.
```
# rename [options] expression replacement file...
```

### 12.1. Đổi tên nhiều file
Đổi đuôi tệp:

<img src ="https://i.imgur.com/FKYM2WJ.png">

Đổi chữ HOA/thường:

<img src ="https://i.imgur.com/gXQKAtA.png">

### 12.2. `rename -v`
`v- verbose`: hiển thị quá trình

<img src  = "https://i.imgur.com/BRBhA8h.png">

