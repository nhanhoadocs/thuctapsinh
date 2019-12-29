### Tìm hiểu về filesystem trong Linux  
Mục lục  
1. [Cấu trúc filesystem trong Linux](#1)  
2. [Chức năng của một số thư mục](#2)   

<a name ="1"></a>

#### 1. Cấu trúc filesystem trong Linux  
Trong rất nhiều hệ điều hành, bao gồm cả Linux đều có filesystem giống như cấu trúc của một cây.  
Hệ điều hành Linux coi tất cả đều là các tập tin (file) thậm chí cả thiết bị cũng như ổ đĩa. Nó quản lý tất cả trên một *hệ thống tệp tin* duy nhất, bắt đầu ở gốc là **root** và đây là thư mục ở mức cao nhất. Tất cả các thư mục khác đều là thư mục con của root. Cấu trúc filesystem được mô tả như hình vẽ bên dưới.  
<img src="https://i.imgur.com/Ktiufc4.png">  

Tiêu chuẩn phân cấp của hệ thống tập tin (Filesystem Hierarchy Standard - FHS) phát triển từ các tiêu chuẩn lịch sử từ các tiêu chuẩn đầu tiên của UNIX. FHS cung cấp cho các nhà phát triển và nhà quản trị hệ thống  một cấu trúc thư mục tiêu chuẩn cho hệ thống tệp, cung cấp tính nhất quán giữa các hệ thống và phân phối.  
Một số ví dụ về các loại hệ thống tệp mà Linux hỗ trợ:  
- ext3, ext4, btrfs, xfs (hệ thống tệp tin Linux gốc)  
- vfat, ntfs, hfs (hệ thống tập tin từ các hệ điều hành khác)   

Mỗi hệ thống tập tin nằm trên 1 phân vùng đĩa cứng. Các phân vùng giúp sắp xếp nội dung của các đĩa theo loại dữ liệu và cách sử dụng.   
<a name="2"></a>

#### 2. Chức năng chính của một số thư mục  

**Home Directories**  
Trong bất kì hệ thống UNIX nào, mỗi user sẽ có 1 thư mục riêng, đặt tên là `/home`. Thư mục này thường được gắn dưới dạng một hệ thống tệp riêng biệt trên phân vùng riêng. Nó chứa các thông tin, dữ liệu... của user.  

**Binary Directories**   
Các thư mục trong `/bin` chứa các tập tin nhị phân thực thi, lệnh thiết yếu được sử dụng cho chế độ đơn người dùng và các lệnh cần thiết theo yêu cầu của tất cả người dùng hệ thống, chẳng hạn như `ps`, `pl`, `cp`... Các lệnh không cần thiết cho hệ thống, ở chế độ một người dùng được đặt trong thư mục `/usr/bin` trong khi thư mục `/sbin` được sử dụng cho các lệnh thiết yếu liên quan đến quản trị hệ thống như `ifconfig`, `shutdown`, `lilo`, `init`...  

**Device Directories**  
Thư mục `/dev` chứa các loại tệp giả đại diện cho các thiết bị phần cứng hoặc phần mềm, ngoại trừ các thiết bị mạng. Thư mục này trống trên phân vùng đĩa khi nó không được gắn nhưng nó chứa các mục được tạo bởi hệ thống `udev`. Nó tạo và quản lý một cách linh hoạt trên Linux khi tìm thấy thiết bị.  

**Variable Directories**  
Thư mục `/var` chứa các tập tin có thể thay đổi kích thước và nội dung như các chương trình đang chạy (var là từ viết tắt của Variable - biến).    

**Cofiguration Directories**  
Thư mục `/etc` là ngôi nhà cho các tệp tin cấu hình hệ thống. Ví dụ `/etc/resolv.conf` dùng để cấu hình dns-server, `/etc/network` dùng để quản lý dịch vụ mạng.  
Ở `/etc` có một thư mục quan trọng là `/etc/rc.d`. Nơi đây chứa các scripts dùng để start, stop, kiểm tra status cho các chương trình. 

**Boot Directories**  
Thư mục `/boot` chứa các tệp tin cần thiết để khởi động hệ thống. Đối với mỗi kernel thay thế được cài đặt trên hệ thống, có 4 tệp:   
- `vmlinuz`:là hạt nhân Linux được nén, cần thiết để khởi động.  
- `initramfs`: là hệ thống tập tin Ram ban đầu, cần thiết để khởi động.  
- `config is`:  tập tin cấu hình kernel, chỉ được sử dụng để gỡ lỗi.  
- `system.map`: chứa bảng kí hiệu kernel, chỉ được dùng để gỡ lỗi.  

**Library Directories**
Thư mục `/lib` chứa các file library hỗ trợ các file thực binary trong `/bin ` và `/sbin`. Hầu hết trong số đó là các thư viện tải động (còn gọi là thư viện chia sẻ hoặc đối tượng chia sẻ).
Tên của các file trong library thường là ld* hoặc lib*, so*...  

Tham khảo thêm một số directories khác.

