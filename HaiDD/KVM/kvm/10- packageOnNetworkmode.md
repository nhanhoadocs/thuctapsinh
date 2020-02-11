# Phân tích đường đi các gói tin với các chế độ card mạng trong KVM

## I. Bridge


## II. Host-only
Với mô hình mạng Host-Only thì  các VM chỉ có thể giao tiếp với nhau qua 1 switch ảo, và không thể ra ngoài in internet

Mô hình

<img src = "..\images\Screenshot_98.png">

Ping ra ngoài internet và ping máy trong cùng mạng Host-only

<img src = "..\images\Screenshot_99.png">

## III. NAT
**Mô hình**

<img src ="..\images\Screenshot_96.png">

Với mô hình mạng NAT, KVM tạo ra một thiết bị là virtual router. Khi ta tạo một dải mạng với mô hình NAT thì lúc này virtual router sẽ NAT từ dải mạng mà ta tạo ra ra địa chỉ của card mạng vật lý trên KVM host để đi ra ngoài internet.

Khi một dải mạng tạo ra ta sẽ thấy trên KVM host xuất hiện một thêm một card mạng. Card mạng này đóng vai trò là gateway cho dải mạng mà ta tạo ra.


Ping `8.8.8.8` để xem gói tin đi qua những điểm nào

**Sơ đồ quá trình gói tin đi:**

<img src ="..\images\Screenshot_97.png">

Thành phần cấp DHCP cho máy ảo trong chế độ NAT này: là Virtual Router, ở đây là `virbr1` cấp IP cho VM. Tham khảo tại [đây](https://blog.cloud365.vn/ccna/dhcp_KVM/).

<img src = "..\images\Screenshot_117.png">


Tham khảo thêm về NAT ở [bài viết](https://blog.cloud365.vn/linux/mo-hinh-mang-nat-kvm/).