<a name = "Hệ thống tệp linux">

# Hệ thống tệp Linux

## I. Nội dung
 - [1. Khái niệm về hệ thống tệp logic](#a)
 - [2. Các thao tác với thư mục](#b)
 - [3. Các thao tác với tệp](#c)
 - [4. inode](#d)

 <a name="a"></a>
 1. Khái niệm về hệ thống tệp logic
 - Cấu trúc hệ tống trong tệp: Một/nhiều cây phân cấp thưc mục vào các tệp
    - Tệp nhóm các bit
    - Một thư mục dùng để tạo nhóm các tệp dữ liệu và thư mục

- Thư mục gốc (/) là điểm vsò đầu tiên cho cả cây thư mục
- Các tệp là các nút lá

1.2 Các thưc mục thông dụng trong Linux
- / (Thư mục góc)
    - /bin:  Lưu trữ tập những lệnh thường sử dụng nhất
    - /boot: Chứa phần nhân khởi động Linux và file cấu hình khởi động (grub cũng trong thư mục này
    - /etc: Chứa các thiết lập của hệ thống 
    - /dev: Chứa các tập tin đặc biệt tương ứng với các thiết bị có trong hệ thống
    - /home: Chứa các thư mục con có tên ứng với User name của người dùng, mỗi thư mục đó chính là nơi lưu trữ toàn bộ dữ liệu của người dùng. Người dùng bình thường cũng chỉ được lưu trữ vào thư mục “nhà” của mình mà thôi.
    - /lib: Thư viện hệ thống
    - /usr: Thư mục ứng dụng
    - /var: Thư mục dữ liệu cập nhật
    - /root: Thư mục nhà của người dùng có quyền cao nhất(root),người ngoài thường bị cấm truy cập
    -  /mnt – thư mục này được dùng để gắn các hệ thống tập tin tạm thời (mounted filesystems)
    -  /tmp – thư mục này lưu lại các tập tin được tạo ra tạm thời (temporary files)
    -  /proc – đây là một thư mục đặc biệt linh động để lưu các thông tin về tình trạng của hệ thống, đặc biệt về các tiến trình (processes) đang hoạt động

1.3 Tệp Linux vs. tệp Windows
- Giống nhau:
    - độ dài tối đa cho tên tệp là 255
    -  Chấp nhận tất cả các kí tự để đặt tên tệp (nhưng nên tránh sử dụng các kí tự đặc biệt như * ? [ ] & để tránh sự nhập nhằng trong câu lệnh sử dụng sau này) 

- Tính đặc thù của Linux
    - Quản lý dưới một khung nhìn của tệp cho cả thư mục và các loại tài nguyên hệ thống (ngoại vi, bảng phân chương đĩa)
    - Không có khái niệm phần mở rộng của tên tệp (kí tự '.' trong tên tệp được đối xử như mọi kí tự khác
    - Không dùng ổ đĩa logic trong cây thư mục
    -  '/' được dùng thay cho '\' trong đường dẫn thư mục
1.4 Đường dẫn và thư mục đặc biệt
- Truy cập tập và các thư mục cần có đường dẫn
- Đường dẫn có thể có móc tùe các thư mục đặc biệt
    - / : Thư mục gốc
    - ~ : Thư mục nhà
    - . : Thư mục hiện tại
    - .. : Thu mục cha

<a name="b"></a>
2. Các thao tác với thư mục

2.1 Lệnh cơ bản quản lý thư mục:
- pwd 
- cd  
- ls –la [tên thư mục] 
- mkdir [-p] [tên thư mục mới] 
- rmdir [tên thư mục rỗng]

2.2 Quản lý thư mục
- pwd: Hiển thị đường dẫn tuyệt đối của thưu mục hiện tại
- cd: Thay đỏi vị rí hiện tại
-  mkdir: tạo một thư mục rỗng 
-  rmdir: xoá một thư mục rỗng

2.3 Câu lệnh ls
    <img src="https://imgur.com/1LDhzkM.jpg">

<a name="c"></a>
3. Các thao các với tệp

- Kiểu cảu tệp:
    - Tệp thư mục là một thư mục trong đường dẫn phân loại (vd., /usr, /home,…) 
    - Tệp thông thường là một tệp chứa dữ liệu hoặc tệp chương trình (vd., /bin/passwd, /etc/passwd, …) 
    - Tệp đặc biệt là một tệp thiết bị tương ứng với thiết bị ngoại vi hoặc các tệp tự sinh bởi HĐH. Có thể có tệp ký tự hoặc tệp block 
    - Liên kết 
    - Các tệp biểu diễn các kênh vào ra
- Các ký hiệu dưới đây được sử dụng để biểu diễn các kiểu tệ

- `-` : Tệp thông thường
- `d` : Thư mục
- `b` : Têp đặc biệt(block)
- `c` : tệp đặc biệt (ký tự)
- `l` : Link
- `m` : phần bộ nhớ trong dùng chung
- `p ` : Đường ống

- Các siêu kí tự
    - `*` dùng để thay thế cho một chuỗi kí tự bất kì bao gồm cả xâu rỗng 
    - `?` thay thế cho một kí tự bất kì 
    - `[ ]` được thay thế bởi một kí tự trong một tập kí tự cho trước 
    - `[! ]` được thay thế bởi một kí tự không có trong một tập kí tự cho trước

- Quản lý tệp
- cat: xem nhanh một tệp 
-  more: xem từng dòng 
-  less: xem từng trang 
-  tail: xem cuối trang 
- touch: tạo tệp mới, cập nhật tệp cũ 
-  echo > [tên tệp]

<a name="d"></a>
4. inode

4.1 Khái niệm inode
- Một inode được tạo ra cho mỗi điểm vào trên hệ thống tệp
- Nội dung của tệp được lưu trong các khối dữ liệu 
    - một tệp rỗng = một inode không có khối dữ liệu 
- Một thư mục là một tệp với nội dung là một bảng liên kết
    - một liên kết gắn một tên tệp với một inode của hệ thống tệp
- Inode (index node) là một khái niệm cơ bản trong Linux filesystem. Mỗi đối tượng của filesystem dược đại diện bởi một inode. Vậy những đối tượng đó là gì? Chúng ta hãy tìm hiểu một vài thứ đơn giản sau đây. Tất cả các file đều có những thuộc tính sau đây:


    - Loại file
    - Permissions
    - Chủ sở hữu
    - Nhóm
    - Kích thước file
    - Thời gian truy cập, thay đổi, sửa đổi file
    - Thời gian file bị xóa
    - Số lượng liên kết
    - Thuộc tính mở rộng
    - Danh sách truy cập file
- Sử dụng `ls -i` đối với file và `ls -id` đối với thư mục
```
[root@localhost etc]# ls -i /etc/passwd
17293842 /etc/passwd
[root@localhost etc]#

```

Tất cả những thông tin trên được lưu trong inode. Một cách ngắn gọn, Inode xác định file và thuộc tính của nó (như đã kể trên). Mỗi Inode được xác định bởi 1 con số duy nhất trong hệ thống tệp tin. Inode cũng biết đến như một chỉ số. Vậy INODE là:

inode là một cấu trúc dữ liệu trong hệ thống tệp truyền thống của các họ Unix ví dụ như UFS hoặc EXT3. Inode lưu trữ thông tin về 1 tệp thông thường, thư mục, hay những đối tượng khác của hệ thống tệp tin
4.2 Liên kết vật lý

 - Một liên kết vật lý là một quan hệ giữa tên tệp trong thư mục với một inode 
 - Có thể có nhiều liên kết vật lý đến cùng một inode 
 - Lệnh `ln` cho phép tạo một liên kết vật lý đến một inode (tệp) đã tồn tại 
    - tệp mới chia sẻ cùng inode và khối dữ liệu của tệp ban đầu
4.3 Tìm kiếm File
- `find tên_thư_mục expressions` 
    - Cho phép tìm kiếm các file trong một thư mục (ngầm định là trong thư mục hiện tại) với một số điều kiện hoặc các lệnh thực thi trên tập các file tìm được.
- Các điều kiện 
    - Tên : -name tên 
    - Quyền truy cập : -perm quyền_truy_cập 
    - Kiểu : -type d/f/... 
    - Kích thước : -size N 
    - Thời gian : -atime N, -mtime N, -ctime N 
- Các lệnh thực thi trên tạp các file tìm được 
    - -print 
    - -exec câu_lệnh