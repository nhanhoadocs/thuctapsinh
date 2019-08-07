# CÁC INTERFACES CỦA CENTOS :   

- en: cáp ethernet nối trực tiếp   
 wl: Kết nối wifi  
 lo: Địa chỉ loopback  
- Thường các interface được đặt theo qui tắc sau :   
	1. Tên đặt theo  số được Firmware/BIOS cung cấp ở cổng onboard (VD: eno1)  
	2. Tên đặt theo số được  Firmware/BIOS cung cấp ở cổng  PCI Express hotplug  (BF: ens1)  
	3. Tên đặt theo địa chỉ cổng vật lí của phần cứng (BF: enp2s0)
	4. Tên theo MAC (BF: enx78e7d1ea46da)  
	5. Tên theo kiểu cũ , thường dùng nếu tất cả các qui tắc trên không dùng được (VD: eth0)  


# CHUYỂN ĐỔI TÊN CỦA INTERFACE:  

- Chỉnh file trong đường dẫn sau  /etc/default/grub file bằng việc thêm *net.ifnames=0* *biosdevname=0* ở cuối dòng  GRUB_CMDLINE_LINUX .  

	- Thử cấu hình bằng lệnh grub ở dưới :  
      `grub2-mkconfig`  
    
    - Nếu không có lỗi chúng ta áp dụng các chỉnh sửa bằng lệnh :  
     ` grub2-mkconfig -o /boot/grub2/grub.cfg  `

   - Sau đó đổi tên file ở cd /etc/sysconfig/network-scripts:  
 ` mv ifcfg-ens33 ifcfg-eth0  `
	- Mở file  **ifcfg-eth0** và chuyển tên của DEVICE và NAME thành eth0:  

	- Reboot hoặc restart lại network và kiểm tra tên interface:  
      `  service network restart`



	

# THAY ĐỔI IP TĨNH :

* Vào thư mục có đường dẫn sau :  
` /etc/sysconfig/network-scripts/`
<img src="https://i.imgur.com/KrbrDEY.png">  

Chỉnh sửa file cấu hình , ở đây là ifcfg-ens33:  
<img src="https://i.imgur.com/SlRMcOa.png">  

TYPE=Ethernet  
BOOTPROTO=static  
DEFROUTE=yes  
IPV4_FAILURE_FATAL=no  
IPV6INIT=yes  
IPV6_AUTOCONF=yes  
IPV6_DEFROUTE=yes  
IPV6_PEERDNS=yes  
IPV6_PEERROUTES=yes  
IPV6_FAILURE_FATAL=no  
NAME=ens33  
UUID=73e1617d-a727-4c0b-80c5-a4b0fe99491  
ONBOOT=yes  
IPADDR=192.168.30.55 // Địa chỉ IP  
PREFIX=24// Prefix  
GATEWAY=192.168.30.2 // Địa chỉ Gateway  

Lưu ý  : Thứ tự câu lệnh không quan trọng  
DEVICE : Tên card mạng   
NAME : Giống Device   
ONBOOT : Để yes để khi reboot hệ thống network có thể bật lên với cấu hình card mạng tương ứng .  
BOOTPROTO : Cấu hình IP tĩnh hay DHCP  

	* Lưu file và restart lại network service : systemctl restart network
	* Sau đó kiểm tra lại ip của máy :  

<img src="https://i.imgur.com/U3i57Ec.png">  

Ta thấy ip của ens33 đã thành 192.168.30.55 như đã đặt trong file cấu hình .


**Chú ý**  
LINUX chỉ nhận 1 gateway , nên nếu máy ảo có 1 card NAT để kết nối internet và các card khác như host only để cấu hình nội bộ thì chỉ để hiển thị gatewat của interface nat ,các interface khác bỏ gatewat đi 
 