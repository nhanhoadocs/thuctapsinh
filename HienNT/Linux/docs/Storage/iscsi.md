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

  - `iSCSI target` là từ dùng để chỉ các thiết bị iSCSI SAN(hay IP SAN). Các thiết bị này là các server dùng để lưu trữ dữ liệu. Chúng sử dụng 1 HĐH bất kỳ và có cài tính năng hỗ trợ iSCSI.  
  - `iSCSI initiators` là từ để chỉ các thiết bị truy cập đến IP SAN. Các thiết bị này phải hỗ trợ tính năng iSCSI client thì mới có thể truy cập được.  

    >iSCSI initiators(client) được cài sẵn trong Win Vista/7 và 2008. Đối với iSCSI target, có nhiều Soft, ví dụ StarWind trên nền Win, và OpenFiler trên nền Linux.

- `iSCSI` dễ dùng, linh hoạt, dễ mở rộng, vì hoạt động dựa trên nền IP và Ethernet/Internet, không đòi hỏi nhiều phần cứng. Đặc biệt hiệu quả trong mạng Ethernet 10G.  

- Ví dụ sử dụng iSCSI trong một vài cấu hình mạng:   

  <img src="../../images/raid/iSCSI.png">  

  - ***Ví dụ 1:*** Clients kết nối với server(có thể là: File servers, Database servers, Exchange servers hoặc Web servers) được cài đặt iSCSI initiators qua mạng LAN.  
  Điều này cho phép thêm nhiều bộ nhớ hơn trong thời gian thực mà không cần tắt máy chủ.

  - ***Ví dụ 2:*** Client hoặc server đã cài đặt iSCSI initiators có thể truy cập tới iSCSI target qua Internet. iSCSI target và firewal phải được cấu hình để cho phép phát hiện và xác thực máy client qua mạng WAN. Yêu cầu kết nối băng thông rộng hoặc cao để có độ tin cậy và tốc độ truyền đủ.
 
  - ***Ví dụ 3:*** Admin hoặc user có yêu cầu lưu trữ hiệu suất cao hơn có thể kết nối trực tiếp với thiết bị iSCSI thông qua Gigabit Switch.

## 2. Cách thức hoạt động của iSCSI  







## TÀI LIỆU THAM KHẢO  
- https://resources.infosecinstitute.com/iscsi-security-considerations-cloud/
- https://www.addonics.com/technologies/iscsi_tutorial.php