# Thay đổi IP cho VM

## Check IP hiện tại của VM :

**Trên SolusVM:**

<img src="..\images\Screenshot_38.png">

**Trên VM :**

<img src="..\images\Screenshot_39.png">

IP Hiện tại của VM là `192.168.200.130/24`


## Thay đổi IP của VM trên SolusVM
- Chọn biểu tượng **Manager Virtual Machine** của máy ảo cần đổi IP để vào giao diện quản lí VM

    <img src="..\images\Screenshot_40.png">

- Trong giao diện quản lí VM, ta chọn **IP's** hoặc **IP Address** như hình:

    <img src="..\images\Screenshot_41.png">

- Tại phần này, ta chọn các IP muốn thêm và click Add

    <img src ="..\images\Screenshot_42.png">

    Sau khi add thành công, ta thấy như hình

    <img src="..\images\Screenshot_43.png">

- Sau đó, ta chọn mục **Main IP** để đổi sang 1 IP vừa thêm ở trên.

    <img src="..\images\Screenshot_44.png">

- Tại đây, ta chọn IP trong danh sách các IP mà VM được sử dụng. Rồi click **Change**. Ở đây, ta đổi thành địa chỉ `192.168.200.128/24`

    <img src="..\images\Screenshot_45.png">

- Tiến hành reboot VM trên SolusVM. Sau đó, kiểm tra lại IP của VM

    **Trên SolusVM**
    <img src= "..\images\Screenshot_46.png">

    **Trên VM**
    <img src="..\images\Screenshot_47.png">


**Lưu ý:** 
Reboot trên SolusVM mới có hiệu lực thay đổi IP cho VM, còn reboot VM trên host KVM thì IP của VM sẽ không thay đổi.

## Nơi cấp DHCP cho VM
Ta kiểm tra trên host KVM, ta thấy interface `kvm101`.0 với MAC `fe:16:3c:df:2a:4e`

<img src="..\images\Screenshot_48.png">

Ta xem file cấu hình dhcp trong host KVM : `/etc/dhcp/dhcpd.conf`

<img src="..\images\Screenshot_49.png">

Vậy ta có thế thấy, nơi cấp dhcp cho VM là interface `kvm101.0`