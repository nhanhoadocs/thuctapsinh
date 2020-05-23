# Các option khi tạo một VM (CPU, Disk, NIC)


## 1. Options của CPU
Ta có thể tùy chỉnh dung lượng của RAM và số CPU ảo cho VM

**Virt-manager**

<img src = "..\images\Screenshot_59.png">

**WebVirtCloud**

<img src = "..\images\Screenshot_60.png">


## 2. Options của Disk
Khi tạo một VM đến mục tùy chọn option cho Disk, ta có 2 lựa chọn sau:
- Tạo 1 Disk image để lưu máy ảo

<img src= "..\images\Screenshot_61.png">

- Tạo hoặc chọn 1 Storage đã tạo trước để cài đặt máy ảo (thường sử dụng trên WebVirtCloud)

<img src= "..\images\Screenshot_62.png">


## 3. Options của NIC
Tùy vào mục đích tạo VM để chọn kiểu card mạng cho thích hợp. Có thể để kết nối ra ngoài mạng internet hoặc để dạng NAT

<img src= "..\images\Screenshot_63.png">

Hoặc chọn Vlan có sẵn:

<img src= "..\images\Screenshot_64.png">

Phần tùy chọn NIC có thể tham khảo thêm tại bài [Network_mode](.\3-network_mode.md)