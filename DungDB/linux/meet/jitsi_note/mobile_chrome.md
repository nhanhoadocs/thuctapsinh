# Jitsi - Hướng dẫn tạo phòng và truy cập phòng họp trên điện thoại bằng trình duyệt

Đầu tiên, để cho các người dùng mobile có thể truy cập được vào hệ thống của ta thì cần phải sửa file `/etc/jitsi/meet/<domain>-config.js`. Ví dụ domain của tôi là *jitsi.dangdohai.xyz-config.js* thì vào file `/etc/jitsi/meet/jitsi.dangdohai.xyz-config.js` tìm đến dòng `disableDeepLinking`, uncomment và sửa lại thành.

    disableDeepLinking: true,

Sử dụng Jitsi bằng trình duyệt trên điện thoại cũng khá tương tự như sử dụng trên máy tính. 

## Hướng dẫn Truy cập phòng

Nếu được mời vào một phòng họp, ta mở trình duyệt (Nên sử dụng các trình duyệt thông dụng như Google Chrome, Opera, Firefox, Cốc cốc) và dán link phòng vào thanh địa chỉ. Nếu trong phòng có mật khẩu thì nhập mật khẩu và nhấn `Được` hoặc `OK`.

![Imgur](https://i.imgur.com/co1U2RL.jpg)

Nếu đây là lần đầu bạn dùng trình duyệt, bạn cần cấp quyền dùng máy ảnh và micro cho trình duyệt. Đơn giản nhấn **Cho phép**. Ví dụ một vài trình duyệt sẽ thông báo như sau:

![Imgur](https://i.imgur.com/X4O803k.jpg)

![Imgur](https://i.imgur.com/1NXAGay.jpg)

![Imgur](https://i.imgur.com/303j7cA.jpg)

Một vài trình duyệt còn cho phép bạn chọn dùng máy ảnh và micro nào cho cuộc họp.

![Imgur](https://i.imgur.com/RBct2Sl.jpg)

Nếu trước đó bạn đã không cho phép ứng dụng các quyền này, bạn có thể làm theo các bước sau đây để Cho phép. Vì trên trình duyệt mobile không có tính năng bật tắt camera giữa cuộc họp, nên bạn cũng có thể dùng cách này để hủy quyền dùng camera nếu bạn cảm thấy cần thiết. 

- Vào **Cài đặt**

![Imgur](https://i.imgur.com/YUNROQm.jpg)

- Chọn **Ứng dụng**

![Imgur](https://i.imgur.com/VSSPGYs.jpg)

- Bấm vào dấu ba chấm ở góc phải phía trên màn hình, chọn **Trình quản lý quyền**

![Imgur](https://i.imgur.com/Y5TwHSX.jpg)

- Tìm đến phần **Máy ảnh** và **Micro**

![Imgur](https://i.imgur.com/8qj3ZN9.jpg)

- Chọn Ứng dụng trình duyệt cần cấp phép. Ví dụ ở đây chọn Google Chrome.

![Imgur](https://i.imgur.com/ut6Ingp.jpg)

- Chọn **Cho phép**

![Imgur](https://i.imgur.com/G8W18xb.jpg)

## Hướng dẫn tạo phòng

Truy cập vào trang Jitsi của ta. Nhập tên phòng và nhấn **Go**

![Imgur](https://i.imgur.com/N9pgqQW.jpg)

Giao diện bên trong phòng

![Imgur](https://i.imgur.com/6C0YmB2.jpg)

Ở đây ta có thể thấy giao diện khá giống với giao diện khi sử dụng trên máy tính.

**Lưu ý:** Không có tính năng bật tắt camera trong cuộc họp nếu sử dụng trình duyệt

Click vào dấu 3 chấm để xem các tính năng trong phòng

![Imgur](https://i.imgur.com/22Nnahn.jpg)

## Đặt mật khẩu cho phòng

Bấm vào dấu ba chấm và chọn **Thông tin cuộc họp**

![Imgur](https://i.imgur.com/QcqOlUq.jpg)

Bấm Thêm mật khẩu, sau đó nhập mật khẩu và nhấn vào **Đi** hoặc **Go** trên bàn phím. Nhấn vào **Sao chép** để copy link phòng và gửi cho những người bạn muốn mời vào phòng.

![Imgur](https://i.imgur.com/hNDsGB1.jpg)