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
## Phần 5: Working with file content

## 5.1 head
Sử dụng `head` để hiển thị 10 dòng đầu tiền của một file
```
nptr@thinkpad:~$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nptr@thinkpad:~$ 
```
## 5.2 head -number 
Ví dụ `head -4 /etc/password` để hiển thị 4 dòng đầu tiên của file
```
nptr@thinkpad:~$ head -4 /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
```
## 5.3 tail 
Giống như `head`, `tail` dùng để hiển thị 10 dòng cuối cùng của một file
```
nptr@thinkpad:~$ tail /etc/passwd
dnsmasq:x:114:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
saned:x:115:122::/var/lib/saned:/usr/sbin/nologin
nm-openvpn:x:116:123:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
avahi:x:117:124:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
colord:x:118:125:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
speech-dispatcher:x:119:29:Speech Dispatcher,,,:/var/run/speech-dispatcher:/bin/false
pulse:x:120:126:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
hplip:x:121:7:HPLIP system user,,,:/var/run/hplip:/bin/false
geoclue:x:122:128::/var/lib/geoclue:/usr/sbin/nologin
nptr:x:1000:1000:i am nptr,,,:/home/nptr:/bin/bash
```
## 5.4 tail -number
`tail -3 /etc/services`
```
nptr@thinkpad:~$ tail -3 /etc/services 
fido		60179/tcp			# fidonet EMSI over TCP

# Local services
```
## 5.5 cat
là một công cụ rất phổ biến trong linux.

- Dùng để đọc nội dung của một tập tin: 
  cat file1 file2 file3 ...
```
nptr@thinkpad:~$ cat text.txt 
đây là nội dung của file text 
```
## 5.6 cat -s file 
Dùng để loại bỏ khoảng trống trong file
```
cat multi_blanks.txt
line 1

line 2


line 3

line 4
```
```
cat -s multi_blanks.txt
line 1
line 2
line 3
line 4
```
## 5.7 cat -n file
hiển thị theo dòng trong file
```
nptr@thinkpad:~$ cat -n text.txt 
     1	đây là nội dungđây là nội dung của file text 
     2	
     3	đây là nội dung của file text 
     4	
     5	đây là nội dung của file text 
     6	
     7	đây là nội dung của file text 
     8	
```
## 5.8 cat > file 
Tạo file: 
```
nptr@thinkpad:~$ cat > winner.txt
abc abc abc 
nptr@thinkpad:~$ ls
Desktop    Downloads  part1     Public     text.txt  winner.txt
Documents  Music      Pictures  Templates  Videos
nptr@thinkpad:~$ cat winner.txt 
abc abc abc 
```
## 5.9 strings 
Dùng để hiển thị dạng đọc của một cuối ASCII tìm được trong files.
```
nptr@thinkpad:~$ strings /bin/ls
/lib64/ld-linux-x86-64.so.2
libselinux.so.1
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable

...

```

## PHẦN 6:

## 6.1 echo
Sử dụng để in nội dung thông báo ra màn hình.
```
nptr@ThinkPad-T460:~$ echo nguyenphuongtrinh
nguyenphuongtrinh
nptr@ThinkPad-T460:~$ echo "nguyenphuongtrinh"
nguyenphuongtrinh
```
## echo -e \b
b - backspace:
xóa một ký tự trước nó.

```
nptr@ThinkPad-T460:~$ echo -e "nguyen\bphuong"
nguyephuong
nptr@ThinkPad-T460:~$
```
## echo -e \c 
Ngắt chuỗi ở vị trí đã chọn

```
nptr@ThinkPad-T460:~$ echo -e "nguyen\cphuong"
nguyennptr@ThinkPad-T460:~$ 
```
## echo -e \n

xuống dòng ở vị trí đã chọn
```
nptr@ThinkPad-T460:~$ echo -e "nguyen\nphuong"
nguyen
phuong
nptr@ThinkPad-T460:~$
```
## echo -e \r
trả về chuỗi sau vị trí đã chọn
```
nptr@ThinkPad-T460:~$ echo -e "nguyen\rphuong"
phuong
nptr@ThinkPad-T460:~$ 
```

## echo -e \v
Tab đầu dòng ở vị trí đã chọn 
```
nptr@ThinkPad-T460:~$ echo -e "nguyen\vphuong"
nguyen
      phuong
nptr@ThinkPad-T460:~$ 
```

## echo * 
Giống như `ls`
```
nptr@ThinkPad-T460:~$ echo *
cloud Desktop Documents Downloads go Music Pictures Public Templates test Videos vmware
nptr@ThinkPad-T460:~$
```
## 6.2 Type và which 

**Type** Để tìm hiểu xem 1 lệnh cung cấp cho shell sẽ được thực thi như 1 lệnh bên ngoài shell hay 1 lệnh dựng sẵn.

- alias: nếu là bí danh trong shell
- keywork : nếu là 1 từ dành riêng cho shell
- function : nếu là 1 shell dựng sẵn
- file : nếu là một tệp trên disk

```
nptr@ThinkPad-T460:~$ type ls 
ls is aliased to `ls --color=auto'
nptr@ThinkPad-T460:~$
```
## 6.3 type -a

Dùng như `type` nhưng cũng hiển thị đường dẫn của tệp thực thi nếu cos:
```
nptr@ThinkPad-T460:~$ type -a ls 
ls is aliased to `ls --color=auto'
ls is /bin/ls
nptr@ThinkPad-T460:~$
```

## 6.4 type -t 
hiển thị ngắn ngọn: 
```
nptr@ThinkPad-T460:~$ type -t ls 
alias
```
## 6.5 alias 
cho phép shell thay thế một chuỗi string bằng chuỗi string khác khi thực hiện lệnh.
giống như việc ta có một lệnh dài và đặt bí danh cho lệnh dài đó để tiện việc thực thi.

## Tạo một alias 

`alias name="value"`
## Xem tất cả alias đang có
```
nptr@ThinkPad-T460:~$ alias
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
nptr@ThinkPad-T460:~$ 
```

## Xem alias chỉ định: 

```
nptr@ThinkPad-T460:~$ alias ls
alias ls='ls --color=auto'
nptr@ThinkPad-T460:~$ 
```

## Xóa alias
`unalias name`

## 6.6 tee

`tee` đọc đầu vào tiêu chuẩn và ghi nó vào đầu ra tiêu chuẩn một hoặc nhiều tệp

```
nptr@ThinkPad-T460:~$ cat list 
1
2
3
4
5
nptr@ThinkPad-T460:~$ echo 6 | tee list 
6
nptr@ThinkPad-T460:~$ cat list 
6
nptr@ThinkPad-T460:~$ 
```

## tee -a 
Không ghi đè mà viết thêm vào tệp 

```
nptr@ThinkPad-T460:~$ echo 6 | tee -a list 
6
nptr@ThinkPad-T460:~$ cat list 
6
6
nptr@ThinkPad-T460:~$ 
```

## 6.7 Grep 
So sánh và in ra màn hình chuỗi chứa từ khóa, có phần biệt chữ hoa và thường

```
nptr@ThinkPad-T460:~$ grep "6" list 
6
6
nptr@ThinkPad-T460:~$ 
```
## grep -i 
bỏ  qua phân biệt hoa thường

## grep -c 
đếm số dòng có kết quả tìm kiếm 
```
nptr@ThinkPad-T460:~$ grep "6" list 
6
6
nptr@ThinkPad-T460:~$ grep -c "6" list 
2
nptr@ThinkPad-T460:~$ 
```
## grep -l 
tìm kiếm và in ra tên file có từ khóa

```
nptr@ThinkPad-T460:~$ grep -l "6" list 
list
nptr@ThinkPad-T460:~$ 
```

## grep -w 
Chỉ hiển thị khi đúng là từ đó.

## grep -o 
chỉ hiển thị từ khóa cần tìm
```
nptr@ThinkPad-T460:~$ cat list 
6
6
aaa
nptr@ThinkPad-T460:~$ grep -o "aaa" list 
aaa
nptr@ThinkPad-T460:~$ 
``` 

## grep -n 
In kết quả kèm số dòng 
```
nptr@ThinkPad-T460:~$ grep -n  "6" list 
1:6
2:6
```

## Grep ^string

Tìm các dòng bắt đầu bằng từ khóa được chọn

## grep $string
Tìm các dòng kết thúc bằng từ khóa

## Lệnh tr
tr - translate :  dùng để dịch hoặc xóa các ký tự
` tr [optione] SET1 SET2`
## 7.1 tr
Đổi chữ hoa - thường:

```
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr "a-z" "A-Z" 
A B C D
A C DS ASAS
AVCBA
AASSA2020123412
nptr@ThinkPad-T460:~$
```
Đổi khoảng trắng thành tab 
```
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr [:space:] '\t'
a	b	c	d	a	c	ds	asas	avcba	aassa2020123412	nptr@ThinkPad-T460:~$ 
```

Đổi kiểu ngoặc:
```
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr '{}' '()'

() () () ()
a b c d
a c ds asas

nptr@ThinkPad-T460:~$ 
```

## 7.2 tr -s
s - squeeze repeat: loại bỏ sự lặp lại
```
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr '{}' '()'
() () () ()
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr [:space:] ' '
 {} () {} {} a b c d a c ds asas
nptr@ThinkPad-T460:~$ 
```

## 7.3 tr -d 
d - delete : xóa bỏ ký tự được chỉ định 
```
nptr@ThinkPad-T460:~$ cat nguyen.phuong 

{} () {} {}
a b c d
a c ds asas

nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr -d 'a'

{} () {} {}
 b c d
 c ds ss

nptr@ThinkPad-T460:~$ 
```
Xóa bỏ chữ số khỏi văn bản 

```
nptr@ThinkPad-T460:~$ cat nguyen.phuong 
1 2 3 4 5
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ cat nguyen.phuong | tr -d [:digit:]
    
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 
```

## Lệnh wc
Đếm số dòng , số từ, số ký tự có trong tệp. 3 giá trị được hiển thị lần lượt trên 3 cột
`wc [option]  [filename1]  [filename2] ...`

```
nptr@ThinkPad-T460:~$ wc nguyen.phuong 
 4 17 42 nguyen.phuong
nptr@ThinkPad-T460:~$ 
```

##  wc -l
chỉ đếm số dòng 

## wc -w 
chỉ đếm số từ 

## wc -c 

chỉ đếm số byte 
## wc -m 
chỉ đếm số ký tự 
## wc -L 

in ra chiều dài ký tự của dòng dài nhất trong file 

## Lệnh sort
Dùng để sắp  xếp các dòng từ tất cả các file đầu vào rồi xuất ra đầu ra tiêu chuẩn 

`sort [option] [file1] [file2] ...`

Ưu tiên sắp xếp các dòng 

- Bắt đầu bằng `space`
- Bắt đầu bằng số (0-9)
- Bắt đầu bằng chữ (a-A-b-B-...-z-Z)

## sort filename 
```
nptr@ThinkPad-T460:~$ sort nguyen.phuong 
{} () {} {}
1 2 3 4 5
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 
```
## sort -r 

`r - reverse` : đảo ngược thứ tự sắp xếp (theo dòng) 
```
nptr@ThinkPad-T460:~$ sort -r nguyen.phuong 
a c ds asas
a b c d
1 2 3 4 5
{} () {} {}
nptr@ThinkPad-T460:~$ 
```

## sort -k 
k - key: sắp xếp theo 1 cột chỉ định

## sort -c
c - check : kiểm tra file. In ra dòng đầu tiên sai vị trí sắp xếp 
```
nptr@ThinkPad-T460:~$ sort -c nguyen.phuong 
sort: nguyen.phuong:2: disorder: {} () {} {}
nptr@ThinkPad-T460:~$
```
## sort -u :
u(unique) : loại bỏ dòng trùng lặp  

## sort -M 
M - month : sắp xếp theo thứ tự tháng 

## uniq <filename>
DÙng để hợp nhất những dòng lặp liền kề nhau trong một file

```
nptr@ThinkPad-T460:~$ cat nguyen.phuong 
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ uniq nguyen.phuong 
1 2 3 4 5
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 

```

## uniq -c 
c: count 
đếm số lần 1 dòng được lặp lại   
```
nptr@ThinkPad-T460:~$ uniq -c nguyen.phuong 
      3 1 2 3 4 5
      1 {} () {} {}
      1 a b c d
      1 a c ds asas
nptr@ThinkPad-T460:~$
```

## uniq -d 

Chỉ in ra các dòng bị lặp lại
```
nptr@ThinkPad-T460:~$ uniq -d  nguyen.phuong 
1 2 3 4 5
nptr@ThinkPad-T460:~$ 
```

## uniq -u 
u: unique
Chỉ in ra những dòng riêng biệt  
```
nptr@ThinkPad-T460:~$ uniq -u  nguyen.phuong 
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 
```

## uniq -f <number> 

f: field 
chọn cột để thực hiện uniq


## uniq -s <number>

Bỏ qua một số ký tự đầu tiên để thực hiện lệnh 
```
nptr@ThinkPad-T460:~$ uniq -s 1 nguyen.phuong 
1 2 3 4 5
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 
```

## uniq -w <number>
  Giới hạn ký tự so sánh: 
  
  ```
nptr@ThinkPad-T460:~$ uniq -w 5 nguyen.phuong 
1 2 3 4 5
{} () {} {}
a b c d
a c ds asas
nptr@ThinkPad-T460:~$ 
```

## Lệnh comm 
comm : compare (so sánh)
Dùng để so sánh 2 tệp đã chọn , 2 tệp đã được sắp xếp theo dòng
Nếu tệp đã chọn chưa sắp xếp sẽ báo lỗi 
```
nptr@ThinkPad-T460:~$ comm phuong.nguyen nguyen.phuong 
		1 2 3 4 5
	1 2 3 4 5
	1 2 3 4 5
comm: file 2 is not in sorted order
	{} () {} {}
5 4 3 2 1
a asd asdds asdds 
comm: file 1 is not in sorted order
aaa asdd bbb asdasd 

	a b c d
	a c ds asas
nptr@ThinkPad-T460:~$ 
```

## lệnh od 

chuyển đổi nội dung file thành chuỗi 8bit
```
nptr@ThinkPad-T460:~$ od nguyen.phuong 
0000000 020061 020062 020063 020064 005065 020061 020062 020063
0000020 020064 005065 020061 020062 020063 020064 005065 076573
0000040 024040 020051 076573 075440 005175 020141 020142 020143
0000060 005144 020141 020143 071544 060440 060563 005163
0000076
nptr@ThinkPad-T460:~$ 
```

## od -c 
Hiển thị nội dung đầu vào dưới dạng ký tự: `c: char`

```
nptr@ThinkPad-T460:~$ od -c nguyen.phuong 
0000000   1       2       3       4       5  \n   1       2       3    
0000020   4       5  \n   1       2       3       4       5  \n   {   }
0000040       (   )       {   }       {   }  \n   a       b       c    
0000060   d  \n   a       c       d   s       a   s   a   s  \n
0000076
nptr@ThinkPad-T460:~$ 
```
## od - 

Nhập input bằng lệnh 
```
nptr@ThinkPad-T460:~$ od -
cat nguyen.phuong 
0000000 060543 020164 063556 074565 067145 070056 072550 067157
```

## Lệnh sed 

Là một tool chỉnh sửa văn bản mạnh mẽ. 

## sed 's/<từ cần thay>/<từ thay thế>' file
```
nptr@ThinkPad-T460:~$ cat nguyen.phuong 
toi la nguyen phuong trinh
nptr@ThinkPad-T460:~$ sed 's/phuong/van/' nguyen.phuong 
toi la nguyen van trinh
nptr@ThinkPad-T460:~$ 
```

Để thay thế từ thứ n của 1 dòng, ta thêm /n
Thay tất cả các từ trên dòng ta thêm /g 
## sed -n s/<từ cần thay>/<từ thay thế>/p
Chỉ in ra các dòng được thay thế 
```
nptr@ThinkPad-T460:~$ sed 's/phuong/van/p' nguyen.phuong 
toi la nguyen van trinh
toi la nguyen van trinh
nptr@ThinkPad-T460:~$ 
```
## Lệnh find
Dùng để tìm kiếm đường dẫn tập tin trong 1 phân cấp thư mục 

## find /root -name text1.txt
## sudo find /root -empty : Tìm kiếm tập tin và thư mục rỗng
```
nptr@ThinkPad-T460:~$ sudo find /root -empty
/root/.cache
/root/snap/anbox/186/.local/share/icons
/root/snap/anbox/186/.local/share/glib-2.0/schemas
nptr@ThinkPad-T460:~$ 
```

## find /root/A -perm 644 : Tìm theo permission
```
nptr@ThinkPad-T460:~$ sudo sudo find /root -empty
/root/.cache
/root/snap/anbox/186/.local/share/icons
/root/snap/anbox/186/.local/share/glib-2.0/schemas
nptr@ThinkPad-T460:~$ 
```

## find ./ -type f -name "*" -exec grep 'nguyenphuongtrinh'  {} \;
Tìm "nguyenphuongtrinh" trong nhiều file

## fine -size +1M : để tìm lớn hơn 1MB


## Lệnh locate

Dùng để tìm kiếm tệp theo tên 
`locate [option]... pattern...`

## locate filename

```
nptr@ThinkPad-T460:~$ locate nguyen.phuong 
/home/nptr/nguyen.phuong
nptr@ThinkPad-T460:~$ 
```
## locate -n (number) filename
Giới hạn số kết quả 


## locate -i filename
Không phân biệt chữ hoa và thường 

## Lệnh date 
Dùng để in ra ngày tháng và thời gian của hệ thống 
```
nptr@ThinkPad-T460:~$ date 
Thứ sáu, 14 Tháng 2 năm 2020 17:30:06 +07
nptr@ThinkPad-T460:~$ 

```
## date -u 

Hiển thị tại múi giờ GMT 
```
nptr@ThinkPad-T460:~$ date -u
Thứ sáu, 14 Tháng 2 năm 2020 10:30:45 UTC
nptr@ThinkPad-T460:~$ 
```
## date --date=""
Hiển thị thời gian cụ thể. 

```
nptr@ThinkPad-T460:~$ date --date="10 day ago"
Thứ ba, 04 Tháng 2 năm 2020 17:31:43 +07
nptr@ThinkPad-T460:~$ 
```
## date -s 
Đặt tgian hệ thống 
```
date --set="Tue Nov 13 15:23:34 +08 2020"
```
## date -r 
Sử dụng để hiển thị dấu tgian được sửa đổi lần cuối của tệp
```
nptr@ThinkPad-T460:~$ date -r nguyen.phuong 
Thứ ba, 11 Tháng 2 năm 2020 17:42:53 +07
nptr@ThinkPad-T460:~$ 
```
## date "+%<format_option>"
Dùng để định dạng đầu ra tgian của hệ thống 

## Lệnh cal 
cal - calendar 
Hiển thị lịch của hệ thống 
```
nptr@ThinkPad-T460:~$ cal
    Tháng 2 2020      
CN T2 T3 T4 T5 T6 T7  
                   1  
 2  3  4  5  6  7  8  
 9 10 11 12 13 14 15  
16 17 18 19 20 21 22  
23 24 25 26 27 28 29  
                      
nptr@ThinkPad-T460:~$ 
```
## cal [month] [year]
Hiển thị lịch của một tháng chỉ định 
```
nptr@ThinkPad-T460:~$ cal 01 2020
    Tháng 1 2020      
CN T2 T3 T4 T5 T6 T7  
          1  2  3  4  
 5  6  7  8  9 10 11  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30 31     
                      
nptr@ThinkPad-T460:~$
```
## cal [year]

Lịch của 12 tháng của 1 năm chỉ định 


## Lệnh sleep 

Trì hoãn một tgian xác định 
mặc định là giây 

## Lệnh time 

Dùng để thực thi 1 lệnh và hiển thị thời gian thực, thời gian CPU của hệ thống và user để thực thi lệnh đó.

```
nptr@ThinkPad-T460:~$ time ls
cloud    Documents  Music          Pictures  snap       test    vmware
Desktop  Downloads  nguyen.phuong  Public    Templates  Videos

real	0m0,005s
user	0m0,001s
sys	0m0,004s
nptr@ThinkPad-T460:~$ 
```




































