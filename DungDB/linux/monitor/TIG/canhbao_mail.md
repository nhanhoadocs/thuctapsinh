# Cảnh báo với gmail

Sửa file `/etc/grafana/grafana.ini`

    nano /etc/grafana/grafana.ini

Sửa các dòng

```
[smtp]

enabled = true

host = smtp.gmail.com:587

user = <emailid>@gmail.com #nhập email của bạn

password = XXXXXXXX #nhập password email

;cert_file =

;key_file =

;skip_verify = false

from_address = admin@grafana.localhost

from_name = Grafana
```

Khởi động lại dịch vụ

    systemctl restart grafana-server

Vào trang https://myaccount.google.com/lesssecureapps

![Imgur](https://i.imgur.com/eeZsSYa.png)

Thêm channel cảnh báo grafana

![Imgur](https://i.imgur.com/o2UYhCl.png)

![Imgur](https://i.imgur.com/VWk6Rcl.png)

Send test. Nếu không được thhif vào trang: https://accounts.google.com/b/0/DisplayUnlockCaptcha

![Imgur](https://i.imgur.com/psOvuiv.png)

Sau đó send test lại.

Kết quả:

![Imgur](https://i.imgur.com/9GuW4NH.png)

Thử test gửi mail khi RAM đầy

Tạo một graph và edit như sau:

![Imgur](https://i.imgur.com/c4wfISF.png)

![Imgur](https://i.imgur.com/jemdXsz.png)

![Imgur](https://i.imgur.com/8PjQukN.png)

![Imgur](https://i.imgur.com/59FcYk6.png)

![Imgur](https://i.imgur.com/cUSEY0i.png)

Khi RAM sử dụng trên 50% sẽ gửi cảnh báo

Kết quả:

![Imgur](https://i.imgur.com/p1m1oe7.png)

https://www.techiescorner.in/grafana-mail-alert-configuration/