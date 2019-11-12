# Tìm hiểu Storage Area Network.
# Mục lục.
[1. Storage area network.](#1)

[2. Các thành phần trong hệ thống SAN](#2)

[3. Giao thức SAN sử dụng.](#3)
- [3.1 iSCSI là gì ?](#3.1)
- [3.2 Fiber channel.](#3.2)

[4 FCoE ( Fiber Channel over Ether frames)](#4)

----
<a name="1"></a>
## 1. Storage area network.
Storage area network(SAN) : là một mạng chuyên dụng kết nối nhiều server và thiết bị lưu trữ, với mục đích là truyền tải dữ liệu giữa hệ thống máy tính và phần tử lưu trữ và giữa các phần tử với nhau.
 
Mạng SAN có thể kết nối tất cả các tài nguyên liên quan đến lưu trữ trong mạng lại với nhau.

SAN có tốc độ lưu trữ cao dành cho việc quản lý dữ liệu, giúp việc sử dụng dữ liệu hiệu quả hơn, dễ dàng hơn trong công việc quản trị, tập trung cac thao tác tăng độ an toàn, sao lưu, khôi phục khi có sự cố.

SAN thường được sử dụng ở những nơi lưu trữ nhiều dữ liệu như ngân hàng, các nha cung cấp dịch vụ viến thông. 

SAN thường có mạng lưới lưu trữ riêng mà không thông qua mạng LAN với các thiết bị khác.

SAN sử dụng các giao thức như: Fiber Channel, iSCSI, ATA over Ethernet và HyperSCSI.
<a name="2"></a>
## 2. Các thành phần trong hệ thống SAN
Thiết bị lưu trữ: các tủ đĩa có dung lượng lớn, khả năng truy suất nhanh, có hỗ trợ các chức năng RAID, local replica, ... Đây là nơi dữ liệu chung cho toàn bộ hệ thống.

Thiết bị chuyển mạch SAN: là các SAN switch thực hiện việc kết nối các máy chủ đến tủ đĩa.

Các máy chủ hoặc máy trạm: cần lưu trữ, được kết nối đến SAN switch bằng cáp quang thông qua HBA card.
<a name="3"></a>
## 3. Giao thức SAN sử dụng.
SAN sử dụng giao thức chính là Fiber Channel và iSCSI.

<a name="3.1"></a>
### 3.1 iSCSI là gì ?
iSCSI là Iternet SCSI ( Small Computer System Interface): là một chuẩn công nghiệp phát triển đề cho phép truyền tải các lệnh SCSI qua mạng IP bằng cách sử dụng giao thức TCP/IP.

Giao thức iSCSI có 5 lớp: 
- Lớp 1: lớp phân chia mạng ALC.
- Lớp 2: lớp xác thực CHAP.
- lớp 3: lớp xác thực RADIUS.
- Lớp 4: lớp xac thực IPSec.
- Lớp 5: lớp mã hóa IPSec.

iSCSI là giao thức Internet thuộc tầng application để lưu trữ thông tin qua Internet. Nó cung cấp truy cập block-level để truy cập thiết bị lưu trữ.

Một giao tiếp kết nối iSCSI sẽ bao gồm 2 thành phần chính: iSCSI Initator và iSCSI Target.
- iSCSI Inititor ( iSCSI Initiator Node): là thiết bị client trong kiến trúc hệ thống lưu trữ qua mạng. iSCSI Inititor sẽ kết nối đến máy chủ iSCSI Target và truyền tải các lệnh SCSI thông qua đường truyền mạng TCP/IP. iSCSI Inititor có thể được khởi chạy từ chương trình phần mềm trên OS hoặc phần cứng thiết bị hỗ trợ iSCSI.

- iSCSI Target( iSCSI Target Node): thường là một máy chủ luu trữ có thể là hệ thống NAS. Từ máy chủ iSCSI Target sẽ tiếp nhận các request gửi từ iSCSI Inititor gửi đến và gửi trả dữ liệu trả về. iSCSI Target quản lý các ổ đĩa iSCSI với các tên gọi LUN ( Logical Unit Number) được sử dụng để chia sẻ ổ đĩa lưu trữ iSCSI với phía iSCSI Inititor (clinet).

<a name="3.2"></a>
### 3.2 Fiber channel.
Fiber channel  là một chuẩn kỹ thuật cho phép dữ liệu được truyền từ một nút mạng này đến nút mạng khác với tốc độ rất cao 1Gbps, 2Gbps, 4Gbps, 8Gbps, 10Gbps.

Kiến trúc fiber channel gồm các lớp độc lập như các giao thức mạng khác và được chia thành 5 lớp đánh số từ 0 đên 4.

Từ lớp 0 đến lớp 3 là lớp vật lý.
- FC-0 : định nghĩa tốc độ đường truyền và phương tiện vật lý bao gồm cáp, bộ kết nối, ổ đĩa, các bộ phát và thu.
- FC-1: định nghĩa sơ đồ mã hóa, dùng để đồng bộ dự liệu khi truyền.
- FC-2: định nghĩa giao thức framing và điều khiển dòng.

Lớp 4 và lớp 5 cung cấp sử dụng chung cho các thao tác giữa các phần,  định tuyến và chuyển mạch.
- FC-3: định nghĩa các dịch vụ dùng chung cho các node. Một dịch vụ được đĩnh nghĩa là multicast là 1 nơi chuyển đến nhiều nơi.
- FC-4: định nghĩa sự ánh xạ giao thức lớp trên cùng. Các giao thức như FCP (ISCSI), FICON và IP.

<a name="4"></a>
## 4 FCoE ( Fiber Channel over Ether frames)
Công nghệ mạng máy tính cho phép Fiber channel được sử dụng trên mạng Ethernet có tốc độ 10 Gigabit trong khi vẫn dữ được giao thức fiber channel 
- Data center sử dụng Ethernet trên TCP/IP
- Fiber channel cho storage area network ( SAN)

Với một đường truyền Ethernet ta có thể truyền cả traffic fiber channel và cả ethernet

Hợp nhất kết nối LAN và SAN làm giảm bớt chi phí



Tài liệu tham khảo.

https://developer.ibm.com/tutorials/l-network-filesystems/

http://www.linux-tutorial.info/modules.php?name=MContent&pageid=150

http://tuhocmang.com/chuyen-de-tu-hoc/tu-hoc-lpi-1-2-bai-12-network-file-system-nfs.html