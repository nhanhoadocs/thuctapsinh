# Uname
`uname` là câu lệnh để tra cứu về thông tin cuả hệ điều hành và thông tin của phần cứng
### Một số option
#1. Không có option#
Nếu sử dụng câu lệnh `uname` mà không có option thì kết quả trả về sẽ là tên của hệ điều hành mà không có bất kỳ thông tin nào khác
```
niemdt@niemdt:~$ uname
Linux
```
#2. Option -a#
Với option `-a` sẽ trả về những thông tin sau:
```
niemdt@niemdt:~$ uname -a
Linux niemdt 4.15.0-42-generic #45-Ubuntu SMP Thu Nov 15 19:32:57 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```
Thông tin trả về gồm các trường sau:
 * Tên của kerdnel(`linux`)
 * Tên của host (`niemdt`)
 * Thông tin phát hành kernel (`4.15.0-42-generic`)
 * Ngày phát hành kernel (`Thu Nov 15 19:32:57 UTC 2018`)
 * Tên phần cứng máy (`x86_64`)
 * Kiến trúc CPU (`x86_64`)
 * Nền tảng phần cứng (`x86_64`)
 * Tên hệ điều hành (`GNU/Linux`)
#3. Option -rs#
Option `-s` để in tên của kernel và `-r` để hiển thị thông tin phát hành
```
niemdt@niemdt:~$ uname -rs
Linux 4.15.0-42-generic
```
#4. Option -v#
Option `-v` là về ngày phát hành kernel
```
niemdt@niemdt:~$ uname -v
#45-Ubuntu SMP Thu Nov 15 19:32:57 UTC 2018
```
#5. Kiểm tra kiến trúc CPU#
Để kiểm tra kiến trúc CPU ta dùng option `-p`
```
niemdt@niemdt:~$ uname -p
x86_64
```
#6. Kiểm tra OS là 32-bit hay 64-bit#
Ta sử dụng option `-m`
Nếu là 32-bit thì sẽ trả về là (`i686` hoặc `i386`) còn 64-bit sẽ là (`x86_64`)
```
niemdt@niemdt:~$ uname -m
x86_64
```
#7. Kiểm tra tên máy#
Dùng option `-n`
```
niemdt@niemdt:~$ uname -n
niemdt
```

