# Định dạng ổ đĩa ISO, RAW và QCOW2 trong KVM

## I. Các định dạng ổ đĩa trong KVM
Trong KVM Guest có 2 thành phần chính:
1. **VM definition** : được lưu dưới dạng file xml tại `/etc/libvirt/qemu`. File này chứa các thông tin của máy ảo như tên, thông tin về tài nguyên của VM (RAM, CPU)… 

2. **Storage** : được lưu dưới dạng file image tại thư mục `/var/lib/libvirt/images`. 3 định dạng thông dụng nhất của file image sử dụng trong KVM là : `ISO`, `raw`, `qcow2`

### 1. ISO
File ISO là file image của 1 đĩa CD/DVD, nó chứa toàn bộ dữ liệu của đĩa CD/DVD đó. File ISO thường được sử dụng để cài đặt hệ điều hành vủa VM, người dùng có thể import trực tiếp hoặc tải từ trên internet về.

### 2. RAW
- Là định dạng file image phi cấu trúc
- Khi người dùng tạo mới một máy ảo có disk format là raw thì dung lượng của file disk sẽ đúng bằng dung lượng của ổ đĩa máy ảo bạn đã tạo (cơ chế Thick).
- Định dạng raw là hình ảnh theo dạng nhị phân (bit by bit) của ổ đĩa.
- `raw` chính là định dạng mặc định của QEMU.

### 3. QCOW2
- `qcow` (QEMU Copy On Write) là một định dạng tập tin cho đĩa hình ảnh các tập tin được sử dụng bởi QEMU , một tổ chức màn hình máy ảo
- Nó sử dụng một chiến lược tối ưu hóa lưu trữ đĩa để trì hoãn phân bổ dung lượng lưu trữ cho đến khi nó thực sự cần thiết (cơ chế Thin)
- `Qcow2` là một phiên bản cập nhật của định dạng qcow, nhằm để thay thế nó. Khác biệt với bản gốc là qcow2 hỗ trợ nhiều snapshots thông qua một mô hình mới, linh hoạt để lưu trữ ảnh chụp nhanh. Khi khởi tạo máy ảo mới sẽ dựa vào disk này rồi snapshot thành một máy mới.
- `Qcow2` hỗ trợ copy-on-write với những tính năng đặc biệt như snapshot, mã hóa ,nén dữ liệu…
- `Qcow2` hỗ trợ việc tăng bộ nhớ bằng cơ chế Thin Provisioning (Máy ảo dùng bao nhiêu file có dung lượng bấy nhiêu)


## II. So sánh RAW với QCOW2
### 1. Dung lượng
Để kiểm tra dung lượng của 2 định dạng này, ta sẽ dùng lệnh `qemu-img` để tạo ra một file có định dạng **raw** và một file có định dạng **qcow2** cả 2 file nàu đều có dung lượng là 2G. 

File **raw** :
```
qemu-img create -f raw file.raw 2G
```
File **qcow2** : 
```
qemu-img create -f qcow2 file.qcow2 2G
```

<img src = "..\images\Screenshot_33.png">

Ta có thể thấy, khi tạo thì 2 file đều có dung lượng là 2G, nhưng sau đó, kiểm tra thực tế thì ta thấy file có định dạng qcow2 chỉ có dung lượng là 193K, còn file định dạng raw thì vẫn là 2G.

### 2. Performance (hiệu năng)
Để test hiệu năng giữa 2 định dạng này ta sử dụng câu lệnh `dd` để đọc và ghi dữ liệu từ các file trên.

**Đọc dữ liệu** : raw < qcow2
```
dd if=file.raw of=test1 bs=8k count=100000
dd if=file.qcow2 of=test2 bs=8k count=100000
```

<img src = "..\images\Screenshot_34.png">

**Ghi dữ liệu** : raw > qcow2
```
dd if=/dev/zero of=file.raw bs=8k count=100000
dd if=/dev/zero of=file.qcow2 bs=8k count=100000
```

<img src = "..\images\Screenshot_35.png">

### 3. Tạo snapshot
Chỉ có `qcow2` hỗ trợ tạo snapshot

### 4. Chuyển đổi giữa `raw` và `qcow2`
Chuyển từ **qcow2** sang **raw** : 
```
qemu-img convert -f qcow2 -O raw file.qcow2 file.raw
```

<img src= "..\images\Screenshot_36.png">

Chuyển từ **raw** sang **qcow2** : 
```
qemu-img convert -f raw -O qcow2 file.raw file.qcow2
```

<img src="..\images\Screenshot_37.png">

**Chú ý** : chuyển đổi này chỉ thực hiện được khi VM đang được tắt và sau khi chuyển đổi xong ta phải tiến hành sửa lại file xml tương ứng

<img src = "..\images\Screenshot_38.png">