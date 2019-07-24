
<a name ="Cấu hình hệ thống">

# Cấu hình hệ thống
- [1. Các thông tin cần cấu hình](#a)
- [2. Công cụ để cáu hình tạm thời ](#b)
- [3. Các tệp cấu hình](#c)
- [4. công cụ để cấu hình bền vững](#d)
- [4. Công cụ để kiểm tra cấu hình](#e)

<a name="a"></a>
1. Các thông tin cần cấu hình

- Cấu hình kết nối mạng
    - NIC
    - Địa chỉ IP/Netmask
    - Gateway
- Cấu hình tên miền
- NIS,DNS,host
 
## Kiểm tra cấu hình mạng

|Thao Tác|Y nghĩ|
|---|--|
|ping host-ip|Cấu hình NIC OK?|
|ping GW|Cấu hình mạng cục bộ OK|
|ping live public IP|Cấu hình mạng OK|
|ping live domain name|Cấu hình DNS OK|
|telnet|Kiểm tra dịch vụ máy từ xa|

|Thao Tác|Thông tin|
|---|--|
|teaceroute|Kiểm tra đường đi của gói tin|
|ifconfig|Cấu hình mạng của các NIC|
|route|Bảng chon đường đi|
|cat /etc/réolve.conf|DNS đã được cấu hình|
|hostname|Tên máy|

## Cấu hình bằng lệnh
|Thao Tác|câu lệnh|
|---|--|
|Dặt địa chỉ IP|ifconfig NIC-name IP netmask MASK|
|Kích hoạt thay đổi|Tức thì|
|Đặt GW|route add default GW IP|
|Kích hoạt thay đổi|Tức thì|
|Khởi động lại dịch vụ mạn|vụ mạng
/etc/init.d/network restart|
|Tắt dịch vụ mạng|/etc/init.d/network stop
|Tắt NIC|ifconfig eth0 down|
|Bật NIC|ifconfig eth0 up|
|Đặt tên cho máy|hostname|

## Các tệp cấu hình

|Tên têp|Y nghĩ|
|---|--|
|/etc/init.d/network|Bật/tắt/khởi động lại dịch vụ mạng|
|/etc/sysconfig/network|Cấu hình chung về mạng|
|/etc/sysconfig/network-script|Cấu hình của các NIC|
|/etc/resolve.conf|Cấu hình DNS|
|/etc/nsswitch|Thứ tự dịch vụ tên|
