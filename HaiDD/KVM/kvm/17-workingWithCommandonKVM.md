## Truy cập console VM
- Cần khởi động dịch vụ trên VM

```
systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service
```

- Trên Host KVM
```
virsh console <tên_VM>
```

<img src="..\images\Screenshot_177.png">

- Nhấn phím Enter

<img src="..\images\Screenshot_178.png">

- Nhập tài khoản và mật khẩu đăng nhập cho VM

<img src= "..\images\Screenshot_179.png">

- Quay lại host KVM, ta nhấn tổ hợp `Ctrl ]`