# Jitsi - Hướng dẫn đổi ngôn ngữ mặc định, đổi logo, favicon trên 

## Hướng dẫn đổi ngôn ngữ mặc định

Vào thư mục `/etc/jitsi/meet/`, backup file `<domain>-config.js`. Ở đây domain của tôi là `jitsi.dangdohai.xyz` nên sẽ có file `jitsi.dangdohai.xyz-config.js`

    cp jitsi.dangdohai.xyz-config.js jitsi.dangdohai.xyz-config.js.bak

Đổi ngôn ngữ mặc định thành tiếng Việt

Vào file jitsi.dangdohai.xyz-config.js tìm đến dòng 256. Đổi `defaultLanguage: 'en'` thành `defaultLanguage: 'vi'`. Hoặc chạy lệnh:

    sed -i "s|// defaultLanguage: 'en',|defaultLanguage: 'vi',|g" /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js

Mở trình duyệt ẩn danh và kiểm tra lại kết quả.

Ngôn ngữ tiếng Việt trên đây được dịch chưa kỹ lắm. Nếu muốn bạn có thể sửa đổi các câu chữ theo ý bạn tại file `/usr/share/jitsi-meet/lang/main-vi.json`

    cp /usr/share/jitsi-meet/lang/main-vi.json /usr/share/jitsi-meet/lang/main-vi.json.bak
    vi /usr/share/jitsi-meet/lang/main-vi.json

Xem nội dung của file này ở đây: https://github.com/jitsi/jitsi-meet/blob/master/lang/main-vi.json

Để sửa đổi hiển thị thông báo mời vào cuộc họp.

![Imgur](https://i.imgur.com/cVln6B1.png)

Đổi lại một số title trong file `/usr/share/jitsi-meet/title.html` tùy ý bạn:

    vi /usr/share/jitsi-meet/title.html

Kết quả:

![Imgur](https://i.imgur.com/o5Dvl1z.png)

Bổ sung thêm text Vận hành bởi cloud365:

    cp /usr/share/jitsi-meet/css/all.css /usr/share/jitsi-meet/all.css.bak
    vi /usr/share/jitsi-meet/css/all.css


Sửa css bổ sung thêm đoạn sau vào cuối file (chỗ này đã minify)

    .watermark::after{content:"Hạ tầng cloud để triển khai";color:#fff;font-weight:400;position:relative;left:.1rem;top:3.2rem}
    #largeVideoContainer > div:nth-child(3) > a > .watermark::after{left: -0.3rem}
    .leftwatermark{height: 3rem;}

Sửa file `/usr/share/jitsi-meet/index.html`. 

    vi /usr/share/jitsi-meet/index.html

Tại dòng số 9, tăng thêm 1 số. Ví dụ:

    "css/all.css?v=3729" sửa thành "css/all.css?v=3730"

## Đổi logo

Logo của Cloud365: https://cloud365.vn/images/logo-white.png
 
Thay thế logo của ta vào file `/usr/share/jitsi-meet/images/watermark.png`

    cp /usr/share/jitsi-meet/images/watermark.png /usr/share/jitsi-meet/images/watermark.png.bak
    cd /usr/share/jitsi-meet/images/
    wget https://cloud365.vn/images/logo-white.png -O watermark.png

## Đổi favicon

Favicon của Nhân Hòa: https://cloud365.vn/images/favicon.ico

Thay thế favicon của ta vào file `/usr/share/jitsi-meet/images/favicon.ico`

    cd /usr/share/jitsi-meet/images/
    mv favicon.ico favicon.ico.bak
    wget https://cloud365.vn/images/favicon.ico -O favicon.ico

![Imgur](https://i.imgur.com/uJhPoiA.png)

## Giảm độ phân giải để đỡ ngốn mạng và không mở file 

Độ phân giải mặc định sẽ là HD (720p). Bạn có thể giảm độ phân giải mặc định xuống thấp hơn để tiết kiệm lưu lượng mạng.

Vào thư mục `/etc/jitsi/meet/<domain>-config.js` để chỉnh resolution

    vi /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js

Uncomment và sửa lại cac dòng sau:

```
    // Sets the preferred resolution (height) for local video. Defaults to 720.
    resolution: 180,

    constraints: {
       video: {
            aspectRatio: 16 / 9,
             height: {
                ideal: 180,
                 max: 180,
                 min: 180
            }
         }
     },
```

## Tắt tự động đặt tên phòng

Vào file `/usr/share/jitsi-meet/interface_config.js`, tìm đến dòng `GENERATE_ROOMNAMES_ON_WELCOME_PAGE` sửa từ `true` thành `false`.

    GENERATE_ROOMNAMES_ON_WELCOME_PAGE: false,

## Sửa title trang

Vào file `/usr/share/jitsi-meet/interface_config.js` sửa các dòng

    APP_NAME: 'Họp trực tuyến - Nhân hòa',
    NATIVE_APP_NAME: 'Họp trực tuyến - Nhân Hòa',

## Yêu cầu người dùng nhập tên trước khi vào phòng họp

Vào file `/etc/jitsi/meet/<domain>-config.js`. Ví dụ `/etc/jitsi/meet/jitsi.dungdb.xyz-config.js` Uncomment dòng sau:

    requireDisplayName: true,

## Ghi âm phía client

Vào file `/etc/jitsi/meet/jitsi.dangdohai.xyz-config.js`, tìm đến mục `localRecording` sửa thành

    localRecording: {
    // Enables local recording.
    // Additionally, 'localrecording' (all lowercase) needs to be added to
    // TOOLBAR_BUTTONS in interface_config.js for the Local Recording
    // button to show up on the toolbar.
         enabled: true,
    // The recording format, can be one of 'ogg', 'flac' or 'wav'.
         format: 'flac'
     },

Sau đó tìm đến thư mục `/usr/share/jitsi-meet/interface_config.js` trong phần `TOOLBAR_BUTTONS` thêm `'localrecording'` (để ý dấu phẩy).

Chỉ có quản trị viên được quyền record. Lưu trên máy local của tất cả mọi người trong phòng họp.

![Imgur](https://i.imgur.com/TEVer78.png)

![Imgur](https://i.imgur.com/QJoyZj9.png)

![Imgur](https://i.imgur.com/JpG5qLq.png)

## Cấu hình để người dùng trên mobile vào phòng bằng chrome được 

Vào file `/etc/jitsi/meet/jitsi.dangdohai.xyz-config.js` uncomment và sửa `disableDeepLinking`

    disableDeepLinking: true,

## Thêm lịch họp tích hợp Google hoặc Microsoft (Cần xác thực, chưa được)

Vào file `/etc/jitsi/meet/jitsi.dangdohai.xyz-config.js` sửa `enableCalendarIntegration`

    googleApiApplicationClientID: "39065779381-bbhnkrgibtf4p0j9ne5vsq7bm49t1tlf.apps.googleusercontent.com",
    microsoftApiApplicationClientID: "00000000-0000-0000-0000-000040240063",
    enableCalendarIntegration: true,

## Tắt âm thanh của người vào phòng khi họ mới vào

    // Start calls with audio muted. Unlike the option above, this one is only
    // applied locally. FIXME: having these 2 options is confusing.
    startWithAudioMuted: true,

## Tắt cam của người vào phòng khi họ mới vào

    // Start calls with video muted. Unlike the option above, this one is only
    // applied locally. FIXME: having these 2 options is confusing.
    startWithVideoMuted: true,

## Tắt nút "Tôi đang phát biểu". Giảm mức độ sử dụng CPU trên client chậm

    // Disable measuring of audio levels.
    disableAudioLevels: true,

## crontab, restart lúc 12h trưa và 12h đêm mỗi ngày (Xóa user ảo)

vi /bin/restartJitsiService.sh
```
---
#!/bin/bash
DATE=$(date "+%T %d/%m/%Y")

/etc/init.d/jicofo restart
/etc/init.d/prosody restart
/etc/init.d/jitsi-videobridge restart
/etc/init.d/jitsi-videobridge2 restart

echo "Da thuc hien Script restart vao luc $DATE" >> /var/log/jitsi/scriptRestart.log
----

chmod 755 /bin/restartJitsiService.sh

ll /bin/ | grep restartJitsiService.sh

crontab -e

---
00 00,12 * * * /bin/restartJitsiService.sh
---
```

## Tắt làm mờ background

Vào file `/usr/share/jitsi-meet/interface_config.js`, sửa dòng:
    
    DISABLE_VIDEO_BACKGROUND: true,


## Tắt hoạt ảnh feedback

Vào file `/usr/share/jitsi-meet/interface_config.js`. Sửa các dòng

    // Enables feedback star animation.
    ENABLE_FEEDBACK_ANIMATION: false,
    DISABLE_FOCUS_INDICATOR: true,
    DISABLE_DOMINANT_SPEAKER_INDICATOR: true,

## Tắt thông báo khi có người vào phòng, thoát khỏi phòng

Cân nhắc dùng nếu có quá nhiều người vào phòng.

Vào file `/usr/share/jitsi-meet/interface_config.js`. Sửa dòng

    DISABLE_JOIN_LEAVE_NOTIFICATIONS: true,

    
## Xem các dòng sau (k thấy)

Vào file `/usr/share/jitsi-meet/interface_config.js`. Sửa các dòng

    SET_FILMSTRIP_ENABLED: false