# Cài đặt Postfix trên CentOS 7  

`Postfix` là chương trình mã nguồn mở và miễn phí (free and open-source) dùng để gửi thư điện tử (Mail Transfer Agent – MTA) được tạo ra ban đầu tại IBM với mục tiêu là thay thế chương trình gửi mail phổ biến là Sendmail. Postfix được phát triển dựa trên mục tiêu là nhanh, dễ quản lý và bảo mật.

## 1. Install Postfix  

Trước khi cài đặt Postfix ta cần xóa `sendmail` trên máy.  
```
yum remove sendmail
yum -y install postfix cyrus-sasl-plain mailx
yum install postfix
```
Sau đó chạy các lệnh cần thiết
```
alternatives --set mta /usr/sbin/postfix
alternatives --set mta /usr/sbin/sendmail.postfix
systemctl restart postfix
```

## 2. Config Postfix  

- Thêm vào cuối file cấu hình `/etc/postfix/main.cf` nội dung như sau:  
```
myhostname = hostname.example.com
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
```
## 3. Configure Postfix SASL Credentials

- Tạo file `/etc/postfix/sasl_passwd` và ghi vào nội dung sau:  
```
[smtp.gmail.com]:587 username:password
```
Lưu ý: username:password là địa chỉ gmail và password dăng nhập gmail của bạn

- Phân quyền  
```
postmap /etc/postfix/sasl_passwd
chown root:postfix /etc/postfix/sasl_passwd*
chmod 640 /etc/postfix/sasl_passwd*
systemctl reload postfix
```
- Truy cập vào địa chỉ bên dưới để bật chế độ cho phép truy cập ứng dụng kém an toàn.  
```
https://myaccount.google.com/lesssecureapps
```
Bật quyền truy cập của ứng dụng kém an toàn để Postfix có thể đăng nhập vào Gmail

<img src="https://i.imgur.com/0sjnui6.png">

## 4. Kiểm tra  

Nhập dòng lệnh sau để kiểm tra mail đã được gửi thành công chưa  
```
echo "Day la mail thu nghiem" | mail -s "demo mail" hongnga.at8a@gmail.com
```

Vào gmail và xem trong hộp thư đến  
<img src="https://i.imgur.com/pDSouTt.png">

Như vậy ta đã cài đặt postfix thành công trên CentOS 7 để gửi mail.