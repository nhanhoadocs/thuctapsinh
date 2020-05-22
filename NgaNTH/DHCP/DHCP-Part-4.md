### Cấp phát IP DHCP cho các máy khác nhau  
Mục lục  
1. [Cấp phát IP động cho máy Ubuntu](#1)  
2. [Cấp phát IP động cho máy CentOS 6](#2)  

Chuẩn bị  
Trên VMWare Workstation dựng một máy chủ CentOS7 và 2 máy khách là Ubuntu 18.4 và CentOS 6. Ta sẽ tiến hành cấp phát IP động cho 2 máy khách từ máy chủ.  

<a name="1"></a>
1. Cấp phát IP động cho máy Ubuntu 

Sau khi cài Ubuntu xong tôi sẽ dùng lệnh `ifconfig -a` để kiểm tra xem máy đã có những card mạng nào rồi.    

<img src="https://i.imgur.com/BjGrthI.png">

Do trong quá trình cài đặt Ubuntu tôi đã chọn 1 card mạng ở chế độ NAT dhcp nên sau khi cài đặt xong hệ thống sẽ tự động nhận IP ở card `ens33` là `192.168.152.130`.  
Bây giờ tôi sẽ thêm 1 card mạng nữa, để chế độ host-only và kiểm tra lại bằng lệnh `ifconfig -a`  

<img src="https://i.imgur.com/UprbHAt.png">  

Như vậy hệ thống đã được gắn thêm một card `ens38`. 
Để cấu hình cho card `ens38` ta sẽ chỉnh sửa tệp `interfaces` bằng lệnh `vi /etc/network/interfaces`. Ta để card này ở chế độ `dhcp` và gắn card này với `VMnet2` trên VMWare Workstation.  
Sau đó dùng lệnh `sudo vi /etc/network/interfaces` để chỉnh sửa file cấu hình. Ta thêm 2 dòng sau vào file
```
auto ens38
iface ens38 inet dhcp
```
<img src="https://i.imgur.com/V5NjRWX.png"> 

Nhìn vào nội dung file cấu hình, ta lưu ý hệ thống có thông báo cần phải vào `etc/netplan` để cấu hình `ifupdown`.   
Tôi sẽ khai báo thêm card `ens38` và để chế độ cấp phát IPv4 động:  
<img src="https://i.imgur.com/PJ6tQUE.png"> 

Lưu file cấu hình và gõ lệnh `sudo netplan apply`.  
Kiểm tra lại card mạng `ens38` xem đã được cấp phát IP chưa bằng lệnh `ip a`  

<img src="https://i.imgur.com/MqoqtkJ.png">  

Vậy ta đã cấp phát địa chỉ IP cho máy Ubuntu từ máy chủ CentOS7.  

<a name="2"></a>
2. Cấp phát IP động cho máy CentOS 6  

Tương tự như trên, tôi tạo 2 card mạng cho máy CentOS6, 1 card NAT và một card Host-only sau đó cấu hình card `eth1` để nhận địa chỉ IP động.
Ta gõ lệnh `ip a` để kiểm tra:  
  
<img src="https://i.imgur.com/KJKEXle.png">  

Card `eth1` chưa có địa chỉ IP. Ta sẽ restart lại network thông qua lệnh `/etc/init.d/network restart` sau đó kiểm tra kết quả:  
<img src="https://i.imgur.com/2X2NRUC.png">  

Lưu ý: Trên CentOS 6 khi thêm một card mạng khác vào máy thì ta phải tạo thủ công file cấu hình. Trong file cấu hình thì ta có thể không ghi địa chỉ MAC và UUID nhưng bắt buộc phải có các dòng:  
```
DEVICE=tên_thiết_bị
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=dhcp #hoặc static nếu đặt IP tĩnh
```  

