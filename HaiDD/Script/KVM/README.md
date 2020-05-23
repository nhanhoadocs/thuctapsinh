# Hướng dẫn sử dụng Script cài đặt KVM trên CentOS 7

## Chuẩn bị và Yêu cầu
- Một máy cài đặt CentOS-7 64bits
- Máy có hỗ trợ ảo hóa
- Đăng nhập vào hệ thống với quyền `root`
- Có NIC, kết nối được với internet
- **Lưu ý:** Dịch vụ NetworkManager không bị tắt.

-----------

## Thực hiện
### 1. Cài đặt các gói liên quan:
- Đăng nhập vào hệ thống bằng tài khoản `root`
- Cài đặt `wget` để sử dụng tải file script về máy
```
yum -y install wget
```

### 2. Tải script
Tải file scipt về thư mục `/root/`

```
wget -P /root/ https://raw.githubusercontent.com/danghai1996/thuctapsinh/master/HaiDD/Script/KVM/kvm_centos7.sh
```
Sau khi dùng lệnh trên tải về, file script sẽ ở tại thư mục `/root/` và có tên là: `kvm_centos7.sh`

### 3. Phân quyền
Cấp quyền thực thi cho file script
```
chmod +x kvm_centos7.sh
```

### 4. Thực hiện chạy script
```
bash /root/kvm_centos7.sh
```

Sau khi cài đặt các gói xong, đến phần tạo card Bridge ta sẽ đặt tên cho card Bridge. Tên không được trùng với các tên đang có.
```
ENTER Interface_name for Bridge card (For example: br0, br1, ...):
```
Nếu nhập tên không phù hợp thì sẽ có yêu cầu nhập lại.

<img src = "https://i.imgur.com/60Q5d9P.png">

Sau khi nhập tên phù hợp, thì sẽ chuyển sang phần chọn card mạng hiện có để gán vào card Bridge ta vừa tạo. Tên phải là tên của card hiện đang có.

<img src = "https://i.imgur.com/CpismUU.png">

Sau đó, ta sẽ nhập các thông số (IP, DNS, Gateway, ...). 

**Lưu ý:** phần nhập IP chỉ nhập địa chỉ IP và cần xác định chính xác địa chỉ IP để tránh xảy ra xung đột(nên dùng IP của card hiện tại), số prefix sẽ nhập sau

<img src ="https://i.imgur.com/8VgYOtC.png">

Sau khi nhập hoàn thành các thông số cho card Bridge, hệ thống sẽ được khởi động lại. Đợi một vài phút để hệ thống reboot. Ta sẽ truy lại bình thường.

<img src = "https://i.imgur.com/FYDGXKI.png" >

Sử dụng virt-manager để tạo và cấu hình máy ảo

<img src = "https://i.imgur.com/s1RWddc.png">

Vậy là ta đã cài đặt thành công KVM trên một máy CentOS-7. 