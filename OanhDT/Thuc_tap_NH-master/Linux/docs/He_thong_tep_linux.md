<a name ="Hệ thống tệp trong linux"></a>

# Hệ thống tệp trong linux 
# MỤC LỤC 

- [I. Các thư mục thông dụng trong linux ](#1)
- [II. Đường dẫn tương đối và tuyệt đối.](#2)
- [III. Câu lệnh ls](#3)
- [IV. Các ký hiệu biểu diễn kiểu tệp ](#4)
- [V. Các câu lệnh làm việc với tệp](#5)
- [VI. Khái niệm inode](#6)
- [VII. Tìm file](#7)

<a name ="1"></a>

## I. Các thư mục thông dụng trong linux 

- /bin : thư mục tệp chương trình cơ bản 
    - Chứa các tập tin thực thi nhị phân 
    - Ví dụ : ls,cp,ping ...
- /lib : thư mục thư viện hệ thống 
    - Chứa các file thư viện hỗ trợ nằm dưới thư mục /bin
- /boot : thư mục chứa hạt nhân của HĐH
- /etc : thư mục các tệp cấu hình
    - Chứa phần config của tất cả các chương trình chính trong hệ điều hành. 
    - Ví dụ : passwd,yum,...
- /dev : thư mục các tệp thiết bị
    - Chứa các tập tin để nhận biết thiết bị của hệ thống 
- /home : thư mục chứa dữ liệu NSD
    - Lưu trữ tất cả các tập tin của user
- /usr : thư mục ứng dụng
    - Chứa các ứng dụng, thư viện, tài liệu và mã nguồn các chương trình thứ cấp.
    - Ví dụ : usr/bin ,usr/local,..
- /var : thư mục dữ liệu cập nhật
     - Lưu lại cá tập tin ghi số liệu biến đổi 

<a name ="2"></a>

## II. Đường dẫn tương đối và tuyệt đối.

### 1. Đường dẫn tuyệt đối

- Đường dẫn tuyệt đối thường bắt đầu với thư mục /root rồi theo cây hoặc theo nhanh đến thư mục mà bạn mong muốn đi đến. 
- Ví dụ : bạn muốn di chuyển vào thư mục Jun trong thư mục OanhDT 
```
[root@localhost ~]# cd /root/OanhDT/Jun
[root@localhost Jun]#
```
### 2. Đường dẫn tương đối 

- Một đường dẫn tuyệt đối thường bắt đầu bằng tên của thư mục hoặc một tệp tin 
- Thường dùng ký hiệu "." để chỉ thư mục hiện hành và ".." để chỉ thư mục mẹ của thư mục hiện hành.
- Ví dụ : Từ thư mục Jun muốn quay về thư mục root 
```
[root@localhost ~]# cd /root/OanhDT/Jun
[root@localhost Jun]# cd ../../
[root@localhost ~]#
```
<a name ="3"></a>

## III. Câu lệnh ls

|Options|Result|
|---|---|
|-p|Xác định thư mục|
|-t|Hiển thị theo trình tự thời gian|
|-i|Thời gian truy cập lần cuối của file|
|-1|chỉ hiển thị các file không hiển thị ngày giờ|
|-i|Hiển thị inode|

<a name ="4"></a>

## IV. Các ký hiệu biểu diễn kiểu tệp 

- `-`  tệp thông thường
- `d` : thư mục
- `b` : tệp đặc biệt (block)
-` c` : tệp đặc biệt (ký tự)
- `l` : link
- `m` : phần bộ nhớ trong dùng chung
- `p` : đường ống
 
<a name ="5"></a>

## V. Các câu lệnh làm việc với tệp

- Sao chép 
```
cp <options> <file> <dir>

```
- Xóa một file hoặc một thư mục 

```
rmdir <options> <dir>
```
- Tạo mới một thư mục 
```
mkdir <dirname>
```
- Tạo mới một file 
```
touch <filename>
```
- Chi tiết các câu lệnh các bạn có thể xem [Tại đây](https://github.com/oanhhdt/Thuc_tap_NH/blob/master/Linux/docs/101command.md)

<a name ="6"></a>

## VI. Khái niệm inode

![Inode](../images/101/inode.png)

- Inode là cấu trúc dữ liệu bên trong Linux sử dụng để lưu trữ thông tin về đối tượng file hệ thống (file hay thư mục). Thông tin này bao gồm kích thước,owner, socket, pipe ngoại trừ dữ liệu và tên file. 
- Cấu trúc inode 

![](../images/101/double.png)

- **Direct block** : Bản thân inode trỏ đến một vài khối dữ liệu đầu tiên, thường được gọi là khối trực tiếp

- **Indirect block**: Mỗi inode chứa một danh sách, hoặc con trỏ tới danh sách (các khối gián tiếp), của tất cả các khối được yêu cầu bởi inode. 

- **Double Indirect block** : Nếu một tệp lớn, nó sẽ sử dụng tất cả các khối trực tiếp, và nó sẽ sử dụng các khối gián tiếp, gián tiếp kép và ba gián tiếp khi cần.

<a name = "7"></a>

## VII. Tìm file 

```
find <điều kiện> .... 
```
- Các điều kiện 
    - Tên : -name tên
        - Ví dụ tìm file có tên a.txt
        ```
        [root@localhost ~]# find -name a.txt
        ./a.txt
        ```

    - Quyền truy cập : -perm quyền_truy_cập
        - Ví dụ muốn tìm file có quyền truy cập 777
        ```
        [root@localhost ~]# find -perm 777
        ./b.txt
        [root@localhost ~]#
        ```

    - Kiểu : -type d/f/...
    - Kích thước : -size N
        - Ví dụ : Tìm file có kích thước 1G 
        ```
         [root@localhost ~]# find -size 1G
        .
        ./test
        ./.tcshrc
        ./.bash_logout
        ./.cshrc
        ./.bashrc
        ./.bash_history
        ./OanhDT
        ./OanhDT/oanhdt
        ./OanhDT/Jun
        ./OanhDT/Jun/oanh.txt
        ./a.txt
        ./jun
        ./jun/test
        ./.bash_profile
        ./anaconda-ks.cfg
        [root@localhost ~]#
        ```

    - Thời gian : -atime N, -mtime N, -ctime N






