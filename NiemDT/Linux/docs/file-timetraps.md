# File timestamps
 * `atime`- access time. Trả về thời gian lần cuối cùng file được đọc. Nếu ta mở file ra đọc hoặc bất tiến trình hoặc chương trình nào mở file ra đọc thì `atime` cũng sẽ được update. `atime` chỉ thay đổi khi ta mở file ra đọc mà không có bất kỳ thay đổi nào.
 * `mtime` - modification time. Trả về thời gian lần cuối cùng file được sửa nội dung.
 * `ctime` - change time. Trả về lần cuối cùng file được được sửa (nội dụng hoặc thuộc tính -quyền).
Để kiểm tra ta có một số các sau.
Vd kiểm tra file `mtr.md`
```
niemdt@niemdt:~/Thuc_tap/GitHub/Niemdt/linux/docs$ stat --printf '%n\nmtime: %y\nctime: %z\natime: %x\n' mtr.md
mtr.md
mtime: 2018-12-10 22:59:27.621033000 +0700
ctime: 2018-12-10 22:59:27.621033000 +0700
atime: 2018-12-10 22:59:21.954021500 +0700
```
hoặc 
```
niemdt@niemdt:~/Thuc_tap/GitHub/Niemdt/linux/docs$ stat mtr.md 
  File: mtr.md
  Size: 2993      	Blocks: 8          IO Block: 4096   regular file
Device: 813h/2067d	Inode: 2089        Links: 1
Access: (0666/-rw-rw-rw-)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2018-12-10 22:59:21.954021500 +0700
Modify: 2018-12-10 22:59:27.621033000 +0700
Change: 2018-12-10 22:59:27.621033000 +0700
 Birth: -
```
hoặc dùng lệnh `ls`
 * `ls -l file` kiểm tra `mtime`
 * `ls -lc file` kiểm tra `ctime`
 * `ls -lu file` kiểm tra `atime`