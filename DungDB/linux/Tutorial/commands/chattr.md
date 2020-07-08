# chattr - Bảo vệ tập tin trên Linux

`chattr` là viết tắt của Change Attribute. Đây là câu lệnh cho phép bạn thay đổi thuộc tính của file giúp bảo vệ file khỏi bị xóa hoặc ghi đè nội dung, dù cho bạn có đang là user root đi nữa.

**Lưu ý:** Tất cả các lệnh dưới đây đểu chạy dưới quyền user root.

Trong bài viết này, tôi đã tạo trước một file cloud365.txt trong thư mục vidu. Nội dung file như sau:

    [root@dungdbhost1 vidu]# cat cloud365.txt
    cloud365.vn
    [root@dungdbhost1 vidu]#

Cú pháp lệnh:

    chattr [operator] [flags] [filename]

Các operator:

- `+`: Thêm thuộc tính cho file
- `-`: Gỡ bỏ thuộc tính khỏi file
- `=`: Giữ nguyên thuộc tính của file

Các flag:

Có nhiều flag, ở đây tôi sẽ giới thiệu các flag thường dùng là

- `i`: Flag này khiến file không thể rename, không thể tạo symlink, không thể thực thi, không thể write. Chỉ có user root mới set và unset được thuộc tính này.
- `a`: Flag này khiến file không thể rename, không thể tạo symlink, không thể thực thi, chỉ có thể nối thêm nội dung vào file. Chỉ có user root mới set và unset được thuộc tính này.
- `d`: file có thuộc tính này sẽ không được backup khi tiến trình dump chạy
- `S`: Nếu một file có thuộc tính này bị sửa, thay đổi sẽ được cập nhật đồng bộ trên ổ cứng.
- `A`: Khi file có thuộc tính được truy cập, giá trị `atime` của file sẽ không thay đổi

1. Cách thêm thuộc tính trên file để bảo vệ file khỏi bị xóa

Chúng ta thêm thuộc tính `i` (immutable) cho file.

    [root@dungdbhost1 vidu]# chattr +i cloud365.txt

Xem lệnh trên đã có hiệu lực chưa bằng cách dùng lệnh `lsattr`:

    [root@dungdbhost1 vidu]# lsattr
    ----i----------- ./cloud365.txt

Bây giờ ta thử xóa file trên:

    [root@dungdbhost1 vidu]# rm -rf cloud365.txt
    rm: cannot remove ‘cloud365.txt’: Operation not permitted
    [root@dungdbhost1 vidu]# mv cloud365.txt nhanhoa.txt
    mv: cannot move ‘cloud365.txt’ to ‘nhanhoa.txt’: Operation not permitted
    [root@dungdbhost1 vidu]# chmod 755 cloud365.txt
    chmod: changing permissions of ‘cloud365.txt’: Operation not permitted

Có thể thấy rằng chúng ta không thể xóa hoặc thay đổi file trên.

2. Cách để unset thuộc tính đã thêm cho file

Ta sử dụng operator `-`

    [root@dungdbhost1 vidu]# chattr -i cloud365.txt

Sau khi bỏ thuộc tính `i` khỏi file, ta có thể thay đổi file một cách bình thường:

    [root@dungdbhost1 vidu]# mv cloud365.txt nhanhoa.txt
    [root@dungdbhost1 vidu]# lsattr
    ---------------- ./nhanhoa.txt
    [root@dungdbhost1 vidu]# ll
    total 4
    -rw-r--r-- 1 root root 12 Jun  2 13:34 nhanhoa.txt
    [root@dungdbhost1 vidu]#

3. Chỉ cho phép nối thêm nội dụng vào file

Chúng ta thêm thuộc tính `a` (append) cho file

    [root@dungdbhost1 vidu]# chattr +a nhanhoa.txt
    [root@dungdbhost1 vidu]# lsattr
    -----a---------- ./nhanhoa.txt

Thử sửa nội dung file này:

    [root@dungdbhost1 vidu]# echo "sua noi dung file" > nhanhoa.txt
    -bash: nhanhoa.txt: Operation not permitted

Có thể thấy là không sửa được nội dung.

Nhưng chúng ta có thể nối nội dung file:

    [root@dungdbhost1 vidu]# echo "noi noi dung file" >>nhanhoa.txt
    [root@dungdbhost1 vidu]# cat nhanhoa.txt
    cloud365.vn
    noi noi dung file
    [root@dungdbhost1 vidu]#

Ta có thể gõ bỏ thộc tính này với lệnh

    [root@dungdbhost1 vidu]# chattr -a nhanhoa.txt  

4. Cách dùng `chattr` để bảo vệ thư mục

Để bảo vệ cả thư mục và các file bên trong thư mục đó, ta dùng flag `-R` (recursively) và `+i` với đường dẫn của thư mục đó.

    [root@dungdbhost1 ~]# chattr -R +i vidu/

Thử xóa thư mục này đi

    [root@dungdbhost1 ~]# rm -rf vidu/
    rm: cannot remove ‘vidu/nhanhoa.txt’: Permission denied

Có thể thấy ta không thể xóa thư mục vidu và các file bên trong nó.

Để unset quyền trên, ta sử dụng flag `-R` (recursively) và `-i` với đường dẫn của thư mục đó.

    [root@dungdbhost1 ~]# chattr -R -i vidu/

Sau khi chạy lệnh này, ta có thể sửa, xóa thư mục và file bên trong như bình thường.

5. Áp dụng lệnh `chattr` để bảo vệ file `/etc/passwd` và `/etc/shadow`

Thêm thuộc tính `i` cho các file này để tránh bị xóa nhầm. Lưu ý rằng ta không thể tạo thêm user trên khi sử dụng cách này.

    [root@dungdbhost1 ~]# chattr +i /etc/passwd
    [root@dungdbhost1 ~]# chattr +i /etc/shadow

Thử tạo thêm user:

    [root@dungdbhost1 ~]# useradd nhanhoa
    useradd: cannot open /etc/passwd

Có thể thấy ta không thể thêm user mới vào hệ thống.

Với cách này, bạn có thể đặt quyền không thể sửa đổi cho các file hệ thống quan trọng hoặc các file cấu hình quan trọng để tránh bị xóa.