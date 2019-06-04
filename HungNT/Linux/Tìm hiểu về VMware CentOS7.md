# VMWARE NETWORK :
- **Bridge**: 
	- Ở chế độ này, card mạng trên máy ảo được gắn vào VMnet0, VMnet0 này liên kết trực tiếp với card mạng vật lý trên máy thật, máy ảo lúc này sẽ kết nối internet thông qua  card mạng vật lý và có chung lớp mạng với card mạng vật lý.  
	- Thông thường không hay dùng bridge vì IP lấy cùng với dải IP của card máy chủ . Nhưng khi chuyển địa điểm ( ví dụ từ nhà đến trường ) thì dải IP sẽ khác nhau , nếu đặt IP tĩnh sẽ gây nên xung đột .  
	- Dùng Bridge khi máy cần thao tác với các thiết bị có chung dải mạng LAN (máy in , ....)  
    <img src="https://i.imgur.com/5vNR5BI.jpg">
- **Host-only**: 
	* Máy ảo được kết nối với VMnet có tính năng Host-only, trong trường hợp này là VMnet1 . VNnet Host-only kết nối với  một card mạng ảo tương ứng ngoài máy thật (như đã nói ở phần trên). Ở chế độ này,  các máy ảo không có kết nối vào mạng vật lý bên ngoài hay internet thông qua máy thật , có nghĩa là mạng VMnet Host-only và mạng vật lý hoàn toàn tách biệt. Tạo dải IP private riêng cho máy ảo .
<img src ="https://i.imgur.com/ZxjpVEX.jpg">
- **NAT**:
	* Ở chế độ này, card mạng của máy ảo kết nối với VMnet8, VNnet8 cho phép máy ảo đi ra mạng vật lý bên ngoài internet thông qua cơ chế NAT (NAT device). Lúc này lớp mạng bên trong máy ảo khác hoàn toàn với lớp mạng của card vật lý bên ngoài, hai mạng hoàn toàn tách biệt. IP của card mạng máy ảo sẽ được cấp bởi DHCP của VMnet8, trong trường hợp bạn muốn thiết lập IP tĩnh cho card mạng máy ảo bạn phải đảm bảo chung lớp mạng với VNnet8 thì máy ảo mới có thể đi internet.  
    <img src = "https://i.imgur.com/aK6m4T0.jpg">  

## Cấu hình IP cho các chế độ mạng của Vmware :  

+ **Bridge** : Dùng card của PC , chung dải IP với PC .  

+ **Nat** :
Chỉnh sửa địa chỉ dải IP và subnet của dải mạng đó .  
<img src="https://i.imgur.com/TlqGj1b.png">  
Cấu hình DHCP  
<img src="https://i.imgur.com/cfOaDq4.png">  

+Host-Only :  
-Cấu hình mạng cho các máy ảo :   

CentOS7 :  
-Với chế độ Bridge :   
+IP có chung dải IP của PC host :   
	* IP của CentOS7  
 <img src="https://i.imgur.com/b27jFKz.png">

IP của PC :  
<img src="https://i.imgur.com/6QqHWlB.png">  
Từ máy ảo có thể ping ra ngoài mạng :

 <img src="https://i.imgur.com/KM7CccN.png">  
 
	* Từ PC có thể ping vào máy ảo :  
  <img src ="https://i.imgur.com/sNTCSbV.png ">    
  -Với chế độ NAT :   
+IP máy ảo được nat ra bằng IP khác 
<img src="https://i.imgur.com/4nzdBB7.png">   

Từ máy ảo có thể ping ra ngoài internet và PC host và PC có thể ping vào máy ảo :  
<img src="https://i.imgur.com/1WwBCEk.png">  

<img src="https://i.imgur.com/iQJh8Eq.png">  
-Với chế độ host-only :   
PC có thể ping vào máy ảo nhưng máy ảo k thể ping ra ngoài hoặc PC host 




 



