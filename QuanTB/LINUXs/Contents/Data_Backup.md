# Data backup

## Backup data `rsync`
Lệnh `rsync` được sử dụng để đồng bộ hóa toàn bộ cây thư mục. về cơ bản, nó sao chép tập tin như lệnh `cp`. Ngoài ra, `rsync` có cơ chế kiểm tra xem tập tin đang được sao chép đã tồn tại hay chưa. Nếu tệp tin tồn tại và không có thay đổi về kích thước hoặc thời gian sửa đổi `rsync` sẽ bỏ qua, vì vậy nó giúp tiết kiệm thời gian. Hơn nữa `rsync` chỉ sao chép các phần của tệp thực sự thay đổi nên nó rất nhanh.

`rsync` rất hữu ích khi đồng bộ hóa các tệp qua mạng (remote) vì nó chỉ gửi đi những gì có sự thay đổi.

Để sử dụng `rsync` ta phải cài đặt bằng lệnh:

CentOS: `# sudo yum install rsync`

Ubuntu: `# sudo apt install rsync`

`# rsync -h` để biết cách sử dụng và các option của `rsync`

```
# rsync --help
rsync  version 3.1.2  protocol version 31
Copyright (C) 1996-2015 by Andrew Tridgell, Wayne Davison, and others.
Web site: http://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
    append, ACLs, xattrs, iconv, symtimes, prealloc

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.

rsync is a file transfer program capable of efficient remote update
via a fast differencing algorithm.

Usage: rsync [OPTION]... SRC [SRC]... DEST
  or   rsync [OPTION]... SRC [SRC]... [USER@]HOST:DEST
  or   rsync [OPTION]... SRC [SRC]... [USER@]HOST::DEST
  or   rsync [OPTION]... SRC [SRC]... rsync://[USER@]HOST[:PORT]/DEST
  or   rsync [OPTION]... [USER@]HOST:SRC [DEST]
  or   rsync [OPTION]... [USER@]HOST::SRC [DEST]
  or   rsync [OPTION]... rsync://[USER@]HOST[:PORT]/SRC [DEST]
The ':' usages connect via remote shell, while '::' & 'rsync://' usages connect
to an rsync daemon, and require SRC or DEST to start with a module name.

Options
 -v, --verbose               increase verbosity
     --info=FLAGS            fine-grained informational verbosity
     --debug=FLAGS           fine-grained debug verbosity
     --msgs2stderr           special output handling for debugging
 -q, --quiet                 suppress non-error messages
     --no-motd               suppress daemon-mode MOTD (see manpage caveat)
 -c, --checksum              skip based on checksum, not mod-time & size
 -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
     --no-OPTION             turn off an implied OPTION (e.g. --no-D)
 -r, --recursive             recurse into directories
 -R, --relative              use relative path names
     --no-implied-dirs       don't send implied dirs with --relative
 -b, --backup                make backups (see --suffix & --backup-dir)
     --backup-dir=DIR        make backups into hierarchy based in DIR
     --suffix=SUFFIX         set backup suffix (default ~ w/o --backup-dir)
 -u, --update                skip files that are newer on the receiver
     --inplace               update destination files in-place (SEE MAN PAGE)
     --append                append data onto shorter files
     --append-verify         like --append, but with old data in file checksum
 -d, --dirs                  transfer directories without recursing
 -l, --links                 copy symlinks as symlinks
 -L, --copy-links            transform symlink into referent file/dir
     --copy-unsafe-links     only "unsafe" symlinks are transformed
     --safe-links            ignore symlinks that point outside the source tree
     --munge-links           munge symlinks to make them safer (but unusable)
 -k, --copy-dirlinks         transform symlink to a dir into referent dir
 -K, --keep-dirlinks         treat symlinked dir on receiver as dir
 -H, --hard-links            preserve hard links
 -p, --perms                 preserve permissions
 -E, --executability         preserve the file's executability
     --chmod=CHMOD           affect file and/or directory permissions
 -A, --acls                  preserve ACLs (implies --perms)
 -X, --xattrs                preserve extended attributes
 -o, --owner                 preserve owner (super-user only)
 -g, --group                 preserve group
     --devices               preserve device files (super-user only)
     --copy-devices          copy device contents as regular file
     --specials              preserve special files
 -D                          same as --devices --specials
 -t, --times                 preserve modification times
 -O, --omit-dir-times        omit directories from --times
 -J, --omit-link-times       omit symlinks from --times
     --super                 receiver attempts super-user activities
     --fake-super            store/recover privileged attrs using xattrs
 -S, --sparse                handle sparse files efficiently
     --preallocate           allocate dest files before writing them
 -n, --dry-run               perform a trial run with no changes made
 -W, --whole-file            copy files whole (without delta-xfer algorithm)
 -x, --one-file-system       don't cross filesystem boundaries
 -B, --block-size=SIZE       force a fixed checksum block-size
 -e, --rsh=COMMAND           specify the remote shell to use
     --rsync-path=PROGRAM    specify the rsync to run on the remote machine
     --existing              skip creating new files on receiver
     --ignore-existing       skip updating files that already exist on receiver
     --remove-source-files   sender removes synchronized files (non-dirs)
     --del                   an alias for --delete-during
     --delete                delete extraneous files from destination dirs
     --delete-before         receiver deletes before transfer, not during
     --delete-during         receiver deletes during the transfer
     --delete-delay          find deletions during, delete after
     --delete-after          receiver deletes after transfer, not during
     --delete-excluded       also delete excluded files from destination dirs
     --ignore-missing-args   ignore missing source args without error
     --delete-missing-args   delete missing source args from destination
     --ignore-errors         delete even if there are I/O errors
     --force                 force deletion of directories even if not empty
     --max-delete=NUM        don't delete more than NUM files
     --max-size=SIZE         don't transfer any file larger than SIZE
     --min-size=SIZE         don't transfer any file smaller than SIZE
     --partial               keep partially transferred files
     --partial-dir=DIR       put a partially transferred file into DIR
     --delay-updates         put all updated files into place at transfer's end
 -m, --prune-empty-dirs      prune empty directory chains from the file-list
     --numeric-ids           don't map uid/gid values by user/group name
     --usermap=STRING        custom username mapping
     --groupmap=STRING       custom groupname mapping
     --chown=USER:GROUP      simple username/groupname mapping
     --timeout=SECONDS       set I/O timeout in seconds
     --contimeout=SECONDS    set daemon connection timeout in seconds
 -I, --ignore-times          don't skip files that match in size and mod-time
 -M, --remote-option=OPTION  send OPTION to the remote side only
     --size-only             skip files that match in size
     --modify-window=NUM     compare mod-times with reduced accuracy
 -T, --temp-dir=DIR          create temporary files in directory DIR
 -y, --fuzzy                 find similar file for basis if no dest file
     --compare-dest=DIR      also compare destination files relative to DIR
     --copy-dest=DIR         ... and include copies of unchanged files
     --link-dest=DIR         hardlink to files in DIR when unchanged
 -z, --compress              compress file data during the transfer
     --compress-level=NUM    explicitly set compression level
     --skip-compress=LIST    skip compressing files with a suffix in LIST
 -C, --cvs-exclude           auto-ignore files the same way CVS does
 -f, --filter=RULE           add a file-filtering RULE
 -F                          same as --filter='dir-merge /.rsync-filter'
                             repeated: --filter='- .rsync-filter'
     --exclude=PATTERN       exclude files matching PATTERN
     --exclude-from=FILE     read exclude patterns from FILE
     --include=PATTERN       don't exclude files matching PATTERN
     --include-from=FILE     read include patterns from FILE
     --files-from=FILE       read list of source-file names from FILE
 -0, --from0                 all *-from/filter files are delimited by 0s
 -s, --protect-args          no space-splitting; only wildcard special-chars
     --address=ADDRESS       bind address for outgoing socket to daemon
     --port=PORT             specify double-colon alternate port number
     --sockopts=OPTIONS      specify custom TCP options
     --blocking-io           use blocking I/O for the remote shell
     --stats                 give some file-transfer stats
 -8, --8-bit-output          leave high-bit chars unescaped in output
 -h, --human-readable        output numbers in a human-readable format
     --progress              show progress during transfer
 -P                          same as --partial --progress
 -i, --itemize-changes       output a change-summary for all updates
     --out-format=FORMAT     output updates using the specified FORMAT
     --log-file=FILE         log what we're doing to the specified FILE
     --log-file-format=FMT   log updates using the specified FMT
     --password-file=FILE    read daemon-access password from FILE
     --list-only             list the files instead of copying them
     --bwlimit=RATE          limit socket I/O bandwidth
     --outbuf=N|L|B          set output buffering to None, Line, or Block
     --write-batch=FILE      write a batched update to FILE
     --only-write-batch=FILE like --write-batch but w/o updating destination
     --read-batch=FILE       read a batched update from FILE
     --protocol=NUM          force an older protocol version to be used
     --iconv=CONVERT_SPEC    request charset conversion of filenames
     --checksum-seed=NUM     set block/file checksum seed (advanced)
 -4, --ipv4                  prefer IPv4
 -6, --ipv6                  prefer IPv6
     --version               print version number
(-h) --help                  show this help (-h is --help only if used alone)

Use "rsync --daemon --help" to see the daemon-mode command-line options.
Please see the rsync(1) and rsyncd.conf(5) man pages for full documentation.
See http://rsync.samba.org/ for updates, bug reports, and answers
```

Một số option:

- `-z, --compress` nén file khi truyền
- `-r, --recursive` đệ quy
- `...`


## Nén dữ liệu - Compress the data
Nén dữ liệu là một trong những phương pháp làm giảm dung lượng file, tiết kiệm bộ nhớ và giảm được thời gian truyền tệp qua mạng. Sau đây là một số phương pháp thường được sử dụng để nén dữ liệu:

|Commands|Usage|
|--------|-----|
|gzip|Tiện ích nén được sử dụng phổ biến nhất trên linux|
|bzip2|Nén thành các tệp có dung lương nhỏ hơn đáng kể so với gzip|
|zip|Tiện ích nén hiệu quả nhất về không gian được sử dụng trong linux, Nó hiện được [kernel.org](https://www.kernel.org/) sử dụng để lưu trữ tài liệu lưu trữ của nhân Linux.|
|xz|Thường được yêu cầu kiểm tra và giải nén tài liệu lưu trữ từ các hệ điều hành khác|

Các tiện ích nén trên khác nhau về hiểu quả của việc nén dữ liệu và thời gian nén dữ liệu, các kỹ thuật nén hiệu quả hơn thường mất nhiều thời gian hơn và ngược lại. Thời gian giải nén không thay đổi qua các phương pháp khác nhau.

## Archiving data - Lưu trữ dữ liệu
Lệnh `tar` cho phép giải nén hay trích xuất dữ liệu từ một file nén (thường được gọi là tarball), ngoài ra nó hỗ trợ tạo ra archive nhưng không hỗ trợ nén.

### Extract a tar.gz archive
Để giải nén một file tar.gz ta sử dụng lệnh:

`# tar -xzvf for.tar.gz`

Trong đó:

`x` - Giải nén file

`v` - Verbose,  in tên tệp khi chúng được trích xuất, từng file một

`z` or `--gzip, --gunzip, --ungzip` - laọc lưu trữ thông qu gzip

`f` - Sử dụng file sau cho việc giải nén

Ngoài ra:

`-C` - Giải nén vào một đường dẫn hoặc một thư mục cụ thể

### Giải nén một hoặc nhiều file
Để giải nén một hoặc nhiều file trong một file nén ta sử dụng lệnh:

`# tar -xz foo.tar.gz file[s]`

### Giải nén khớp với wildcards (kí tự đại diện)
Để giải nén sử dụng ký tự đại diện ta dùng lệnh:

`# tar -xz foo.tar.gz -wildcards [wildcard]s`

Ví dụ: `# tar -xz foo.tar.gz -wildcards *.txt`

### Liệt kê nội dung của một file nén
Để liệt kê nội dung một file nén ta sử dụng lệnh:

`# tar -zt foo.tar.gz`

`-t` or `--list` :(

Ngoài ra ta có thể kết hợp với `-v, Verbose` hoặc `grep` để tìm kiếm hiệu quả hơn

### Tạo một archive

### Permission trước khi thêm file

### Thêm file vào một archive đã tồn tại

### Thêm file vào một compress archive
### Note
|Commands|Usage|
|--------|-----|
|`tar xvf foo.tar.gz`||
|`tar zcvf foo.tar.gz dir`||
|`tar jcvf foo.tar.gz`||
|`tar xvf foo.tar.gz`||
|`tar cvf foo.tar.gz`||


## Copy disks `dd`
`dd` là một tiện ích rất mạnh mẽ và hữu ích, nó có sẵn trên các hệ điều hành giống Unix và Unix, mục đích chính của nó là chuyển đổi và sao chép tệp tin, nhưng trên linux hầu hết mọi thứ được coi là tệp, điều này làm cho `dd` trở lên hữu ích.

Cú pháp của `dd` khác với các chương trình linux khác, nó sử dụng `option=value` cho các tùy chọn dòng lệnh thay vì `-option` hoặc `-option=value`. Theo mặc định nó đọc từ `stdin` và ghi vào `stdout` nhưng nó cũng hỗ trợ các tùy chọn `if` (input file) và `of` (output file).

### Backup toàn bộ đĩa cứng
Để backup toàn bộ đĩa cứng sang một đĩa cứng khác được gắn trên cùng một hệ thống ta sử dụng lệnh:

`# dd if=/dev/sda of=/dev/sdb`

Trong đó:

`if` - input file (là ổ sda)

`of` - output file (là ổ sdb)

Lệnh trên sẽ thất bại khi có lỗi, có một option giúp chuyển đổi dữ liệu mà `dd` hỗ trợ là `conv` (convert) với một số giá trị sau:
- `noerror` - Giúp dd tiếp tục hoạt động khi sảy ra lỗi đọc dữ liệu
- `notrunc` - Tùy chọn này hướng dẫn dd không cắt bớt tệp đầu ra
- `sync` - Tùy chọn này sẽ gán tất cả các dữ liệu không thể đọc được bằng `NULs`

Một cách phổ biến hay sử dụng là kết hợp `noerror` để `dd` không dừng lại khi sảy ra lỗi đọc và `sync` để thay thế các dữ liệu không đọc được bằng `NULs` giúp giữ nguyên độ dài của dữ liệu.

Ví dụ:
`# dd if=/dev/sda of=/dev/sdb conv=noerror, sync`

### Backup một partition (Phân vùng)
Để backup một phân vùng ta sử dụng lệnh:

`# dd if=/dev/hda1 of=~/partition.img` lệnh này sẽ copy toàn bộ phân vùng `sda1` và lưu vào `partition.img`

### Tạo một image của một đĩa cứng
Đôi khi ta cần tạo một image của một đĩa cứng và lưu trữ nó ở đâu đó nhằm sử dụng mỗi khi gặp một sự cố bất ngờ nào đó, để làm điều đó ta sử dụng lệnh:

`# dd if = /dev/hda of = ~/hdadisk.img`

### Tạo một file iso backup từ một CDROM
Để tạo một file iso từ một CDROM được gắn ta sử dụng lệnh sau:

`# dd if=/dev/cdrom of=cdrom.iso bs=2048`

Trong đó `bs` (block size) chỉ định kích thước khối.