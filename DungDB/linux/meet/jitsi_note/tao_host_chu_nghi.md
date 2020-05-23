# Hướng dẫn thêm tính năng chủ nghị (host) trên Jitsi

Sau khi cài đặt Jitsi, mọi người đều có thể vào trang web của chúng ta để tạo phòng họp. Để hạn chế điều này, ta cần tạo một chủ nghị (host). Với tính năng này, bắt buộc chủ nghị phải có mặt thì phiên họp mới có thể bắt đầu. Tất cả những user khác sẽ không có quyền thực hiện thao tác trên trang web của ta. 

Sau đây sẽ là hướng dẫn tạo một chủ nghị cho trang Jitsi của bạn.

## Chuẩn bị

- [Cài đặt Jitsi theo hướng dẫn ở đây.](https://kb.nhanhoa.com/pages/viewpage.action?pageId=33817301)
- Trong hướng dẫn này tôi dùng một VPS có IP public là 45.117.80.217.

- Domain truy cập trang Jitsi meet: meeting1.workfromhome.vn

![Imgur](https://i.imgur.com/Jaqt4eQ.png)

## Thao tác

### Bước 1:

Sửa file `/etc/prosody/conf.avail/<IP_OR_DOMAIN>.cfg.lua`

Cụ thể trong bài này là `/etc/prosody/conf.avail/meeting1.workfromhome.vn.cfg.lua`

    vi /etc/prosody/conf.avail/meeting1.workfromhome.vn.cfg.lua

Tại phần `VirtualHost "meeting1.workfromhome.vn"`. Sửa mục authentication thành `authentication = "internal_plain"`

và thêm đoạn này vào cuối file

```
VirtualHost "guest.meeting1.workfromhome.vn"
        authentication = "anonymous"
        c2s_require_encryption = false
```

### Bước 2: 

Sửa file `/etc/jitsi/meet/<IP_OR_DOMAIN>-config.js`

Cụ thể trong bài này sẽ là `/etc/jitsi/meet/meeting1.workfromhome.vn-config.js`

Thêm giá trị `anonymousdomain: 'guest.meeting1.workfromhome.vn'`

Nội dung file tương tự như sau

```
var config = {
    // Connection
    //

    hosts: {
        // XMPP domain.
        domain: 'meeting1.workfromhome.vn',
        anonymousdomain: 'guest.meeting1.workfromhome.vn',
...
```
### Bước 3: 

Sửa file `/etc/jitsi/jicofo/sip-communicator.properties` 

Thêm dòng này vào file: `org.jitsi.jicofo.auth.URL=XMPP:<IP_OR_DOMAIN>`

Cụ thể ở đây sẽ là `org.jitsi.jicofo.auth.URL=XMPP:meeting1.workfromhome.vn`

File sẽ có nội dung tương tự như sau:

```
root@jitsimeet:/etc/jitsi/jicofo# cat sip-communicator.properties
org.jitsi.jicofo.BRIDGE_MUC=JvbBrewery@internal.auth.meeting1.workfromhome.vn
org.jitsi.jicofo.auth.URL=XMPP:meeting1.workfromhome.vn
```

**Lưu ý:** Nếu muốn backup file này bạn nên lưu file backup ở một thư mục khác để tránh lỗi.

### Bước 4:

Khởi động lại dịch vụ

    sudo service prosody restart; sudo service jicofo restart

### Bước 5:

Thêm tài khoản chủ nghị (host)

Cú pháp

    sudo prosodyctl register <USERNAME> <IP_OR_DOMAIN> <PASSWORD>

Cụ thể trong bài sẽ là

Ví dụ

    sudo prosodyctl register chunghi meeting1.workfromhome.vn Cloud365*&^

## Kết quả

Truy cập vào trang Jitsi và tạo một phòng. Sẽ có một thông báo xuất hiện.

![Imgur](https://i.imgur.com/rkyJ210.png)

Click vào ô "I am the host" hay "Tôi là chủ nghị" và nhập tên đăng nhập, mật khẩu để bắt đầu cuộc họp. 

![Imgur](https://i.imgur.com/KXBojLm.png)

Sau khi vào phòng bằng user chủ nghị sẽ thấy thông báo quyền điều hành đã được gán cho ta. 

![Imgur](https://i.imgur.com/Wa7MHnb.png)

**Lưu ý:** Chủ nghị là người điều hành cuộc họp. Nếu chủ nghị thoát khỏi phòng thì cuộc họp sẽ chấm dứt ngay lập tức.

Thay đổi dòng `user@domain.net` tại khung đăng nhập chủ trì thành `user@dangdohai.xyz`

![Imgur](https://i.imgur.com/uDnoFh2.png)

Sửa file `app.bundle.min.map` và `app.bundle.min.js` tại thư mục `/usr/share/jitsi-meet/libs`

    sed -i 's/user@domain.net/user@dangdohai.xyz/g' /usr/share/jitsi-meet/libs/app.bundle.min.map
    sed -i 's/user@domain.net/user@dangdohai.xyz/g' /usr/share/jitsi-meet/libs/app.bundle.min.js