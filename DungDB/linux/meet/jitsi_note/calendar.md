# Hướng dẫn tạo API APP Key của Goolge cho Jitsi Phục vụ đặt lịch

## Bước 1: Tạo Google calender API App key

Truy cập vào đường dẫn sau:

https://console.developers.google.com/

Tạo 1 Project nếu chưa có.

Click vào ô như trong hình

![Imgur](https://i.imgur.com/dt3J4Xg.png)

Chọn **New Project**

![Imgur](https://i.imgur.com/54Ao8me.png)

Đặt tên cho project của bạn và nhấn **Create** để tạo

![Imgur](https://i.imgur.com/T7ZEkcQ.png)

Thông báo khi tạo project thành công:

![Imgur](https://i.imgur.com/7nMXLUF.png)

Tiếp theo lại truy cập vào đường dẫn này: https://console.developers.google.com/

Tại phần **Dashboard** chọn **Enable APIS AND SERVICES**

![Imgur](https://i.imgur.com/r9kBaFK.png)

Nhập vào ô tìm kiếm nội dung "Calendar"

![Imgur](https://i.imgur.com/kCBpWDB.png)

Bạn sẽ thấy hiển thị như hình dưới. Chọn **Google calendar API**

![Imgur](https://i.imgur.com/7E7OFH4.png)

Chọn **Enable**

![Imgur](https://i.imgur.com/jiZXd91.png)

Sau khi chọn **Enable** trình duyệt sẽ redirect về trang này. Chọn **Create Credentials**

![Imgur](https://i.imgur.com/8hvpC7r.png)

Sau đó chọn **OAuth consent screen**

![Imgur](https://i.imgur.com/Go7qagH.png)

Chọn **External** và **Create**

![Imgur](https://i.imgur.com/XOs2CDU.png)

Điền Application name

![Imgur](https://i.imgur.com/oXdwqXw.png)

Điền Authorized domains. Chú ý điền như sau, ví dụ trang jitsi của tôi dùng subdomain jitsi.dangdohai.xyz thì tôi điền *dangdohai.xyz* Sau đó chọn **SAVE**

![Imgur](https://i.imgur.com/oNUIKjU.png)

Sau đó, chọn **Creadentials** và **Create CREDENTIALS**

![Imgur](https://i.imgur.com/aVCT7Bc.png)

Chọn **OAuth cliend ID**

![Imgur](https://i.imgur.com/erLOdYz.png)

Chọn Web application và nhập như mô tả sau đây

Name: Nhập tùy ý

Authorized JavaScript origins: https://jitsi.dangdohai.xyz (domain của jitsi)

Authorized redirect URIs:  https://jitsi.dangdohai.xyz (domain của jitsi)

Rồi nhấn **Create**

![Imgur](https://i.imgur.com/zhg4Vyj.png)

![Imgur](https://i.imgur.com/VCWiU1n.png)

Sau khi tạo xong sẽ thấy xuất hiện giao diện như sau. Copy lại **Your Client ID**

![Imgur](https://i.imgur.com/6N0SVFF.png)

## Bước 2: Cấu hình trên server Jitsi

Mở file `/etc/jitsi/meet/<domain>-config.js`. Cụ thể trong ví dụ này là `/etc/jitsi/meet/jitsi.dangdohai.xyz-config.js`

    vi /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js

Bổ sung 2 dòng sau nếu chưa có

    enableCalendarIntegration: true,
    googleApiApplicationClientID: "809480196179-sdhdve6jnf15l6iv1vclbmc9ca1v3tgl.apps.googleusercontent.com",

Trong đó `809480196179-sdhdve6jnf15l6iv1vclbmc9ca1v3tgl.apps.googleusercontent.com` là mã Your Client ID vừa copy ở trên.

## Bước 3: Đăng nhập tài khoản google và tạo thời gian biểu trên lịch

Truy cập vào trang Jitsi. Chọn **Kết nối lịch của bạn**.

![Imgur](https://i.imgur.com/rCOTTo3.png)

Sau đó đăng nhập vào tài khoản google của bạn.

![Imgur](https://i.imgur.com/FRpS7qX.png)

Vì ứng dụng này chưa được google xác minh nên google sẽ không tin tưởng. Chọn **Nâng cao**

![Imgur](https://i.imgur.com/tvP0AZq.png)

và Đi tới trang jitsi.dangdohai.xyz

![Imgur](https://i.imgur.com/WDcRgvF.png)

Ta cho phép trang jitsi các quyền cần thiết để phục vụ ứng dụng.

![Imgur](https://i.imgur.com/noNber8.png)

Xác nhận lại một lần nữa.

![Imgur](https://i.imgur.com/FyXBWGG.png)

Sau khi kết nối tài khoản google bạn sẽ thấy hiển thị như sau. Click vào **Được**.

![Imgur](https://i.imgur.com/WjuNqku.png)

Ở đây tôi chưa tạo thời gian biểu trên tài khoản này nên sẽ không thấy hiển thị lịch.

Để tạo thời gian biểu. Ta truy cập vào trang https://calendar.google.com/

Click vào **Tạo**, thêm mô tả và click **Lưu**

Quay lại trang Jitsi, nhấn vào **Làm tươi lịch**. 

![Imgur](https://i.imgur.com/UMZuBhs.png)

Ta sẽ thấy thời gian biểu vừa tạo đã xuất hiện. Như hiển thị ở đây là sẽ có một cuộc họp giao ban vào ngày 17-04. 

![Imgur](https://i.imgur.com/LfFbgQg.png)

Click vào dấu cộng, hệ thống sẽ tự động tạo cho ta một phòng cho hoạt động họp giao ban này. Click vào **Tham gia** để vào phòng.

![Imgur](https://i.imgur.com/ayXkRp9.png)

Tại trang https://calendar.google.com/ ta có thể chỉnh sửa lại mô tả hoạt động đã đặt trong lịch bằng cách Click vào hoạt động đó. 

![Imgur](https://i.imgur.com/ajhOBlu.png)

Chọn biểu tượng cây bút chì để chỉnh sửa.

![Imgur](https://i.imgur.com/trXsHG8.png)

Chỉnh sửa tùy theo ý của bạn

![Imgur](https://i.imgur.com/1FScARW.png)