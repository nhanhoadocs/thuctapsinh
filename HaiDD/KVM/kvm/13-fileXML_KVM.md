# Tìm hiểu file XML trong KVM

## 1. Khái niệm về XML
**XML (eXtensible Markup Language)** là một loại file có khả năng lưu trữ nhiều loại dữ liệu khác nhau. Mục đích của XML là đơn giản hóa việc chia sẻ dữ liệu giữa các hệ thống khác nhau, đặc biệt là các hệ thống được kết nối với internet.


### XML trong KVM

Một VM trong KVM có hai thành phần chính đó là:
1. VM's definition được lưu dưới dạng file XML và nằm trong thư mục `/etc/libvirt/qemu` 

    <img src= "..\images\Screenshot_124.png">

2. VM's storage lưu dưới dạng file image. 

    <img src= "..\images\Screenshot_125.png">

File domain XML chứa các thông tin về máy ảo như (số CPU, RAM, các thiết lập của I/O, card mạng,...)

Ngoài file domain XML còn có các file XML khác để lưu thông tin network, storage,...

## 2. Các thành phần trong file domain XML của VM
Ta có thể dùng lệnh `virsh edit tên_file` đẻ chỉnh sửa (chú ý tên file bỏ phần đuôi `.xml`) hoặc ta cũng có thể sử dụng `vi` hoặc `vim` để chỉnh sủa nó.

<img src="..\images\Screenshot_131.png">

Có rất nhiều thành phần trong file xml này. Ở đây, ta sẽ tìm hiểu một số thành phần chính sau:

<img src="..\images\Screenshot_132.png">

- name : tên của VM
- uuid : uuid của VM
- memory : dung lượng RAM của VM
- unit='KiB' : đơn vị đo dung lượng RAM, có thể sử dụng các đơn vị khác
- currentMemory : dung lượng RAM hiện tại
- vcpu : Số cpu ảo được cài đặt
- os : hệ điều hành đang cài đặt trên máy ảo

Phần `devices`, các thông số của các device trên VM

<img src ="..\images\Screenshot_133.png">

- disk : thông tin disk
    - source : nơi lưu VM

Mục `interface` : phần mạng của VM

<img src = "..\images\Screenshot_134.png">

- interface type : kiểu card mạng
- mac : địa chỉ MAC của card
- source : tên card

## 3. File XML network
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
