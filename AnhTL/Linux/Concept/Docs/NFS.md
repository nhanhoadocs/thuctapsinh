# NFS (Network File System)
## Mục lục
[1. Khái niệm](#1)

[2. NFS Server](#2)

- [2.1: file cấu hình, dịch vụ](#2.1)

  - [2.1.1: file /etc/exports](#2.1.1)

  - [2.1.2: File /etc/hosts.allow](#2.1.2)

  - [2.1.3: File /etc/hosts.deny](#2.1.3)

- [2.2: Các dịch vụ trong NFS](#2.2)

  - [2.2.1: Khởi động portmapper](#2.2.1)

  - [2.2.2: Các tiến trình ngầm](#2.2.2)

[2.3: Xác minh rằng NFS đang chạy](#2.3)

[2.4: Cấu hình NFS](#2.4)
### <a name="1"> 1. khái niệm </a>

- NFS là hệ thống cung cấp dịch vụ chia sẻ file phổ biến trong hệ thống mạng Linux và Unix.
- NFS hiện có 3 vesion đang có sẵn là: NFS v2, NFS v3 và NFS v4.
- NFS cho phép các máy tính kết nối tới 1 phân vùng đĩa trên 1 máy từ xa giống như là local disk. - Cho phép việc truyền file qua mạng được nhanh và trơn tru hơn.
- NFS sử dụng mô hình Client/Server. Trên server có các disk chứa các file hệ thống được chia sẻ và một số dịnh vụ chạy ngầm (daemon) phục vụ cho việc chia sẻ với Client.
- Cung cấp chức năng bảo mật file và quản lý lưu lượng sử dụng (file system quota).
- Các Client muốn sử dụng các file system được chia sẻ thì sử dụng giao thức NFS để mount các file đó về.
- Khi triển khai hệ thống lớn hoặc chuyên biệt cần áp dụng 3NFS, còn người dùng ngẫu nhiên hoặc nhỏ lẻ thì áp dụng 2NFS, 4NFS.
- Với NFSv4, yêu cầu hệ thống phải có kernel phiên bản từ 2.6 trở lên
- Xử lý được những file lớn hơn 2GB, đòi hỏi hệ thống phải có phiên bản kernel lớn hơn hoặc bằng 2.4x và glibc từ 2.2.x trở lên
- Client từ phiên bản kernel 2.2.18 trở đi đều hỗ trợ NFS trên nền TCP

### <a name="2"> 2. NFS Server </a>
**<a name="2.1"> 2.1: file cấu hình, dịch vụ </a>**
- Có ba tập tin cấu hình chính:
  - file **/etc/exports**
  - file  **/etc/hosts.allow**
  - file **/etc/hosts.deny**

**<a name="2.1.1"> 2.1.1: file /etc/exports </a>**

Dùng để gán thư mục muốn chia sẻ cho client.
```
dir host1(options) host2(options) hostN(options) …
```
- **dir** : Thư mục hoặc file system muốn chia sẻ.
- **host** : Một hoặc nhiều host được cho phép mount dir. Có thể được định nghĩa là một người dùng, một nhóm sử dụng ký tự , * hoặc một nhóm sử dụng 1 dải địa chỉ mạng/subnetmask...
- **options** : Có nghĩa là **quyền hạn** để client có thể thao tác trên thư mục được chia sẻ.

Ví dụ: ta chia sẻ thư mục /test2 đến máy client có địa chỉ ip là: ``192.168.230.151`` với các quyền.
```
/test2 192.168.230.151/24(rw,sync,no_subtree_check)
```
![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/66186604_2321683877915228_1366759091526959104_n.png?_nc_cat=103&_nc_oc=AQntxxfipf7m9A-qfznR4y2UgASoBaEqH3kiPApleRzKVLJIk2kY3LFyPFanPXyDTec&_nc_ht=scontent.fhan5-7.fna&oh=2a6eb98cea737f04b37f01989a0eb179&oe=5DBBB8F6)

Các options:
- **ro**: thư mục được chia sẻ chỉ đọc được; client không thể ghi lên nó.
- **rw**: client có thể đọc và ghi trên thư mục.
- **no_root_squash**: Mặc định, bất kỳ file truy vấn được tạo bởi người dùng (root) máy trạm đều được xử lý tương tự nếu nó được tạo bởi user nobody. Nếu no_root_squash được chọn, user root trên client sẽ giống như root trên server.
- **no_subtree_check**: Nếu chỉ 1 phần của ổ đĩa được chia sẻ, 1 đoạn chương trình gọi là “thẩm tra lại việc kiểm tra cây con” được yêu cầu từ phía client (nó là 1 file nào đó trong phân vùng được chia sẻ). Nếu toàn bộ ổ đĩa được chia sẻ, việc vô hiệu hóa sự kiểm tra này sẽ tăng tốc độ truyền tải.
- **sync**: Đồng bộ dữ liệu từ 2 phía.

Ví dụ 2:
```
/usr/local *.123.vn(ro) 
/home 192.168.1.0/255.255.255.0(rw) 
/var/tmp 192.168.1.1(rw) 192.168.1.3(rw)
```
- **Dòng thứ nhất**: Cho phép tất cả các host với tên miền định dạng “somehost”.123.vn được mount với thư mục /usr/local với quyền chỉ đọc.
- **Dòng thứ hai**: Cho phép bất kỳ host nào có địa chỉ IP thuộc subnet 192.168.1.0/24 được mount thư mục /home với quyền đọc và ghi.
- **Dòng thứ ba**: Cho phép 2 host được mount thư mục /var/tmp với quyền đọc và ghi.

**<a name="2.1.2"> 2.1.2: File /etc/hosts.allow </a>**

Tập tin này giúp xác định các máy tính trên mạng có thể sử dụng các dịch vụ trên máy của ta. Mỗi dòng trong nội dung file chứa duy nhất 1 danh sách gồm 1 dịch vụ và 1 nhóm các máy tính. Khi server nhận được yêu cầu từ client, các công việc sau sẽ được thực thi:

- Kiểm tra file **host.allow** – nếu client phù hợp với 1 quy tắc được liệt kê tại đây thì nó có quyền truy cập.

**<a name="2.1.3"> 2.1.3: File /etc/hosts.deny </a>**

Ngược lại với file **host.allow** - Nếu client không phù hợp với 1 mục trong **host.allow** server sẽ chuyển sang kiểm tra trong **host.deny** để xem thử client có phù hợp với 1 quy tắc được liệt kê trong đó hay không (host.deny). Nếu phù hợp thì client bị từ chối truy cập.
- Nếu máy client không khớp với danh sách trong một hoặc hai tệp thì nó được phép truy cập.

  - Ví dụ: Muốn chặn hoặc cho phép một host hoặc network thì thêm vào file deny hoặc allow.
```
portmap: 10.10.10.5, 10.10.10.0/24
```
**<a name="2.2"> 2.2: Các dịch vụ trong NFS </a>**

- **Portmap**: Quản lý các kết nối, dịch vụ chạy trên port 2049 và 111 ở cả server và client.
- **NFS**: Khởi động các tiến trình RPC (Remote Procedure Call) khi được yêu cầu để phục vụ cho chia sẻ file, dịch vụ chỉ chạy trên server.
- **NFS lock**: Sử dụng cho client khóa các file trên NFS server thông qua RPC.

**<a name="2.2.1"> 2.2.1: Khởi động portmapper </a>**

NFS phụ thuộc vào tiến trình ngầm quản lý các kết nối (portmap hoặc rpc.portmap), chúng cần phải được khởi động trước.

- Nó nên được đặt tại /sbin hoặc trong /usr/sbin. Hầu hết các bản phân phối linux gần đây đều tự khởi động dịch vụ này khi server khởi động. Nhưng vẩn phải đảm bảo nó được khởi động trước khi ta làm việc với NFS.
- Để kiểm tra ta dùng lệnh:
```
netstat -anp | grep -r portmap
```

**<a name="2.2.2"> 2.2.2: Các tiến trình ngầm </a>**

Dịch vụ NFS được hỗ trợ bởi 5 tiến trình ngầm:

- **rpc.nfsd**: thực hiện hầu hết mọi công việc.
- **rpc.lockd and rpc.statd**: quản lý việc khóa các file.
- **rpc.mountd**: quản lý các yêu cầu gắn kết lúc ban đầu.
- **rpc.rquotad**: quản lý các hạn mức truy cập file của người sử dụng trên server được truy xuất.
- **lockd**: được gọi theo yêu cầu của nfsd. Vì thế ta cũng không cần quan tâm lắm tới việc khởi động nó.

Tuy nhiên trong các bản phân phối linux gần đây đều có kịch bản khởi động cho các tiến trình trên. Tất cả các tiến trình này đều nằm trong gói nfs-utils, nó có thể được lưu giữ trong /sbin hoặc /usr/sbin. Nếu bản phân phối của ta không tích hợp chúng trong quá trình khởi động, thì ta nên tự thêm chúng vào, cấu hình theo thứ tự sau đây:
```
rpc.portmap
rpc.mountd, rpc.nfsd
rpc.statd, rpc.lockd (nếu cần), và
rpc.rquotad
```

**<a name="2.3"> 2.3: Xác minh rằng NFS đang chạy </a>**

Để xác minh rằng NFS đang chạy, ta truy vấn portmapper với lệnh `` rpcinfo`` để tìm hiểu những dịch vụ mà nó đang cung cấp.
```
rpcinfo -p
```

![](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/65946969_332215867690086_2991044435006980096_n.png?_nc_cat=102&_nc_oc=AQk1r2-Q--6gJ6m0wp1hSdjGF0XZSjKBDJXO2ZugWlPWO_g2uNq8S9sypDBEeE0v7N8&_nc_ht=scontent.fhan5-2.fna&oh=96a239a5cd9dfa309e527fdfa568498d&oe=5DB54F44)

- **Portmapper**: Tiến trình này không làm việc trực tiếp với dịch vụ NFS mà tham gia quản lý các yêu cầu RPC từ máy trạm gửi đến.
- **Mountd**: Tiến trình này sẽ gắn kết tập tin trên máy chủ tới thư mục mà máy client yêu cầu. Muốn bỏ gắn kết, ta dùng lệnh ``umount``
- **Nfs**: Là tiến trình chính, thực thi nhiệm vụ của giao thức NFS, có nhiệm vụ cung cấp cho máy client các tập tin hoặc thư mục được yêu cầu.
- **nlockmgr**: Là trình quản lý khóa cho Hệ thống tệp mạng NFS.

**<a name="2.4"> 2.4: Cấu hình NFS </a>**

[Trên Ubuntu](https://github.com/letuananh19/thuctapsinh/blob/master/AnhTL/Linux/Ubuntu%20Server/lab/Configure%20NFS%20on%20Ubuntu%20Server.md)

[Trên centOS](https://github.com/letuananh19/thuctapsinh/blob/master/AnhTL/Linux/CentOS/NFS%20on%20centOS.md)

### Tài liệu tham khảo:

http://nfs.sourceforge.net/nfs-howto/


# END
