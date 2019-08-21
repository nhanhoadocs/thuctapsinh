# SSH Configurations
## **1) Khởi tạo phiên SSH**
- Nếu đang sử dụng Linux hoặc Mac OS , kết nối **SSH** khá đơn giản bằng cách sử dụng **Terminal** . Nếu sử dụng Windows , cần thêm 1 chương trình khác để mở kết nối **SSH** . Trình kết nối **SSH** được sử dụng phổ biến nhất cho Windows là **PuTTY** .
- Với Mac OS và Linux , mở **Terminal** và gõ lệnh theo cấu trúc sau :
    ```
    # ssh user@[host/IP]
    ```
    - Trong đó :
        - **user** : user local trên máy cần ssh
        - **host/IP** : hostname ( VD : `www.xyzdomain.com` ) hoặc IP của máy cần kết nối SSH ( VD : `244.235.23.19` )
- Sau khi thực hiện lệnh , máy đầu xa sẽ yêu cầu password của user sử dụng **SSH** .
## **2) Chỉnh sửa file cấu hình SSH**
- Các file cấu hình cần lưu ý khi quản trị **SSH** :
    - `/etc/ssh/sshd_config` : file cấu hình SSH Server
    - `/etc/ssh/ssh_config` : file cấu hình SSH Client
    - `~/.ssh/` : thư mục chứa nội dung cấu hình **SSH** của user client trên Linux
    - `/etc/nologin` : nếu file này tồn tại , thì dịch vụ SSH Server trên Linux sẽ từ chối đăng nhập từ các user khác trên hệ thống ngoại trừ user `root` . File này thường dùng cho trường hợp khẩn cấp cần cách ly sớm hệ thống .
- Để chỉnh sửa file cấu hình SSH Server , ta dùng lệnh :
    ```
    # vi /etc/ssh/sshd_config
    :set nu
    ```

    <img src=https://i.imgur.com/NfpxlUa.png>

### **2.1) Thay đổi port SSH và giới hạn IP lắng nghe SSH**
- Dịch vụ **SSH** mặc định hoạt động trên port `22` . Vì là port phổ biến , rất dễ bị kẻ xấu thực hiện các hoạt động dò tìm mật khẩu tự động đăng nhập **SSH** vào hệ thống .
- Để điều chỉnh port mặc định , xuống dòng `17` , chỉ định port mới , đồng thời bỏ dấu "`#`" ở đầu dòng :

    <img src=https://i.imgur.com/7IWzV1L.png>

- Nếu hệ thống có nhiều hơn 1 địa chỉ IP thì tốt nhất nên chỉ định rõ địa chỉ IP nào sẽ lắng nghe port **SSH** . Thực hiện sửa đổi ở dòng `19` , đồng thời bỏ dấu "`#`" ở đầu dòng ( `0.0.0.0` có nghĩa là mọi IP đều lắng nghe **SSH** ):

    <img src=https://i.imgur.com/DxIr0Mk.png>

### **2.2) Cấu hình thời gian timeout khi user đăng nhập không thành công**
- Khi 1 user đăng nhập **SSH** , nếu không chỉ định thông tin user từ đầu thì sẽ hiện ra 1 prompt yêu cầu nhập thông tin user . Sau đó là phần nhập mật khẩu nếu user đó đăng nhập bằng mật khẩu . Ta sẽ quy định thời gian 1 kết nối **SSH** đợi cho hoạt động đăng nhập user thành công , nếu sau khoảng thời gian này không đăng nhập được thì ngắt kết nối .
- Thay đổi tùy chọn này ở dòng `37` ( mặc định đã được cấu hình là `2 phút` ) :

    <img src=https://i.imgur.com/uZpCZPu.png width=90%>
### **2.3) Không cho đăng nhập bằng user `root`**
- Nếu muốn sử dụng quyền `root` chỉ cần tạo 1 user khác rồi cấp quyền `sudo` cho các lệnh cần thực hiện và sử dụng => Bảo mật hệ thống hơn .
- Để cấu hình , tìm đến dòng `38` , sửa "`yes`" thành "`no`" đồng thời bỏ dấu "`#`" ở đầu dòng :

    <img src=https://i.imgur.com/kNGOjFE.png width=90%>
### **2.4) Chế độ "Strict Mode"**
- Ta sẽ chỉ định dịch vụ **SSH** phải kiểm tra thông tin quyền của thư mục `$HomeUser` , thư mục `.ssh` và file `authorized_keys` chứa key **SSH** nếu dùng **SSH key** .
- Nếu không sử dụng chế độ này ( `no` ) thì **SSH** sẽ không kiểm tra cấu hình các quyền khi đăng nhập vào Server . => Ép người quản trị phải cấu hình đúng các phân quyền ( ***permissions*** ) cho các thư mục / key dùng để đăng nhập **SSH** .
- Thay đổi tùy chọn này ở dòng `39` ( mặc định đã để `yes` ) :

    <img src=https://i.imgur.com/JrM7HvZ.png>

### **2.5) Thiết lập số lần đăng nhập sai tối đa**
- Nếu đăng nhập sai số lần quy định sẽ ngắt kết nối của Client .
- Thay đổi tùy chọn này ở dòng `40` ( mặc định là `6` ) :

    <img src=https://i.imgur.com/9OUVDPU.png width=90%>

### **2.6) Thiết lập số phiên đăng nhập SSH tối đa**
- Thực hiện thay đổi ở dòng `41` ( mặc định là `10` ) :

    <img src=https://i.imgur.com/BdyuqR6.png>
### **2.7) Sử dụng chứng thực bằng SSH key , thay vì mật khẩu**
- Mặc định , mỗi VPS/Cloud Server sẽ đăng nhập vào bằng user `root` hoặc user thường . Tuy nhiên việc sử dụng mật khẩu có 2 nguy cơ lớn là :
    - Mất toàn bộ hệ thống nếu để lộ mật khẩu
    - Hacker có thể dùng phương thức tấn công **BruteForce** để dò ra mật khẩu
- Vì vậy nên dùng **SSH Key** để đăng nhập vào Server cũng như sử dụng nó để xác thực các kết nối từ bên ngoài vào cho an toàn hơn . Đồng thời , nếu có thể nên tắt cấu hình chứng thực mật khẩu .
- Thực hiện thay đổi ở dòng `43` và `65` :

    <img src=https://i.imgur.com/U9oM0Oc.png width=90%>
    <img src=https://i.imgur.com/WKPrrLH.png width=90%>

### **2.8) Tắt log đăng nhập lần cuối**
- Thực hiện sửa đổi ở dòng `106` , đồng thời bỏ dấu "`#`" ở đầu dòng :

    <img src=https://i.imgur.com/B0oNFG2.png width=95%>
### **2.9) Cấu hình thời gian ngắt kết nối SSH khi user không hoạt động**
- Có thể quy định thời gian timeout mà 1 kết nối **SSH** đến Server Linux không nhận được bất kỳ hoạt động tương tác nào trên Terminal SSH . Lúc này nếu quá thời gian quy định thì **SSH Server** sẽ tự ngắt kết nối từ các user không tương tác .
- Thực hiện thay đổi ở dòng `112` và `113` , đồng thời bỏ dấu "`#`" ở đầu dòng :

    <img src=https://i.imgur.com/zdNw6WW.png width=95%>

### **2.10) Giới hạn User/Group sử dụng cho SSH**
- Mặc định **SSH Server** cho phép tất cả các user local đăng nhập qua **SSH** . Nhưng đôi khi cần chặn không cho đăng nhập với 1 số user nhất định hoặc 1 nhóm cụ thể .
- Để **cho phép** user hoặc group được đăng nhập **SSH** , thực hiện thêm vào 1 số dòng sau vào cuối file :

    <img src=https://i.imgur.com/Mk6dOzD.png>

- Để **không cho phép** user hoặc group được đăng nhập **SSH** , thực hiện thêm vào 1 số dòng sau vào cuối file :

    <img src=https://i.imgur.com/8uxJIp2.png>

## **3) Kiểm tra lại file cấu hình**
- Thực hiện kiểm tra lại quá trình sửa đổi file `sshd_config` xem có sai không , nếu sai sẽ báo lỗi :
    ```
    # sshd -t
    ```
## **4) Cho phép SSH qua Firewalld**
```
# firewall-cmd --permanent --zone=public --add-port=22/tcp
# firewall-cmd --reload
```
hoặc
```
# firewall-cmd --permanent --zone=public --add-service=ssh
# firewall-cmd --reload
```
## **5) Khởi động lại dịch vụ SSH**
```
# systemctl restart sshd
# systemctl enable sshd
```