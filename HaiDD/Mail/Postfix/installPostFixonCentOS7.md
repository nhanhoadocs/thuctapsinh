# Sử dụng Postfix để gửi mail

Postfix là một phầm mềm nguồn mở được dùng để gửi mail (Mail Transfer Agent-MTA). Được phát hành bởi IBM với mục tiêu thay thế trình gửi mail phổ biến là sendmail. Trong bài viết này tôi sẽ hướng dẫn bạn cách cài đặt postfix để gửi mail trên Centos7.

## Remove Sendmail
Trước tiên cần kiểm tra xem sendmail đã được cài đặt chưa bằng câu lệnh
```
rpm -qa | grep sendmail
```

Nếu có kết quả trả về chứng tỏ sendmail đã được cài đặt. Ta cần remove nó
```
yum remove sendmail*
```

## Install postfix
Cài đặt postfix và một số gói liên quan
```
yum -y install postfix cyrus-sasl-plain mailx
```

Đặt postfix như MTA mặc định của hệ thống
```
alternatives --set mta /usr/sbin/postfix
```

Nếu câu lệnh bị lỗi và trả về output `/usr/sbin/postfix has not been configured as an alternative for mta` thì thực hiện lệnh sau:
```
alternatives --set mta /usr/sbin/sendmail.postfix
```

Restart và enable postfix
```
systemctl restart postfix
systemctl enable postfix
```

## Configure Postfix
Mở file `main.cf` để chỉnh sửa
```
vi /etc/postfix/main.cf
```

Thêm vào cuối file những dòng sau
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

### Configure Postfix SASL Credentials
Tạo file `/etc/postfix/sasl_passwd` và thêm vào dòng sau
```
[smtp.gmail.com]:587 username:password
```
**Trong đó:**
- `username`: là địa chỉ email dùng để gửi mail
- `password`: là password của email dùng để gửi mail

Xác nhận lại file
```
postmap /etc/postfix/sasl_passwd
```

Phân quyền cho file vừa tạo
```
chown root:postfix /etc/postfix/sasl_passwd*
chmod 640 /etc/postfix/sasl_passwd*
```

Reload lại service
```
systemctl reload postfix
```

## Cho phép ứng dụng truy cập gmail
Nếu bạn sử dụng gmail làm địa chỉ người gửi thì bạn phải cho phép ứng dụng truy cập gmail của bạn

Đăng nhập bằng gmail để thực hiện gửi mail đã khai báo bên trên trên trình duyệt và truy cập vào địa chỉ sau

https://myaccount.google.com/lesssecureapps

Bật chế độ cho phép ứng dụng truy cập

<img src="https://i.imgur.com/6YGerWK.png">

## Kiểm tra
Kiểm tra lại xem đã gửi mail thành công hay chưa
```
echo "Đã gửi thành công" | mail -s "Mail kiểm tra" dangdohai1996@gmail.com
```

Tôi đã nhận được mail vừa gửi