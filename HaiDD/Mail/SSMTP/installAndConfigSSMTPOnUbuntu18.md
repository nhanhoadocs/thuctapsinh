# Cài đặt và cấu hình SSMTP trên Ubuntu 18.04 LTS

SSMTP là một sự thay thế cho sendmail để gửi thư. Nó cho phép bạn định cấu hình gửi qua máy chủ của bên thứ 3.

## Cài đặt
- Update repo
    ```
    apt-get update
    ```

- Cài đặt ssmtp
    ```
    apt-get -y install ssmtp mailutils
    ```

## Cấu hình
File cấu hình ssmtp: `/etc/ssmtp/ssmtp.conf`

### Cho phép ứng dụng truy cập gmail
Nếu bạn sử dụng gmail làm địa chỉ người gửi thì bạn phải cho phép ứng dụng truy cập gmail của bạn

Đăng nhập bằng gmail để thực hiện gửi mail đã khai báo bên trên trên trình duyệt và truy cập vào địa chỉ sau

https://myaccount.google.com/lesssecureapps

Bật chế độ cho phép ứng dụng truy cập

<img src="https://i.imgur.com/6YGerWK.png">

### Cấu hình
Ở đây, ta sử dụng gmail nên phần mailhub sẽ để là `mailhub=smtp.gmail.com:587` và `rewriteDomain=gmail.com`
```conf
#
# Config file for sSMTP sendmail
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
# root=postmaster
root=dangdohai1996@gmail.com

# The place where the mail goes. The actual machine name is required no
# MX records are consulted. Commonly mailhosts are named mail.domain.com
# mailhub=mail
mailhub=smtp.gmail.com:587

AuthUser=youremail@gmail.com
AuthPass=youremailpassword
UseTLS=YES
UseSTARTTLS=YES

# Where will the mail seem to come from?
#rewriteDomain=
rewriteDomain=gmail.com

# The full hostname
hostname=ssmtpServer

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
FromLineOverride=YES
```

Tạo alias cho user local. Mở file sau và sửa
```
vi /etc/ssmtp/revaliases
```

Thêm dòng
```
root:youremail@gmail.com:smtp.gmail.com:587
```

### Thử gửi mail
Sử dụng lệnh: 
```
ssmtp -v des.email@mail.com
```
Sau đó nhập nội dung mail. Kết thúc bằng cách nhấn tổ hợp phím **Ctrl+D**

hoặc có thể kết hợp với `echo`
```
echo "Test message from Linux server using ssmtp" | ssmtp -v des.email@mail.com
```


Để thêm trường subject:
```
{
    echo Subject: canh bao
    echo Hello ssmtp
} | ssmtp des.email@mail.com
```

Sử dụng nội dung từ file:
- Tạo 1 file `test.txt`
    ```
    Subject: Sending email using ssmtp
    Noi dung email
    ```

- Chạy lệnh gửi mail
    ```
    ssmtp des_email@gmail.com < test.txt
    ```

**Lưu ý:** sử dụng ssmtp trong script với crontab sẽ cần dùng đường dẫn thư mục ssmtp.

Có thể tìm bằng cách sử dụng lệnh `locate ssmtp`. Thường sẽ là `/usr/sbin/ssmtp`

