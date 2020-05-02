# File Permissions

Trong Linux và các hệ điều hành UNIX, mọi tệp đều liên kết với người dùng là chủ sở hữu. Mỗi tệp cũng được liên kết với 1 nhóm có mối quan tâm đến tệp và các quyền  hoặc quyền nhất định: đọc, viết, thực thi,...

|Command|Nội dung|
|-------|-----------|
|chown|Thay đổi quyền sử hữu của người dùng đối với tệp và thư mục.|
|chgrp|Thay đổi quyền sở hữu nhóm|
|chmod|Thay đổi quyền trên tệp|

Các tệp có 3 loại quyền: đọc(r), ghi(w), thực thi(x). 3 quyền này thường được đại diện theo thứ tự:
người dùng(U), nhóm (g), những người khác: (o)

|rwx: |rwx: |rwx|
|---|---|---|
|u: |g:|o|

Ví dụ: 
```
# ls -l test1
-rw--wxr-x 1 joy caldera 1601 Mar 9 15:04 test1

-> Ta thấy: 
`-` : xác định là file. Nếu là folder sẽ là "d"
User: `rw-` : có quyền đọc và ghi
Group: `-wx` : có quyền ghi và thực thi
Other: `r-x` : có quyền đọc và thực thi
```

<img src = "https://i.imgur.com/LwSt3xg.png">

- `ls -l` : kiểm tra quyền của file/folder

- `chmod` : lệnh thay đổi quyền truy cập của người dùng tới file/folder

## Cấu trúc lệnh
```
chmod [options] mode [mode] file1 file2 file3 ....
```

### Các option:
- -R: Recursive, áp dụng cho tất cả các file và folder bên trong
- -f: force, set quyền trong cả trường hợp xảy ra lỗi
- -v: verbose, hiển thị đối tượng đã xử lý

### Các mode:

|#|Permission|rwx|
|-|----------|---|
|7|read, write and execute|rwx|
|6|read and write|rw-|
|5|read and execute|r-x|
|4|read only|r--|
|3|write and execute|-wx|
|2|write only|-w-|
|1|execute only|--x|
|0|none|---|

```
Ví dụ:

# ll
rw-rw-r-- 1 root root 0 Dec 9 15:04 test1
# chmod -v 777 test1
mode of 'test1' change from 0664 (rw-rw-r--) to 0777 (rwxrwxrwx)
```
Quyền sở hữu nhóm được thay đổi khi sử dụng lệnh `chgrp`:
```
Ví dụ:
# ll /home/mina/myfile.txt
-rw-rw-r--. 1 mina caldera 679 Dec 9 15:51 /home/mina/myfile.txt
# chgrp root /home/mina/myfile.txt
# ll /home/mina/myfile.txt
-rw-rw-r--. 1 mina root 679 Feb 9 15:51 /home/mina/myfile.txt
```
