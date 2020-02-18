# Install KVM Slave

### 1. Để thực hiện cài đặt, ta tải script cài đặt về và chạy script

```
curl -o install.sh https://files.soluslabs.com/install.sh && sh install.sh
```
<img src="..\images\Screenshot_6.png">

### 2. Chọn option thứ 2 rồi đợi quá trình cài đặt hoàn tất.

<img src="..\images\Screenshot_7.png">


### 3. Vô hiệu hóa SELinux vĩnh viễn trong file `/etc/selinux/config`

<img src="..\images\Screenshot_8.png">



- ID Key : `eYFKkRTHoKlxOT8Ypm6F2OU4BZqhbNCdUaHxTEfBOPVORjWp21`
- ID Password : `VheyWpSMnbqCLXenhGnAhS3bwLrAFmAULi30tXCSbrNKvAVdEN`

### 4. Ta thấy ID key và IP Password

<img src="..\images\Screenshot_9.png">

Cặp ID này ta có thể tìm trong file
```
/usr/local/solusvm/data/solusvm.conf
```

### 5. Ta truy cập địa chỉ sau bằng trình duyệt 
```
https://master_server_ip:5656/admincp/
```

Ở đây, ta đã cài SolusVM Master trên server có địa chỉ `10.10.34.162`. Truy cập đường dẫn `https://10.10.34.162:5656/admincp/`

<img src="..\images\Screenshot_12.png">

Đăng nhập bằng tài khoản mặc định

- Admin Username : `vpsadmin`
 
- Admin Password : `vpsadmin`

### 6. Add node KVM ta vừa tạo
**Nodes** -> **Add Node**

<img src="..\images\Screenshot_13.png">

Điền thông tin vào các trường và sử dụng **ID Key** và **ID Password**

<img src="..\images\Screenshot_14.png">

**Chú ý 1 số trường:**
- **Type**: ta chọn KVM
- **IP address**: 
- **SSH Port** : cổng để có thể ssh
- **ID Key, ID Password** : ID, Pass được sinh ra ở trên
- **LV Group** : tên volume ta đã tạo ở phần 4.

Sau đó Click **Add Node**

Thêm thành công, ta sẽ thấy thông báo như sau

<img src="..\images\Screenshot_15.png">

### 7. Click để cấu hình node
Ta có giao diện cấu hình node

<img src="..\images\Screenshot_16.png">

Tích vào dòng ISO Tranfers rồi click **Update Node** 