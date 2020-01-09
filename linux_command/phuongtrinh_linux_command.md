# CÁC LỆNH CƠ BẢN TRONG LINUX
  
##  Phần 1: man pages

## 1.1 man $command

Lệnh này dùng để  cho ta thông tin chi tiết về cách sử dụng và những thứ liên quan đến một lệnh bận ký mà ta chưa rõ
; Ví dụ: 
```
man xclip
XCLIP(1)                                                                                General Commands Manual                                                                               XCLIP(1)

NAME
       xclip - command line interface to X selections (clipboard)

SYNOPSIS
       xclip [OPTION] [FILE]...

DESCRIPTION
       Reads from standard in, or from one or more files, and makes the data available as an X selection for pasting into X applications. Prints current X selection to standard out.

       -i, -in
              read text into X selection from standard input or files (default)

       -o, -out
              print the selection to standard out (generally for piping to a file or program)

       -f, -filter
              when  xclip  is  invoked  in  the in mode with output level set to silent (the defaults), the filter option will cause xclip to print the text piped to standard in back to standard out
              unmodified

       -l, -loops
              number of X selection requests (pastes into X applications) to wait for before exiting, with a value of 0 (default) causing xclip to wait for an  unlimited  number  of  requests  until
              another application (possibly another invocation of xclip) takes ownership of the selection

       -t, -target
              specify  a  particular data format using the given target atom.  With -o the special target atom name "TARGETS" can be used to get a list of valid target atoms for this selection.  For
              more information about target atoms refer to ICCCM section 2.6.2

       -d, -display
              X display to use (e.g. "localhost:0"), xclip defaults to the value in $DISPLAY if this option is omitted

       -h, -help
              show quick summary of options

       -selection
              specify which X selection to use, options are "primary" to use XA_PRIMARY (default), "secondary" for XA_SECONDARY or "clipboard" for XA_CLIPBOARD

       -version
              show version information

       -silent
              fork into the background to wait for requests, no informational output, errors only (default)

       -quiet show informational messages on the terminal and run in the foreground

       -verbose
              provide a running commentary of what xclip is doing

       -noutf8
              operate in legacy (i.e. non UTF-8) mode for backwards compatibility (Use this option only when really necessary, as the old behavior was broken)

``` 
nhấn phím `q` để thoát ra ngoài.

## 1.2 man $configfile
Khi sử dụng sẽ đưa ra hướng dẫn riêng của file cấu hình
```
RSYSLOG.CONF(5)                                                                       Linux System Administration                                                                      RSYSLOG.CONF(5)

NAME
       rsyslog.conf - rsyslogd(8) configuration file

DESCRIPTION
       The  rsyslog.conf  file  is  the  main configuration file for the rsyslogd(8) which logs system messages on *nix systems.  This file specifies rules for logging.  For special features see the
       rsyslogd(8) manpage. Rsyslog.conf is backward-compatible with sysklogd's syslog.conf file. So if you migrate from sysklogd you can rename it and it should work.

       Note that this version of rsyslog ships with extensive documentation in html format.  This is provided in the ./doc subdirectory and probably in a separate package if  you  installed  rsyslog
       via a packaging system.  To use rsyslog's advanced features, you need to look at the html documentation, because the man pages only cover basic aspects of operation.

```

## 1.3 man $daemon
Đưa ra thông tin về các chương trình nền của hệ thống 

## 1.4 man -k [string]
Đưa ra màn hình các manpages chứa chuỗi nhập vào 
```
clock_nanosleep (2)  - high-resolution sleep with specifiable clock
editor (1)           - Nano's ANOther editor, an enhanced free Pico clone
futimens (3)         - change file timestamps with nanosecond precision
nano (1)             - Nano's ANOther editor, an enhanced free Pico clone
nanorc (5)           - GNU nano's configuration file
nanosleep (2)        - high-resolution sleep
pico (1)             - Nano's ANOther editor, an enhanced free Pico clone
rnano (1)            - a restricted nano
utimensat (2)        - change file timestamps with nanosecond precision
``` 
## 1.5 whatis 
Đưa ra mô tả của một trang thủ công.
```
nano (1)             - Nano's ANOther editor, an enhanced free Pico clone
```

## 1.6 whereis 
Đưa ra vị trí của một manpage, xác định vị trí lưu trữ binary file, source code, trang hướng dẫn sử dụng của một chương trình
** Sử dụng**
`whereis [option(s)] program_name(s)`
Có các option để sử dụng kèm:
```
-b : tìm kiếm binary file
-m : tìm kiếm man page
-s : tìm kiếm source code 
```

khi không đi kèm tùy chọn thì sẽ trả về đường dẫn tuyệt đói của binary file, source code, man page (nếu có).
```
nano: /bin/nano /usr/share/nano /usr/share/man/man1/nano.1.gz /usr/share/info/nano.info.gz
```
## Phần 2: Working with dỉectories

## 2.1 pwd (Print Working Directory)

Dùng để in ra đường dẫn của thư mục đang làm việc hiện tại.
```
[nptr@localhost ~]$ pwd 
/home/nptr
```
## 2.2 cd  (Change Directory)
Dùng để thay đổi thư mục hiện thời của bạn.

```
[nptr@localhost ~]$ cd Desktop/
[nptr@localhost Desktop]$ 
```
## 2.3 cd ~ 
Dùng để quay về thư mục gốc của người dùng hiện tại.
```
[nptr@localhost ~]$ cd Desktop/
[nptr@localhost Desktop]$ cd ~
[nptr@localhost ~]$ 
```
## 2.4 cd ..
Dùng để truy cập vào thư mục cha của thư mục hiện tại.
```
[nptr@localhost ~]$ cd Desktop/
[nptr@localhost Desktop]$ cd ..
[nptr@localhost ~]$ 
```
## 2.5 cd -
Dùng để quay trở lại thư mục trước đó.
```
[nptr@localhost ~]$ cd -
/home/nptr/Desktop
[nptr@localhost Desktop]$
```
## Phần 3: Đường dẫn tương đối và tuyệt đối

## 3.1 ls 
Dùng để xem nội dung của một thư mục.
```
[nptr@localhost ~]$ ls
centos7            Desktop    Downloads    Music     Public    Templates
clamav.local.conf  Documents  ibus-bamboo  Pictures  Telegram  Videos
```

## 3.2 ls -a 
Ta có thể dùng `ls` kèm option `-a` để hiện thị tất cả các files (kể cả các file ẩn).

```
[nptr@localhost ~]$ ls -a
.              .bashrc            Desktop    ibus-bamboo  Pictures  Templates
..             .cache             Documents  .local       .pki      Videos
.bash_history  centos7            Downloads  .m17n.d      Public    .vmware
.bash_logout   clamav.local.conf  .esd_auth  .mozilla     .ssh      .vscode
.bash_profile  .config            .gnome     Music        Telegram
```
## 3.3 ls -l 
Dùng để hiển thị đầy đủ và rõ ràng thông tin của các file trong thư mục.
```
[nptr@localhost ~]$ ls -l 
total 48
drwxrwxr-x. 2 nptr nptr 4096 Dec 25 23:57 centos7
-rw-r--r--. 1 nptr nptr 1955 Dec 26 00:24 clamav.local.conf
drwxr-xr-x. 2 nptr nptr 4096 Dec 25 16:20 Desktop
drwxr-xr-x. 2 nptr nptr 4096 Dec 26 14:05 Documents
drwxr-xr-x. 6 nptr nptr 4096 Dec 26 13:59 Downloads
drwxrwxr-x. 9 nptr nptr 4096 Dec 25 23:20 ibus-bamboo
```
## 3.4 ls -lh

Dùng để hiển thị ra chi tiết hơn những gì mà bình thường ta sử dụng.
Ta có thể dùng để bổ sung thêm cho ls -l: 
```
[nptr@localhost ~]$ ls -lh 
total 48K
drwxrwxr-x. 2 nptr nptr 4.0K Dec 25 23:57 centos7
-rw-r--r--. 1 nptr nptr 2.0K Dec 26 00:24 clamav.local.conf
drwxr-xr-x. 2 nptr nptr 4.0K Dec 25 16:20 Desktop
drwxr-xr-x. 2 nptr nptr 4.0K Dec 26 14:05 Documents
drwxr-xr-x. 6 nptr nptr 4.0K Dec 26 13:59 Downloads
drwxrwxr-x. 9 nptr nptr 4.0K Dec 25 23:20 ibus-bamboo
drwxr-xr-x. 2 nptr nptr 4.0K Dec 25 16:20 Music
```
## 3.5 mkdir
Dùng để tạo mới một thư mục. 
```
[nptr@localhost ~]$ mkdir nptr 
[nptr@localhost ~]$ cd nptr 
[nptr@localhost nptr]$
```

## 3.6 mkdir -p 
```
[nptr@localhost nptr]$ mkdir a/b/c
mkdir: cannot create directory ‘a/b/c’: No such file or directory
```
Như trên, ta không thể tạo thư mục c khi sử dụng `mkdir`
Khi thêm option `-p` , `mkdir` sẽ tạo thêm thư mục cha nếu cần.
```
[nptr@localhost nptr]$ mkdir -p a/b/c 
[nptr@localhost nptr]$ cd a/b/c 
[nptr@localhost c]$ 
```
## 3.7 rmdir (remove directory)

Khi thư mục rỗng, ta dùng `rmdir` để xóa thư mục đó
```
[nptr@localhost b]$ ls
c
[nptr@localhost b]$ rmdir c
[nptr@localhost b]$ ls
[nptr@localhost b]$ 
```
## 3.8 rmdir -p 
Sử dụng option `-p` để `rmdir` có thể xóa hoàn toàn thư mục và bên trong thư mục đó 
```
[nptr@localhost a]$ ls 
b
[nptr@localhost nptr]$ rmdir -p a/b 
```
## Phần 4: Working with files

## 4.1 file

Dùng để xác định kiểu của file

```
nptr@thinkpad:~$ file aa.txt 
aa.txt: UTF-8 Unicode text
```
## 4.2 file -b [filename]

Dùng để hiện thị thông tin file một cách đơn giản
```
nptr@thinkpad:~$ file -b aa.txt 
UTF-8 Unicode text
```

## 4.3 file -s filename

DÙng hiển thị thông tin cho những file đặc biệt
```
nptr@thinkpad:~$ sudo file -s /dev/sda
[sudo] password for nptr: 
/dev/sda: DOS/MBR boot sector
```
## 4.4 touch
Dùng để tạo mới một file bất kỳ
```
nptr@thinkpad:~$ touch file1
nptr@thinkpad:~$ touch file2
nptr@thinkpad:~$ ls
aa.txt   Documents  file1  go     Pictures  Templates
Desktop  Downloads  file2  Music  Public    Videos
```

## 4.5 touch -t
Dùng để tạo mới một file nhưng có thêm một vài thuộc tính bất kỳ 

## 4.5 rm 
Remove forerver
```
nptr@thinkpad:~/test$ touch aaa.txt 
nptr@thinkpad:~/test$ ls
aaa.txt
nptr@thinkpad:~/test$ rm aaa.txt 
nptr@thinkpad:~/test$ ls
nptr@thinkpad:~/test$ 
```

## 4.6 rm -i
cũng dùng để xóa file nhưng có hiển thị thêm cảnh báo
```
nptr@thinkpad:~/test$ rm -i aaa.txt 
rm: remove regular empty file 'aaa.txt'? yes 
```

## 4.7 rm -rf 
Xóa bỏ bất kỹ file hoặc thư mục (`-rf : recursive and force)
```
nptr@thinkpad:~/test$ ls
aaa
nptr@thinkpad:~/test$ rm -rf aaa 
nptr@thinkpad:~/test$ ls
nptr@thinkpad:~/test$ 
```
## 4.8 cp 
Dùng để copy một file 
```
nptr@thinkpad:~/test$ cp aaa.txt aaa1.txt 
nptr@thinkpad:~/test$ ls
aaa1.txt  aaa.txt
nptr@thinkpad:~/test$
```

## 4.9 cp -r (-r : recursive)
Dùng để copy tất cả các file ở tất cả các thư mục con. 

```
nptr@thinkpad:~/test$ cp -r aaaa bbbb 
nptr@thinkpad:~/test$ ls bbbb/
aa
nptr@thinkpad:~/test$ 
```

## 4.10 cp -i
Dùng để  copy file nhưng ghi đè nếu file được copy đã tồn tại

```
nptr@thinkpad:~/test$ cp -i aaa.txt aaa1.txt 
cp: overwrite 'aaa1.txt'? yes
nptr@thinkpad:~/test$ 
```

## 4.11 mv (move)
Ta có thể đổi tên file hoặc thư mục với `mv`
```
nptr@thinkpad:~/test$ ls
aaa1.txt  aaaa  aaa.txt  bbbb
nptr@thinkpad:~/test$ mv aaa.txt bbb.txt
nptr@thinkpad:~/test$ ls
aaa1.txt  aaaa  bbbb  bbb.txt
nptr@thinkpad:~/test$ 
```
## 4.12 mv -i 
optione -i giống với `cp` và `rm`
sẽ có thông báo hỏi để ghi đè file đã tồn tại hay không

## 4.13 rename
Trong Debian/Ubuntu
`rename` sử dụng `regular expressions`  để đổi tên nhiêu file một lúc
```
nptr@thinkpad:~/test$ rename 's/\.txt/\.png/' *.txt
nptr@thinkpad:~/test$ ls
aaa1.png  aaaa  bbbb  bbb.png
nptr@thinkpad:~/test$ 
```

Trong CentOS/RHEL/Fedora thì có khác một chút.
```
[paul@centos7 ~]$ touch one.conf two.conf three.conf
[paul@centos7 ~]$ rename .conf .backup *.conf
[paul@centos7 ~]$ ls
one.backup three.backup two.backup
[paul@centos7 ~]$
```




































































