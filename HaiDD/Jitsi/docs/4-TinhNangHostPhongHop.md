# Hướng dẫn thêm tính năng chủ phòng (host) trên Jitsi

Sau khi cài đặt Jitsi, mọi người đều có thể vào trang web của chúng ta để tạo phòng họp. Để hạn chế điều này, ta cần tạo một chủ phòng (host). Với tính năng này, bắt buộc chủ phòng phải có mặt thì phiên họp mới có thể bắt đầu. Tất cả những user khác sẽ không có quyền thực hiện thao tác trên trang web của ta.

Sau đây sẽ là hướng dẫn tạo một chủ phòng cho trang Jitsi của bạn.

## Chuẩn bị
- [Cài đặt Jitsi theo hướng dẫn ở đây](https://kb.nhanhoa.com/pages/viewpage.action?pageId=33817301).

- Trong hướng dẫn này tôi dùng một VPS có IP public là 103.124.93.50.

- Domain truy cập trang Jitsi meet: https://cmc-jitsi.workfromhome.vn/

## Các bước thiết lập
SSH đến VPS và thực hiện các bước dưới đây

### Bước 1:
Sửa file `/etc/prosody/conf.avail/<IP_OR_DOMAIN>.cfg.lua`:

Cụ thể trong bài này là `/etc/prosody/conf.avail/cmc-jitsi.workfromhome.vn.cfg.lua`
```
vi /etc/prosody/conf.avail/cmc-jitsi.workfromhome.vn.cfg.lua
```

Tại phần `VirtualHost "cmc-jitsi.workfromhome.vn"`. Sửa mục `authentication` thành `authentication = "internal_plain"`

và thêm đoạn này vào cuối file
```
VirtualHost "guest.cmc-jitsi.workfromhome.vn"
        authentication = "anonymous"
        c2s_require_encryption = false
```

### Bước 2:
Sửa file `/etc/jitsi/meet/<IP_OR_DOMAIN>-config.js`
```
vi /etc/jitsi/meet/cmc-jitsi.workfromhome.vn-config.js
```

Thêm giá trị `anonymousdomain: 'guest.cmc-jitsi.workfromhome.vn',` vào mảng `host`

Nội dung file tương tự như sau

<img src="https://i.imgur.com/8HmzWsH.png">


## Bước 3:
Sửa file `/etc/jitsi/jicofo/sip-communicator.properties`
```
vi /etc/jitsi/jicofo/sip-communicator.properties
```

Thêm dòng này vào file: `org.jitsi.jicofo.auth.URL=XMPP:<IP_OR_DOMAIN>`

Cụ thể ở đây sẽ là `org.jitsi.jicofo.auth.URL=XMPP:cmc-jitsi.workfromhome.vn`

**Lưu ý:** Nếu muốn backup file này bạn nên lưu file backup ở một thư mục khác để tránh lỗi.

## Bước 4:
Khởi động lại dịch vụ
```
service prosody restart; service jicofo restart
```

## Bước 5:
Thêm tài khoản chủ phòng (host)

**Cú pháp**
```
prosodyctl register <USERNAME> <IP_OR_DOMAIN> <PASSWORD>
```

Tại đây, ta thêm 
```
prosodyctl register chuphong cmc-jitsi.workfromhome.vn cloud365
```

## Kết quả
Truy cập vào trang Jitsi và tạo một phòng. Sẽ có một thông báo xuất hiện.

<img src="https://i.imgur.com/rWczPEV.png">

Click vào ô "**I am the host**" hay "**Tôi là chủ phòng**" và nhập tên đăng nhập, mật khẩu để bắt đầu cuộc họp.

<img src="https://i.imgur.com/nEdyJYN.png">

Sau khi vào phòng, ta sẽ thấy thông báo quyền host được gán cho ta

<img src="https://i.imgur.com/W1A9uYE.png">

# Thay đổi gợi ý đăng nhập
Thay đổi dòng user@domain.net tại khung đăng nhập chủ trì thành user@workfromhome.vn

<img src="https://i.imgur.com/UKRoUHP.png">

Sửa file `app.bundle.min.map` và `app.bundle.min.js` tại thư mục `/usr/share/jitsi-meet/libs`
```
sed -i 's/user@domain.net/user@workfromhome.vn/g' /usr/share/jitsi-meet/libs/app.bundle.min.map
sed -i 's/user@domain.net/user@workfromhome.vn/g' /usr/share/jitsi-meet/libs/app.bundle.min.js
```

<img src="https://i.imgur.com/hFgNKre.png">