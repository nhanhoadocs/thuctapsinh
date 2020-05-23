# Tạo và quản lí máy ảo bằng Virt-manager


## 1. Kiểm tra máy có hỗ trợ ảo hóa hay không
```
# egrep -c "svm|vmx" /proc/cpuinfo
2
```

Nếu kết quả trả về khác 0 thì máy có hỗ trợ ảo hóa, còn bằng 0 tức là không hỗ trợ. 


## 2. Cài đặt các gói cần thiết :
```
# yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager
```


## 3. Truy cập Virt-manager để cấu hình VM
```
# virt-manager
```

<img src ="..\images\Screenshot_3.png">

- Tạo 1 máy ảo: `File -> New Virtual Machine`

<img src = "..\images\Screenshot_4.png">

- Chọn `Local install media (ISO image or CDROM)`

<img src = "..\images\Screenshot_5.png">

- Chọn đường dẫn file ISO ta đã tải ở trên

<img src = "..\images\Screenshot_6.png">

- Sau đó, ta cài đặt các thông số cho máy ảo.

**Lưu ý:** Phần Network selection ta sẽ gắn card mạng

<img src ="..\images\Screenshot_7.png">
<img src ="..\images\Screenshot_8.png">
<img src ="..\images\Screenshot_9.png">

- Kiểm tra và thiết lập lại các thông số của máy ảo và click chọn `Begin Installation`

<img src ="..\images\Screenshot_10.png">

- Cài đặt CentOS-7 như bình thường.

<img src ="..\images\Screenshot_11.png">


## 4. Một số thao tác
### Quản lí các máy ảo đã tạo tại giao diện `virt-manager`

<img src ="..\images\Screenshot_52.png">

### Snapshot
Để tạo Snapshot cho VM, ta làm theo các bước sau

Chọn vào mục Manager VM Snapshot:

<img src ="..\images\Screenshot_53.png">

Click chọn thêm Snapshot

<img src ="..\images\Screenshot_54.png">

Điền tên cho Snapshot

<img src ="..\images\Screenshot_55.png">

Sau đó, ta sẽ thấy Snapshot được tạo:

<img src ="..\images\Screenshot_56.png">

### Xem thông tin phần cứng
Ta click biểu tượng như trong hình

<img src = "..\images\Screenshot_57.png">

Ở đây, ta có thể xem các thông số phần cứng của máy ảo

<img src=  "..\images\Screenshot_58.png">