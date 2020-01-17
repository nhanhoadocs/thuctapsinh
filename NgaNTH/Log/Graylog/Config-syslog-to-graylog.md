## Cấu hình syslog đẩy log về graylog-server  

**Mô hình**  

<img src="https://i.imgur.com/uERZaFg.png">  

### Configure on CentOS 7  

**1. Trên máy Client**  
- Sửa file cấu hình `/etc/rsyslog.conf`  
```
*.* @@192.168.152.134:5014  
```
Chú ý:  `192.168.152.134` là địa chỉ IP của máy nhận log (graylog-server). Ta để port `5014` để không bị trùng với port `514` của rsyslog và nên dùng với các cổng lớn hơn `1024`.  

**2. Trên máy graylog-server**  
Ta cần tắt hết firewall và selinux.  
Kiểm tra thời gian của các máy client và máy graylog-server đã được đồng bộ chưa.  
Dùng lệnh `datetimectl` để xem thông tin cài đặt thời gian hiện tại của hệ thống.  
```
datetimectl
```

**3. Mở trình duyệt và gõ địa chỉ IP của graylog-server kèm port `9000`**.

Trong mục `System/Input` chọn `Input` và thiết lập các thông số đầu vào. Ta sẽ chọn input `Syslog TCP` hoặc `Syslog UDP`. Sau đó chọn `Launch new input`.

<img src="https://i.imgur.com/FsdM112.png">

Một cửa sổ sẽ hiển thị lên để bạn điền một số thông tin.  

<img src="https://i.imgur.com/jTKCKij.png">

Sau đó chọn `Save` để lưu lại. 
Chọn `start input` để bắt đầu nhận các message khi có log đẩy về. Trạng thái khi đó của input sẽ là `Running`.  

**4. Test các message đã được đẩy về graylog hay chưa**  

Trên máy client bạn mở một terminal mới và thử đăng nhập sai tên 1 tài khoản user. Sau đó quay lại trình duyệt graylog để kiểm tra message đã báo về chưa.  

<img src="https://i.imgur.com/cmvOUMv.png">  


### Configure on Ubuntu 18.4**  

Tương tự như trên ta chỉnh sửa trong file cấu hình `/etc/rsyslog.conf` bằng cách thêm dòng sau vào cuối file  
```
*.* @192.168.152.134:5014
```  
Sau đó quay lại trình duyệt đang mở graylog, chọn đầu vào input là `Syslog UDP` và thiết lập thông số tương tự như phần trước. 
Tiếp tục test kết quả bằng cách đăng nhập sai tên một tài khoản. 
Kết quả như sau  
<img src="https://i.imgur.com/PryRu3s.png">  

Như vậy ta đã cấu hình đẩy log về graylog-server từ các máy client như CentOS 7 và Ubuntu 18.4  

