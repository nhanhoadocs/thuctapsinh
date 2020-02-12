# Live migrate trên KVM

## I. Tổng quan
Trong quá trình vận hành để phục vụ cho việc bảo trì và nâng cấp hệ thống chúng ta cần chuyển các VM từ host này sang host khác. Với các VM đang chạy các ứng dụng quan trọng chúng ta không thể tắt nó đi trong quá trình chuyển. Trên KVM việc **live migrate** sẽ đảm bảo được các yêu cầu này


## II. Chuẩn bị
Chuẩn bị ba máy cài đặt hệ điều hành CentOS 7 trong đó một máy dùng để cài đặt NFS dùng làm máy lưu file disk của VM và 2 máy cài đặt KVM.

**Cấu hình**

- NFS server
    - 1 CPU
    - 1G RAM
    - 20G disk
- Host KVM
    - 2 CPU
    - 1.5G RAM
    - 20G disk

Ba máy này cần có card mạng và có thể kết nối được với nhau

Đây là môi trường lap nên tôi tắt firewalld và selinux trên cả 3 máy. Để tắt sử dụng 3 câu lệnh sau trên cả ba máy:
```
systemctl stop firewalld 

setenforce 0
```

**Mô hình**

<img src= "..\images\Screenshot_154.png">

### Cơ chế cơ bản của live-migrate: 
Về cơ bản cơ chế di chuyển vm khi vm vẫn đang hoạt động. Quá trình trao đổi diễn ra nhanh các phiên làm việc kết nối hầu như không cảm nhận được sự gián đoạn nào. Quá trình Live Migrate được diễn ra như sau:

- Bước đầu tiên của quá trình Live Migrate: 1 ảnh chụp ban đầu của VM cần chuyển trên host KVM162 được chuyển sang VM trên host KVM163.

- Trong trường hợp người dùng đang truy cập VM tại host KVM162 thì những sự thay đổi và hoạt động trên host KVM162 vẫn diễn ra bình thường, tuy nhiên những thay đổi này sẽ không được ghi nhận.

- Những thay đổi của VM trên host KVM162 được đồng bộ liên tục đến host KVM163.

- Khi đã đồng bộ xong thì VM trên host KVM162 sẽ offline và các phiên truy cập trên host KVM162 được chuyển sang host KVM163.

## III. Cài đặt
### 1. Cấu hình phân dải tên miền
Để có thể live migrate giữa 2 KVM host thì 2 máy này cần biết tên miền của nhau. Bạn có thể cấu hình dịch vụ DNS phân dải tên miền cho các 2 máy này.

Đây là mô hình lap có ít máy nên tôi sẽ cấu hình luôn trong file `/etc/hosts`

#### **Trên KVM162** 
- Sửa tên máy trong file `/etc/hostname`. Máy này tôi để tên là `kvm162`
    ```
    kvm162
    ```
- Chỉ ra tên miền và địa chỉ của máy KVM host còn lại trong file `/etc/hosts`. Thêm dòng sau vào cuối file. Chú ý đổi đúng địa chỉ IP máy KVM host còn lại của bạn
    ```
    10.10.34.163  kvm163.local kvm163
    ```
- Reboot lại máy

#### **Trên KVM163**
- Sửa tên máy trong file `/etc/hostname`. Máy này tôi để tên là `kvm163`
    ```
    kvm163
    ```
- Bổ sung vào file `/etc/hosts` dòng sau. Chú ý thay đổi địa chỉ IP thích hợp
    ```
    10.10.34.162  kvm162.local kvm162
    ```
- Reboot lại máy

### 2. Cài đặt NFS
#### **Trên NFS server**
- Cài đặt các gói NFS
    ```
    yum install -y nfs-utils nfs-utils-lib
    ```
- Chọn 1 thư mục để làm thư mục share hoặc tạo mới 1 thư mục. Ở đây, ta tạo 1 thư mục `/root/storage`
    ```
    mkdir /root/storage
    ```
- Chia sẻ thư mực này với các máy KVM host bằng cách ghi các thông tin như sau vào trong file `/etc/exports`
    ```
    /root/storage 10.10.34.162/24(rw,sync,no_root_squash)
    /root/storage 10.10.34.163/24(rw,sync,no_root_squash)
    ```
    Địa chỉ IP bên trên là địa chỉ IP của 2 máy KVM host.
- Cập nhật lại file vừa chỉnh sửa
    ```
    exportfs -a
    ```
- Khởi động dịch vụ NFS
    ```
    service nfs start
    ```

#### **Trên máy KVM host**
Trên 2 máy KVM host đều thực hiện các câu lệnh sau:

- Cài đặt NFS
    ```
    yum install -y nfs-utils nfs-utils-lib
    ```
- Sử dụng thư mục chứa file disk. Ở đây, ta tạo thư mục mới để lab
    ```
    mkdir storage
    ```
- Mount thư mục chứa máy ảo với thư mục đã share. **Lưu ý**: địa chỉ IP đúng với IP của NFS server
    ```
    mount 10.10.34.161:/root/storage/  storage
    ```
    hoặc khi sử dụng thư mục mặc định chứa file disk của VM
    ```
    mount 10.10.34.161:/root/storage/ /var/lib/libvirt/images/
    ```

**Lưu ý**: mỗi khi reboot lại máy ta cần mount lại các thư mục này. Nếu không muốn bạn mount nó bằng cách sửa file `/etc/fstab`

### 3. Cài đặt KVM
Thực hiện cài đặt KVM trên cả 2 máy KVM host. Để cài đặt KVM bạn tham khảo [tại đây](https://gist.github.com/danghai1996/3e4cca15342527eba4fca260c960bb43).

Khi cài đặt VM ta cần lưu file disk của VM vào thư mục đã mount với thư mục được share của NFS server.

Khi cài máy ảo xong ta cần thêm thông tin sau vào trong file xml của VM bằng cách dùng lệnh
```
virsh edit <tên-VM>
```

Thêm vào `cache=’none’` để tránh trường hợp migrate bị mất dữ liệu

<img src="..\images\Screenshot_155.png">

Sau đó reboot lại VM. 

Các bước này nên thực hiện ngay sau cài VM kể cả bạn chưa có ý định live migrate ngay lúc này bởi vì khi cần migrate có thể thực hiện được luôn mà không cần phải reboot VM khi đã cài các ứng dụng lên.

### 4. Kết nối qemu giữa hai KVM host
Để có thể live migrate giữa hai host thì hai host này cần phải kết nối được với nhau. Để làm được việc này ta thực hiện các bước sau ở trên cả hai máy host KVM.

```
sed -i 's/#listen_tls = 0/listen_tls = 0/g' /etc/libvirt/libvirtd.conf 
sed -i 's/#listen_tcp = 1/listen_tcp = 1/g' /etc/libvirt/libvirtd.conf
sed -i 's/#tcp_port = "16509"/tcp_port = "16509"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#listen_addr = "10.10.34.1"/listen_addr = "0.0.0.0"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#auth_tcp = "sasl"/auth_tcp = "none"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#LIBVIRTD_ARGS="--listen"/LIBVIRTD_ARGS="--listen"/g' /etc/sysconfig/libvirtd
```

Restart lại libvirtd trên cả hai máy
```
systemctl restart libvirtd
```

### 5. Migrate
Ta kiểm tra VM trên KVM162, và tạo một số file như hình

<img src="..\images\Screenshot_157.png">

<img src="..\images\Screenshot_156.png">

Trên KVM163 không có VM nào.

<img src="..\images\Screenshot_158.png">

Trước khi migrate, ta sẽ chạy lệnh `ping` trên vm162 của KVM162

<img src="..\images\Screenshot_159.png">

**Migrate** từ KVM162(`10.10.34.162`) sang KVM163(`10.10.34.163`)
Thực hiện câu lệnh trên KVM162
```
virsh migrate --live vm162 qemu+tcp://10.10.34.163/system
```

Nếu có thông báo `unsafe` như dưới đây, ta thêm tùy chọn `--unsafe` vào câu lệnh là có thể tiến hành migrate

<img src="..\images\Screenshot_160.png">

Sau khi quá trình hoàn tất, vm162 trên host KVM162 sẽ ở trạng thái Shutoff và VM162 chuyển sang host KVM163 ở trạng thái Running.

<img src="..\images\Screenshot_161.png">

Ta mở vm162 ở trên KVM163 ta thấy lệnh `ping 8.8.8.8` vẫn đang chạy

<img src="..\images\Screenshot_162.png">

Sau khi chuyển qua KVM163, vm162 vẫn giữ nguyên IP và dữ liệu cũ

<img src="..\images\Screenshot_163.png">