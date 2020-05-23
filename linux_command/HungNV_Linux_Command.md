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

### 6. rmdir command ( remove directory)

rmdir dùng để xóa 1 thư mục , nếu thư mục đó chứa các thư mục con hoặc chứa các file sẽ không xóa được.

Để xem phiên bản của lệnh ta sử dụng : 
```
[root@Sidecar ~]# rmdir --version
rmdir (GNU coreutils) 8.22
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by David MacKenzie.
```


- xóa đồng thời 2 thư mục không chứa thư mục con hoặc file 

```
[root@Sidecar ~]# rmdir -v viethung/viethung1/viethung2/ hung
rmdir: removing directory, ‘viethung/viethung1/viethung2/’
rmdir: removing directory, ‘hung’
```

nếu thư mục đầu tiên muốn xóa chứa thư mục con, nó sẽ bỏ qua và chuyển sang xóa thư mục thứ 2 

```
[root@Sidecar ~]# rmdir -v viethung/ hung
rmdir: removing directory, ‘viethung/’
rmdir: failed to remove ‘viethung/’: Directory not empty
rmdir: removing directory, ‘hung’
```

### 7. File command 

Được sử dụng để xác định loại tệp tin 

**Syntax** : 
```
File [Option] [Filename]
```

- Để xác định loại tệp tin, ta sử dụng cú pháp như sau : 

```
[root@Client2 ~]# file anaconda-ks.cfg
anaconda-ks.cfg: ASCII text
[root@Client2 etc]# file aliases.db
aliases.db: Berkeley DB (Hash, version 9, native byte-order)
[root@Client2 etc]# file cron.deny
cron.deny: empty
```
- Hiển thị loại tệp trong chế độ ngắn gọn : 
```
[root@Client2 ~]# file -b anaconda-ks.cfg
ASCII text
```

- Có thể hiển thị cùng lúc loại tệp của nhiều tệp.  

```
[root@Client2 etc]# file login.defs tcsd.conf rc1.d/
login.defs: ASCII text
tcsd.conf:  ASCII text
rc1.d/:     directory
```
- Để xem các option của lệnh, ta sử dụng help. 
```
[root@Client2 etc]# file --help
Usage: file [OPTION...] [FILE...]
Determine type of FILEs.

      --help                 display this help and exit
  -v, --version              output version information and exit
  -m, --magic-file LIST      use LIST as a colon-separated list of magic
                               number files
  -z, --uncompress           try to look inside compressed files
  -b, --brief                do not prepend filenames to output lines
  -c, --checking-printout    print the parsed form of the magic file, use in
                               conjunction with -m to debug a new magic file
                               before installing it
  -e, --exclude TEST         exclude TEST from the list of test to be
                               performed for file. Valid tests are:
                               ascii, apptype, compress, elf, soft, tar, tokens, troff
  -f, --files-from FILE      read the filenames to be examined from FILE
  -F, --separator STRING     use string as separator instead of `:'
  -i, --mime                 output MIME type strings (--mime-type and
                               --mime-encoding)
      --apple                output the Apple CREATOR/TYPE
      --mime-type            output the MIME type
      --mime-encoding        output the MIME encoding
  -k, --keep-going           don't stop at the first match
  -l, --list                 list magic strength
  -L, --dereference          follow symlinks (default)
  -h, --no-dereference       don't follow symlinks
  -n, --no-buffer            do not buffer output
  -N, --no-pad               do not pad output
  -0, --print0               terminate filenames with ASCII NUL
  -p, --preserve-date        preserve access times on files
  -r, --raw                  don't translate unprintable chars to \ooo
  -s, --special-files        treat special (block/char devices) files as
                             ordinary ones
  -C, --compile              compile file specified by -m
  -d, --debug                print debugging messages

Report bugs to http://bugs.gw.com/
```
### 8. touch command 

Lệnh touch được sử dụng để tạo 1 file trống. 

- Để tạo 1 file : 
```
[root@Client2 ~]# touch file1
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem  file  file1
```

- Để tạo cùng lúc nhiều file trống : 
```
[root@Client2 ~]# touch file2 file3 doc1 doc2
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem  doc1  doc2  file  file1  file2  file3
```

- Để cập nhật thời gian sửa file gần nhất ta sử dụng -m 
```
[root@Client2 ~]# ls -al
total 28
dr-xr-x---.  4 root root  185 Dec 25 21:56 .
dr-xr-xr-x. 17 root root  224 Dec  4 16:11 ..
-rw-------.  1 root root 1726 Dec  4 16:12 anaconda-ks.cfg
-rw-------.  1 root root 1687 Dec 25 12:12 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root    0 Dec  5 17:52 ca.pem
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root    0 Dec 25 18:18 file
drwxr-----.  3 root root   19 Dec 23 16:21 .pki
drwx------.  2 root root   25 Dec  5 18:39 .ssh
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
[root@Client2 ~]# touch -m file
[root@Client2 ~]# ls -al
total 28
dr-xr-x---.  4 root root  185 Dec 25 21:56 .
dr-xr-xr-x. 17 root root  224 Dec  4 16:11 ..
-rw-------.  1 root root 1726 Dec  4 16:12 anaconda-ks.cfg
-rw-------.  1 root root 1687 Dec 25 12:12 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root    0 Dec  5 17:52 ca.pem
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root    0 Dec 25 22:00 file
drwxr-----.  3 root root   19 Dec 23 16:21 .pki
drwx------.  2 root root   25 Dec  5 18:39 .ssh
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
- Tạo file và chỉ định thời gian : 
```
[root@Client2 ~]# touch -t 201912240005 filetime
[root@Client2 ~]# stat filetime
  File: ‘filetime’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 134313286   Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2019-12-24 00:05:00.000000000 +0700
Modify: 2019-12-24 00:05:00.000000000 +0700
Change: 2019-12-25 22:09:43.669371605 +0700
 Birth: -
```
# 9. rm command (remove command) 

Sử dụng để xóa 1 file hoặc thư mục. 

- Để xóa 1 file : 
```
[root@Client2 ~]# rm file
rm: remove regular empty file ‘file’? y
```
- Sử dụng tùy chọn -f để xóa không cần hỏi lại. 
```
[root@Client2 ~]# rm -f hung.txt
```
Tuy nhiên đối với các thư mục chống ghi, ta không thể sử dụng tùy chọn -f. 

- Để xem version của lệnh, ta sử dụng `--version` 
```
[root@Client2 ~]# rm --version
rm (GNU coreutils) 8.22
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Paul Rubin, David MacKenzie, Richard M. Stallman,
and Jim Meyering.
```
- Để xóa 1 thư mục hoặc file mà không cần hỏi 
```
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem  filetime  vhung
[root@Client2 ~]# rm -rf vhung/
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem  filetime
[root@Client2 ~]#
```
hoặc xóa cùng lúc nhiều file hoặc thư mục : 
```
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem  filetime  hung
[root@Client2 ~]# rm -rf filetime hung/
[root@Client2 ~]# ls
anaconda-ks.cfg  ca.pem
```
Lưu ý: tùy chọn này có thể xóa bất cứ file hoặc thư mục nào. Nên cân nhắc khi sử dụng. 

### 10. cp command 

Cp command dùng để sao chép tệp tin và thư mục, Khi sao chép cp đồng thời cũng có thể tạo tệp mới. 

- Để sao chép 1 thư mục đồng thời tạo thư mục cần sao chép : 
```
[root@server ~]# cat hung1
Nguyen Viet Hung
NS : 29/06/1999
Noi Sinh : Thai Binh
[root@server ~]# cp hung1 hung2
[root@server ~]# ls
anaconda-ks.cfg  hung1  hung2
[root@server ~]# cat hung2
Nguyen Viet Hung
NS : 29/06/1999
Noi Sinh : Thai Binh
```
- Nếu copy vào 1 file đã có dữ liệu, hệ thống sẽ đưa ra câu hỏi có muốn ghi đè dữ liệu hay không. 
```
[root@server ~]# cp hung1 hung2
cp: overwrite ‘hung2’? n
```

- Để sao chép 1 thư mục, ta sử dụng tùy chọn -R. 
```
[root@server viethung]# cp /root/viethung /root/viethung01
cp: omitting directory ‘/root/viethung’
[root@server viethung]# cp -R /root/viethung /root/viethung01
```
```
[root@server ~]# pwd
/root
[root@server ~]# ls
anaconda-ks.cfg  hung1  hung2  viethung  viethung01
```

### 11. mv command

Sử dụng để di chuyển tập tin hoặc thư mục từ nơi này sang nơi khác. 

- Để di chuyển thư mục đến 1 thư mục không tồn tại, thư mục sẽ tự động đổi thành tên thư mục đó.  
```
[root@server ~]# mv viethung /root/viethung01/nguyenviethung
[root@server ~]# cd /root/viethung01/
[root@server viethung01]# ls
nguyenviethung
```

- Nếu di chuyển thư mục đến 1 thư mục đã tồn tại, thư mục sẽ di chuyển đến và giữ nguyên tên. 
```
[root@server ~]# mv hung11 /root/viethung01
[root@server ~]# cd viethung01/
[root@server viethung01]# ls
hung11  nguyenviethung
```

- Để di chuyển 1 file đến 1 thư mục khác : 
```
[root@server ~]# mv hung1 viethung01/
[root@server ~]# cd viethung01/
[root@server viethung01]# ls
hung1  hung11  nguyenviethung
```

- Để di chuyển nhiều file. ví dụ các file có phần mở rộng là txt. Thay vì di chuyển từng file hoặc nhập tên từng file để di chuyển, ta sử dụng * 

```
[root@server ~]# ls
anaconda-ks.cfg  hung1.txt  hung2  hung.txt  viethung01  viethung.txt
[root@server ~]# mv *.txt /root/viethung01
[root@server ~]# cd viethung01/
[root@server viethung01]# ls
hung1  hung11  hung1.txt  hung.txt  nguyenviethung  viethung.txt
```

- Nếu di chuyển 1 file hoặc thư mục đến 1 file hoặc thư mục đã tồn tại, ta sẽ được nhắc có ghi đè hay không ? 

```
[root@server viethung01]# mv hung.txt /root/viethung01/hung1
mv: overwrite ‘/root/viethung01/hung1’? y
```

# 12. rename command 

Sử dụng để thay đổi tên các file.

vd : 

- Để đổi tên 1 file hoặc nhiều file.( Đổi tất cả các file có đổi txt thahf đôi pdf) 
```
[root@server viethung01]# ls
hung1  hung11  hung1.txt  nguyenviethung  viethung.txt
[root@server viethung01]# rename .txt .pdf *.txt
[root@server viethung01]# ls
hung1  hung11  hung1.pdf  nguyenviethung  viethung.pdf
```


