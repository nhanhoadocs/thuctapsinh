# File XML network và Tạo Virtual-network bằng file XML

## I. File XML network
Thư mục chứa file XML network. Các file ở đây là mạng ảo trong KVM
```
/etc/libvirt/qemu/networks
```

<img src="..\images\Screenshot_135.png">

Ta sẽ xem file `NAT.xml`

<img src="..\images\Screenshot_136.png">

- name : tên mạng
- forward mode : kiểu mạng
- bridge : card sử dụng
- mac : địa chỉ MAC
- domain : tên domain của mạng
- ip : thông số IP của mạng
    - dhcp : thông tin dhcp của mạng
        - range : dải cấp dhcp cho các VM

## II. Tạo virtual network bằng file XML
### 1. Chuẩn bị file XML
Ở đây, ta sẽ tạo 1 mạng ảo Host-only. Ta tạo file xml `isolated.xml` trong thư mục `/etc/libvirt/qemu/networks/`

```xml
<network>
<name>isolated</name>
</network>
```

### 2. Tiến hành tạo mạng bằng file xml
Tiến hành define network từ file xml bằng câu lệnh `virsh net-define isolated.xml`

<img src="..\images\Screenshot_142.png">

Sau khi đã define, bạn có thể sử dụng câu lệnh `virsh net-list --all` để xem network available:

<img src="..\images\Screenshot_143.png">

Mạng `isolated` đã xuất hiện, tuy nhiên nó vẫn chưa được active.

Sau khi define, libvirt sẽ tự động add thêm một số thành phần vào file xml bạn vừa tạo và lưu nó tại `/etc/libvirt/qemu/networks/`

**File `isolated.xml`**

<img src="..\images\Screenshot_144.png">

Bạn có thể chỉnh sửa file xml bằng lệnh `virsh net-edit isolated`

**File `isolated.xml` sau khi chỉnh sửa**

<img src="..\images\Screenshot_145.png">

Bên cạnh đó, bạn cũng có thể dùng lệnh `virsh net-dumpxml <net_name>` để xem chi tiết cấu hình trong các file network xml của Linux Bridge.

<img src="..\images\Screenshot_146.png">

Sau khi cấu hình xong, ta tiến hành start virtual network vừa tạo bằng câu lệnh `virsh net-start isolated`

<img src="..\images\Screenshot_147.png">

Như vậy, isolated đã được start và có thể sử dụng. Dùng virt-manager để xem:

<img src="..\images\Screenshot_148.png">

### 3. Chỉnh sửa cấu hình mạng
Trong trường hợp người dùng muốn thay đổi cấu hình:
- tiến hành chỉnh sửa trong file xml
- dùng lệnh `virsh net-destroy` và `virsh net-start` để reset lại virtual network.