# Các lệnh cơ bản trong Linux  
## Mục lục  
[1. man page](#1)  
[2. Các lệnh làm việc với thư mục](#2)  
       [2.1 pwd](#2)  
       [2.2 cd](#3)  
       [2.3 ls](#4)  
       [2.4 mkdir](#5)  
       [2.5 rmdir](#6)  
[3. Các lệnh làm việc với tệp](#7)  
       [3.1 touch](#7)  
       [3.2 rm](#8)  
       [3.3 cp](#9)  
       [3.4 mv](#10)   
       [3.5 rename](#11) 


<a name="1"></a>
# Phần 1. man pages 

## 1.1 man $command  
Khi gặp một lệnh mà bạn không hiểu hoặc chưa biết cách sử dụng thì ta có thể gõ `man` đứng trước lệnh đó.  
```
man cat
CAT(1)                                                      User Commands                                                      CAT(1)

NAME
       cat - concatenate files and print on the standard output

SYNOPSIS
       cat [OPTION]... [FILE]...

DESCRIPTION
       Concatenate FILE(s), or standard input, to standard output.

       -A, --show-all
              equivalent to -vET

       -b, --number-nonblank
              number nonempty output lines, overrides -n

       -e     equivalent to -vE

       -E, --show-ends
              display $ at end of each line

       -n, --number
              number all output lines

       -s, --squeeze-blank
              suppress repeated empty output lines

       -t     equivalent to -vT

       -T, --show-tabs
              display TAB characters as ^I

       -u     (ignored)

       -v, --show-nonprinting
              use ^ and M- notation, except for LFD and TAB
```
Ta ấn `q` để thoát.  

## 1.2 man $configfile
Hầu hết các tập tin cấu hình đều có hướng dẫn riêng của nó  
```
man rsyslog.conf
RSYSLOG.CONF(5)                                      Linux System Administration                                      RSYSLOG.CONF(5)

NAME
       rsyslog.conf - rsyslogd(8) configuration file

DESCRIPTION
       The  rsyslog.conf  file  is  the main configuration file for the rsyslogd(8) which logs system messages on *nix systems.  This
       file specifies rules for logging.  For special features see the rsyslogd(8) manpage. Rsyslog.conf is backward-compatible  with
       sysklogd's syslog.conf file. So if you migrate from sysklogd you can rename it and it should work.

       Note  that this version of rsyslog ships with extensive documentation in html format.  This is provided in the ./doc subdirec‐
       tory and probably in a separate package if you installed rsyslog via a packaging system.  To use rsyslog's advanced  features,
       you need to look at the html documentation, because the man pages only cover basic aspects of operation.

MODULES
       Rsyslog  has  a  modular design. Consequently, there is a growing number of modules. See the html documentation for their full
       description.
...
```

## 1.3 man $daemon  
-> Hiển thị thông tin các chương trình chạy nền trên hệ thống  

## 1.4 man -k (apropos)
-> Hiển thị danh sách các manpage chứa chuỗi  
```
[root@centos7srv ~]# man -k syslog
logger (1)           - a shell command interface to the syslog(3) system log module
rsyslog.conf (5)     - rsyslogd(8) configuration file
rsyslogd (8)         - reliable and extended syslogd
```
## 1.5 whatis  
Để chỉ xem mô tả của một trang thủ công, sử dụng `whatis` theo sau bởi một chuỗi.  
```
[root@centos7srv ~]# whatis route
tc-route (8)         - route traffic control filter
```

## 1.6 whereis  
Vị trí của một `manpage` (tài liệu hướng dẫn sử dụng của program) có thể được hiển thị thông qua lệnh `whereis`  
Ngoài ra Lệnh `whereis` được sử dụng để xác định vị trí lưu trữ các binary file, source code, manual page của 1 chương trình (program) trên máy tính.

**Cú pháp cơ bản**  
```
whereis [option(s)] program_name(s)
```
Các tùy chọn:  
`-b` : tìm kiếm binary file  
`-m`: tìm kiếm man page  
`-s`: tìm kiếm source code

Khi không đi kèm tùy chọn, `whereis` trả về đường dẫn tuyệt đối của binary file, source code, man page (nếu chúng tồn tại) cho program_name (hay tên lệnh).  

```
[root@centos7srv ~]# whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz
```
```
[root@centos7srv ~]# whereis -b ls
ls: /usr/bin/ls
```
```
[root@centos7srv ~]# whereis -m ls
ls: /usr/share/man/man1/ls.1.gz
```
## 1.7 man sestions  
Ý nghĩa của những số nằm trong dấu ngoặc khi chạy lệnh man:  
- `1` chương trình thực thi hoặc lệnh shell  
- `2` Cuộc gọi hệ thống (các chức năng được cung cấp bởi kernel)  
- `3` cuộc gọi thư viện (chức năng trong thư viện chương trình)  
- `4` tệp đặc biệt (thường được tìm thấy trong /dev)  
- `5` Định dạng và quy ước về tệp, vd /etc/passwd  
- `6` trò chơi  
- `7` Khác (bao gồm các gói và quy ước vĩ mô), ví dụ: man(7)  
- `8` Lệnh quản trị hệ thống (thường chỉ dành cho root)  
- `9` Kernel routines [Không chuẩn]  

## 1.8 mandb
Lệnh `mandb` dùng để test trên Debian/Mint có tồn tại một trang man hay không.  
Hoặc trên CentOS ta chạy lệnh  
```
makewhatis
```
<a name ="2"></a>

# Phần 2. Các lệnh làm việc với thư mục  

## 2.1 pwd
Lệnh `pwd` dùng để hiển thị đường dẫn đến thư mục đang làm việc hiện tại  
```
[root@centos7srv network-scripts]# pwd
/etc/sysconfig/network-scripts
```
<a name= "3"></a>

## 2.2 cd
Bạn có thể thay đổi thư mục hiện tại đang làm việc bằng cách di chuyển tới thư mục khác qua lệnh `cd`.  
Các option đi kèm:  
- Thay đổi thư mục hiện tại sang thư mục cha
```
cd ..
```
- Thay đổi thư mục hiện tại về thư mục chính
```
cd ~
```
- Hiển thị thư mục làm việc cuối cùng từ nơi bạn di chuyển
```
cd --
```
- Di chuyển tới thư mục `home`
```
cd
```
<a name="4"></a>

## 2.3 ls
Lệnh `ls` dùng để hiển thị danh sách nội dung của thư mục  
```
[root@graylogsrv var]# ls
adm  cache  crash  db  empty  games  gopher  kerberos  lib  local  lock  log  mail  nis  opt  preserve  run  spool  tmp  yp
```
- Để hiển thị các thư mục và file ẩn
```
ls -a
.                        depmod.d                 hosts                     maven              .pwd.lock       statetab
..                       dhcp                     hosts.allow               mke2fs.conf        python          statetab.d
adjtime                  DIR_COLORS               hosts.deny                modprobe.d         rc0.d           subgid
aliases                  DIR_COLORS.256color      init.d                    modules-load.d     rc1.d           subuid
aliases.db               DIR_COLORS.lightbgcolor  inittab                   mongod.conf        rc2.d           sudo.conf

```
- Hiển thị thông tin đầy đủ như file hoặc thư mục con, size, modified date and time, file hoặc folder name và permission của nó.
```
ls -l
total 1068
-rw-r--r--.  1 root root              16 Dec 17 11:03 adjtime
-rw-r--r--.  1 root root            1518 Jun  7  2013 aliases
-rw-r--r--.  1 root root           12288 Dec 17 11:05 aliases.db
drwxr-xr-x.  2 root root            4096 Dec 21 09:42 alternatives
-rw-------.  1 root root             541 Apr 11  2018 anacrontab
-rw-r--r--.  1 root root              55 Oct 30  2018 asound.conf
drwxr-x---.  3 root root              43 Dec 17 10:59 audisp
drwxr-x---.  3 root root              83 Dec 17 11:05 audit
drwxr-xr-x.  2 root root              22 Dec 17 10:59 bash_completion.d
-rw-r--r--.  1 root root            2853 Oct 31  2018 bashrc
```
- Hiển thị size trong định dạng có thể đọc được.
```
ls -lh
total 1.1M
-rw-r--r--.  1 root root            16 Dec 17 11:03 adjtime
-rw-r--r--.  1 root root          1.5K Jun  7  2013 aliases
-rw-r--r--.  1 root root           12K Dec 17 11:05 aliases.db
drwxr-xr-x.  2 root root          4.0K Dec 21 09:42 alternatives
-rw-------.  1 root root           541 Apr 11  2018 anacrontab
-rw-r--r--.  1 root root            55 Oct 30  2018 asound.conf
drwxr-x---.  3 root root            43 Dec 17 10:59 audisp
drwxr-x---.  3 root root            83 Dec 17 11:05 audit
drwxr-xr-x.  2 root root            22 Dec 17 10:59 bash_completion.d
-rw-r--r--.  1 root root          2.8K Oct 31  2018 bashrc
```
- Sắp xếp File theo size
```
ls -lS
total 1068
-rw-r--r--.  1 root root          670293 Jun  7  2013 services
-rw-r--r--.  1 root root           20133 Dec 21 09:42 ld.so.cache
-rw-r--r--.  1 root root           12288 Dec 17 11:05 aliases.db
-rw-r--r--.  1 root root            7265 Dec 17 10:59 kdump.conf
-rw-r--r--.  1 root root            6722 Apr 11  2018 screenrc
-rw-r--r--.  1 root root            6545 Oct 31  2018 protocols
```
- Hiển thị danh sách thư mục dưới dạng tree
```
ls -R
```  
<a name="5"></a>

## 2.4 mkdir
- Lệnh `mkdir` (Make directory) được dùng để tạo thư mục  
```
mkdir folder1
```
- Tạo thư mục có chứa các thư mục con
```
mkdir -p /folder1/nga/nga1
```
<a name="6"></a>

## 2.4 rmdir
- Lệnh `rmdir` dùng để xóa thư mục trống (Remove Directory) 
```
rmdir nga1
```
- Để xóa các thư mục đệ quy sử dụng tùy chọn `-p`
```
rmdir -p /folder1/nga/nga1
```
<a name="7"></a>

# 3. Các lệnh làm việc với tệp

## 3.1 touch
Lệnh `touch` dùng để tạo một file trống
```
touch file1
```
- Tạo nhiều file
```
touch file1 file2 file3
```
- Tạo file chỉ định thời gian cụ thể
```
touch -t YYMMDDHHMM.SS file1
touch -t 1912242200.00 file1
```
- Tránh việc tạo file mới khi file không tồn tại
```
touch -c file1.txt
```

<a name="8"></a>

## 3.2 rm
Lệnh `rm` (remove) được dùng để xóa file  
```
rm file1
```
- Xóa nhiều file 
```
rm file1 file2 file3
```
- Nhắc trước khi xóa file
```
rm -i file1
```
Y: chấp nhận xóa
N: từ chối xóa
- Xóa thư mục đệ quy
```
rm -r 
```
- Xóa tập tin bất kể quyền hạn
```
rm -f
```
- Xóa bất kì thư mục nào (r - recursive: đệ quy, f - force) -> Bắt buộc xóa dù có các thư mục con và file bên trong.
```
rm -rf
```
### 3.3 file  
Lệnh `file` được dùng để xác định loại tệp  
Ví dụ  
```
[root@centos7srv ~]# file /etc/passwd
/etc/passwd: ASCII text

[root@centos7srv ~]# file /dev/sda
/dev/sda: block special

[root@centos7srv ~]# file -s /dev/sda
/dev/sda: x86 boot sector; partition 1: ID=0x83, active, starthead 32, startsector 2048, 2097152 sectors; partition 2: ID=0x8e, starthead 170, startsector 2099200, 39843840 sectors, code offset 0x63
```

<a name="9"></a>

### 3.4 cp  
Lệnh `cp` dùng để sao chép thư mục hoặc tệp tin  
- Sao chép đệ quy các thư mục  
```
cp -r
```
- Sao chép một file và đổi tên file
```
cp file1 file1.copy
```
- Sao chép 1 tệp vào 1 thư mục  
```
cp file1 dir1
```
- Sao chép nhiều tệp vào 1 thư mục  
```
cp file1 file2 file3 dir1/
```
- Xác nhận trước khi copy
```
cp -i file file1
```
- Copy file nhưng giữ lại toàn bộ thuộc tính của **file**

```
cp -p ./*.txt ./lab/
```
Lưu ý: Các thuộc tính được giữ lại là: access time, user ID, group ID, modification date

- Copy thư mục: sử dụng tùy chọn `-r` hoặc `-a`  
       - `-r`: copy toàn bộ file và các thư mục con của thư mục copy
       - `-a`: copy toàn bộ **thư mục** và duy trì các thuộc tính như timestamp, ownership

- Copy mà không ghi đè lên file đang có (file cùng tên) (n --no-clobber)
```
cp -n file1 folder1/
```
- Bắt buộc ghi đè
```
cp -f file1 folder1/
```
- Chỉ copy những phần chưa có trong file (u -update)
```
cp -u home/file1 /etc/file1
```
- Ghi đè file đang có ở thư mục đích
```
cp -i /etc/passwd /mnt/backup/
cp: overwrite '/mnt/backup/passwd'? y
```
- Tạo symbolic link  
```
root@mtd:~# cp -s /home/mtd/file_1.txt /mnt/backup/
root@mtd:~# cd /mnt/backup/
root@mtd:/mnt/backup# ls -l file_1.txt
lrwxrwxrwx 1 root root 27 Feb  5 18:37 file_1.txt -> /home/mtd/file_1.txt
root@mtd:/mnt/backup#
```
- Tạo hard link  
```
root@mtd:~# cp -l /home/mtd/devops.txt /mnt/backup/
root@mtd:~#
```
<a name="10"></a>

### 3.5 mv
Lệnh `mv` dùng để đổi tên file hoặc di chuyển file
- Tạo bản sao lưu (backup) với tệp đích hiện có
```
mv --backup[=CONTROL]
```
- Cũng tạo bản sao lưu nhưng không chấp nhận đối số truyền vào
```
mv -b
```
- Nhắc trước khi đổi tên
```
mv -i
```
- Không nhắc 
```
mv -f
```
- Không ghi đè lên 1 tập tin hiện có
```
mv -n
```
- Di chuyển tệp tin/thư mục
```
mv home/ngahong/file1 /home/ngakma
```
<a name="11"></a>

### 3.6 rename
Lệnh `rename` dùng để đổi tên file
- Diễn giải
```
rename -v
```
- Hiển thị phiên bản và thoát
```
rename -V
```
- Đổi tên peform trên taget liên kết mềm (symlink)
```
rename -s
```
Ví dụ
```
[root@centos7 ~]$ touch one.conf two.conf three.conf
[root@centos7 ~]$ rename .conf .backup *.conf
[root@centos7 ~]$ ls
one.backup three.backup two.backup
[root@centos7 ~]$
```
<a name="12"></a>

## 4. Các lệnh làm việc với nội dung file  

### 4.1 head  
Lệnh `head` dùng trong trường hợp ta muốn hiển thị phần đầu nội dung của file.  Mặc định lệnh `head` sẽ hiển thị 10 dòng đầu tiên của file  

```
[root@centos7srv ~]# head /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
```
- Ta cũng có thể hiển thị `n` dòng theo ý muốn 
```
[root@centos7srv ~]# head -4 /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
```
- In ra 200 bytes đầu tiên của tệp
```
[root@centos7srv ~]# head -c 200 /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/[root@centos7srv ~]#
```
- Không in ra tiêu đề xác định tên tệp (q- quiet)

```
head -q
```
-Luôn in tiêu đề xác định tên tệp ( v- verbose)
```
head -v
```

<a name="13"></a>

### 4.2 tail  

Lệnh `tail` dùng để hiển thị các dòng cuối của tệp. Mặc định nó sẽ hiển thị 10 dòng cuối cùng của file  

```
[root@centos7srv ~]# man head
[root@centos7srv ~]# tail /etc/passwd
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
polkitd:x:999:998:User for polkitd:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
chrony:x:998:996::/var/lib/chrony:/sbin/nologin
nginx:x:997:995:Nginx web server:/var/lib/nginx:/sbin/nologin
mysql:x:27:27:MariaDB Server:/var/lib/mysql:/sbin/nologin
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
```
- In ra `n` dòng cuối của file  
```
[root@centos7srv ~]# tail -n 3 /etc/passwd
nginx:x:997:995:Nginx web server:/var/lib/nginx:/sbin/nologin
mysql:x:27:27:MariaDB Server:/var/lib/mysql:/sbin/nologin
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
```
- Tiếp tục đọc file cho đến khi có lệnh dừng (Ctrl+C) (f -follow)
```
tail -f
```
- In ra `n` bytes cuối của file  
```
tail -c 
```
- Không in ra tiêu đề của file
```
tail -q
```

<a name="14"></a>

### 4.3 Lệnh cat  

Lệnh `cat` dùng để hiển thị nội dung của tệp.  
```
[root@centos7srv ~]# cat song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```

- `cat` là viết tắt của `concatenate`. Một trong những cách sử dụng cơ bản của `cat` là ghép các tệp thành một tệp lớn hơn (hoặc hoàn chỉnh).
```
[root@centos7srv ~]# echo line1 > f1
[root@centos7srv ~]# echo line2 > f2
[root@centos7srv ~]# echo line3 > f3
[root@centos7srv ~]# cat f1
line1
[root@centos7srv ~]# cat f2
line2
[root@centos7srv ~]# cat f3
line3
[root@centos7srv ~]# cat f1 f2 f3
line1
line2
line3
[root@centos7srv ~]# cat f1 f2 f3 > all
[root@centos7srv ~]# cat all
line1
line2
line3
```
- Có thể dùng cat để tạo các tập tin văn bản phẳng  
```
[root@centos7srv ~]# cat > muadong.txt
Mua dong lanh gia
Gio ret tung con
[root@centos7srv ~]# cat muadong.txt
Mua dong lanh gia
Gio ret tung con
```
Sau khi nhập dòng cuối thì ấn Ctrl+d để thoát.  

- Đánh dấu kết thúc tùy chỉnh  
- Copy tệp tin
```
[root@centos7srv ~]# cat song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
[root@centos7srv ~]# cat song.txt >> song2.txt
[root@centos7srv ~]# cat song2.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```
<a name="15"></a>

## 4.4 tac
Lệnh `tac` dùng để hiển thị ngược nội dung của file  
```
[root@centos7srv ~]# tac song.txt
Khi nao ta yeu nhau
Em cung khong biet nua
Gio bat dau tu dau
Song bat dau tu gio
```
<a name="16"></a>

## 4.5 less & more  
Trong trường hợp cần phải đọc toàn bộ dữ liệu từ một file nhưng lại không muốn mở file đó lên bằng một trình soạn thảo, chúng ta có thể sử dụng lệnh less hoặc lệnh more để phân trang file cần đọc.

### 4.5.1 less  
Lệnh `less` dùng mở một tệp để đọc tương tác, cho phép di chuyển lên xuống và tìm kiếm. Để mở tệp tin ta gõ:  
```
less song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
song.txt (END)
```
- **Các phím di chuyển**:  
       - Xuống trang mới: Phím **Space**  
       - Lên trang phía trên: **Phím b**  
       - Xuống cuối file: phím **G**    
       - Lên đầu file: phím **g**  

- **Theo dõi đầu ra của tệp hiện đang mở** : phím F  
- **Mở tệp hiện tại trong trình chỉnh sửa**: phím v  
- **Thoát khỏi tệp**: phím q  

### 4.5.2 more  

Lệnh `more` dùng mở một tệp để đọc tương tác, cho phép di chuyển lên xuống và tìm kiếm. Để mở tệp tin ta gõ lệnh  
```
[root@centos7srv ~]# more song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```
> Điểm khác biệt giữa `less` và `more` là `less` cho phép cuộn ngược lên các trang dữ liệu đã đọc, còn more thì chỉ có thể đọc từ đầu tới cuối. Lệnh `less` có thể dùng phím mũi tên trên bàn phím để scroll lên xuống, lệnh more không có chức năng này.  

<a name="17"></a>

## 4.6 strings  
Lệnh `strings` dùng để in chuỗi ký tự có thể in trong tệp.  
```
[root@centos7srv ~]# strings song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```
- Mặc định `strings` sẽ tìm chuỗi có 4 ký tự hoặc dài hơn. Ta có thể set chiều dài của chuỗi bằng cách sử dụng tùy chọn `-n`  
```
strings -n file_name
```
VD:  
```
[root@centos7srv ~]# strings -n 6 f1
```
- Chỉ in chuỗi từ các phần dữ liệu được tải, khởi tạo trong tệp. (d -data)
```
strings -d
```
- In tên của file trước mỗi chuỗi
```
[root@centos7srv ~]# strings -f song.txt
song.txt: Song bat dau tu gio
song.txt: Gio bat dau tu dau
song.txt: Em cung khong biet nua
song.txt: Khi nao ta yeu nhau
```
- Tính cả khoảng trắng của chuỗi. Theo mặc định, tab và ký tự khoảng trắng được bao gồm trong các chuỗi được hiển thị, nhưng các ký tự khoảng trắng khác, chẳng hạn như dấu cách và xuống dòng mới. Tùy chọn `-w` thay đổi điều này để tất cả các ký tự khoảng trắng được coi là một phần của chuỗi.  
```
string -w
```

<a name="18"></a>  

## 5. Commands and arguments (Các lệnh và đối số)
  
### 5.1 echo  
Lệnh `echo` dùng để hiển thị một dòng văn bản. 
- Hiển thị chuỗi nhập vào  
```
[root@centos7srv ~]# echo Xin chao
Xin chao
```
- Cho phép giải thích các dấu gạch chéo ngược/ Chèn các kí tự 
```
echo -e  
```
- Xuống dòng (`-n`)
```
[root@centos7srv ~]# echo -e "Xin chao \n --Nga"
Xin chao
 --Nga
```
- Tab (`\t`) 
```
[root@centos7srv ~]# echo -e "Xin chao \n\t --Nga"
Xin chao
         --Nga
```
- Không xuất ra dòng mới  (`-n`)
```
[root@centos7srv ~]# echo -n "Xin chao"
Xin chao[root@centos7srv ~]#
```

**Trường hợp sử dụng**  
- Nhập 1 chuỗi vào tệp và xóa dòng cũ  
```
[root@centos7srv ~]# echo Xin chao > t1
[root@centos7srv ~]# cat t1
Xin chao
[root@centos7srv ~]# echo  Xin chao 2 > t1
[root@centos7srv ~]# cat t1
Xin chao 2
```
- Nối dòng tiếp theo vào tệp  
```
[root@centos7srv ~]# echo Xin chao 3 >> t1
[root@centos7srv ~]# cat t1
Xin chao 2
Xin chao 3
```

### 5.2 type and which  

**5.2.1**
Trong hệ thống Linux, lệnh `type` được sử dụng để hiển thị thông tin về loại lệnh. Nó hiển thị nếu lệnh là alias, shell funtion, shell builtin, tệp đĩa hoặc từ dành riêng cho shell.  

Các tùy chọn đi kèm:  
- **-a** : Hiển thị xem nó là một alias, từ khóa hoặc hàm, nó cũng có thể hiển thị đường dẫn của 1 file thực thi nếu có  
```
[root@centos7srv ~]# type -a ls
ls is aliased to `ls --color=auto'
ls is /usr/bin/ls
[root@centos7srv ~]# type -a pwd
pwd is a shell builtin
pwd is /usr/bin/pwd
```
- **-t** : Tùy chọn -t cho biết loại để in một từ duy nhất mô tả loại lệnh có thể là một trong những điều sau đây:  
       - alias (alias vỏ)  
       - funtion (funtion shell)  
       - builtin (shell builtin)  
       - file (disk file)  
       - keyword (shell reserved word)  

```
[root@centos7srv ~]# type -t cat
file
[root@centos7srv ~]# type -t ls
alias
```
- **-p** : hiển thị đường dẫn (path)  
```
[root@centos7srv ~]# type -p date
/usr/bin/date
```

**5.2.2 which**  
Lệnh `which` dùng để hiển thị đầy đủ đường dẫn của lệnh (shell)  
```
[root@centos7srv ~]# which cp ls cd mkdir pwd
alias cp='cp -i'
        /usr/bin/cp
alias ls='ls --color=auto'
        /usr/bin/ls
/usr/bin/cd
/usr/bin/mkdir
/usr/bin/pwd
```

### 5.3 alias  
Trong Linux có một công cụ thu gọn lệnh rất tiên lợi và ta gọi là `Alias`, vậy `Alias` là một cách khai báo các lệnh viết tắt nhằm tiết kiệm thời gian gõ phím và dễ nhớ hơn. Thay vì bạn gõ một dòng lệnh dài hàng trăm chử thì bạn chỉ việc gõ đôi ba chữ là có thể thay thế lệnh đó được. Theo mặc định các lệnh viết tắt được lưu trữ trong file `~/.bashrc` hoặc `~/.bash_profile`, trong đó dấu `~` là viết tắt cho thư mục `home` của bạn. Ví dụ thư mục `home` của bạn là `/home/ngahong/ thì file đó sẽ là /home/ngahong/.base_profile.

**5.3.1 Tạo một alias**  
Ví dụ  
```
[root@centos7srv ~]# cat count.txt
one
two
three
[root@centos7srv ~]# alias dog=tac
[root@centos7srv ~]# dog count.txt
three
two
one
```  
**5.3.2 Viết tắt lệnh**  
```
alias ll='ls -lh --color=auto'
alias c='clear'
```  
`alias` có thể được sử dụng để cung cấp các lệnh với các tùy chọn mặc định. Ví dụ dưới đây cho thấy cách đặt tùy chọn `-i` mặc định khi nhập `rm`.  
```
[root@centos7srv ~]# touch muadong.txt
[root@centos7srv ~]# alias rm='rm -i'
[root@centos7srv ~]# rm muadong.txt
rm: remove regular empty file ‘muadong.txt’?
```
Ví dụ alias cho SSH  
```
alias sshnga='ssh ngakma@192.168.152.100'  
```

- Liệt kê danh sách lệnh alias  
```
[root@centos7srv ~]# alias
alias cp='cp -i'
alias dog='tac'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
```

**5.3.3 Xóa một alias** 
```
unalias alias_name
```
Ví dụ  
```
[root@centos7srv ~]# which dog
alias dog='tac'
        /usr/bin/tac
[root@centos7srv ~]# unalias dog
[root@centos7srv ~]# which dog
/usr/bin/which: no dog in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin)
```

## 6. tee  
Lệnh `tee` dùng để đọc từ đầu vào tiêu chuẩn và ghi vào đầu ra và tập tin tiêu chuẩn.  
```
tee [tùy chọn] file
```
Ví dụ  
- Sao chép đầu vào từng file và cả đầu ra
```
[root@test1 ~]# cat file.txt
[root@test1 ~]# echo "example" | tee file.txt
example
[root@test1 ~]# cat file.txt
example
```
- Nối vào các file đã cho, không ghi đè
```
[root@test1 ~]# cat file.txt
example
[root@test1 ~]# echo "example-1" | tee -a file.txt
example-1
[root@test1 ~]# cat file.txt
example
example-1
```

## 7. grep  
Lệnh `grep` dùng để in ra chuỗi cần tìm kiếm.  
Các tùy chọn đi kèm lệnh `grep`  

`-i` : không phân biệt hoa thường

<img src="https://i.imgur.com/Pjvwxnw.png">

`-v` : Tìm những dòng không chứa chuỗi (tìm kiếm ngược)

<img src="https://i.imgur.com/etaD5tl.png">

`-n` : Hiển thị số dòng

<img src="https://i.imgur.com/tRtnCi7.png">

`-c` : Đếm số dòng khớp

<img src="https://i.imgur.com/unWSDsk.png">  

- Tìm kiếm chuỗi  
```
https://i.imgur.com/KSF4hWr.png
```
- Loại bỏ dấu # và khoảng trắng  

<img src="https://i.imgur.com/hNq6kfp.png">  

## 8. cut  
Lệnh `cut` dùng để loại bỏ các phần từ mỗi dòng của tập tin.  

Ví dụ  
- Cắt mười sáu ký tự đầu tiên của mỗi dòng STDIN:  
```
[root@centos7srv ~]# echo "This is a filetest" | cut -c 1-16
This is a filete
```
- Cắt 15 ký tự đầu tiên của mỗi dòng của các tệp đã cho
```
[root@centos7srv ~]# cut -c 1-15 song.txt
Song bat dau tu
Gio bat dau tu
Em cung khong b
Khi nao ta yeu
```
- Cắt bỏ từ ký tự thứ 3 đến cuối mỗi dòng
```
[root@centos7srv ~]# cut -c 3- song.txt
ng bat dau tu gio
o bat dau tu dau
 cung khong biet nua
i nao ta yeu nhau
```

## 9. tr  
Lệnh `tr` dùng để dịch hoặc xóa kí tự trong tệp tin. 
Cú pháp chung  
```
tr [tuỳ chọn] [set1] [set2]
``` 
Ví dụ  
- Chuyển tất cả các kí tự thành chữ hoa
```
[root@centos7srv ~]# cat song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
[root@centos7srv ~]# tr "a-z" "A-Z" < song.txt
SONG BAT DAU TU GIO
GIO BAT DAU TU DAU
EM CUNG KHONG BIET NUA
KHI NAO TA YEU NHAU
```
- Chuyển khoảng trắng(space) thành tab.
```
[root@centos7srv ~]# echo "This is for test " | tr [:space:] '\t'
This    is      for     test 
```
- Xóa kí tự 
```
[root@centos7srv ~]# tr -d "d" < song.txt
Song bat au tu gio
Gio bat au tu au
Em cung khong biet nua
Khi nao ta yeu nhau
```
## 10. wc  
Lệnh `wc` dùng để in dòng mới, từ và số byte cho mỗi tệp.  
Cú pháp  
```
wc [tùy chọn] file
```
- Đếm các dòng trong tệp
```
[root@centos7srv ~]# wc -l song.txt
5 song.txt
```
- Đếm kí tự (byte) trong tệp 
```
[root@centos7srv ~]# wc -c song.txt
83 song.txt
```
- Đếm số từ trong tệp
```
[root@centos7srv ~]# wc -w song.txt
20 song.txt
```
- Đếm số kí tự trong tệp
```
[root@centos7srv ~]# wc -m song.txt
83 song.txt
```
- In ra độ dài của dòng dài nhất
```
[root@centos7srv ~]# wc -L song.txt
22 song.txt
```

## 11. sort
Lệnh `sort` được sử dụng để sắp xếp các dòng của tệp văn bản theo thứ tự tăng dần hoặc giảm dần, theo một khoá sắp xếp. Khóa sắp xếp mặc định là thứ tự của các ký tự ASCII (theo thứ tự bảng chữ cái). Cú pháp của lệnh sort:  
```
sort <tuỳ chọn> <file>
```
- Sắp xếp mặc định
```
[root@centos7srv ~]# sort song.txt
Em cung khong biet nua
Gio bat dau tu dau
Khi nao ta yeu nhau
Song bat dau tu gio
```
- Sắp xếp ngược lại
```
[root@centos7srv ~]# sort -r song.txt
Song bat dau tu gio
Khi nao ta yeu nhau
Gio bat dau tu dau
Em cung khong biet nua
```
- Sắp xếp các số theo thứ tự tăng dần
```
[root@centos7srv ~]# cat number.txt
10
8
50
100
98
[root@centos7srv ~]# sort -n number.txt
8
10
50
98
100
```
- Sắp xếp rồi chỉ định tệp đầu ra bằng tùy chọn -o:
```
[root@centos7srv ~]# sort -n number.txt -o file1.txt
[root@centos7srv ~]# cat file1.txt
8
10
50
98
100
```
- Sắp xếp theo cột bằng cách sử dụng tùy chọn -k. Theo mặc định dấu space, dấu tab, dấu 2 chấm dùng để phân tách các cột:
```
[root@centos7srv ~]# cat file2.txt
nga 20
ha 18
nam 27
[root@centos7srv ~]# sort -k2,2n file2.txt
ha 18
nga 20
nam 27
```

## 12. uniq
Lệnh `uniq` được dùng để báo cáo hoặc bỏ qua những dòng lặp lại
Lệnh `uniq` thường đi kèm với lệnh `sort`.  
- Xóa các bản sao từ danh sách đã sắp xếp
```
[root@centos7srv ~]# cat file1.txt
8
10
50
98
100
50
8
[root@centos7srv ~]# sort -n file1.txt | uniq
8
10
50
98
100
```
- Đếm số lần xuất hiện  
```
[root@centos7srv ~]# sort -n file1.txt | uniq -c
      2 8
      1 10
      2 50
      1 98
      1 100
```

## 13. comm
Lệnh `comm` được dùng để so sánh hai tệp được sắp xếp theo từng dòng  
- Ví dụ
```
[root@centos7srv ~]# cat group1
Anh
Binh
Hong
Ngoc
Phong
Trung
[root@centos7srv ~]# cat group2
Anh
Chau
Hoa
Ngoc
[root@centos7srv ~]# comm group1 group2
                Anh
Binh
        Chau
        Hoa
Hong
                Ngoc
Phong
Trung
```
- Đầu ra của `comm` có thể dễ đọc hơn khi chỉ xuất ra một cột duy nhất. Các chữ số chỉ ra những cột đầu ra không nên được hiển thị.
```
[root@centos7srv ~]# comm group1 group2
                Anh
Binh
        Chau
        Hoa
Hong
                Ngoc
Phong
Trung
[root@centos7srv ~]# comm -12 group1 group2
Anh
Ngoc
[root@centos7srv ~]# comm -13 group1 group2
Chau
Hoa
[root@centos7srv ~]# comm -23 group1 group2
Binh
Hong
Phong
Trung
```

## 15. od  
Lệnh `od` trong Linux được sử dụng để chuyển đổi nội dung đầu vào ở các định dạng khác nhau với định dạng bát phân làm định dạng mặc định.   
Lệnh này đặc biệt hữu ích khi gỡ lỗi các tập lệnh Linux cho các thay đổi hoặc ký tự không mong muốn. Nếu có nhiều hơn một tệp được chỉ định, lệnh od sẽ ghép chúng theo thứ tự được liệt kê để tạo thành đầu vào.   
Nó có thể hiển thị đầu ra ở nhiều định dạng khác nhau, bao gồm thập lục phân, thập phân và ASCII. Nó rất hữu ích để trực quan hóa dữ liệu không ở định dạng có thể đọc được, giống như mã thực thi của chương trình.   

**Cú pháp** 
```
od [OPTION]... [FILE]...
```  
- `-b`: Hiển thị nội dung của đầu vào ở định dạng bát phân.
```
[root@centos7srv ~]# cat input.txt
100
101
102
103
104
105
[root@centos7srv ~]# od -b input.txt
0000000 061 060 060 012 061 060 061 012 061 060 062 012 061 060 063 012
0000020 061 060 064 012 061 060 065 012
0000030
```
Cột đầu tiên trong đầu ra của `od` biểu thị phần bù byte trong tệp.  
- `-c`: Hiển thị nội dung của đầu vào ở định dạng ký tự.
```
[root@centos7srv ~]# od -c input.txt
0000000   1   0   0  \n   1   0   1  \n   1   0   2  \n   1   0   3  \n
0000020   1   0   4  \n   1   0   5  \n
0000030
```
- `-`: Chấp nhận đầu vào từ dòng lệnh.
```

```
Ở đây, chúng ta thấy rằng đầu tiên input đã được đưa ra và sau đó sau khi nhấn ctrl + d, output lệnh od được hiển thị.
```
[root@centos7srv ~]# od -c -
test lenh
0000000   t   e   s   t       l   e   n   h  \n
0000012
```

## 6. sed
Lệnh `sed` được sử dụng để chỉnh sửa luồng và lọc văn bản. sed là viết tắt của từ `stream editor`  
Ví dụ thay thế một chuỗi trong file:  
- Thay thế những xuất hiện của một chuỗi với một chuỗi khác trong file  
```
[root@localhost ~]# cat song.txt
Song bat dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
[root@localhost ~]# sed 's/Song bat/SONG BAT/' song.txt
SONG BAT dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```
- Lưu thay đổi file 
```
[root@localhost ~]# sed -i 's/Song bat/SONG BAT/' song.txt
[root@localhost ~]# cat song.txt
SONG BAT dau tu gio
Gio bat dau tu dau
Em cung khong biet nua
Khi nao ta yeu nhau
```
- Thay thế tất cả sự xuất hiện của mẫu trong file ( `g` option)  
```
[root@localhost ~]# sed -i 's/dau/DAU/g' song.txt
[root@localhost ~]# cat song.txt
SONG BAT DAU tu gio
Gio bat DAU tu DAU
Em cung khong biet nua
Khi nao ta yeu nhau
```
- Xóa dòng trống
```
[root@localhost ~]# cat song.txt
SONG BAT DAU tu gio

Gio bat DAU tu DAU
Em cung khong biet nua
Khi nao ta yeu nhau
[root@localhost ~]# sed '/^$/d' song.txt
SONG BAT DAU tu gio
Gio bat DAU tu DAU
Em cung khong biet nua
Khi nao ta yeu nhau
```

- Xóa dòng chứa chuỗi chỉ định 
```
[root@localhost ~]# sed '/khong/d' song.txt
SONG BAT DAU tu gio
Gio bat DAU tu DAU
Khi nao ta yeu nhau
```

- Thay thế mẫu có kí tự đặc biệt  
Ví dụ ta sẽ thay thế string chuỗi http://192.168.152.100 thành ipaddress thì ta sẽ đặt dấu \ trước mỗi kí tự đặc biệt
```
echo https://192.168.152.100 | sed 's/https\:\/\/192\.168\.152\.100/ipaddress/'
```
hoặc:  
```
sed 's|http://192.168.152.100|ipaddress|'
```

## 7. find  
Lệnh `find` được dùng để tìm kiếm file và thư mục
- Tìm kiếm theo tên file cụ thể
```
[root@localhost ~]# find song.txt
song.txt
```
- Tìm kiếm theo tên file không đầy đủ
```
[root@localhost ~]# find / -name son*
/root/song.txt
```
- Tìm kiếm file với phần mở rộng
```
[root@localhost ~]# find -name *.txt
./song.txt
```
- Tìm kiếm file ẩn
```
find / -type f -name ".*"
```
- Tìm kiếm theo owner
```
[root@localhost ngahong]# find /home -user ngahong
/home/ngahong
/home/ngahong/.bash_logout
/home/ngahong/.bash_profile
/home/ngahong/.bashrc
/home/ngahong/filenga.txt
```
- Tìm kiếm theo group
```
 find /home -group ten_group
```
- Tìm kiếm theo permision
```
find / -perm 644
/home/ngahong/.bash_logout
/home/ngahong/.bash_profile
/home/ngahong/.bashrc
```
- Tìm các file/ thư mục rỗng
```
[root@localhost ngahong]# touch filerong.txt
[root@localhost ngahong]# cat filerong.txt
[root@localhost ngahong]# find -empty
./filerong.txt
./folderrong
```
 
- Tìm kiếm file có dung lượng dưới 50M  
```
[root@localhost ~]# find /root/ -size -50M
/root/
/root/.bash_logout
/root/.bash_profile
/root/.bashrc
/root/.cshrc
/root/.tcshrc
/root/anaconda-ks.cfg
/root/.bash_history
/root/.song.txt.swp
/root/song.txt
/root/graylog.sh
/root/.pki
/root/.pki/nssdb
```
- Tìm kiếm file có dung lượng lớn hơn 50M nhỏ hơn 100M
```
find / -size +50M -size -100M
```
- Tìm và xóa file có kích thước lớn hơn 100M
```
find /home/ngahong -size +100M -exec rm -rf {} \
```
## locate
Tùy thuộc vào bản phân phối và cách hệ thống được cung cấp, gói locate có thể được cài đặt sẵn trên hệ thống Linux.
Trên CentOS không hỗ trợ gói `locate`. Muốn sử dụng lệnh locate ta cần cài đặt
```
yum install mlocate
updatedb
```
- Tìm kiếm vị trí file  
```
locate ten_file
```
- Không phân biệt chữ hoa thường
```
locate -i readme.md
```
- Giới hạn kết quả tìm kiếm
```
locate -n 10 *.py
```
- Hiển thị số lượng tìm kiếm phù hợp
```
locate -c *.json
```

## date
Lệnh `date` dùng để hiển thị hoặc thiết lập thời gian (ngày, giờ) của hệ thống.  
- In ra ngày tháng hiện tại
```
[root@localhost ~]# date
Tue Jan 14 20:36:01 +07 2020
```
- In ra tên ngắn gọn và tên đầy của của ngày trong tuần
```
[root@localhost ~]# date +%a
Tue
[root@localhost ~]# date +%A
Tuesday
```
- In ra tên ngắn gọn và tên đầy đủ của tháng
```
[root@localhost ~]# date +%b
Jan
[root@localhost ~]# date +%B
January
```
- In ra ngày tháng và thời gian
```
[root@localhost ~]# date +%c
Tue 14 Jan 2020 08:40:31 PM +07
```
- In ra ngày trong tháng
```
[root@localhost ~]# date +%d
14
```
- In ra thời gian ở dạng 12h
```
[root@localhost ~]# date +%r
08:43:34 PM
```
- In ra thời gian ở dạng 24h
```
[root@localhost ~]# date +%R
20:43
```
- Chúng ta có thể sử dụng kết hợp nhiều tùy chọn trên với nhau để in ra chuỗi ngày tháng mong muốn.
```
[root@localhost ~]# date "+%d %B %Y"
14 January 2020
```
- Thiết lập ngày tháng và thời gian
```
[root@localhost ~]# date -s "14 Jan 2020 20:49:00"
Tue Jan 14 20:49:00 +07 2020
```


## cal
Lệnh `cal` dùng để hiển thị tháng hiện tại, với ngày hiện tại được tô sáng.

<img src="https://i.imgur.com/k3Zg30G.png">  

- Bạn có thể hiển thị bất kì tháng nào của năm nào.

<img src="https://i.imgur.com/xVgrffI.png">  

- Hiển thị 3 tháng gần nhất (tháng trước, tháng hiện tại và tháng tiếp theo)

<img src="https://i.imgur.com/XCnMEh7.png">  

- Hiển thị thứ hai như ngày đầu tiên của tuần
```
[root@localhost ~]# cal --monday
    January 2020
Mo Tu We Th Fr Sa Su
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
```
- Hiển thị chủ nhật là ngày đầu tiên của tuần
```
[root@localhost ~]# cal --sunday
    January 2020
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
```
- Hiển thị lịch của năm hiện tại
```
[root@localhost ~]# cal -y
                               2020

       January               February                 March
Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
          1  2  3  4                      1    1  2  3  4  5  6  7
 5  6  7  8  9 10 11    2  3  4  5  6  7  8    8  9 10 11 12 13 14
12 13 14 15 16 17 18    9 10 11 12 13 14 15   15 16 17 18 19 20 21
19 20 21 22 23 24 25   16 17 18 19 20 21 22   22 23 24 25 26 27 28
26 27 28 29 30 31      23 24 25 26 27 28 29   29 30 31

        April                   May                   June
Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
          1  2  3  4                   1  2       1  2  3  4  5  6
 5  6  7  8  9 10 11    3  4  5  6  7  8  9    7  8  9 10 11 12 13
12 13 14 15 16 17 18   10 11 12 13 14 15 16   14 15 16 17 18 19 20
19 20 21 22 23 24 25   17 18 19 20 21 22 23   21 22 23 24 25 26 27
26 27 28 29 30         24 25 26 27 28 29 30   28 29 30
                       31
        July                  August                September
Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
          1  2  3  4                      1          1  2  3  4  5
 5  6  7  8  9 10 11    2  3  4  5  6  7  8    6  7  8  9 10 11 12
12 13 14 15 16 17 18    9 10 11 12 13 14 15   13 14 15 16 17 18 19
19 20 21 22 23 24 25   16 17 18 19 20 21 22   20 21 22 23 24 25 26
26 27 28 29 30 31      23 24 25 26 27 28 29   27 28 29 30
                       30 31
       October               November               December
Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
             1  2  3    1  2  3  4  5  6  7          1  2  3  4  5
 4  5  6  7  8  9 10    8  9 10 11 12 13 14    6  7  8  9 10 11 12
11 12 13 14 15 16 17   15 16 17 18 19 20 21   13 14 15 16 17 18 19
18 19 20 21 22 23 24   22 23 24 25 26 27 28   20 21 22 23 24 25 26
25 26 27 28 29 30 31   29 30                  27 28 29 30 31
```


## sleep
Lệnh `sleep` dùng để trì hoãn trong một khoảng thời gian xác định
```
sleep 5
```

## time
Lệnh `time` có thể hiển thị thời gian cần thiết để thực hiện một lệnh. Lệnh `date` chỉ mất một ít thời gian.
Để chạy lệnh `time` ta cần phải cài đặt
```
yum install -y time
```
Sau khi cài đặt, ứng dụng time của chúng ta sẽ nằm trong đường dẫn `/usr/bin/time`.  

- Xem thời gian của lệnh 
```
[root@localhost ~]# time ls
anaconda-ks.cfg  f1.sh  graylog-sidecar-1.0.2-1.x86_64.rpm  t1.txt  test.sh

real    0m0.002s
user    0m0.000s
sys     0m0.002s
```
Trong đó:

- `real` (thời gian thực thi thật) => thời gian từ khi bắt đầu đến khi kết thúc tiến trình. Đây là toàn bộ thời gian được dùng, bao gồm thời gian được dùng bởi các tiến trình khác và thời gian mà tiến trình dùng khi bị chặn ( ví dụ, nếu nó đang đợi các tác vụ I/O  để hoàn thành).
- `user` (thời gian người dùng) => là lượng thời gian của CPU dùng trong các mã ở chế độ người dùng (các mã nằm bên ngoài nhân của hệ điều hành) bên trong tiến trình. Đây chỉ là thời gian thực tế của CPU được dùng trong việc thực thi tiến trình. Các tiến trình khác, và thời gian mà các tiến trình này dành khi bị chặn không tính vào con số này.
- `sys` => là lượng thời gian của CPU dùng trong nhân hệ điều hành bên trong quá trình này, tức là thời gian CPU dùng cho các lời gọi hệ thống bên trong nhân hệ điều hành. Giống với thời gian người dùng, giá trị này chỉ là thời gian mà CPU được dùng bởi tiến trình này.

Ví dụ
```
[root@localhost ~]# time sleep 5

real    0m5.004s
user    0m0.002s
sys     0m0.000s
```



