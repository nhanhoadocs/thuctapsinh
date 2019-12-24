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
# 1.7 man sections

































































