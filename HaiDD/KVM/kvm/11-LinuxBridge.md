# Công nghệ Linux Bridge

## 1. Linux bridge là gì? 

**Linux Bridge** là một công nghệ cung cấp switch ảo để giải quyết vấn đề ảo hóa Network bên trong các máy vật lí

<img src="..\images\Screenshot_100.png">

Ta có thể thấy có một con switch được tạo ra nằm trong bên máy vật lí. Các VM kết nối đến đây để có thể liên lạc được với nhau. Nếu muốn liên lạc ra bên ngoài ta có thể kết nối con switch này với card mạng trên máy vật lý của ta (giống như ta dùng dây kết nối switch với router). Ta có thể kết nối switch với 1 hoặc nhiều port.

**Chú ý**: Ta không thể kết nối switch ảo với card wireless do HĐH không hỗ trợ.

## 2. Cấu trúc của Linux Bridge

<img src="..\images\Screenshot_101.png">

**Trong đó:**

- `bridge` : ở đây là switch ảo
- `tap` : (tap interface) là giao diện mạng để các VM kết nối với switch do Linux bridge tạo ra(hoạt động ở lớp 2 của mô hình OSI)
- `fd` : (Forward data) có nhiệm vụ chuyển dữ liệu từ VM đến switch. Switch ảo do Linux bridge tạo ra có chức năng tương tự như 1 con switch vật lí.

<img src = "..\images\Screenshot_102.png">

Ta có thể thấy rõ hơn cách kết nối của VM ra ngoài internet. Khi máy vật lý của ta có card mạng kết nối với internet(không phải card wireless). Trên switch ảo của ta sẽ phải có đường để kết nối ra ngoài internet(cụ thể là kết nối với card mạng của máy vật lý). Ta có thể hình dung card mạng trên máy vật lý sẽ được gắn trực tiếp vào switch ảo nên ta có thể thấy sau khi add switch ảo và card vật lý có cùng địa chỉ MAC. Và trên card vật lý sẽ không còn địa chỉ IP mà nó được gắn cho switch ảo.

<img src= "..\images\Screenshot_103.png">

<img src = "..\images\Screenshot_104.png">

Khi các VM muốn giao tiếp với nhau hoặc ra ngoài internet, ta chỉ cần kết nối VM đó với switch ảo. Lúc này card mạng trên VM sẽ được gắn với 1 cổng của switch ảo thông qua tap interface và cổng này có tên là `vnet`. 

Khi ta kết nối vào switch ảo các VM sẽ nhận địa chỉ IP cùng với dải địa chỉ IP của card mà ta add và switch và các địa chỉ IP này sẽ được cấp bởi dịch vụ DHCP trên router.

<img src = "..\images\Screenshot_105.png">

## 3. Tạo và quản lí Linux bridge
Để tạo 1 linux bridge (switch ảo) ta dùng lệnh `brctl addbr tên_switch`

<img src="..\images\Screenshot_106.png">

Add card mạng cho switch, dùng lệnh `brctl addif <tên_switch> <tên_card>`

Và kiểm tra những switch ảo trên máy và những card đã được add vào switch ảo đó, ta dùng lệnh `brctl show`

<img src="..\images\Screenshot_107.png">

