# Hướng dẫn cấu hình domain cho hệ thống Jitsi

## Yêu cầu

1. Sở hữu một domain

Hướng dẫn này sẽ sử dụng domain trên [Zone DNS](https://zonedns.vn/).

Thông tin về domain, cũng như mật khẩu truy cập sẽ có trong email mà bạn dùng để mua domain.

Trong hướng dẫn dưới đây là domain : workfromehome.vn.

2. Sở hữu VPS trên Portal của Cloud365

Thông tin về tài khoản Portal sẽ được cung cấp qua email bạn đăng ký.

IP public được đặt cho VPS.

![Imgur](https://i.imgur.com/AUIrrzm.png)

*Giao diện quản lí máy chủ trên Portal Cloud365*.

**Lưu ý:** Nếu chưa cài đặt Jitsi. Bạn có thể xem hướng dẫn cài đặt Jitsi tại :

- [Cài đặt Jitsi trên Ubuntu 18.04 LTS Step by step](https://news.cloud365.vn/huong-dan-cai-dat-jitsi-meet-tren-ubuntu-18-04-lts/).
- [Cài đặt sử dụng template Jitsi của Cloud365](https://support.cloud365.vn/cloud-app/su-dung-template-jitsi-tai-cloud365/).

## Thực hiện

Đầu tiên truy cập vào trang zonedns.vn

![Imgur](https://i.imgur.com/t91EsMs.png)

Nhập thông tin đăng nhập domain của bạn

![Imgur](https://i.imgur.com/K8kIhlO.png)

Nếu muốn trỏ domain vào một IP public cụ thể. Cách đơn giản nhất là bạn kéo xuống cuối trang. Click vào ô `Tạo record mặc định theo IP`. Sau đó nhập IP public của bạn vào là xong.

![Imgur](https://i.imgur.com/9BeSrg6.png)

Nếu bạn muốn trỏ subdomain cho domain của bạn thì thực hiện tương tự như ví dụ dưới đây.

Ở ví dụ này tôi sẽ tạo subdomain với tên "jitsi.workfromehome.vn" cho domain "workfromehome.vn".

![Imgur](https://i.imgur.com/iMlagtv.png)

Bạn cần phải thêm bản ghi mới với tên = subdomain và trỏ IP để Domain của bạn có thể nhận được subdomain. Vào phần Tạo Record:

+ Gõ tên subdomain vào ô tên Record
+ Loại Record: chọn bản ghi A
+ Điền IP public của Server cần trỏ đến
+ Giá trị TTL : Thời gian tồn tại của record cấu hình tên miền được nhớ với máy chủ DNS trung gian. Ở đây, ta để là 300.
+ Bấm vào Tạo Record để hoàn tất việc tạo subdomain

Sau khi hoàn tất 2 bước trên thì subdomain : "jitsi.workfromehome.vn" đã được tạo và trỏ về Server IP đã điền, khi đó các Record của Domain sẽ có dạng như hình dưới:

![Imgur](https://i.imgur.com/CBQF1HX.png)

Giá trị bị che mờ ở cột **Value** là địa chỉ IP public của bạn.

Kiểm tra lại việc trỏ subdomain bằng cách truy cập vào trang [MXToolBox](https://mxtoolbox.com/)

Click vào ô "DNS lookup"

![Imgur](https://i.imgur.com/hK7QYBC.png)

Điền subdomain "jitsi.workfromehome.vn" và click vào ô "DNS lookup"

![Imgur](https://i.imgur.com/44BXo6n.png)

Điền subdomain "jitsi.workfromehome.vn" và click vào ô "DNS lookup"

Hiển thị kết quả như sau tức là đã thành công.

![Imgur](https://i.imgur.com/TGNV3PI.png)

Như vậy là đã hoàn thành việc trỏ subdomain cho trang jitsi của ta.







