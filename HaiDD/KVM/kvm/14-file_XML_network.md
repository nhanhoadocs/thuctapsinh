# File XML network



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

## II. 