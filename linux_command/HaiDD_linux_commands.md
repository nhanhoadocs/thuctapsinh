# Linux command

## 1. Lệnh `man`:
Hầu hết các file và lệnh Unix đều có trang `man` khá tốt để giải thích việc sử dụng chúng.

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

## 3. Lệnh `cd`
Chuyển đổi thư mục làm việc.
- `cd /duong/dan/tuyet/doi` : chuyển tới thư mục /doi/
- `cd` : chuyển về thư mục chính của người dùng
- `cd A && ls` : chuyển tới thư mục A và hiện danh sách các file của nó.
- `cd -`: chuyển về thư mục đang làm việc trước đó.
- `cd ..` : chuyển về thư mục cha.
- `cd~` : Thay đổi thư mục hiện tại về thư mục chính