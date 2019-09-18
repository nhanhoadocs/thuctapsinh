# iSCSI là gì ? Tìm hiểu về hệ thống lưu trữ iSCSI SAN

## Mục lục  
1. [iSCSI là gì?](#1)  
2. [Cách thức hoạt động của iSCSI](#2)
3. [LAB sử dụng iSCSI](#3)  
  3.1. [Chuẩn bị và mô hình lab](#3.1 )  
  3.2. [Cài đặt và cấu hình iSCSI target](#3.2)  
  3.3. [Cài đặt và cấu hình iSCSI initiator](#3.3)  

## 1. iSCSI là gì?  
- `iSCSI`*(đọc là: ai-x-kơ-zi)* là viết tắt của **I**nternet **S**mall **C**omputer **S**ystems **I**nterface. iSCSI là một giao thức lớp vận chuyển(Transport) hoạt động dựa trên giao thức TCP/IP. Nó cho phép truyền dữ liệu cấp khối giữa `iSCSI target` và `iSCSI initiators` bằng đường Network(LAN/WAN). iSCSI hỗ trợ mã hóa các gói mạng và giải mã khi đến đích.

  - `iSCSI target` là từ dùng để chỉ các thiết bị iSCSI SAN(hay IP SAN). Các thiết bị này là các server dùng để lưu trữ dữ liệu. Chúng sử dụng 1 HĐH bất kỳ và có cài tính năng hỗ trợ iSCSI. Từ máy chủ iSCSI Target sẽ tiếp nhận các request gửi từ iSCSI Initiator gửi đến và gửi trả dữ liệu trở về  
  - `iSCSI initiators` là từ để chỉ các thiết bị truy cập đến IP SAN(client trong kiến trúc hệ thống lưu trữ qua mạng). iSCSI Initiator sẽ kết nối đến máy chủ iSCSI Target và truyền tải các lệnh SCSI thông qua đường truyền mạng TCP/IP . iSCSI Initiator có thể được khởi chạy từ chương trình phần mềm trên OS hoặc phần cứng thiết bị hỗ trợ iSCSI.

    >iSCSI initiators(client) được cài sẵn trong Win Vista/7 và 2008. Đối với iSCSI target, có nhiều Soft, ví dụ StarWind trên nền Win, và OpenFiler trên nền Linux.

- `iSCSI` dễ dùng, linh hoạt, dễ mở rộng, vì hoạt động dựa trên nền IP và Ethernet/Internet, không đòi hỏi nhiều phần cứng. Đặc biệt hiệu quả trong mạng Ethernet 10G.  

- `iSCSI` có rất nhiều ưu điểm nổi bật như:
  - Chi phí rẻ hơn nhiều so với Fiber Channel SAN
  - Tạo và quản lý được nhiều ổ cứng cho nhiều máy tính nội-ngoại mạng(VPN).
  - Gián tiếp mở rộng dung lượng lưu trữ cho các máy tính nội-ngoại mạng(VPN).
  - Cài VMware trên ổ cứng iSCSI hoặc cài phần mềm từ xa.
  - Hiển thị y hệt ổ cứng trong máy, thân thiện với người dùng phổ thông.
  - Bảo mật cao bằng mật khẩu.
  - Kết nối rất nhanh, không cần qua nhiều bước.
  - Thích hợp cho doanh nghiệp quản lý dữ liệu của máy nhân viên.

- Ví dụ sử dụng iSCSI trong một vài cấu hình mạng:   

  <img src="../../images/raid/iSCSI.png">  

  - ***Ví dụ 1:*** Clients kết nối với server(có thể là: File servers, Database servers, Exchange servers hoặc Web servers) được cài đặt iSCSI initiators qua mạng LAN.  
  Điều này cho phép thêm nhiều bộ nhớ hơn trong thời gian thực mà không cần tắt máy chủ.

  - ***Ví dụ 2:*** Client hoặc server đã cài đặt iSCSI initiators có thể truy cập tới iSCSI target qua Internet. iSCSI target và firewal phải được cấu hình để cho phép phát hiện và xác thực máy client qua mạng WAN. Yêu cầu kết nối băng thông rộng hoặc cao để có độ tin cậy và tốc độ truyền đủ.
 
  - ***Ví dụ 3:*** Admin hoặc user có yêu cầu lưu trữ hiệu suất cao hơn có thể kết nối trực tiếp với thiết bị iSCSI thông qua Gigabit Switch.


## 2. Cách thức hoạt động của iSCSI  
iSCSI hoạt động thông qua việc truyền và nhận dữ liệu cấp khối giữa bộ khởi tạo iSCSI(iSCSI initiators) trên client và mục tiêu iSCSI(iSCSI target) trên server lưu trữ. Các câu lệnh SCSI và dữ liệu sẽ được đóng gói vào [iSCSI PDU](http://www.3kranger.com/HP3000/mpeix/en-hpux/T1452-90011/img/gfx12.gif) và truyền đi qua mạng. Hình dưới cho thấy cấu trúc của một iSCSI Frame

<p align="center"><img src="../../images/raid/Capture.png"></p>

## 3. LAB sử dụng iSCSI
### &emsp;3.1. Một số khái niệm sử dụng trong bài lab  
- `IQN` - iSCSI qualified name - Tên đủ điều kiện iSCSI được dùng để xác định target và initiator.  
- `Backend Storage` - Các thiết bị lưu trữ được sử dụng làm iSCSI target  
- `Target` - Dịch vụ trên máy chủ iSCSi cho phép truy cập vào backend storage devices.
- `Initiator` - iSCSI client kết nối với iSCSI target và được IQN xác định.  
- `ACl` - Danh sách kiểm soát truy cập dựa trên iSCSI initiator IQN và được sử dụng để cung cấp quyền truy cập cho người dùng cụ thể.
- `LUN` - Logical Unit Number -  đơn vị số logic gắn cho iSCSI dùng để tập hợp các ổ đĩa chạy bằng các loại giao thức SCSI, iSCSI và Fibre Channel. Các backend storage devices được chia sẻ thông qua target. Target có thể là bất kỳ thiết bị nào có hỗ trợ các hoạt động đọc/ghi, ví dụ như disk, partitions, logical volumes, files or tape drves.
- `Portal` - Địa chỉ IP và cổng mà mục tiêu hoặc người khởi tạo sử dụng để thiết lập kết nối.
- `TPG` - Target Portal Group - Tập hợp các địa chỉ IP và cổng TCP mà iSCSI target cụ thể sẽ lắng nghe.
- `Discovery` - Khám phá các mục tiêu có sẵn bằng cách sử dụng lệnh `iscsiadm`.
  Câu lệnh:  
  ```sh
    # iscsiadm --m discovery -t sendtargets --p [portal] --discover
  ```
  Trong đó: 
  - `sendtargets` - xác định làm thế nào để tìm ra mục tiêu.
  - `portal` - báo cho iscsiadm địa chỉ IP và cổng tới địa chỉ để thực hiện khám phá. Cổng mặc định là 3260. Thường sẽ để giá trị IP
  - `--discover` - nói với dịch vụ iscsid để thực hiện khám phá.
- `Login` - Xác thực cho phép initiator truy cập vào LUN trên target. Sau khi đăng nhập thành công, thông tin đăng nhập được lưu trữ tự động trên bộ khởi tạo. Đăng nhập được thực hiện bằng lệnh `iscsiadm`

  ```sh
    # iscsiadm -m node --login
  ```  
- LVM - Logical Volumn Manager: là phương pháp cho phép ấn định không gian đĩa cứng thành những `Logical Volume` khiến cho việc thay đổi kích thước trở nên dễ dàng hơn (so với partition). Với kỹ thuật LVM bạn có thể thay đổi kích thước mà không cần phải sửa lại table của OS. Điều này hữu ích với những trường hợp bạn đã sử dụng hết phần bộ nhớ còn trống của partition và muốn mở rộng dung lượng của nó.

### &emsp;3.2. Mô hình

<p align="center"><img src="../../images/raid/iscsi1.png"></p>

### &emsp; 3.3. Các bước thực hiện  
#### &emsp;&emsp;3.3.1. Tạo `iSCSI Target`  
-  Tạo thiết bị lưu trữ sao lưu



- Cài đặt `targetcli` trên máy target - công cụ quản trị cung cấp giao diện mặc định để quản lý target.  
  ```sh
    # yum install targetcli -y
  ```










## TÀI LIỆU THAM KHẢO  
- https://resources.infosecinstitute.com/iscsi-security-considerations-cloud/
- https://www.addonics.com/technologies/iscsi_tutorial.php
- https://www.packetflow.co.uk/iscsi-san-protocols-explained/#howdoesiscsiwork
- https://www.golinuxcloud.com/configure-iscsi-target-initiator-targetcli-rhel-centos-7/