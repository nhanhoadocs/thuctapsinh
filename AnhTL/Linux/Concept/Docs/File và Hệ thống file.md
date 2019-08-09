# Inode và đơn vị lưu trữ.

**1: Inode**
- Inode là một cấu trúc dữ liệu chứa các metadata của mỗi file, thư mục trong các hệ thống file Linux. Trong một inode có các metadata sau:
  - Dung lượng file tính bằng bytes.
  - Device ID : mã số thiết bị lưu file.
  - User ID : mã số chủ nhân của file.
  - Group ID.: mã số nhóm của chủ file.
  - File mode : gồm kiểu file và các quyền truy cập file (permissions).
  - Hệ thống phụ và các cờ hạn chế quyền truy cập file.
  - Timestamps: các mốc thời gian khi: bản thân inode bị thay đổi (ctime), nội dung file thay đổi (mtime) và lần truy cập mới nhất (atime).
  - Link count : số lượng hard links trỏ đến inode.
  - Các con trỏ (từ 11-15 con trỏ) chỉ đến các blocks trên ổ cứng dùng lưu nội dung file. Theo các con trỏ này mới biết file nằm ở đâu để đọc nội dung.
- Trong inode không có tên file. Tên file được lưu trong thư mục cùng với số inode của nó (xem lệnh ls -i dưới đây).
- Có hai chú ý trong nội dung inode:

  - Inode không chứa tên file, thư mục.
  - Các con trỏ là thành phần quan trọng nhất: nó cho biết địa chỉ các block lưu nội dung file và tìm đến các block đó có thể truy cập được nội dung file.

- Để hiện thông số về inode ta dùng lệnh: ``stat tên_file``

![](https://www.slashroot.in/sites/default/files/inode%20structure%20of%20a%20directory.png)  

### Đơn vị lưu trữ file trên ổ cứng
**1: Sector**
- Là đơn vị lưu trữ vật lý nhỏ nhất trên ổ cứng. Dung lượng một sector từ 512B đến 1,2 hoặc 4KiB (cấp số mũ 2 của 8bit).

**2: Cluster**
- Cluster (nhóm sector): khi lưu file nếu quản lý theo sector thì quá nhỏ, dữ liệu quản lý nhiều, làm chậm quá trình đọc, ghi. Cluster là đơn vị lưu trữ nhỏ nhất để lưu file trên ổ cứng gồm từ 1-128 sector liên tục.

### Đơn vị lưu trữ file logic
**1: Block**
- là đơn vị lưu trữ **logic** nhỏ nhất được cấp khi lưu dữ liệu.
- Dung lượng một block (block size) tùy theo: với hệ thống file ext3, một block có thể là 1,2 hoặc 4 KB

**2: Extent** 
- Là một nhóm block liên tục.
- Một số hệ thống file (JFS2, XFS, ext4) dùng đơn vị lưu trữ được cấp khi lưu dữ liệu không phải là block mà là một nhóm block (gọi là một extent).
- Dữ liệu được lưu đủ một extent trong bộ nhớ trước khi ghi vào ổ cứng, do đó tốc độ ghi và đọc nhanh hơn và cũng giảm được lượng metadata cần quản lý. 
- Nếu không dùng extent, metadata được cập nhật cho từng block dữ liệu, khi dùng extent, metadata chỉ cập nhật cho từng nhóm block.
  - Ví dụ ext4 ghép các block 4KB thành extent tới 128MB.

### Superblock

- Superblock gồm các thông tin chung về một hệ thống file: dung lượng, dung lượng block, các block đã ghi và còn trống, vị trí và dung lượng bảng inode, …

- Nếu superblock bị hỏng thì hệ thống file không mount được và do đó không truy cập được. Vì vậy hệ điều hành định kỳ sẽ tạo các bản backup của superblock ngoài bản chính (primary superblock).
