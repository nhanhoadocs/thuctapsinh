# Linux command

## Mục lục
|1-10|11-20|21-30|31-40|41-50|
|-|-|-|-|-|
|[1. man](#man)|[11. mv](#mv)|[21. alias](#alias)|[31. sed](#31)|[41. bzcat - bzmore](#41)|
|[2. pwd](#pwd)|[12. rename](#rename)|[22. tee](#tee)|[32. find](#32)|[42. who](#42)|
|[3. cd](#cd)|[13. head](#head)|[23. grep](#grep)|[33. locate](#33)|[43. su](#43)|
|[4. ls](#ls)|[14. tail](#tail)|[24. cut](#cut)|[34. date](#34)|[44. useradd](#44)|
|[5. mkdir](#mkdir)|[15. cat](#cat)|[25. tr](#25)|[35. cal](#35)|[45. userdel](#45)|
|[6. rmdir](#rmdir)|[16. tac](#tac)|[26. wc](#26)|[36. sleep](#36)|[46. usermod](#46)|
|[7. file](#file)|[17. more và less](#moreless)|[27. sort](#27)|[37. time](#37)|[47. passwd](#47)|
|[8. touch](#touch)|[18. strings](#strings)|[28. uniq](#28)|[38. gzip & gunzip](#38)|[48. groupmod](#48)|
|[9. rm](#rm)|[19. echo](#echo)|[29. comm](#29)|[39. zcat & zmore](#39)|[49. groupdel](#49)|
|[10. cp](#cp)|[20. type & which](#typewhich)|[30. od](#30)|[40. bzip2 - bunzip2](#40)|[50. vigr](#50)|


## 1. Lệnh `man` (manual - hướng dẫn sử dụng) <a name="man"></a>
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

## 2. Lệnh `pwd` (Print Working Directory) <a name="pwd"></a>
Lệnh `pwd` dùng để hiển thị đường dẫn đến thư mục đang làm việc hiện tại:
```
[root@localhost wp-admin]# pwd
/root/wordpress/wp-admin
```

Option:
- `-L`: In đường dẫn tượng trưng
- `-P`: In đường dẫn thực tế

## 3. Lệnh `cd` (change directory) <a name="cd"></a>
Chuyển đổi thư mục làm việc.
- `cd /duong/dan/tuyet/doi` : chuyển tới thư mục /doi/
- `cd` : chuyển về thư mục chính của người dùng
- `cd A && ls` : chuyển tới thư mục A và hiện danh sách các file của nó.
- `cd -`: chuyển về thư mục đang làm việc trước đó.
- `cd ..` : chuyển về thư mục cha.
- `cd~` : Thay đổi thư mục hiện tại về thư mục chính

## 4. Lệnh `ls` (list) <a name="ls"></a>
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

## 5. Lệnh `mkdir` (make directory - tạo thư mục) <a name="mkdir"></a>
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

## 6. Lệnh `rmdir` (remove directory - Xóa thư mục) <a name="rmdir"></a>
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


## 7. Lệnh `file` <a name="file"></a>
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

## 8. Lệnh `touch` <a name="touch"></a>
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


## 9. Lệnh `rm` (remove) <a name="rm"></a>
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

## 10. Lệnh `cp` <a name="cp"></a>
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


## 11. Lệnh `mv` <a name="mv"></a>
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

## 12. Lệnh `rename` <a name="rename"></a>
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


## 13. Lệnh `head` <a name="head"></a>
Dùng để in phần đầu của tệp tin.

Ta sẽ sử dụng file `list.txt` chứa 30 dòng số từ 1 đến 30 để ví dụ lệnh `head`.

<img src = "https://i.imgur.com/p1VHnxF.png">

### 13.1. `head <filename>`
Mặc định in ra 10 dòng đầu tiên của tệp đó.

<img src = "https://i.imgur.com/vFrelCr.png">

Có thể dùng 1 lúc cho nhiều file.

<img src = "https://i.imgur.com/CYgeDP4.png">

### 13.2. `head -n (number)`
`n - number` : In ra số dòng đầu tiên xác định. Nếu không có giá trị xác định sẽ xảy ra lỗi.

<img src = "https://i.imgur.com/aQ5gZBD.png">

### 13.3. `head -c (number)`
In ra `number` byte đầu tiên của tệp tin.

Mỗi kí tự = 1 byte, dòng mới = 1 byte.

<img src = "https://i.imgur.com/o5ueISj.png">

### 13.4. `head -q`
`q - quiet --silent` : yên tĩnh
Nó sẽ in ra các dòng đầu tiên của tệp nhưng không có tên tệp khi có nhiều file.

<img src = "https://i.imgur.com/YgNZkTb.png">

### 13.5. `head -v`
`v - verbose` : luôn in ra kèm tên của file

<img src = "https://i.imgur.com/ukZW1uU.png">

### 13.6. Ứng dụng của `head`
- Khi ta muốn in ra những dòng giữa của file. Ví dụ từ dòng 11 - 15, ta kết hợp với lệnh `tail` (Trình bày tại mục 14) như sau:

`# head -n 15 list.txt | tail -5`

<img src = "https://i.imgur.com/4ZwiOci.png">

- Dùng kèm các lệnh khác bằng cách sử dụng `|`. Xem các ví dụ sau: 

Kèm lệnh `ls -lt`:

<img src = "https://i.imgur.com/FfBZizh.png">

Ghép 3 lệnh:

<img src = "https://i.imgur.com/GPOczB0.png">

## 14. Lệnh `tail` <a name="tail"></a>
In những dòng cuối cùng của file.

Ta sử dụng file `list.txt` như mục 13 ở trên.

### 14.1. `tail <filename>`
Mặc định in 10 dòng cuối cùng của file

<img src = "https://i.imgur.com/vUVjQQx.png">

Áp dụng với nhiều file:

<img src =  "https://i.imgur.com/keBhWK3.png">

### 14.2. `tail -n (number)`
In ra số dòng xác định cuối cùng của file.

<img src = "https://i.imgur.com/q9xjWnY.png">

Có thể không cần kí tự `n`:

<img src = "https://i.imgur.com/YYKxSdR.png">

Hoặc sử dụng `+` để in từ dòng xác định đến hết file. `tail -n +(number) <filename>`

<img src = "https://i.imgur.com/5EbjkiV.png">

### 14.3. `tail -c (number)`
In ra số byte cuối cùng của tệp.

<img src = "https://i.imgur.com/aXiImPn.png">

Sử dụng `+` để bỏ qua `number` byte đầu tiên. `tail -n +(number) <filename>`

<img src = "https://i.imgur.com/NDWhE1W.png">

### 14.4. `tail -q`
Không in kèm tên file. Sử dụng khi áp dụng với nhiều file

<img src = "https://i.imgur.com/5c17a2K.png">

### 14.5. `tail -f`
`f - follow` : dùng để theo dõi sự thay đổi của file (thường là file log)

Tùy chọn này sẽ in ra 10 dòng cuối cùng của tệp và sẽ cập nhật liên tục.

```
tail -f logfile
```

Ví dụ: file `date.log` ghi lại thời gian hệ thống 5 phút 1 lần. Ta có thể thấy 11 dòng dưới hình, do vừa qua 21h40.

<img src = "https://i.imgur.com/ooa2YTg.png">

### 14.6. `tail -v`
Các dòng in ra luôn đi kèm tên file

<img src = "https://i.imgur.com/UCy4cdd.png">

### 14.7. Ứng dụng của `tail`
- Sử dụng kèm với `|` :

In ra 7 dòng cuối của tệp và sắp xếp ngược lại

<img src = "https://i.imgur.com/EleLQjS.png">

Sử dụng 3 lệnh cat, head, tail rồi đầu ra ghi vào 1 file:

<img src = "https://i.imgur.com/A6kJkLn.png">

## 15. Lệnh `cat` <a name="cat"></a>
`cat` : concatenate (tiếp nhau)

Lệnh này được sử dụng để tạo, xem nội dung, nối nội dung các file với nhau.

Ví dụ với 2 file `list.txt` - Số từ 1 đến 10, file `abc.txt` - chữ cái a, b, c

<img src = "https://i.imgur.com/sF2dmGm.png">

### 15.1. `cat filename1 filename 2`
Xem nội dung của 1 tệp:

<img src = "https://i.imgur.com/3XI7XZy.png">

Nối nội dung của nhiều tệp và in ra:

<img src = "https://i.imgur.com/pWlUYpX.png">

### 15.2. `cat -n filename`
`n - number`

Xem nội dung của file với đánh số dòng:

<img src = "https://i.imgur.com/Oqnv5we.png">

Nhiều file:

<img src ="https://i.imgur.com/MjrfKLW.png">

### 15.3. `cat >newfile`
Tạo file.

<img src = "https://i.imgur.com/9ZBFDel.png">

### 15.4. `cat s_filename >d_filename`
Sao chép file.

<img src = "https://i.imgur.com/EiJG1Or.png">

### 15.5. `cat -s`
`s - squeeze-blank` : Bỏ những dòng trống ở đầu file.

<img src = "https://i.imgur.com/mgdYX7x.png">

### 15.6. `cat file1 >> file2`
Nối nội dung `file1` vào cuối `file2`

<img src ="https://i.imgur.com/NKdzWSb.png">

### 15.6. `cat -E file`
`E - show ends` : Thêm kí tự `$` vào cuối mỗi dòng

<img src = "https://i.imgur.com/vc71oeb.png">


## 16. Lệnh `tac` <a name="tac"></a>
Dùng để nối và in nội dung file ngược lại. Ngược với lệnh `cat`

Ta có 2 file sau để thực hành lệnh `tac` : `list` và `abc`

<img src = "https://i.imgur.com/cBkbvma.png">

### 16.1. `tac file1 file2`:
In ngược các dòng từ dưới lên trên của 1 file

<img src = "https://i.imgur.com/At5azVH.png">

Nối ngược nhiều tệp tin và in ra:

<img src = "https://i.imgur.com/HoIA0ri.png">

### 16.2. `tac -b filename`
`b - before`: Tạo dòng trắng để ngăn cách trước mỗi file.

<img src = "https://i.imgur.com/qOCD7qx.png">

### 16.3. `tac -r`
`r - regex` : Lệnh này sẽ diễn giải dấu phân cách như một biểu thức chính quy.

<img src ="https://i.imgur.com/aL18o1t.png">

### 16.4. `tac -s string`
`s - separator` : Dừng tại chuỗi `String` chỉ định, rồi in ra

<img src = "https://i.imgur.com/DsxzrJK.png">

## 17. Lệnh `more` và `less` <a name ="moreless"></a>
### 17.1. Lệnh `more`
Dùng để xem các tệp lớn trong 1 màn hình, có thể cuộn chuột để xem. 

Dùng phím Enter để xem tiếp các dòng.

Ở đây ta xem file `date.log`
```
# more date.log
```

<img src = "https://i.imgur.com/UuEpO5g.png">

- `-p` : Xóa màn hình rồi hiển thị nội dung của file.
- `+/<string>`: tìm kiếm trong file và hiển thị ra

<img src = "https://i.imgur.com/hd9r5tV.png">

- `+number` : hiển thị từ dòng `number` của file

<img src = "https://i.imgur.com/5tkq9Sq.png">

- Dùng để đọc đầu ra với nội dung dài:
```
# cat filename | more
```

### 17.2. Lệnh `less`
Truy cập từng trang của file tài liệu dài.

- `less -N` : đánh số dòng

<img src= "https://i.imgur.com/dpFC9XB.png">

- `less -p "string"` : tìm vị trí có `string`
> dmesg | less -p "disable"

<img src = "https://i.imgur.com/zi8Gjmw.png">

## 18. Lệnh `strings` <a name ="strings"></a>
In ra các chuỗi kí tự có thể in trong tệp. Hiển thị các chuỗi ASCII có thể đọc được trong file nhị phân.

Ví dụ xem file nhị phân của lệnh `ls`:
```
strings /bin/ls
```
Đây là phần đầu, phần dưới đã được cắt bớt do quá dài
<img src=  "https://i.imgur.com/HlU6v4W.png">

### 18.1. `strings -f`
Hiển thị tên file trước mỗi dòng.

<img src= "https://i.imgur.com/nDX6Gsu.png">

## 19. Lệnh `echo` <a name ="echo"></a>
Dùng để hiện thị dòng văn bản được truyền vào. Nó được sử dụng chủ yếu trong các tập lệnh shell hay xuất văn bản ra màn hình hoặc tạo file.

### 19.1. `echo <string>`
In ra màn hình chuỗi `string`

<img src = "https://i.imgur.com/iNlrA2S.png">

### 19.2. `echo -e \(mini_option)`
Với option `-e`, nó cho phép ta xác định sự liên tục của văn bản đầu vào. 

`e - escape`

#### 19.2.1. `\b`
`b - backspace` : Xóa 1 kí tự trước nó

<img src=  "https://i.imgur.com/VZYXLfm.png">

#### 19.2.2. `\c`
Ngắt văn bản và không xuống dòng

<img src = "https://i.imgur.com/gBMzlXR.png">

#### 19.2.3. `\n`
`n - new line` : Xuống dòng

<img src = "https://i.imgur.com/WmscuVI.png">

#### 19.2.4. `\t`
`t - tab` : Tạo khoảng dấu tab.

<img src=  "https://i.imgur.com/5TCEeKR.png">

#### 19.2.5. `\r`
Trả về văn bản sau nó.

<img src ="https://i.imgur.com/Rq0AyAb.png">

#### 19.2.6. `\v`
`v - vertical tab` : tab đầu dòng

<img src = "https://i.imgur.com/nLRReXV.png">

### 19.3. `echo *`
Giống như lệnh `ls`

<img src=  "https://i.imgur.com/jYDtqwY.png">

### 19.4. `echo -n`
Ngăn không xuống dòng. Con trỏ sẽ ở vị trí cuối của văn bản.

<img src= "https://i.imgur.com/nqPQ05z.png">

## 20. Lệnh `type` và `which` <a name ="typewhich"></a>
Để tìm hiểu xem 1 lệnh cung cấp cho shell sẽ được thực thi như 1 lệnh bên ngoài shell hay 1 lệnh dựng sẵn.

- `alias` : nếu lệnh là bí danh trong shell
- `keyword` : nếu lệnh là 1 từ dành riêng shell
- `builtin` : nếu lệnh là 1 shell dựng sẵn
- `function` : nếu lệnh là 1 hàm shell
- `file` : nếu lệnh là 1 tệp disk.

<img src = "https://i.imgur.com/xmh8ELy.png">

### 20.1. `type -a`
Được sử dụng để tìm hiểu xem đó là bí danh, từ khóa hay hàm và nó cũng hiển thị đường dẫn của một tệp thực thi, nếu có.

<img src = "https://i.imgur.com/bJSMsdV.png">

### 20.2. `type -t`
Hiển thị 1 từ duy nhất ở đầu ra

<img src = "https://i.imgur.com/zG4bAuX.png">

### 20.3. `which`
Dùng để định vị tệp thực thi được liên kết với lệnh đã cho.
Nó có 3 trạng thái trả về như sau:
- `0` : Nếu tất cả các lệnh được tìm thấy và thực thi
- `1` : Nếu một hoặc nhiều lệnh được chỉ định không tồn tại hoặc không thể thực thi
- `2` : Nếu một tùy chọn không hợp lệ được chỉ định.

<img src = "https://i.imgur.com/tigx6LW.png">

## 21. Lệnh `alias` <a name ="alias"></a>
Cho phép shell thay thế 1 chuỗi string bằng 1 chuỗi string khác khi thực hiện các lệnh.

Nó giống như ta đặt bí danh cho 1 lệnh lớn để có thể dễ dàng sử dụng nó nhiều lần. Nó giống như lệnh tắt sẽ có chức năng tương tự như khi ta viết toàn bộ lệnh.

### 21.1. Tạo 1 alias
```
alias name="value"
```

<img src = "https://i.imgur.com/6G88y43.png">

### 21.2. Xem các alias hiện có
Tất cả alias: `alias`

<img src = "https://i.imgur.com/x8ezerq.png">

Xem alias chỉ định: `alias name1 name2 ....`

<img src = "https://i.imgur.com/yeBmKRf.png">

### 21.3. Xóa alias
```
unalias name
```

<img src = "https://i.imgur.com/GupiMTH.png">

## 22. Lệnh `tee` <a name="tee"></a>
Lệnh `tee` đọc đầu vào tiêu chuẩn và ghi nó vào cả đầu ra tiêu chuẩn và một hoặc nhiều tệp

### 22.1. `tee`
Ghi đè lên tệp

### 22.2. `tee -a`
`a - append` : không ghi đè tệp mà viết thêm vào tệp

<img src = "https://i.imgur.com/tOWeHU1.png">

## 23. Lệnh `grep` <a name ="grep"></a>
Là 1 bộ lọc để tìm kiếm trong tệp theo từ khóa và in các dòng chưa từ khóa đó ra.

Cú pháp:
```
grep [options] pattern [files]
```

### 23.1. `grep`
In ra dòng chứa từ khóa, tính cả dạng chuỗi con. Có phân biệt hoa thường

<img src=  "https://i.imgur.com/2MkJ1UA.png">

### 23.2. `grep -i`
`i - ignore case` : bỏ qua trường hợp hoa thường

Không phân biệt hoa thường.

<img src = "https://i.imgur.com/h8G2kkZ.png">

### 23.3. `grep -c`
`c -count` : đếm số dòng có kết quả tìm kiếm

<img src = "https://i.imgur.com/Ynmx3Vf.png">

### 23.4. `grep -l`
Tìm kiếm và in ra tên file có từ khóa

<img src= "https://i.imgur.com/NzimVhX.png">

### 23.5. `grep -w`
`w - word regexp`: Chỉ hiển thị khi nó là từ đó, bỏ qua chuỗi con

<img src = "https://i.imgur.com/Tv7n8Oa.png">

### 23.6. `grep -o`
`o - only matching`: chỉ hiển thị từ khóa cần tìm

<img src = "https://i.imgur.com/tn1oZGA.png">

### 23.7. `grep -n`
`n - line number`: in kết quả kèm số dòng của nó

<img src = "https://i.imgur.com/Bm2kIHc.png">

### 23.8. `grep -v`
In các dòng không chứa từ khóa.

<img src = "https://i.imgur.com/6Rs1JE4.png">

### 23.9. `grep ^string`
Tìm các dòng bắt đầu bằng từ khóa.

<img src = "https://i.imgur.com/SFYEudJ.png">

### 23.10. `grep string$`
Tìm các dòng kết thúc bằng từ khóa

<img src= "https://i.imgur.com/Nfq7MET.png">

## 24. Lệnh `cut` <a name ="cut"></a>
Dùng để cắt các phần tử mỗi dòng của tệp và ghi kết quả ra đầu ra tiêu chuẩn.

Lệnh `cut` bắt buộc phải đi cùng option. Nếu không sẽ gây ra lỗi.

<img src = "https://i.imgur.com/chYGXhX.png">

### 24.1. `cut -b`
`b - byte` : dùng để chọn các vị trí byte cần in ra. Dùng dấu phẩy (`,`) để phân tách các vị trí byte. Có thể dùng dấu gạch ngang (`-`) để biểu thị liên tục các chuỗi.

<img src  = "https://i.imgur.com/eY3MCwR.png">

### 24.2. `cut -c`
`c - character` : Lấy ra các kí tự theo vị trí

<img src = "https://i.imgur.com/ysJ9pPN.png">

### 24.3. `cut -f`
Cắt nội dung theo trường, xác định theo dấu phân cách.
#### 24.3.1. `cut -f`
Khi không sử dụng `-d` thì mặc định dấu phân cách được định là dấu `tab`. Như ví dụ dưới đây, không sử dụng dấu `tab`, nó sẽ in ra cả dòng

<img src = "https://i.imgur.com/MknTNgH.png">

#### 24.3.2. `cut -d "delimiter" -f (field number)`
Xác định dấu phân cách bằng `-d`

<img src ="https://i.imgur.com/IMGbKmQ.png">

## 25. Lệnh `tr` <a name="25"></a>
`tr - translate` : dùng để dịch hoặc xóa các kí tự.
```
tr [OPTION] SET1 [SET2]
```

### 25.1. `tr`
Đổi chữ hoa - thường:

<img src = "https://i.imgur.com/c32Xw1o.png">

Đổi khoảng trắng thành tab:

<img src = "https://i.imgur.com/yYfj79G.png">

Đổi kiểu ngoặc :

<img src ="https://i.imgur.com/IbV8tx6.png">

### 25.2. `tr -s`
`s - squeeze repeat` : loại bỏ sự lặp lại

<img src = "https://i.imgur.com/AFk0job.png">

### 25.3. `tr -d`
`d - delete` : xóa bỏ kí tự được chỉ định

<img src= "https://i.imgur.com/mNNfNSs.png">

Xóa bỏ chữ số khỏi văn bản:

<img src = "https://i.imgur.com/kmlWWqp.png">

## 26. Lệnh `wc` <a name="26"></a>
Đếm số dòng, số từ, số ký tự có trong tệp. 3 giá trị được hiển thị lần lượt trên 3 cột

```
wc [option] [filename1] [filename2] ...
```

<img src = "https://i.imgur.com/Q4C1MYe.png">

### 26.1. `wc -l`
chỉ đếm số dòng

### 26.2. `wc -w`
chỉ đếm số từ

### 26.3. `wc -c`
chỉ đếm số byte

### 26.4. `wc -m`
chỉ đếm số kí tự

### 26.1. `wc -L`
in ra chiều dài kí tự của dòng dài nhất trong file

## 27. Lệnh `sort` <a name="27"></a>
Dùng để sắp xếp các dòng từ tất cả các file đầu vào rồi cho xuất ra đầu ra tiêu chuẩn.

```
sort [option] [file1] [file2] ...
```

**Ưu tiên sắp xếp các dòng:**
1. Bắt đầu bằng `space`
2. Bắt đầu bằng số **(0-9)**
3. Bắt đầu bằng chữ **(a-A-b-B-...-z-Z)**

### 27.1. `sort filename`

<img src = "https://i.imgur.com/nlsvIWN.png">

### 27.2. `sort -r`
`r - reverse ` : đảo ngược thứ tự sắp xếp

<img src = "https://i.imgur.com/rKVjQsj.png">

### 27.3. `sort -k`
`k - key` : sắp xếp theo 1 cột chỉ định

<img src = "https://i.imgur.com/ya0vjPH.png">

### 27.4. `sort -c`
`c - check`: kiểm tra file. in ra dòng đầu tiên sai vị trí sắp xếp

<img src = "https://i.imgur.com/JjEEUr5.png">

### 27.5. `sort -u`
`u - unique` : loại bỏ các dòng trùng lặp

<img src = "https://i.imgur.com/7qKG33f.png">

### 27.6. `sort -M`
`M - month` : sắp xếp theo tháng

<img src = "https://i.imgur.com/Y4COuNp.png">

## 28. Lệnh `uniq` <a name ="28"></a>
Dùng để report hoặc bỏ qua những dòng lặp lại liền kề nhau

### 28.1. `uniq <filename>`
<img src = "https://i.imgur.com/xrhHLiN.png">

### 28.2. `uniq -c`
Đếm số lần 1 dòng được lặp lại.

<img src = "https://i.imgur.com/y7Kt0dO.png">

### 28.3. `uniq -d`
Chỉ in ra các dòng bị lặp lại

<img src = "https://i.imgur.com/fqnwNG4.png">

### 28.4. `uniq -u`
`u - unique` : chỉ in ra những dòng duy nhất

<img src = "https://i.imgur.com/l1Lupj1.png">

### 28.5. `uniq -f N`
`f - field` : chọn cột để thực hiện uniq

<img src = "https://i.imgur.com/nXJyKpR.png">

### 28.6. `uniq -s N`
Bỏ quả N kí tự đầu tiên để thực hiện uniq

<img src ="https://i.imgur.com/NaN8fuJ.png">

### 28.7. `uniq -w N`
Giới hạn số kí tự so sánh.

<img src = "https://i.imgur.com/OK1tn8y.png">

## 29. Lệnh `comm` <a name ="29"></a>
`comm` - compare : So sánh 2 tệp đã được sắp xếp theo từng dòng

<img src= "https://i.imgur.com/qnM1hsk.png">


- Cột 1: chứa các từ chỉ có trong file u1
- Cột 2: chứa các từ chỉ có trong file u2
- Cột 3: Chứa tên chung cho cả 2 tệp

### 29.1. `comm -1/2/3`
Bỏ qua cột 1, 2 hoặc 3.

### 29.2. `comm --check-order`
Kiểm tra xem các tệp đầu vào có được sắp xếp hay không. Nếu có file không được sắp xếp thì sẽ thông báo lỗi

### 29.3. `comm --nocheck-order`
Không check sắp xếp các file

<img src = "https://i.imgur.com/9x0e7Bs.png">

### 29.4. `comm --output-delimiter`
Thay đổi dấu phân cách

<img src= "https://i.imgur.com/WVWJCDH.png">

## 30. Lệnh `od` <a name ="30"></a>
Đổi định dạng từ đầu vào thành dạng bát phân(mặc định)

<img src = "https://i.imgur.com/2w0e6Wi.png">

### 30.1. `od -c`
Hiển thị nội dung đầu vào dưới dạng kí tự. Ngoài ra, còn bỏ qua các kí tự đặc biệt.

<img src = "https://i.imgur.com/ThAkp0B.png">

### 30.2. `od -`
Nhập đầu vào bằng dòng lệnh

<img src = "https://i.imgur.com/6YyPpJk.png">

## 31. Lệnh `sed` <a name ="31"></a>
Là 1 trình chỉnh sửa văn bản mạnh mẽ, cho phép tìm kiếm, thay thế, chèn và xóa văn bản.
```
sed OPTIONS... [SCRIPT] [INPUTFILE...] 
```

### 31.1. `sed s/<từ_cần_thay>/<từ_thay_thế> file`
Lệnh `sed` thường được dùng để thay thế văn bản trong file.

Ví dụ dưới đây là thay thế từ `unix` thành `linux` ở từ đầu tiên mỗi dòng
<img src= "https://i.imgur.com/az38VwU.png">

Để thay thế từ thứ n của 1 dòng, ta thêm `/n`

<img src = "https://i.imgur.com/1msF4Oa.png">

Thay tất cả các từ trên dòng: `/g`

<img src ="https://i.imgur.com/HXHpd56.png">

### 31.2. `sed -n s/<từ_cần_thay>/<từ_thay_thế>/p`
Chỉ in ra các dòng được thay thế

<img src ="https://i.imgur.com/MVkltof.png">

### 31.3. Xóa dòng từ 1 file cụ thể
1. Xóa 1 dòng thứ n cụ thể: `sed 'nd' file`

<img src = "https://i.imgur.com/eZstxzu.png">

2. Xóa dòng cuối: `$d`

3. Xóa theo range: `x,yd` (từ x -> y)

4. Xóa dòng có chứa mẫu cho trước: `sed '/pattern/d' filename.txt`

<img src = "https://i.imgur.com/6SeDXtR.png">

### 31.4. `sed` với kí tự đặc biệt
Xét ví dụ: Ta thay thế địa chỉ IP : `https://192.168.1.1` thành `ipaddress`:

Ta sử dụng `\` trước mỗi kí tự đặc biệt.

```
echo https://192.168.1.1 | sed 's/https\:\/\/192\.168\.1\.1/ipaddress/'
```

<img src = "https://i.imgur.com/2RIRln0.png">

## 32. Lệnh `find` <a name="32"></a>
Dùng để tìm kiếm đường dẫn tập tin trong 1 phân cấp thư mục

Nó hỗ trợ tìm kiếm theo tệp, thư mục, tên, ngày tạo, ngày sửa đổi, chủ sở hữu và quyền
```
find [nơi để bắt đầu tìm kiếm] [biểu thức xác định những gì cần tìm] [-options] [những gì cần tìm]
```

### 32.1. Tìm file với tên cụ thể
```
find /root -name text1.txt
```

<img src = "https://i.imgur.com/GQarCCK.png">

### 32.2. Tìm các tập tin và thư mục rỗng
```
find /root -empty
```

<img src  = "https://i.imgur.com/hXR4nYx.png">

### 32.3. Tìm theo permission
```
find /root/A -perm 644
```

<img src = "https://i.imgur.com/7ZGc3yr.png">

### 32.4. Tìm văn bản trong nhiều file
```
find ./ -type f -name "*" -exec grep 'dangdohai'  {} \;
```

<img src= "https://i.imgur.com/gCUlpUU.png">

### 32.5. Tìm theo kích thước file
`-size +1M` để tìm lớn hơn 1MB

`-size -1M` để tìm nhỏ hơn 1MB

## 33. Lệnh `locate` <a name ="33"></a>
Dùng để tìm kiếm tệp theo tên
```
locate [OPTION]... PATTERN...
```

### 33.1. `locate filename`
<img src = "https://i.imgur.com/koQyZad.png">

### 33.2. `locate -n (number) filename`
Giới hạn số kết quả

<img src= "https://i.imgur.com/4R9lvVK.png">

### 33.3. `locate -c file`
Đếm số lượng kết quả

<img src ="https://i.imgur.com/9tOFNNs.png">

### 33.4. `locate -i file`
Không phân biệt hoa, thường

<img src = "https://i.imgur.com/WMWYfUj.png">

## 34. Lệnh `date` <a name="34"></a>
In ra hoặc set kiểu ngày tháng và thời gian của hệ thống.

### 34.1. `date`
In ra ngày tháng và thời gian của hệ thống

<img src = "https://i.imgur.com/myr9lBP.png">

### 34.2. `date -u`
`u - UTC (Coordinated Universal Time )` - Hiển thị thời gian tại múi giờ GMT.

<img src ="https://i.imgur.com/9UugXXu.png">

### 34.3. `date --date=""`
- Ngày giờ 2 năm trước

<img src ="https://i.imgur.com/Gzr6dAj.png">

- Ngày giờ 5 giây trước

<img src ="https://i.imgur.com/JrpiAVC.png">

- Ngày giờ ngày hôm trước

<img src ="https://i.imgur.com/RfEPulo.png">

- Ngày giờ 2 tháng trước

<img src ="https://i.imgur.com/qDeaJV0.png">

- Ngày giờ 10 ngày trước

<img src ="https://i.imgur.com/KjEeCq3.png">

### 34.4. `date -s`
Đặt thời gian hệ thống
```
date --set="Tue Nov 13 15:23:34 +08 2020"
```

### 34.5. `date -r`
Sử dụng để hiển thị dấu thời gian được sửa đổi lần cuối của tệp dữ liệu.

<img src = "https://i.imgur.com/ONClv8n.png">

### 34.6. `date "+%<format_option>"
Dùng để định dạng hiển thị đầu ra của thời gian hệ thống.
Tham khảo tại man page lệnh date.

Một số ví dụ:

<img src = "https://i.imgur.com/wiUv7qL.png">


## 35. Lệnh `cal` <a name="35"></a>
Hiển thị lịch hệ thống

### 35.1. `cal`
Hiển thị lịch của tháng hiện tại

<img src = "https://i.imgur.com/U43UAjU.png">

### 35.2. `cal [month] [year]`
Hiển thị lịch của 1 tháng chỉ định

<img src= "https://i.imgur.com/vSmt8pH.png">

### 35.2. `cal [year]`
Hiển thị lịch 12 tháng của 1 năm chỉ định

<img src ="https://i.imgur.com/ajn7ekB.png">

## 36. Lệnh `sleep` <a name="36"></a>
Trì hoãn 1 thời gian xác định. (s, m, h, d)

Mặc định tính theo giây
```
sleep 10
sleep 10s
```

Theo phút:
```
sleep 1m
```

## 37. Lệnh `time` <a name="37"></a>
Dùng để thực thi 1 lệnh và hiển thị thời gian thực, thời gian CPU của hệ thống và user để thực thi lệnh đó.

<img src= "https://i.imgur.com/eM60P3s.png">

## 38. Lệnh `gzip - gunzip` <a name ="38"></a>
Nén và giải nén file. Mỗi file được nén thành 1 file duy nhất

### 38.1. `gzip`
Nén file thành file có tên `.gz` và xóa file ban đầu.

<img src = "https://i.imgur.com/9uQEOzs.png">

#### 38.1.1. `gzip -f`
`f - force` : ép buộc nénn 1 tệp dù đã có 1 tệp trùng tên với tệp sau khi nén

<img src= "https://i.imgur.com/78wuYen.png">

#### 38.1.2. `gzip -r folder_name`
Nén từng file trong thư mục.

#### 38.1.3. `gzip -[1-9]`
Chọn mức độ nén file.

1 : Nén tối đa ở tốc độ chậm nhất

...

9 : Nén tối thiểu ở tốc độ nhanh nhất

#### 38.1.4. `gzip -v`
Hiển thị quá trình nén

<img src = "https://i.imgur.com/y5qLFxF.png">

#### 38.1.5. `gzip -d`
Giải nén file

<img src = "https://i.imgur.com/SMesIEc.png">

### 38.2. `gunzip`
Dùng để giải nén file. sau khi giải nén xong sẽ xóa file nén

<img src = "https://i.imgur.com/7ro0rNr.png">

#### 38.2.1. `gunzip -c`
Xem nội dung file nén mà không cần giải nén file đó

<img src= "https://i.imgur.com/c5Xcs32.png">

#### 38.2.2. `gunzip -f`
Giải nén bất chấp

#### 38.2.3. `gunzip -r`
Giải nén tất cả các file trong 1 thư mục

<img src= "https://i.imgur.com/9TEmG58.png">

#### 38.2.4. `gunzip -v`
Xem qúa trình

## 39. Lệnh `zcat - zmore` <a name ="39"></a>
Dùng để đọc những file nén bằng gzip

- `zcat`

<img src= "https://i.imgur.com/As8jQDl.png">

- `zmore`

<img src ="https://i.imgur.com/Iw5Skqo.png">


## 40. Lệnh `bzip2 - bunzip2` <a name="40"></a>
Nén file nhưng tốt hơn gzip. Muốn sử dụng bzip2 thì phải cài đặt gói hỗ trợ bzip2
```
yum -y install bzip2
```

<img src= "https://i.imgur.com/7tktDwg.png">

### 40.1. `-v`
Hiển thị quá trình

## 41. Lệnh `bzcat - bzmore` <a name="41"></a>
Đọc file nén bằng bzip2

<img src = "https://i.imgur.com/dXR69C8.png">

## 42. Lệnh `who` <a name="42"></a>
### 42.1. `whoami`
Hiển thị tên user đang thực thi

<img src ="https://i.imgur.com/C0KNcjD.png">

### 42.2. `who`
Cung cấp thông tin về người dùng đăng nhập vào hệ thống

<img src ="https://i.imgur.com/abhGEis.png">

### 42.3. `who am i`
Hiển thị dòng trỏ đến phiên hiện tại

<img src= "https://i.imgur.com/xxNMAwu.png">

### 42.4. `w`
Cho biết ai đã đăng nhập và đang làm gi

<img src = "https://i.imgur.com/PG7ypTF.png">

### 42.5. `id`
Cung cấp id user, group

<img src= "https://i.imgur.com/8nEUlBg.png">

## 43. Lệnh `su` <a name ="43"></a>
Lệnh su cho phép người dùng chạy shell như một người dùng khác
```
su <user_name>
```

### 43.1. `su root`
Sử dụng với quyền của user root

## 44. Lệnh `useradd` <a name="44"></a>
Thêm user.

<img src="https://i.imgur.com/RpSzIoK.png">

### 44.1. `useradd -m`
Tạo user cùng thư mục tại `/home`

<img src= "https://i.imgur.com/UbpxE3K.png">

### 44.2. `useradd -d`
Tạo thư mục của user tại thư mục chỉ định

<img src ="https://i.imgur.com/dHxDVqs.png">

### 44.3. `useradd -e`
Tạo user với ngày hết hạn xác định

<img src= "https://i.imgur.com/9z03rWf.png">

Để xem kiểm chứng ngày hết hạn của user. Ta dùng lệnh `chage`

<img src= "https://i.imgur.com/LsZqTZL.png">

## 45. Lệnh `userdell` <a name ="45"></a>
Dùng để xóa user và các mục liên quan đến user

### 45.1. `userdel <ten_user>`
Xóa user

<img src="https://i.imgur.com/8Cmfb2q.png">

### 45.2. `userdel -r <ten_user>`
Xóa user và cả thư mục home của nó.

<img src="https://i.imgur.com/pnIrdM7.png">

## 46. Lệnh `usermod` <a name="46"></a>
Được sử dụng để sửa đổi hoặc thay đổi bất kỳ thuộc tính nào của tài khoản người dùng

### 46.1. `usermod -c`
Đặt mô tả ngắn gọn về user
<img src ="https://i.imgur.com/UBhUjef.png">

### 46.2. `usermod -d`
Thay đổi thư mục home của user

<img src="https://i.imgur.com/iRje1UP.png">

<img src ="https://i.imgur.com/iUR6zQq.png">

### 46.3. `usermod -g`
Thay đổi group của user

<img src= "https://i.imgur.com/sqEUbqS.png">

### 46.4. `usermod -G`
Thêm group vào user

<img src="https://i.imgur.com/89mkYBr.png">

### 46.5. `usermod -a -G`
Thêm group primary (group chính) cho user

<img src="">

### 46.6. `usermod -u uid`
Thay đổi uid của user

<img src= "https://i.imgur.com/YY6kovZ.png">

### 46.7. `usermod -u uid -g gid`
Thay đổi gid của group

<img src= "">

## 47. Lệnh `passwd` <a name="47"></a>
Dùng để thay đổi mật khẩu của user hiện tại

<img src= "https://i.imgur.com/6mr99ns.png">

### 47.1. `passwd <user_name>`
Thay đổi mật khẩu của user chỉ định. Cần thực hiện ở quyền root

<img src="https://i.imgur.com/YuYHaiI.png">

### 47.2. `passwd -d <user_name>`
Xóa mật khẩu của 1 tài khoản. Thực hiện ở quyền root

<img src="https://i.imgur.com/u5RK2Bz.png">


## 48. Lệnh `groupmod` <a name="48"></a>
Dùng để thay đổi hoặc sửa đổi nhóm hiện có trên hệ thống.

### 48.1. `groupmod -g`
Thay đổi GID của group

<img src="https://i.imgur.com/5MsHnSI.png">

### 48.2. `groupmod -n`
Đổi tên group : `groupmod -n gr_newname gr_oldname`

<img src="https://i.imgur.com/ZH9Nm4a.png">

## 49. Lệnh `groupdel` <a name="49"></a>
Xóa group

<img src="https://i.imgur.com/LeZsEOA.png">

## 50. Lệnh `vigr` <a name="50"></a>
Dùng để thay đổi file chứa tên và GID của các group

<img src="https://i.imgur.com/wHJScyl.png">

<img src="https://i.imgur.com/flNqqYc.png">
