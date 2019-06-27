# Chương 1:BASIC COMMANDS :  

**Locating Applications**  
Tùy vào từng bản phân phối , các phần mềm và chương trình có thể được cài đặt ở các directory khác nhau . Nhưng các lệnh, chương trình thực thì thường được lưu ở các directory sau : 
```
/bin
/usr/bin
/sbin
/usr/sbin
/opt
```  
Có thể dùng **which** để tìm được vị trí được lưu của phần mềm .  
Ví dụ : 
`$ which diff ` 
/usr/bin/diff
  
  Nếu which không dùng được có thể dùng whereis thay thế   
`$ whereis diff`  
diff: /usr/bin/diff /usr/share/man/man1/diff.1.gz  

**Accessing Directories**  
  
|Command|Kết quả|
|---|---|
|cd|Chuyển về home|
|cd..|Chuyển về thư mục cha|
|cd-|Chuyển về thư mục trước |
|cd/|Chuyển về thư mục root|

**Exploring the Filesystem**    

|Command|Kết quả|
|--|--|
|ls|Liệt kê các file và thư mục trong directory|
|ls -a | Liệt kê tất cả các file bao gồm các file và directory hidden|  
|ls -l | sẽ hiển thị tên file, directory cùng với size, ngày tháng chỉnh sửa gần nhất, user sở hữu và các permisson của user đó|  
|ls - r|Đưa ra danh sách với thứ tự ngược lại |  
|ls -R |Liệt kê thành các cây thư mục |  
|tree| Hiển thị tree view |
|tree -d | Danh sách directory và file|

**Hard and Symbolic Links**  
Lệnh ln dùng để tạo hard link hoặc soft links (Symbolic and Hard link)  
Giả sử có file file1.txt . Ta tạo một hard link với file file2.txt như sau   
`#ln file1.txt file2.txt`

Dùng lệnh ls -l và -li để xem thông tin file , ta thấy file1 và file2 chỉ cùng đến 1 inode number
```
ls -l file*
-rw-rw-r--. 2 thanhhung98 thanhhung98 12 May  7 10:20 file1.txt
-rw-rw-r--. 2 thanhhung98 thanhhung98 12 May  7 10:20 file2.txt

```  

Tạo một soft links (Symbolic links) ta dùng lệnh sau  
`ln -s file1.txt file4.txt`

Xem thông tin file
 ``` 
 ls -l file*
-rw-rw-r--. 2 thanhhung98 thanhhung98 12 May  7 10:20 file1.txt
-rw-rw-r--. 2 thanhhung98 thanhhung98 12 May  7 10:20 file2.txt
lrwxrwxrwx. 1 thanhhung98 thanhhung98  9 May  7 10:18 file4.txt -> file1.txt
```

Ta thấy file 4 không phải là một file bình thường nó chỉ vào file1 và có inode number khác . Symbolic links k tốn dung lượng filesystem . Khi xóa file1 thì file4 không có tác dụng.


# Chương 2 : File streams

Thông thường khi lệnh được thực thi có 3 dangj file stream cos theer suwr dungj : 
1. Standard inout (stdin)
2. Standard output (stdout)
3. Standard error (stderr)

stdin là các luồng dữ liệu nhập từ bán phím , stdout và stderr được in ra trên terminal , thường in ra các file . Stderr thường được dẫn đến các error logging file .  

$ do_something < input-file
Để gửi thông tin của một lệnh vaof một file
$ do_something > output-file
Chuyển thông tin lỗi ra file
$ do_something 2> output_File

Có thể **pipe** nhiều lệnh vào ,Theo đó output của lệnh A sẽ là đầu vào cho lệnh B xử lý. Hai hay nhiều lệnh ghép lại với nhau theo cách này gọi là cơ chế ống dẫn (pipe
$ command1 | command2 | command3

**Search for files** 
 Lệnh **locate** :  
 Thực hiện việc tìm kiếm qua toàn bộ hệ thống . Locate thường đưa ra các danh sách rất dài , ta có thể dùng grep để lọc bớt thông tin 

Lệnh **find** :


**Manage files**  

|Command |Usage|
|-|-|
|cat|Dùng để xem file k quá dài |
|tac|Xem ngược file |
|less|Dùng để xem file lớn, có cơ chế phân trang |
|tail|in 10 dòng cuối .Có thể thay đổi số dòng bằng -n number  |
|head|Ngược lại với tail|

VD lệnh cat :  
truyền một đoạn vào file   

  cat > filename : viết chèn vào file.       
  cat >> filename : viết vào sau các dòng đã được viết trong file .      



**Compare files**

Lệnh `diff` dùng để so sánh files và directories .  

VD :
```sh 
diff file1.txt file2.txt
```
**The file utility**  
Dùng lệnh `file` để xem được định dạng của file .  
VD :
```sh
$ file /etc/resolv.conf
/etc/resolv.conf: ASCII text 
``` 
# Chương 3 :File System  
Hệ thống file của Linux có dạng cây (tree). Bắt đầu bằng root directory, đánh dấu bằng /.

The Filesystem Hierarchy Standard (FHS) là hệ thống file căn bản của  UNIX.  FHS cung cấp cho  Linux một hệ thống file system căn bản và sự thống nhất giữa các hệ thống và các distributions. Linux hỗ trợ rất nhiều file system và các file system của các hệ điều hành khác.  
 Một số loại file system của linux :

 1. ext3, ext4, btrfs, xfs (native Linux filesystems)  
 - Ext – Extended file system: là định dạng file hệ thống đầu tiên được thiết kế dành riêng cho Linux. Có tổng cộng 4 phiên bản và mỗi phiên bản lại có 1 tính năng nổi bật. Phiên bản đầu tiên của Ext là phần nâng cấp từ file hệ thống Minix được sử dụng tại thời điểm đó, nhưng lại không đáp ứng được nhiều tính năng phổ biến ngày nay. Và tại thời điểm này, chúng ta không nên sử dụng Ext vì có nhiều hạn chế, không còn được hỗ trợ trên nhiều distribution.  

 - Ext4: cũng giống như Ext3, lưu giữ được những ưu điểm và tính tương thích ngược với phiên bản trước đó. Như vậy, chúng ta có thể dễ dàng kết hợp các phân vùng định dạng Ext2, Ext3 và Ext4 trong cùng 1 ổ đĩa trong Ubuntu để tăng hiệu suất hoạt động. Trên thực tế, Ext4 có thể giảm bớt hiện tượng phân mảnh dữ liệu trong ổ cứng, hỗ trợ các file và phân vùng có dung lượng lớn... Thích hợp với ổ SSD so với Ext3, tốc độ hoạt động nhanh hơn so với 2 phiên bản Ext trước đó, cũng khá phù hợp để hoạt động trên server, nhưng lại không bằng Ext3.

 - BtrFS – thường phát âm là Butter hoặc Better FS, hiện tại vẫn đang trong giai đoạn phát triển bởi Oracle và có nhiều tính năng giống với ReiserFS. Đại diện cho B-Tree File System, hỗ trợ tính năng pool trên ổ cứng, tạo và lưu trữ snapshot, nén dữ liệu ở mức độ cao, chống phân mảnh dữ liệu nhanh chóng... được thiết kế riêng biệt dành cho các doanh nghiệp có quy mô lớn.
Mặc dù BtrFS không hoạt động ổn định trên 1 số nền tảng distro nhất định, nhưng cuối cùng thì nó vẫn là sự thay thế mặc định của Ext4 và cung cấp chế độ chuyển đổi định dạng nhanh chóng từ Ext3/4. Do vậy, BtrFS rất phù hợp để hoạt động với server dựa vào hiệu suất làm việc cao, khả năng tạo snapshot nhanh chóng cũng như hỗ trợ nhiều tính năng đa dạng khác.  

- XFS được phát triển bởi Silicon Graphics từ năm 1994 để hoạt động với hệ điều hành riêng biệt của họ, và sau đó chuyển sang Linux trong năm 2001. Khá tương đồng với Ext4 về một số mặt nào đó, chẳng hạn như hạn chế được tình trạng phân mảnh dữ liệu, không cho phép các snapshot tự động kết hợp với nhau, hỗ trợ nhiều file dung lượng lớn, có thể thay đổi kích thước file dữ liệu... nhưng không thể shrink – chia nhỏ phân vùng XFS. Với những đặc điểm như vậy thì XFS khá phù hợp với việc áp dụng vào mô hình server media vì khả năng truyền tải file video rất tốt.  Nếu dùng với máy tính cá nhân, thì đây cũng không phải là sự lựa chọn tốt nên so sánh với Ext, vì hiệu suất hoạt động không khả thi, ngoài ra cũng không có gì nổi trội về hiệu năng, quản lý so với Ext3/4.

 2. vfat, ntfs, hfs (filesystems from other operating systems)
 HFS : là định dạng File System trên nền tảng Mac OS. Tương tự như EXT, HFS cũng tương thích với Windows và Linux nhưng tương thích tốt nhất vẫn là trên Mac OS. Nếu bạn chỉ sử dụng USB trên các máy Mac thì mới chọn định dạng này. 


**The home directories**

Trong UNIX system, từng  user có riêng  home directory,đặt trong /home.

**The binary directories**

/bin directory chứa các biến hàm , cho các lệnh sử dụng cho người dùng như ps , ls , cp . lệnh không thường được sử dụng lưu ở /usr/bin directory,  /sbin directory chứa phần mềm liên quan đến các lệnh cho các quản trị hệ thống ,ví dụ như  ifconfig và shutdown.  /usr/sbin directory chứa phần mềm liên quan đến quản trị nhưng ít dùng hơn . Tất cả các binary directories đều chứa dười phân vùng root. 

**The device directory**

The /dev directory chứa các file cho  hardware và software devices, không chứa các file của thiết bị network .  /dev directory bao gồm :

/dev/sda1
/dev/lp1
/dev/dvd1

**The variable directory**

 /var directory chứa các file :

    System log files: /var/log
    Packages files: /var/lib
    Print queues: /var/spool
    Temp files: /var/tmp
    FTP home directory: /var/ftp
    Web Server directory: /var/www

**The system configuration directory**

 /etc directory chứa các file config và một vài script  . Không chứa các  binary programs.Ví dụ  file resolv.conf có tác dụng như DNS. Các password , quản lý các nhóm user  được chứa trong  /etc directory. 


**The boot directory**

 /boot directory chứa các file dùng để boot system. 

**The libraries directory**

 /lib chứa các thư viện phục vụ các phần mềm chạy trong folder /bin và /sbin . 

**Additional directories**  
  
|Directory|Usage|
|-|-|
|/opt|Các packages sofware|
|/sys|Các file hệ thống và phần cứng |
|/tmp|Các file tạm thời |
|/usr|Dữ liệu , ứng dụng của người dùng 
|/usr/lib|Thư viện phục vụ các chương trình |

# Chương 4 : File permissions
**Những file liên quan đến User và Group**

#/etc/passwd

Mỗi dòng trong tập tin gồm có 7 trường, được phân cách bởi dấu hai chấm.
#/etc/group

Mỗi dòng trong tập tin gồm có 4 trường, được phân cách bởi dấu hai chấm.
#/etc/shadow

Lưu mật khẩu đã được mã hóa và chỉ có user root mới được quyền đọc.  
  **USER**  
  Có 2 loại user cẳn bản là system users và regular users .  
  
  Đặc biệt có superuser , hay còn gọi là root user .Root user có khả năng tương tác với tất cả các file và mọi quyền trong hệ thống .Muốn truy cập là root user cần có lệnh sudo trước lệnh . 
  Các lệnh tạo : 
  ```sh  
  #useradd username  
  #passwd password  
```
  **GROUP**  

   Group là tập hợp nhiều user lại. Mỗi user luôn là thành viên của một group.

  Lệnh Tạo group :   
 ```sh
  #groupadd groupname  
```
add user vào group :  
```sh
#useradd –g groupname username  
```
**File permissions**  

|Command||  
|-|-|  
|chown|Thay đổi quyền sở hữu của file hoặc directory|  
|chgrp|Thay đổi quyền sở hữu nhóm |  
|chmod|thay đổi quyền truy cập file |    

Files có 3 loại  permissions: read (r), write (w), execute (x).Viết tắt theo thứ tự rwx. Phân quyền tác động đến 3 đối tượng : user (u), group (g), và others (o).  

<img src="https://i.imgur.com/BAQPMeK.png">

VD :   
Phân lại quyền cho file :  

<img src="https://i.imgur.com/yXnMP6Z.png">  

phân quyền group cho file :  

<img src="https://i.imgur.com/ijFTJQs.png">  

**Quản lý quyền truy cập trong Centos7**  
 Tạo 2 user và add vào 2 group khác nhau :  
  useradd user1   
  passwd user1  
  useradd user2  
  passwd user2  

  groupadd dev  
  groupadd dev1  

Thêm user vào các nhóm   
  #useradd –g dev user1  
  #useradd –g dev1 user2  

  Từ user1 ta tạo 1 directory có quyền sở hữu bởi user1 và group dev . Phân quyền cho directory này chỉ cho group của uesr1 đọc , viết và thực thi , còn các group khác không được phép vào bằng lệnh `chmod 770 filename`   
  Sau đó đăng nhập vào user2 bằng lệnh `su user2`  
  Ta thử truy cập vào directory của user1 thì thấy quyền truy cập bị từ chối .  
  <img src="https://i.imgur.com/EqFqzsB.png">  
   





 