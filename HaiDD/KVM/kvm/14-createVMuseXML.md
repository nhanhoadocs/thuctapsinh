# Tạo máy ảo, network mới bằng file XML

## I. Tạo VM bằng file XML
### 1. Chuẩn bị file XML
Chuẩn bị 1 file XML
```

```

Mã uuid, ta có thể download package `uuid` rồi sử dụng lệnh `uuid` để sinh ra 1 mã uuid

<img src ="..\images\Screenshot_137.png">

Ngoài ra, ta có thể tạo 1 file xml bằng việc dump từ một máy ảo đang chạy bằng câu lệnh
```
virsh dumpxml vm1 > vm2.xml
```

### 2. Tạo ổ đĩa

### 3. Khởi tạo máy ảo

