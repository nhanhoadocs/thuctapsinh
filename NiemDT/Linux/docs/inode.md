# inode
Inode ( index node ) là một khái niệm cơ bản trong Linux filesystem. Khi một file được tạo ra nó được gán với một inode. Mỗi inode được xác định bởi một con số duy nhất trong hệ thống tệp tin. `inode` lưu trữ các thông tin sau của file
 * Loại file
 * Quyền đối với file 
 * Chủ sở hữu 
 * Nhóm sở hữu 
 * Kích thước file
 * Thời gian truy cập, thay đổi, chỉnh sửa file
 * Thời gian file bị xóa
 * Số lượng liên kết
 * Thuộc tính mở rộng
 * Danh sách truy cập file

### Hiển thị inode

Sử dụng `ls -i` đối với file và `ls -id` đối với thư mục
```
niemdt@niemdt:~/Thuc_tap/GitHub/Niemdt/linux2$ ls -i links.md 
2263 links.md
```

```
niemdt@niemdt:~/Thuc_tap/GitHub/Niemdt$ ls -id linux2
2260 linux2
```
Hoặc có thể sử dụng cách sau để mở
```
niemdt@niemdt:~/Thuc_tap/GitHub/Niemdt/linux2$ stat links.md 
  File: links.md
  Size: 453       	Blocks: 1          IO Block: 4096   regular file
Device: 813h/2067d	Inode: 2263        Links: 1
Access: (0666/-rw-rw-rw-)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2018-12-11 22:27:17.144871900 +0700
Modify: 2018-12-11 15:07:59.221182700 +0700
Change: 2018-12-11 15:07:59.221182700 +0700
 Birth: -
```
