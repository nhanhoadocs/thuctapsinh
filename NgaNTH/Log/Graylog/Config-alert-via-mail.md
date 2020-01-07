# Cấu hình graylog cảnh báo SSH qua email  
Là một System Admin bạn luôn phải lưu ý vấn đề bảo mật của hệ thống. Khi có hoạt động đăng nhập bất thường xảy ra, làm cách nào để bạn nhận biết được nó và rút ngắn thời gian kiểm tra nhanh nhất có thể? Nối tiếp chuỗi bài về Graylog, hôm nay Cloud365 sẽ chia sẻ đến các bạn cách cấu hình graylog server để nhận cảnh báo SSH qua email.  

## 1. Điều kiện:  
- Graylog server đã cài đặt Postfix để gửi mail. Nếu bạn chưa biết cách cài đặt Postfix trên Linux có thể tham khảo tại bài viết theo [link](https://github.com/ngahong/thuctapsinh/blob/master/NgaNTH/Log/Graylog/Install-Postfix.md)  
- Máy client01 đâ cài đặt sidecar để đẩy log về graylog server.  

## 2. Cấu hình  

### 2.1 Cấu hình trên graylog server  
- Mở file `/etc/graylog/server/server.conf` và thêm vào file nội dung sau  
```
transport_email_enabled = true
transport_email_hostname = smtp.gmail.com
transport_email_port = 587
transport_email_use_auth = true
transport_email_auth_username = your_mail@gmail.com
transport_email_auth_password = your_password
transport_email_subject_prefix = [graylog]
transport_email_from_email = your_mail@gmail.com
transport_email_use_tls = true
transport_email_use_ssl = false
```
Chú ý: Bạn cần điền chính xác tài khoản mail của bạn và mật khẩu đăng nhập ở mục `transport_email_auth_username`, `transport_email_from_email` và `transport_email_auth_password`.  
- Lưu thay đổi file và khởi động lại dịch vụ graylog-server  
```
systemctl restart graylog-server
```
### 2.2 Cấu hình trên Web interface  
- Click vào `Alerts` trên menu Graylog. Sau đó chọn `Notifications`  
<img src="https://i.imgur.com/2kl2PkL.png">
- Tiếp tục Chọn Get Started! để bắt đầu tạo thông báo
<img src="https://i.imgur.com/fKdfX8T.png">
- Điền thông tin vào các trường như bên dưới  
<img src="https://i.imgur.com/QYLX6jH.png">
<img src="https://i.imgur.com/Ss6rvA0.png">

**Lưu ý**:  
    – `Email recipient(s)` là địa chỉ email để nhận mail cảnh báo.  
    – Có thể thay đổi nội dung cảnh báo trong phần `Body Template`.  
    – Thử cảnh báo bằng cách click `Execute Test Notification`. Nếu thấy thông báo Success tức là ta đã cấu hình đã thành công. Sau đó click `Create` để tạo.  

- Tiếp theo cấu hình cho `Event Definitions`. Click `Get Started!` để bắt đầu định nghĩa một sự kiện.  

<img src="https://i.imgur.com/K2xIrQF.png"> 
<img src="https://i.imgur.com/kHtg4oN.png"> 

- Đặt tên tiêu đề của event và viết mô tả sau đó chọn `Next`

<img src="https://i.imgur.com/BMUZwnD.png">  

- Ở bài trước ta đã grok pattern ra trường `action_ssh` nên ta có thể sử dụng nó để tạo `SSH streams`. Sau khi tạo xong ta sử dụng giá trị `Failed` của trường `action_ssh` để lấy các log message gửi về khi có đăng nhập thất bại. 

<img src="https://i.imgur.com/hidh7wM.png">  

- Tiếp tục điền các thông tin như bên dưới. Lưu ý ta sử dụng cả trường `ip_ssh` và `user_ssh` để lấy nó làm bộ lọc.

<img src="https://i.imgur.com/h34qXAj.png">  

> Ý nghĩa của cấu hình trên là: Tìm những message có chứa cụm từ Failed trong SSH streams. Mỗi 30s tìm 1 lần, nếu trong 5 phút mà tìm được nhiều hơn hoặc bằng 5 lần thì sẽ xuất thông báo (gửi cảnh báo qua mail).  

- Tiếp tục tạo 2 trường có nội dung lần lượt như sau:  

<img src="https://i.imgur.com/sF0EaYy.png"> 

<img src="https://i.imgur.com/YSagERH.png"> 

- Sau đó nhấn Next sang phần `Notifications`, nhấn `Add Notication` và thêm notication mà ta tạo lúc đầu, sau đó chọn `Next`.  
<img src="https://i.imgur.com/QSBhkMj.png">  

- Tiếp tục chuyển sang phần Summary. Tại đây ta kiểm tra lại và nhấn Done để kết thúc cấu hình. 
<img src="https://i.imgur.com/Erv4Zlz.png"> 

## 3. Test kết quả  
Trên máy client01 thử đăng nhập sai 5 lần trong thời gian 5 phút và kiểm tra hộp thư đến trong email nhận cảnh báo mà ta cấu hình lúc đầu. Nếu kết quả như bên dưới tức là ta đã thành công.  
<img src="https://i.imgur.com/7ui54JN.png">  
