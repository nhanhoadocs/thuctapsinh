# Các lệnh thường xuyên sử dụng trong linux

### 1. man command

Lệnh man trong linux dùng để chỉ ra hướng dẫn của bất kỳ lệnh nào có thể thực hiện trong linux. 
Nó chỉ ra chi tiết về 1 lệnh như : Tên, mô tả, tùy chọn, phiên bản, ...

**Syntax:**

man [OPTION]... [COMMAND NAME]...

* Không có tùy chọn, nó sẽ hiển thị toàn bộ hướng dẫn của lệnh. 

```
# man ls
```
```
LS(1)                                User Commands                                LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the  FILEs  (the  current directory by default).  Sort
       entries alphabetically if none of -cftuvSUX nor --sort is specified.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
              with -l, print the author of each file

       -b, --escape
              print C-style escapes for nongraphic characters

       --block-size=SIZE
              scale sizes by SIZE before printing them; e.g.,  '--block-size=M'  prints
              sizes in units of 1,048,576 bytes; see SIZE format below

       -B, --ignore-backups
              do not list implied entries ending with ~

       -c     with  -lt:  sort  by,  and show, ctime (time of last modification of file
              status information); with -l: show ctime and  sort  by  name;  otherwise:
              sort by ctime, newest first

       -C     list entries by columns

       --color[=WHEN]
              colorize  the  output;  WHEN  can  be  'never',  'auto', or 'always' (the
              default); more info below

       -d, --directory
              list directories themselves, not their contents
              
  Manual page ls(1) line 72 (press h for help or q to quit)
            
```
* Để tìm kiếm hướng dẫn và đưa ra 1 mô tả ngắn về lệnh, sử dụng tùy chọn -f 

```
# man -f man
man (1)              - an interface to the on-line reference manuals
```
- hướng dẫn về 1 tệp cấu hình 
```
# man yum.conf
```
```
yum.conf(5)                      yum configuration file                     yum.conf(5)

NAME
       yum.conf - Configuration file for yum(8).

DESCRIPTION
       Yum uses a configuration file at /etc/yum.conf.

       Additional  configuration  files  are  also read from the directories set by the
       reposdir option (default is `/etc/yum.repos.d').  See the reposdir option  below
       for further details.

PARAMETERS
       There  are  two  types  of  sections  in the yum configuration file(s): main and
       repository. Main defines all global configuration options. There should be  only
       one  main  section.  The repository section(s) define the configuration for each
       repository/server. There should be one or more repository sections.

[main] OPTIONS
       The [main] section must exist for yum to do anything. It consists of the follow‐
       ing options:

              cachedir  Directory  where  yum  should store its cache and db files. The
              default is `/var/cache/yum'.

              persistdir Directory where yum should store information that should  per‐
              sist over multiple runs. The default is `/var/lib/yum'.

              keepcache  Either  `1'  or  `0'.  Determines whether or not yum keeps the
              cache of headers and packages after successful installation.  Default  is
              '1' (keep files)

              usercache  Either  `1' or `0'. Determines whether or not yum should store
              per-user cache in $TMPDIR.  When set to `0', then whenever yum runs as  a
              non-root  user, --cacheonly is implied and system cache is used directly,
              and no new user cache is created in $TMPDIR.  This can be used to prevent
              $TMPDIR  from  filling  up  if many users on the system often use yum and
              root tends to have up-to-date metadata that the users can rely  on  (they
              can  still  enable  this feature with --setopt if they wish).  Default is
              `1' (user cache enabled).

              reposdir A list of directories where yum  should  look  for  .repo  files
              which  define  repositories  to  use. Default is `/etc/yum.repos.d'. Each
              file in this directory should contain one or more repository sections  as
              documented  in  [repository] options below. These will be merged with the
 Manual page yum.conf(5) line 1 (press h for help or q to quit)
```

- Ta cũng có thể sử dụng lệnh man để xem hướng dẫn 1 tiến trình hệ thống 
```
# man httpd
```
```
HTTPD(8)                                 httpd                                 HTTPD(8)

NAME
       httpd - Apache Hypertext Transfer Protocol Server

SYNOPSIS
       httpd  [  -d  serverroot  ] [ -f config ] [ -C directive ] [ -c directive ] [ -D
       parameter ] [ -e level ] [ -E file ] [ -k  start|restart|graceful|stop|graceful-
       stop  ] [ -R directory ] [ -h ] [ -l ] [ -L ] [ -S ] [ -t ] [ -v ] [ -V ] [ -X ]
       [ -M ] [ -T ]

       On Windows systems, the following additional arguments are available:

       httpd [ -k install|config|uninstall ] [ -n name ] [ -w ]

SUMMARY
       httpd is the Apache HyperText Transfer Protocol (HTTP)  server  program.  It  is
       designed  to  be run as a standalone daemon process. When used like this it will
       create a pool of child processes or threads to handle requests.

       In general, httpd should not be invoked directly, but rather should  be  invoked
       via  apachectl  on Unix-based systems or as a service on Windows NT, 2000 and XP
       and as a console application on Windows 9x and ME.

OPTIONS
       -d serverroot
              Set the initial value for the ServerRoot directive  to  serverroot.  This
              can  be overridden by the ServerRoot directive in the configuration file.
              The default is /etc/httpd.

       -f config
              Uses the directives in the file config on startup.  If  config  does  not
              begin with a /, then it is taken to be a path relative to the ServerRoot.
              The default is conf/httpd.conf.

       -k start|restart|graceful|stop|graceful-stop
              Signals httpd to start, restart, or stop. See Stopping Apache  httpd  for
              more information.

       -C directive
              Process the configuration directive before reading config files.

       -c directive
              Process the configuration directive after reading config files.

 Manual page httpd(8) line 1/120 44% (press h for help or q to quit)
```

- Đưa ra mô tả ngắn về tất cả các hướng dẫn chứa chuỗi.

```
[root@Client1 html]# man -k ls
blockdev (8)         - call block device ioctls from the command line
c++filt (1)          - Demangle C++ and Java symbols.
crlutil (1)          - List, generate, modify, or delete CRLs within the NSS security d...
dircolors (1)        - color setup for ls
failsafe_context (5) - The SELinux fail safe context configuration file
false (1)            - do nothing, unsuccessfully
grub2-menulst2cfg (1) - Convert a configuration file from GRUB 0.xx to GRUB 2.xx format.
ip (8)               - show / manipulate routing, devices, policy routing and tunnels
logrotate (8)        - rotates, compresses, and mails system logs
logrotate.conf (5)   - rotates, compresses, and mails system logs
ls (1)               - list directory contents
lsattr (1)           - list file attributes on a Linux second extended file system
lsblk (8)            - list block devices
lscpu (1)            - display information about the CPU architecture
lsinitrd (1)         - tool to show the contents of an initramfs image
lsipc (1)            - show information on IPC facilities currently employed in the system
lslocks (8)          - list local system locks
lslogins (1)         - display information about known users in the system
lsmem (1)            - list the ranges of available memory with their online status
lsmod (8)            - Show the status of modules in the Linux Kernel
lsns (8)             - list namespaces
lsscsi (8)           - list SCSI devices (or hosts) and their attributes
lvm (8)              - LVM2 tools
```


### 2. pwd command

Lệnh pwd sử dụng để in ra đường dẫn thư mục hiện tại. Dùng để xác định thư mục hiện tại. 

- Để in ra đường dẫn trực tiếp của thư mục hiện tại: 

```
# pwd
/var/log/httpd
```

### 3. cd command 

Sử dụng để di chuyển qua lại giữa các thư mục (chỉ thực hiện đối với thư mục)

- Để thay đổi thư mục hiện tại của mình 

```
[root@Client1 log]# cd /var
[root@Client1 var]# pwd
/var
```

- Để trở lại thư mục cha

```
[root@Client1 var]# cd log
[root@Client1 log]# pwd
/var/log
[root@Client1 log]# cd ..
[root@Client1 var]# pwd
/var
```

- Để trở về thư mục trước đó :

```
[root@Client1 var]# cd -
/var/log
```

- Để trở về thư mục root
```
[root@Client1 log]# cd
[root@Client1 ~]# pwd
/root
```

- Sử dụng / để vào thư mục cây ( Chứa các thư mục trong hệ thống)

```
[root@Client1 ~]# cd /
[root@Client1 /]# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
```

### 4. ls command

#### Ls là gì?
**ls là lệnh liệt kê thông tin các tệp và thư mục. Liệt kê các quyền,tên của user group sở hữu, ngày giờ sửa đổi của tệp/thư mục.  Được sử dụng phổ biến và thường xuyên trong linux .**

#### Cú pháp
**ls [Tùy chọn] [tập tin]**

#### Các tùy chọn
 **-a, --all :  liệt kê các mục bắt đầu bằng .**  
<img src="https://i.imgur.com/CVUH5JU.png">  

**ls -x : sắp xếp đầu ra tệp theo thứ tự bảng chữ cái**
<img src="https://i.imgur.com/WuU6Erz.png">

**ls -t : sắp xếp tệp mới sửa đổi theo thời gian**
<img src="https://i.imgur.com/deC5of5.png">

**ls -l : hiển thị các file và thư mục, các phân quyền, kich thước( file/forder), ngày sửa đổi, chủ sở hữu, tên file hoặc thư mục**
<img src="https://i.imgur.com/5CZi683.png">

**ls -F : chỉ ra loại tệp:**  
-  @ : là 1 symbol link     
*  (*) : là 1 thực thi    
-  | : chỉ ra 1 đường ống được đặt tên    
-   / : là 1 thư mục        

<img src="https://i.imgur.com/W4ACnRH.png">

**ls --format=text**   
* text = across -x = commas -m = horizotal -x = log -l = siggle-colum -1 = verbose -l = vertical -c.  
   *  -1 : liệt kê các mục ra 1 cột duy nhất  
   *  -C : liệt kê các mục theo cột ( nhiều cột )  
   
<img src="https://i.imgur.com/mSJcyXv.png">

**ls --hide=*.mbr : ẩn 1 loại tệp cụ thể ở đầu ra , cụ thể ở đây là mbr**
<img src="https://i.imgur.com/5132MOk.png">

**ls -l -author : hiển thị tên tác giả mỗi tập tin**
<img src="https://i.imgur.com/QXVk3An.png">

**ls -lt : hiển thị các file và thư mục, các phân quyền, chủ sở hữu, kích thước(file/forder), sắp xếp theo thứ tự ngày giờ sửa đổi**
<img src="https://i.imgur.com/KgijdYF.png">

**ls -n : hiển thị số UID (định danh người dùng)  và GID (định danh nhóm).** Có thể hiểu về UID và GID trong đường link sau: [UID and GID](https://geek-university.com/linux/uid-user-identifier-gid-group-identifier/)
<img src="https://i.imgur.com/UMjxurq.png">

**ls -li : hiển thị số inode thành định dạng danh sách dài**
<img src="https://i.imgur.com/oRm9cwg.png">

**ls -R : liệt kê danh sách các cây thư mục, chỉ ra đường dẫn từng thư mục**
<img src="https://i.imgur.com/QXBdHzV.png">

**ls -l [thư mục] : hiển thị danh sách thông tin thư mục được trỏ đến**
<img src="https://i.imgur.com/oLOJEDV.png">

**ls -l -h : hiển thị	danh sách dài ở dạng kich thước con người có thể hiểu**
<img src="https://i.imgur.com/U826J0k.png">

**ls --version : kiểm tra phiên bản của lệnh**
<img src="https://i.imgur.com/HXU1qmy.png">

# 5 . mkdir command

Sử dụng để tạo 1 thư mục hoặc nhiều thư mục trong linux.

**Syntax:**

mkdir [options...] [directories ...]

- Để xem phiên bản của lệnh : 

```
[root@Client1 ~]# mkdir --version
mkdir (GNU coreutils) 8.22
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by David MacKenzie.
```
- Hiển thi thông tin vắn tắt về các option : 

```
[root@Client1 ~]# mkdir --help
Usage: mkdir [OPTION]... DIRECTORY...
Create the DIRECTORY(ies), if they do not already exist.

Mandatory arguments to long options are mandatory for short options too.
  -m, --mode=MODE   set file mode (as in chmod), not a=rwx - umask
  -p, --parents     no error if existing, make parent directories as needed
  -v, --verbose     print a message for each created directory
  -Z                   set SELinux security context of each created directory
                         to the default type
      --context[=CTX]  like -Z, or if CTX is specified then set the SELinux
                         or SMACK security context to CTX
      --help     display this help and exit
      --version  output version information and exit

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
For complete documentation, run: info coreutils 'mkdir invocation'

```

- Hiển thị thông báo khi tạo thư mục  :

```
[root@Client1 ~]# mkdir -v folder
mkdir: created directory ‘folder’
```

- Có thể sử dụng để tạo thư mục mẹ khi cần thiết: 

```
[root@Client1 ~]# mkdir -p -v folder/folder1/folder2
mkdir: created directory ‘folder/folder1’
mkdir: created directory ‘folder/folder1/folder2’
```
Ở đây thư mục folder1 chưa được tạo nên nó tạo luôn thư mục có tên là folder1. 

