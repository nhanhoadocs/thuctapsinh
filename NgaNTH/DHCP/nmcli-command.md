### Tìm hiểu về lệnh nmcli trong Linux  
`nmcli` là một công cụ dòng lệnh để quản lý NetworkManager. Lệnh `nmcli` cũng có thể được sử dụng để hiển thị trạng thái thiết bị mạng, tạo, chỉnh sửa, kích hoạt/hủy kích hoạt và xóa kết nối mạng.  
*Ứng dụng tiêu biểu*:  
- **Scripts**: Thay vì quản lý tay các kết nối mạng thì ta có thể sử dụng lệnh `nmcli` để quản lý NetworkManager.  
- **Server, headless machine anh terminals**: Có thể sử dụng để quản lý NetworkManager mà không cần giao diện người dùng đồ họa (no GUI) và quản lý kết nối hệ thống rộng.  

**Cú pháp**:  
```
# nmcli [OPTIONS] OBJECT {COMMAND | help}
```  
Ở đây, OBJECT có thể là:   
- **nm**: NetworkManager's status.  
- **conection/cn**: NetworkManager connection.  
- **d[evice]**: Các thiết bị được quản lý bởi NetworkManager.  

**1. Dùng lệnh nmcli để cài đặt địa chỉ IP**  

Khi sử dụng lệnh `nmcli` (network manager command line interface) thì bản chất là cách dùng dòng lệnh để tạo ra file config cho các interface giống như các phiên bản CentOS trước kia. Điều này khá tiện lợi cho bạn khi thao tác thông qua CLI hoặc đưa và các bash shell sau này nếu có nhu cầu.
Thông thường khi cài đặt CentOS 7 thì máy sẽ có IP động. Để kiểm tra file config ta gõ lệnh `cat /etc/sysconfig/network-scripts/ifcfg-ens33` và xem kết quả:

<img src="https://i.imgur.com/HcQk44k.png">  

Ở trên ta thấy ens33 nhận địa chỉ IP động, ta tiến hành đặt lại IP tĩnh với các thông số sau: (Lưu ý: Đặt IP tĩnh không nên trùng trong range của DHCP cấp)
- IP address là 192.168.152.10
- GATEWAY=192.168.152.1
- PREFIX=24 (Subnet mask= 255.255.255.0)
- DNS=8.8.8.8
Ta gõ các tập lệnh như bên dưới:  

<img src="https://i.imgur.com/yRPxSlW.png">  

Sau khi cài đặt xong ta xem lại nội dung file `/etc/sysconfig/network-script/ifcfg-ens33`:  

<img src="https://i.imgur.com/AEPiIpC.png">  

Kết quả là ta đã có địa chỉ IP tĩnh cho NIC ens33 để có thể nhận IP mới. Lưu ý lúc này sẽ mất kết nối và cần đăng nhập lại với IP tĩnh vừa đặt ở trên. 

**Add thêm một card mạng**  
Ta sẽ thêm 1 NIC (Network Interface Card) vào máy bằng cách mở Vitual Machine Setting và add thêm 1 Card mạng.  
<img src="https://i.imgur.com/3tzbzXR.png">

Tiếp theo ta sẽ kiểm tra xem tên NIC mới gắn vào là gì bằng cách sử dụng câu lệnh `nmcli dev status`.

<img src="https://i.imgur.com/mjESbz0.png">  

Ta sẽ đổi lại cụm `Wired connection 1` thành ens37 để `nmcli` làm việc thuận tiện hơn. Sử dụng lệnh `nmcli c modify "Wired connection 1" connection.id ens37` và kiểm tra kết quả: 

<img src="https://i.imgur.com/xcmGMJt.png"> 

Ta sẽ đặt IP cho ens37 ở range 192.168.152.0/24 và không dùng gateway, bởi vì ens33 đã có gateway để ra internet rồi, các tham số sẽ như sau.

- IP add: 192.168.152.11
- Subnet Mask: 255.255.255.0 (/24)  

Sau đó thực hiện lệnh `ifdown` và `ifup` để ens37 nhận được IP vừa thiết lập. Xem lại thông tin cấu hình trong file ens37 bằng lệnh `cat`.  
<img src="https://i.imgur.com/mHH6KpJ.png"> 

Tài liệu tham khảo:  
https://news.cloud365.vn/centos-8-huong-dan-dat-ip-trong-centos-8-bang-nmcli/

