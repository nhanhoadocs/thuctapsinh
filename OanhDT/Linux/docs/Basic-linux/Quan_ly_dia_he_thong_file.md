<a name ="Quản lý đĩa và hệ thống file"></a>

# Quản lý đĩa và hệ thống file 

- Các đĩa vật lý : IDE,SCSI,USB,SATA,LVM,...
- Phân vùng : /dev/hdaX,/dev/sdbX,...
- Hệ thống tệp : tổ chức logic của phân vùng. NTF,EXT2,EXT3,...
## 1. Tổ chức ổ đĩa 
- MBR (Master boot record): chương trình khởi động hệ thống 
- Boot record 
- Primary partition : phân vùng chính 
- Extended Partition : phân vùng mở rộng 
- Logical partition : phân vùng logic
### a. mkfs
- Gán định dạng hệ thống tệp 
```
mkfs <định dạng> <phân vùng>
```

- Options 

|Options|Result|
|---|---|
|-b|kích thước block|
|-i|số lượng byte cho 1 inode|
|-c|số lần mount||
|-j|có nhật ký|
|-m|dự trữ|
|-r|số block dự trữ|
|-g,-u|nhóm và NSD được dùng dự trữ |

### b. Mount 
- Trong Linux để sử dụng được một thiết bị lưu trữ ta phải` mount` nó vào một thư mục nào đó để có thể sử dụng.Như vậy `mount` có nghĩa là liên kết 1 thiết bị lưu trữ đến 1 cây thư mục.
- Options 

|Options|Result|
|---|---|
|-t|kiểu hệ thống tệp|
|rw/ro|readonly,read-write |
|usrquota,grpquota|hạn ngạch NSD và hạn ngạch nhóm|
|users/nousers|cho phép thực hiện các phân chương sau khi mount|
|sync/async|cập nhật hoặc không cập nhật ngay các thay đổi|
|user = ,pasword = | cung cấp tên và mật khẩu để kết nối với thiết bị|
|loop|cho phép làm việc với các ổ đĩa ảo|

## 2. Định dạng ổ cứng

- Khởi tạo ổ cứng: Trước khi sử dụng một ổ cứng mới, bạn phải format ổ cứng đó.Vậy tại sao phải format ? Ta sẽ có 3 lý do cơ bản sau :
    - Diệt virus: Có thể trong quá trình sử dụng máy tính, bạn vô tình nhấn vào một trang web không rõ nguồn gốc hay tải về phần mềm độc hại dẫn đến máy tính của bạn bị virus tấn công. Do đó, ngoài việc sử dụng phần mềm diệt virus bạn còn có thể format toàn bộ cứng để diệt sạch virus.
    - Thay đổi kích thước tập tin hệ thống/ổ cứng: Mỗi một tập tin hệ thống/ổ cứng đều được xác định khi chúng khởi động. Vậy nên nếu bạn muốn thay đổi kích thước của chúng thì bạn phải format ổ cứng.
    - Không sử dụng được ổ cứng: Trong trường hợp bạn mở một ổ đĩa nhưng lại không thể truy cập được các dữ liệu trong ổ đĩa đó, cách khắc phục đơn giản lỗi này là định dạng lại ổ cđ.
- Các định dạng đĩa     
    - EXT ,EXT2 ,EXT3 ,EXT4 
    - NTFS 
    - XFS 
    - SWAP : phân vùng làm không gian bộ nhớ ảo, dùng để bổ sung thêm bộ nhớ cho hệ thống khi hệ điều hành phát hiện việc thiếu hụt bộ nhớ RAM
    - NFS :dành cho các tài nguyên ở xa, được chia sẻ qua mạng sử dụng NFS


