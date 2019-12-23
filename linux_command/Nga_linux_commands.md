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
Vị trí của một `manpage` (ài liệu hướng dẫn sử dụng của program) có thể được hiển thị thông qua lệnh `whereis`  
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
