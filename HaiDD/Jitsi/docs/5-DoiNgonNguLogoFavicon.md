# Hướng dẫn đổi ngôn ngữ mặc định, đổi logo, favicon trên hệ thống Jitsi

## 1. Đổi ngôn ngữ mặc định
Vào thư mục `/etc/jitsi/meet/`, tiến hành backup file `<domain>-config.js`.

Ở đây domain của tôi là `jitsi.workfromehome.vn` nên sẽ có file `jitsi.workfromhome.vn-config.js`


Đổi ngôn ngữ mặc định thành tiếng Việt:

Vào file `jitsi.workfromehome.vn-config.js` tìm đến dòng `defaultLanguage.` Đổi `defaultLanguage: 'en'` thành `defaultLanguage: 'vi'`. Hoặc chạy lệnh:
```
sed -i "s|// defaultLanguage: 'en',|defaultLanguage: 'vi',|g" /etc/jitsi/meet/jitsi.workfromehome.vn-config.js
```

Mở trình duyệt ẩn danh và kiểm tra lại kết quả.

Ngôn ngữ tiếng Việt trên đây được dịch chưa kỹ lắm. Nếu muốn bạn có thể sửa đổi các câu chữ theo ý bạn tại file `/usr/share/jitsi-meet/lang/main-vi.json`
```
cp /usr/share/jitsi-meet/lang/main-vi.json /usr/share/jitsi-meet/lang/main-vi.json.bak

vi /usr/share/jitsi-meet/lang/main-vi.json
```

Xem nội dung của file này ở đây: https://github.com/jitsi/jitsi-meet/blob/master/lang/main-vi.json

### Để sửa đổi hiển thị thông báo mời vào cuộc họp.

<img src="https://i.imgur.com/rBMak22.png">


Đổi lại một số title trong file `/usr/share/jitsi-meet/title.html` tùy ý bạn:
```
vi /usr/share/jitsi-meet/title.html
```

<img src="https://i.imgur.com/BWRmfjO.png">

## 2. Đổi logo
Logo của Cloud365: https://cloud365.vn/images/logo-white.png

Thay thế logo của ta vào file `/usr/share/jitsi-meet/images/watermark.png`
```
cp /usr/share/jitsi-meet/images/watermark.png /usr/share/jitsi-meet/images/watermark.png.bak
cd /usr/share/jitsi-meet/images/
wget https://cloud365.vn/images/logo-white.png -O watermark.png
```

**Kết quả**

<img src="https://i.imgur.com/Ihsn30Z.png">

## 3. Đổi favicon
Favicon của Nhân Hòa: `https://cloud365.vn/images/favicon.ico`

Thay thế favicon của ta vào file `/usr/share/jitsi-meet/images/favicon.ico`

```
cd /usr/share/jitsi-meet/images/
mv favicon.ico favicon.ico.bak
wget https://cloud365.vn/images/favicon.ico -O favicon.ico
```

**Kết quả:**

<img src="https://i.imgur.com/OAHkKZB.png">

## 4. Giảm độ phân giải
Độ phân giải mặc định sẽ là HD (720p). Bạn có thể giảm độ phân giải mặc định xuống thấp hơn để tiết kiệm lưu lượng mạng.

Vào thư mục `/etc/jitsi/meet/<domain>-config.js` để chỉnh resolution:

```
vi /etc/jitsi/meet/jitsi.workfromehome.vn-config.js
```

Uncomment và sửa lại các dòng sau:
```json
// Sets the preferred resolution (height) for local video. Defaults to 720.
resolution: 480,
 
constraints: {
   video: {
        aspectRatio: 16 / 9,
         height: {
            ideal: 480,
             max: 480,
             min: 240
        }
     }
 },
```

<img src="https://i.imgur.com/wDsOeTK.png">

Ở đây tôi chỉnh lại độ phân giải tối đa là 480p. Bạn có thể sửa lại tùy theo ý mình (360p, 480p, …)

Như vậy là ta đã thay đổi thành công ngôn ngữ mặc định, favicon, logo, độ phân giải mặc định cho Jitsi.