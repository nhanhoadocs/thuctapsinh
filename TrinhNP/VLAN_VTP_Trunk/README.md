## CẤU HÌNH VLAN TRÊN PACKET TRACER

### Thực hiện theo sơ đồ sau :

![Imgur](https://i.imgur.com/8sRhH1v.png)

**Đặt địa chỉ ip theo sơ đồ trên :**
  
  Vào phần IP Configuration:
  ![Imgur](https://i.imgur.com/JhIX32a.png)
 
  Điền địa chỉ IP theo sơ đồ :
  ![Imgur](https://i.imgur.com/OL90JVe.png)
  
 Làm tương tự với các PC còn lại ở trong sơ đồ mạng.
 
 **Tạo VLAN**
 
 Tạo VLAN 10 và VLAN 20 
 
 
 Vào CLI của Switch1 sử dụng lệnh để tạo và cấu hình VLAN: 
 ![Imgur](https://i.imgur.com/BVFFOZz.png)
 
 Làm tương tự trên Switch2

 **Gán cổng trên switch cho Vlan**
 
 
 ![Imgur](https://i.imgur.com/BeZE626.png)
 
 
 Làm tương tự để gán các cổng vào VLAN tương ứng.
 
 
 ### THIẾT LẬP VTP (VLAN TRUNKING PROTOCOL)
 - Trên Swich1:
 Đặt địa chỉ cho VLAN10 là 192.168.10.1
 Đặt địa chỉ cho VLAN20 là 192.168.10.2
 - Trên Switch2: 
  Đặt địa chỉ cho VLAN10 là 192.168.20.1
   Đặt địa chỉ cho VLAN10 là 192.168.20.2
  Thực hiện cấu hình địa chỉ ip cho VLAN10 trên Switch1:
  
  
 ![Imgur](https://i.imgur.com/l5VKyGf.png)
 
 
 Làm tương tự trên các VLAN của các Switch khác.
 
 ### THIẾT LẬP VTP SERVER VÀ VTP CLIENT
 
 Cấu hình như bên dưới:
 
 ![Imgur](https://i.imgur.com/8xNc5n6.png)
 
 Thực hiện tương tự ở trên Switch2
 
 ### TẠO ĐƯỜNG TRUNK TỪ SWITCH1 TỚI SWITCH2 
 
 ![Imgur](https://i.imgur.com/n4gGYTj.png)
 
 Làm tương tự trên switch2.
 
 **Sử dụng lệnh "show vlan" để xem lại thông tin đã cấu hình
 
 
 ![Imgur](https://i.imgur.com/r3uh867.png)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
