# Các lệnh cơ bản trong Linux  

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
# Phần 2. Các lệnh làm việc với thư mục  

## 2.1 pwd
Lệnh `pwd` dùng để hiển thị đường dẫn đến thư mục đang làm việc hiện tại  
```
[root@centos7srv network-scripts]# pwd
/etc/sysconfig/network-scripts
```
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
## 2.4 mkdir
- Lệnh `mkdir` (Make directory) được dùng để tạo thư mục  
```
mkdir folder1
```
- Tạo thư mục có chứa các thư mục con
```
mkdir -p /folder1/nga/nga1
```
## 2.4 rmdir
- Lệnh `rmdir` dùng để xóa thư mục trống (Remove Directory) 
```
rmdir nga1
```
- Để xóa các thư mục đệ quy sử dụng tùy chọn `-p`
```
rmdir -p /folder1/nga/nga1
```
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
