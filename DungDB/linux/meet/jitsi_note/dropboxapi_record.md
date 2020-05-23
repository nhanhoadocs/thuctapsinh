# Cấu hình Jitsi lưu video record vào Dropbox

https://www.evernote.com/shard/s499/client/snv?noteGuid=27116723-bb7d-e78e-8e71-84a3f2288ad1&noteKey=4630d07b5feacccaff8dd3bcb1f78513&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs499%2Fsh%2F27116723-bb7d-e78e-8e71-84a3f2288ad1%2F4630d07b5feacccaff8dd3bcb1f78513&title=C%25E1%25BA%25A5u%2Bh%25C3%25ACnh%2BJitsi%2Bl%25C6%25B0u%2Bvideo%2Brecord%2Bv%25C3%25A0o%2BDropbox

Sau khi câú hình Jitsi Video recording thành công chúng ta mới thực hiện bài này

**Bước 1:** Truy cập vào https://dropbox.com và đăng nhập vào tài khoản của bạn. Nếu chưa có tài khoản hãy tạo cho mình một tài khoản, sau đó đăng nhập. 

**Lưu ý:** Phải xác nhận email đăng ký tài khoản

![Imgur](https://i.imgur.com/6zOz0Y8.png)

**Bước 2:** Lấy appKey

Truy cập đường dẫn sau để tạo API APP
https://www.dropbox.com/developers/apps/create 

Verify email trước nếu chưa verify

Tạo API APP như sau

![Imgur](https://i.imgur.com/baR91qd.png)

Ở phần (3) name your app. Có thể sẽ bị trùng tên. Ở đây tôi đặt lại tên app là **jitsitestdungdbxyz**

Sau đó chúng ta được chuyển đến trang app đã tạo.

Tại đây, ta lưu lại phần Appkey. Cụ thể như ví dụ ở đây thì AppKey là:  **uh64i9l0uo54geh**

Ở phần *Redirect URIs*, nhập vào nội dung https://jitsi.dungdb.xyz/static/oauth.html sau đó click nút `Add` bên cạnh. (Nhập thay đổi domain ở trên với dommain trang Jitsi của bạn.)

![Imgur](https://i.imgur.com/IshhJ77.png)

Quản lý app tại trang: https://www.dropbox.com/developers/apps/

**Bước 3:** Cấu hình trên server Jitsi

Cài đặt gói jq

    sudo apt install jq

Cấu hình tích hợp dropbox

Sửa file `/etc/jitsi/meet/<domain>-config.js`. Trong ví dụ này sẽ là `/etc/jitsi/meet/jitsi.dungdb.xyz-config.js`. Dán appKey đã copy ở trên vào.

```
dropbox: {
   appKey: 'uh64i9l0uo54geh', // Specify your app key here.
     // A URL to redirect the user to, after authenticating
     // by default uses:
     //'https://meet.huytm.xyz/static/oauth.html'
   redirectURI: 'https://meet.huytm.xyz/static/oauth.html'
},
```

**Chú ý dấu phẩy**

![Imgur](https://i.imgur.com/mPHVmge.png)

Về cơ bản Jibri việc upload file này là do Jibri có một cấu hình thực hiện script đẩy lên dropbox. Cần bổ sung các file sau và cấu hình lại Jibri

Tạo file `/etc/jitsi/jibri/jitsi_uploader.sh`

    curl https://raw.githubusercontent.com/jitsi/jitsi-upload-integrations/master/jitsi_uploader.sh > /etc/jitsi/jibri/jitsi_uploader.sh

Phân quyền

    chmod +x  /etc/jitsi/jibri/jitsi_uploader.sh

Tạo file `/usr/bin/dropbox_uploader.sh`

    curl https://raw.githubusercontent.com/jitsi/jitsi-upload-integrations/master/dropbox/dropbox_uploader.sh > /usr/bin/dropbox_uploader.sh

Phân quyền

    chmod +x /usr/bin/dropbox_uploader.sh

Cấu hình Jibri thực hiện upload file sau khi record

    vi  "/etc/jitsi/jibri/config.json"

Tìm và thay thế dòng sau

Line: 8

    "finalize_recording_script_path": "/etc/jitsi/jibri/jitsi_uploader.sh",

Restart Jibri

    service jibri restart

## Hướng dẫn sử dụng

Truy cập vào trang Jitsi và thực hiện ghi hình

![Imgur](https://i.imgur.com/DHN7XwS.png)

Chọn đăng nhập Dropbox với tài khoản vừa tạo API APP

![Imgur](https://i.imgur.com/qfRMryO.png)

Click *Continue* để tiếp tục

![Imgur](https://i.imgur.com/qeSpDWL.png)

Click *Alow* để xác nhận cho phép API App lưu trên tài khoản Dropbox của bạn

![Imgur](https://i.imgur.com/1bLdqDQ.png)

Sau đó cuộc họp sẽ được ghi hình. Khi muốn kết thúc ghi hình bạn thực hiện như trong hình dưới.

![Imgur](https://i.imgur.com/LKOHh8P.png)

Bây giờ kiểm tra trong tài khoản Dropbox của bạn tại https://www.dropbox.com/. Bạn sẽ thấy có một thư mục Recording mới được thêm. 

![Imgur](https://i.imgur.com/KV0zlkh.png)

Kiểm tra thư mục này bạn sẽ thấy có file ghi hình cuộc họp của bạn với định dạng `.mp4`. Tên file sẽ do hệ thống đặt ngẫu nhiên.

![Imgur](https://i.imgur.com/3RlBDCR.png)