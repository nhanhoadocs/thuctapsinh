# Tìm hiểu file XML trong KVM và Tạo VM bằng file XML

## I. Khái niệm về XML
**XML (eXtensible Markup Language)** là một loại file có khả năng lưu trữ nhiều loại dữ liệu khác nhau. Mục đích của XML là đơn giản hóa việc chia sẻ dữ liệu giữa các hệ thống khác nhau, đặc biệt là các hệ thống được kết nối với internet.


### XML trong KVM

Một VM trong KVM có hai thành phần chính đó là:
1. VM's definition được lưu dưới dạng file XML và nằm trong thư mục `/etc/libvirt/qemu` 

    <img src= "..\images\Screenshot_124.png">

2. VM's storage lưu dưới dạng file image. 

    <img src= "..\images\Screenshot_125.png">

File domain XML chứa các thông tin về máy ảo như (số CPU, RAM, các thiết lập của I/O, card mạng,...)

Ngoài file domain XML còn có các file XML khác để lưu thông tin network, storage,...

## II. Các thành phần trong file domain XML của VM
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

Mục `interface` : phần card mạng của VM

<img src = "..\images\Screenshot_134.png">

- interface type : kiểu card mạng
- mac : địa chỉ MAC của card
- source : tên card

## III. Tạo 1 VM bằng file domain XML
### 1. Chuẩn bị file XML
Chuẩn bị 1 file XML, lưu tại thư mục `/etc/libvirt/qemu/`
```xml
<domain type='kvm'>
  <name>vm3</name>
  <uuid>ad7c6d6e-4d34-11ea-b322-000c29502f16</uuid>
  <memory unit='KiB'>524288</memory>
  <currentMemory unit='KiB'>524288</currentMemory>
  <vcpu>1</vcpu>
  <os>
    <type arch='x86_64' machine='pc-i440fx-rhel7.0.0'>hvm</type>
    <boot dev='cdrom'/>
  </os>
  <features>
    <acpi/>
  </features>
  <clock offset='utc'/>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <devices>
    <emulator>/usr/libexec/qemu-kvm</emulator>
    <disk type="file" device="disk">
      <driver name="qemu" type="qcow2"/>
      <source file="/var/lib/libvirt/images/vm3.qcow2"/>
      <target dev="vda" bus="virtio"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x0"/>
    </disk>
    <disk type="file" device="cdrom">
      <driver name="qemu" type="raw"/>
      <source file="/var/lib/libvirt/file-iso/CentOS-7-x86_64-Minimal-1908.iso"/>
      <target dev="hdc" bus="ide"/>
      <readonly/>
      <address type="drive" controller="0" bus="1" target="0" unit="0"/>
    </disk>
    <interface type='bridge'>
      <source bridge='testbr'/>
    </interface>
    <controller type="ide" index="0">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x1"/>
    </controller>
    <input type='mouse' bus='ps2'/>
    <graphics type='vnc' port='-1' autoport="yes" listen='0.0.0.0'/>
    <console type='pty'>
      <target port='0'/>
    </console>
  </devices>
</domain>
```

File domain xml này sẽ tạo ra máy ảo với những thông số sau:
- 512MB RAM, 1 vCPU
- Đường dẫn tới ổ đĩa : `/var/lib/libvirt/images/vm3.qcow2`
- Máy ảo được boot từ CD-ROM : `/var/lib/libvirt/file-iso/CentOS-7-x86_64-Minimal-1908.iso`
- Sử dụng Linux bridge `testbr`

Mã uuid, ta có thể download package `uuid` rồi sử dụng lệnh `uuid` để sinh ra 1 mã uuid

<img src ="..\images\Screenshot_137.png">

Ngoài ra, ta có thể tạo 1 file xml bằng việc dump từ một máy ảo đang chạy bằng câu lệnh
```
virsh dumpxml vm1 > vm2.xml
```

### 2. Tạo ổ đĩa
Dùng câu lệnh 
```
qemu-img create -f qcow2 /var/lib/libvirt/images/vm3.qcow2 10G
```

để tạo ổ đĩa dung lượng 10G với định dang qcow2

<img src= "..\images\Screenshot_138.png">

### 3. Khởi tạo máy ảo
Dùng câu lệnh `virsh create <ten_file_domain>.xml` để khởi tạo máy ảo:

<img src="..\images\Screenshot_139.png">

Kiểm tra xem máy ảo đã được tạo hay chưa bằng câu lệnh `virsh list`

<img src="..\images\Screenshot_140.png">

Sử dụng virt-manager để quản lí VM

<img src="..\images\Screenshot_141.png">

## IV. Chỉnh sửa cấu hình máy ảo bằng file XML
Trước khi tiến hành chỉnh sửa cấu hình file XML thì sẽ tắt VM trước

Ta dùng lệnh `virsh edit <tên_vm>` hoặc có thể sử dụng `vi`, `vim` để edit file `.xml` của VM.

<img src= "..\images\Screenshot_150.png">

Ở đây, ta sẽ thay đổi dung lượng RAM của **vm4** thành 600000 Kib. Sau đó define lại **vm4**

<img src="..\images\Screenshot_151.png">

Sau đó, start vm4 trở lại và kiểm tra lại dung lượng RAM

<img src="..\images\Screenshot_153.png">

Kiểm tra trên virt-manager

<img src="..\images\Screenshot_152.png">

