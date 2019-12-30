# Đặt lại mật khẩu cho user admin trên graylog server  

Khi cài graylog server ta thấy có bước tạo mật khẩu đăng nhập vào Web interface cho user `admin` mặc định. Bây giờ nếu muốn reset mật khẩu cho admin thì chúng ta phải làm như thế nào?  

- Trước tiên ta đăng nhập vào graylog server trên Web interface. Phía bên phải màn hình có icon hình người, bạn click vào đó và chọn `Edit profile` 

<img src="https://i.imgur.com/dVa8yR1.png">  

- Chọn mục `Users` và kéo xuống dưới  ta sẽ thấy phần **Change Password**  

<img src="https://i.imgur.com/SQvfWxO.png">  

<img src="https://i.imgur.com/VoohSPG.png">  

Như vậy ta sẽ phải chỉnh sửa trong file cấu hình `/etc/graylog/server/server.config` trên graylog server.  

- Tạo chuỗi hash cho mật khẩu mới mà bạn muốn sử dụng
```
echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1
```

<img src="https://i.imgur.com/KWZqXnQ.png">

- Copy chuỗi hash này ghi đè lên hasd cũ (giá trị của `root_password_sha2`) trong file cấu hình `/etc/graylog/server/server.config`  

<img src="https://i.imgur.com/Cc6PFnG.png">

- Lưu thay đổi file và restart graylog server  
```
systemctl restart graylog-server
```

- Thử đăng nhập lại graylog server trên Web interface bằng mật khẩu cũ. Lúc này nó sẽ báo lỗi  

<img src="https://i.imgur.com/GPwekX9.png">  

- Tiếp tục đăng nhập bằng mật khẩu vừa tạo. Nếu trình duyệt trả về giao diện như bên dưới tức là ta đã thành công

<img src="https://i.imgur.com/RYKo2TR.png">
